
## Creating a SaaS Agent

**Who:** Owner or power user of a SaaS service with an API

**Why:** All-the-data's into New Relic!

**How:**

1. Fork repo
1. Add required settings to config/sample_config.yml (remember this is for distribution so do not put real credentials here)
1. Rename service_agent.worker to my_service_agent.worker and add required gems.
1. Rename service_agent.rb to my_service_agent.rb and fill in commented area of my_service_agent.rb
1. Commit and push to github!

That's it! Now users can USE your SaaS agent with the instructions below.

NOTE: This only needs to be done one time by the owners of the SaaS service. Users follow the instructions below.


## Using a SaaS Agent

**Who:** Users of a SaaS/API service of which an agent has already been created (see above).

**Why:** This allows users to easily customize what data they want sent from the SaaS services API into New Relic. Also it makes it so that the SaaS service doesn't need to even know about New Relic as it's all done using already available API's.

**How:** The newrelic_platform gem and [IronWorker](http://iron.io/worker), a service provided by [Iron.io](http://iron.io) that allows for a very easy way to schedule the agent to run every minute.

1. Copy config/sample_config.yml to config/config.yml
1. Create free account at [Iron.io](http://iron.io)
1. Fill in config.yml
1. Upload it: `iron_worker upload my_service_agent`
1. Test it: `iron_worker queue my_service_agent` - check it at hud.iron.io
1. Schedule it: `iron_worker schedule my_service_agent --run-every 60`


## Example Agent

We have provided an example agent for review. You can easily follow the instructions above to use this example agent. The example agent pulls data from the IronMQ API and posts it to New Relic every minute (using the IronWorker service).

service_agent_example_ironmq.rb

service_agent_example_ironmq.worker
