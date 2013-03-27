

# Creating your own SaaS Agent

These instructions are for creating an agent for any SaaS web service. Once created, the agent can then be run by users of the
web service to push the data from their specific account into New Relic.

1. Fork repo
1. Add required settings to config/sample_config.yml (remember this is for distribution so do not put real credentials here)
1. Rename service_agent.worker to my_service_agent.worker and add required gems.
1. Rename service_agent.rb to my_service_agent.rb and fill in commented area of my_service_agent.rb
1. Commit and push to github!

That's it! Now users can USE your SaaS agent with the instructions below.


# Using a SaaS Agent

These are user instructions for installing and running an agent to send your own SaaS accounts data into New Relic for monitoring.

1. Copy config/sample_config.yml to config/config.yml
1. Fill in config.yml
1. Upload it: `iron_worker upload my_service_agent`
1. Test it: `iron_worker queue my_service_agent` - check it at hud.iron.io
1. Schedule it: `iron_worker schedule my_service_agent --run-every 60`


# Example Agent

We have provided an example agent for review. You can easily follow the instructions above to use this example agent.

service_agent_example_ironmq.rb
service_agent_example_ironmq.worker



