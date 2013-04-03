
## Creating a New Relic SaaS Agent

**Who:** Anybody who wants to publish an agent for an API for others to use

**What:** The New Relic platform is a way to push data into New Relic to track and monitor just like all other New Relic Data. Creating a SaaS agent is a one time activity that makes it drop dead simple for any user of that SaaS API to integrate their own data into their own New Relic account. The agent runs on the IronWorker platform by Iron.io.

**Why:** New Relic makes viewing your data awesome, IronWorker makes collecting and sending to New Relic drop dead simple.

**How:**

1. Fork this repo
1. Add required settings to config/sample_config.yml (remember this is for distribution so do not put real credentials here)
1. Rename service_agent.worker to whatever_service_agent.worker and add required gems.
1. Rename service_agent.rb to whatever_service_agent.rb and fill in commented area.
1. Commit and push to github!

That's it! Now users can use your SaaS agent. 

#### Already Created Sample Agents

- [IronMQ](https://github.com/newrelic-platform/ironmq_extension) - Easily track data from the IronMQ cloud message queue service

- TODO: All-the-agents here shortly!
