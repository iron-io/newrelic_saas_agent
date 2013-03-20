# match rabbitmq plugin

require 'rest'
require 'iron_mq'
require 'iron_cache'
require 'yaml'

config = YAML.load_file('config/config.yml')

ironmq = IronMQ::Client.new(
  token: config['iron']['token'],
  project_id: config['iron']['project_id'],
)

ironcache = IronCache::Client.new(
  token: config['iron']['token'],
  project_id: config['iron']['project_id'],
)

cache = ironcache.cache("ironmq_agent_cache")

queues = ironmq.queues.all

components_array = []

# For each queue
queues.each do |q|
  size = q.size
  name = q.name

  puts "\nFound queue: #{name} [#{size} messages]"
  metric_name_size = "Component/Queued Messages[messages]"

  # Add size component
  components_array << {
    :name => name,
    :guid => 'io.iron.mq',
    :duration => 60,
    :metrics => {
      metric_name_size => size,
    }
  }
  puts " Added component #{metric_name_size}"

  # Add rate component
  key = "#{config['iron']['project_id']}_#{name}_lastsize"

  item = cache.get(key)
  if item.nil?
    lastsize = rate = 0
  else
    lastsize = item.value
    rate=(((size-lastsize)/60).to_f).round(2)
  end
  cache.put(key, size)

  puts " Size was #{lastsize}, now #{size}  [Rate #{rate} messages/sec]"

  metric_name_rate = "Component/Message Rate[messages/sec]"
  components_array << {
    :name => name,
    :guid => 'io.iron.mq',
    :duration => 60,
    :metrics => {
      metric_name_rate => rate,
    }
  }
  puts " Added component #{metric_name_rate}\n\n"
end


if components_array.empty?
  puts 'No queues found for this account.'
else

  body = {
    :agent => {
      :host => 'iron.io',
      :pid => 1,
      :version => '1.0.0'
    },
    :components => components_array
  }

  headers = {
    'content-type' => 'application/json',
    'accept' => 'application/json',
    'X-License-Key' => config['newrelic_license']
  }

  puts "Body --> #{body}"
  puts "Headers --> #{headers}"

  response = Rest::Client.new.post('https://platform-api.newrelic.com/platform/v1/metrics',
                                   :body => body,
                                   :headers => headers)

  puts "Response --> #{response.code}"

end
