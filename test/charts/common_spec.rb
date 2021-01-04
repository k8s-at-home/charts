# frozen_string_literal: true

require_relative '../test_helper'

describe Chart.new('charts/common-test') do
  describe 'pod replicas' do
    it 'defaults to 1' do
      jq('.spec.replicas', resource('Deployment')).must_equal 1
    end

    it 'accepts integer as value' do
      chart.value replicas: 3
      jq('.spec.replicas', resource('Deployment')).must_equal 3
    end
  end
end
