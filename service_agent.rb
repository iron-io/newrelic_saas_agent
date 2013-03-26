require 'rest'
require 'yaml'

config = YAML.load_file('config/config.yml')

@new_relic = NewRelic::Client.new(:license => config['newrelic']['license'],
                                  :guid => config['newrelic']['guid'],
                                  :version => config['newrelic']['version'])

collector = @new_relic.new_collector

component = collector.component("COMPONENT_NAME")
component.add_metric 'Widgets Sold', 'widgets', 1000
component.add_metric 'Widget Rate', 'widgets/sec', 5

response = collector.submit
