# frozen_string_literal: true

require 'json'
require 'yaml'
require 'open3'

require 'jq/extend'
require 'minitest-implicit-subject'
require 'minitest/autorun'
require 'minitest/pride'

class HelmCompileError < StandardError
end

class Chart
  attr_reader :name, :path, :values

  def initialize(chart)
    @name = chart.split('/').last

    @path = File.expand_path(chart)

    @values = default_values

    command = "helm dep update '#{path}'"
    stdout, stderr, status = Open3.capture3(command)
    raise HelmCompileError, stderr if status != 0
  end

  def reset!
    @values = default_values
    @parsed_resources = nil
  end

  def value(value)
    values.merge!(value)
  end

  def configure_custom_name(name)
    @name = name
  end

  def execute_helm_template!
    file = Tempfile.new(name)
    file.write(JSON.parse(values.to_json).to_yaml)
    file.close

    begin
      command = "helm template '#{name}' '#{path}' --namespace='default' --values='#{file.path}'"
      stdout, stderr, status = Open3.capture3(command)

      raise HelmCompileError, stderr if status != 0

      stdout
    ensure
      file.unlink
    end
  end

  def parsed_resources
    @parsed_resources ||= begin
      output = execute_helm_template!
      puts output if ENV.fetch('DEBUG', 'false') == 'true'
      YAML.load_stream(output)
    end
  end

  def resources(matcher = nil)
    return parsed_resources unless matcher

    parsed_resources.select do |r|
      r >= Hash[matcher.map { |k, v| [k.to_s, v] }]
    end
  end

  def default_values
    {
      image: {
        repository: 'helm-test',
        tag: '122344'
      }
    }
  end
end

module Minitest
  class Spec
    before { chart.reset! }

    def chart
      subject
    end

    def resource(name)
      chart.resources(kind: name).first
    end

    def jq(matcher, object)
      value(object.jq(matcher)[0])
    end
  end
end

