require 'rest'
require 'yaml'

# Requires manual installation of the New Relic plaform gem (platform is in closed beta)
# https://github.com/newrelic-platform/iron_sdk
require 'newrelic_platform'

config = YAML.load_file('config/config.yml')

new_relic = NewRelic::Client.new(:license => config['newrelic']['license'],
                                  :guid => config['newrelic']['guid'],
                                  :version => config['newrelic']['version'])

collector = new_relic.new_collector

## Here is where you'll fill in your own data to be sent to New Relic
component = collector.component("COMPONENT_NAME")
component.add_metric 'Widgets Sold', 'widgets', 1000
component.add_metric 'Widget Rate', 'widgets/sec', 5


response = collector.submit
