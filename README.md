




# New Relic Service Agent for API's

1. Copy config/sample_config.yml to config/config.yml
1. Fill in config.yml
1. Upload it: `iron_worker upload my_service_agent`
1. Test it: `iron_worker queue my_service_agent` - check it at hud.iron.io
1. Schedule it: `iron_worker schedule my_service_agent --run-every 60`




# How to Make an API Agent for any Service

1. Fork repo
1. Add required settings to config/sample_config.yml
1. Rename service_agent.worker to some_service_agent.worker and add required gems.
1. Rename service_agent.rb to some_service_agent.rb and fill in commented areas of service_agent.rb.
1. Commit and push to github!

