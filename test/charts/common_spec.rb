# frozen_string_literal: true
require_relative '../test_helper'

@chart_name = 'common-test'

describe Chart.new("charts/#{@chart_name}"), @chart_name do
  describe 'controller type' do
    it 'defaults to "Deployment"' do
      assert_nil(resource('StatefulSet'))
      assert_nil(resource('DaemonSet'))
      refute_nil(resource('Deployment'))
    end

    it 'accepts "statefulset"' do
      chart.value controllerType: 'statefulset'
      assert_nil(resource('Deployment'))
      assert_nil(resource('DaemonSet'))
      refute_nil(resource('StatefulSet'))
    end

    it 'accepts "daemonset"' do
      chart.value controllerType: 'daemonset'
      assert_nil(resource('Deployment'))
      assert_nil(resource('StatefulSet'))
      refute_nil(resource('DaemonSet'))
    end
  end

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
