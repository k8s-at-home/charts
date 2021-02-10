# frozen_string_literal: true
require_relative '../test_helper'

class Test < ChartTest
  @@chart = Chart.new('charts/common-test')
  
  describe @@chart.name do
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

    describe 'Environment settings' do
      it 'Check no environment variables' do
        values = {}
        chart.value values        
        assert_nil(resource('Deployment')['spec']['template']['spec']['containers'][0]['env'])
      end

      it 'set "static" environment variables' do
        values = {
          env: {
            STATIC_ENV: 'value_of_env'
          }
        }
        chart.value values
        jq('.spec.template.spec.containers[0].env[0].name', resource('Deployment')).must_equal values[:env].keys[0].to_s
        jq('.spec.template.spec.containers[0].env[0].value', resource('Deployment')).must_equal values[:env].values[0].to_s
      end

      it 'set "valueFrom" environment variables' do
        values = {
          envValueFrom: {
            NODE_NAME: {
              fieldRef: {
                fieldPath: "spec.nodeName"
              }
            }
          }
        }
        chart.value values
        jq('.spec.template.spec.containers[0].env[0].name', resource('Deployment')).must_equal values[:envValueFrom].keys[0].to_s
        jq('.spec.template.spec.containers[0].env[0].valueFrom | keys[0]', resource('Deployment')).must_equal values[:envValueFrom].values[0].keys[0].to_s
      end

      it 'set "static" and "Dynamic/Tpl" environment variables' do
        values = {
          env: {
            STATIC_ENV: 'value_of_env'
          },
          envTpl: {
            DYN_ENV: "{{ .Release.Name }}-admin"
          }
        }
        chart.value values
        jq('.spec.template.spec.containers[0].env[0].name', resource('Deployment')).must_equal values[:env].keys[0].to_s
        jq('.spec.template.spec.containers[0].env[0].value', resource('Deployment')).must_equal values[:env].values[0].to_s
        jq('.spec.template.spec.containers[0].env[1].name', resource('Deployment')).must_equal values[:envTpl].keys[0].to_s
        jq('.spec.template.spec.containers[0].env[1].value', resource('Deployment')).must_equal 'common-test-admin'
      end
      
      it 'set "Dynamic/Tpl" environment variables' do
        values = {
          envTpl: {
            DYN_ENV: "{{ .Release.Name }}-admin"
          }
        }
        chart.value values
        jq('.spec.template.spec.containers[0].env[0].name', resource('Deployment')).must_equal values[:envTpl].keys[0].to_s
        jq('.spec.template.spec.containers[0].env[0].value', resource('Deployment')).must_equal 'common-test-admin'
      end
    end

    describe 'ports settings' do
      default_name = 'http'
      default_port = 8080

      it 'defaults to name "http" on port 8080' do
        jq('.spec.ports[0].port', resource('Service')).must_equal default_port
        jq('.spec.ports[0].targetPort', resource('Service')).must_equal default_name
        jq('.spec.ports[0].name', resource('Service')).must_equal default_name
        jq('.spec.template.spec.containers[0].ports[0].containerPort', resource('Deployment')).must_equal default_port
        jq('.spec.template.spec.containers[0].ports[0].name', resource('Deployment')).must_equal default_name
      end
  
      it 'port name can be overridden' do
        values = {
          service: {
            port: {
              name: 'server'
            }
          }
        }
        chart.value values
        jq('.spec.ports[0].port', resource('Service')).must_equal default_port
        jq('.spec.ports[0].targetPort', resource('Service')).must_equal values[:service][:port][:name]
        jq('.spec.ports[0].name', resource('Service')).must_equal values[:service][:port][:name]
        jq('.spec.template.spec.containers[0].ports[0].containerPort', resource('Deployment')).must_equal default_port
        jq('.spec.template.spec.containers[0].ports[0].name', resource('Deployment')).must_equal values[:service][:port][:name]
      end

      it 'targetPort can be overridden' do
        values = {
          service: {
            port: {
              targetPort: 80
            }
          }
        }
        chart.value values
        jq('.spec.ports[0].port', resource('Service')).must_equal default_port
        jq('.spec.ports[0].targetPort', resource('Service')).must_equal values[:service][:port][:targetPort]
        jq('.spec.ports[0].name', resource('Service')).must_equal default_name
        jq('.spec.template.spec.containers[0].ports[0].containerPort', resource('Deployment')).must_equal values[:service][:port][:targetPort]
        jq('.spec.template.spec.containers[0].ports[0].name', resource('Deployment')).must_equal default_name
      end

      it 'targetPort cannot be a named port' do
        values = {
          service: {
            port: {
              targetPort: 'test'
            }
          }
        }
        chart.value values
        exception = assert_raises HelmCompileError do
          chart.execute_helm_template!
        end
        assert_match("Our charts do not support named ports for targetPort. (port name #{default_name}, targetPort #{values[:service][:port][:targetPort]})", exception.message)
      end
    end

    describe 'statefulset volumeClaimTemplates' do

      it 'volumeClaimTemplates should be empty by default' do
        chart.value controllerType: 'statefulset'
        assert_nil(resource('StatefulSet')['spec']['volumeClaimTemplates'])
      end

      it 'can set values for volumeClaimTemplates' do
        values = {
          controllerType: 'statefulset',
          volumeClaimTemplates: [
            {
              name: 'storage',
              accessMode: 'ReadWriteOnce',
              size: '10Gi',
              storageClass: 'storage'
            }
          ]
        }

        chart.value values
        jq('.spec.volumeClaimTemplates[0].metadata.name', resource('StatefulSet')).must_equal values[:volumeClaimTemplates][0][:name]
        jq('.spec.volumeClaimTemplates[0].spec.accessModes[0]', resource('StatefulSet')).must_equal values[:volumeClaimTemplates][0][:accessMode]
        jq('.spec.volumeClaimTemplates[0].spec.resources.requests.storage', resource('StatefulSet')).must_equal values[:volumeClaimTemplates][0][:size]
        jq('.spec.volumeClaimTemplates[0].spec.storageClassName', resource('StatefulSet')).must_equal values[:volumeClaimTemplates][0][:storageClass]
      end
    end

    describe 'ingress' do
      it 'should be disabled when ingress.enabled: false' do
        values = {
          ingress: {
            enabled: false
          }
        }
        chart.value values
        assert_nil(resource('Ingress'))
      end

      it 'should be enabled when ingress.enabled: true' do
        values = {
          ingress: {
            enabled: true
          }
        }

        chart.value values
        refute_nil(resource('Ingress'))
      end

      it 'ingress with hosts' do
        values = {
          ingress: {
            hosts: [
              {
                host: 'hostname',
                paths: [
                  {
                    path: '/'
                  }
                ]
              }
            ]
          }
        }

        chart.value values
        jq('.spec.rules[0].host', resource('Ingress')).must_equal values[:ingress][:hosts][0][:host]
        jq('.spec.rules[0].http.paths[0].path', resource('Ingress')).must_equal values[:ingress][:hosts][0][:paths][0][:path]
      end

      it 'ingress with hosts template is evaluated' do
        expectedHostName = 'common-test.hostname'
        values = {
          ingress: {
            hosts: [
              {
                hostTpl: '{{ .Release.Name }}.hostname',
                paths: [
                  {
                    path: '/'
                  }
                ]
              }
            ]
          }
        }

        chart.value values
        jq('.spec.rules[0].host', resource('Ingress')).must_equal expectedHostName
        jq('.spec.rules[0].http.paths[0].path', resource('Ingress')).must_equal values[:ingress][:hosts][0][:paths][0][:path]
      end

      it 'ingress with hosts and tls' do
        values = {
          ingress: {
            enabled: true,
            hosts: [
              {
                host: 'hostname',
                paths: [
                  {
                    path: '/'
                  }
                ]
              }
            ],
            tls: [
              {
                hosts: [ 'hostname' ],
                secretName: 'hostname-secret-name'
              }
            ]
          }
        }

        chart.value values
        jq('.spec.rules[0].host', resource('Ingress')).must_equal values[:ingress][:hosts][0][:host]
        jq('.spec.rules[0].http.paths[0].path', resource('Ingress')).must_equal values[:ingress][:hosts][0][:paths][0][:path]
        jq('.spec.tls[0].hosts[0]', resource('Ingress')).must_equal values[:ingress][:tls][0][:hosts][0]
        jq('.spec.tls[0].secretName', resource('Ingress')).must_equal values[:ingress][:tls][0][:secretName]
      end

      it 'ingress with hosts and tls templates is evaluated' do
        expectedHostName = 'common-test.hostname'
        expectedSecretName = 'common-test-hostname-secret-name'
        values = {
          ingress: {
            enabled: true,
            hosts: [
              {
                hostTpl: '{{ .Release.Name }}.hostname',
                paths: [
                  {
                    path: '/'
                  }
                ]
              }
            ],
            tls: [
              {
                hostsTpl: [ '{{ .Release.Name }}.hostname' ],
                secretNameTpl: '{{ .Release.Name }}-hostname-secret-name'
              }
            ]
          }
        }

        chart.value values
        jq('.spec.rules[0].host', resource('Ingress')).must_equal expectedHostName
        jq('.spec.rules[0].http.paths[0].path', resource('Ingress')).must_equal values[:ingress][:hosts][0][:paths][0][:path]
        jq('.spec.tls[0].hosts[0]', resource('Ingress')).must_equal expectedHostName
        jq('.spec.tls[0].secretName', resource('Ingress')).must_equal expectedSecretName
      end
    end
  end
end
