require 'rest'
require 'yaml'

# REQUIRE SERVICE GEMS HERE, EXAMPLE:
# require 'iron_mq'

config = YAML.load_file('config/config.yml')

# INITIALIZE SERVICE GEM: EXAMPLE:
#ironmq = IronMQ::Client.new(token: config['iron']['token'], project_id: config['iron']['project_id'])

@new_relic = NewRelic::Client.new(:license => config['newrelic']['license'],
                                  :guid=>config['newrelic']['guid'],
                                  :version=>config['newrelic']['version'])

collector = @new_relic.new_collector

# GET STATS FROM SERVICE, EXAMPLE:
#queues = ironmq.queues.all
#queues.each do |q|
#  component = collector.component(q.name)
#  component.add_metric 'Queued Messages', 'messages', q.size
#end


# SUBMIT DATA
r = collector.submit
p r

