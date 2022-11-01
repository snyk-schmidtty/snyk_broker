#!/bin/bash
docker pull snyk/code-agent
docker stop code-agent
docker rm code-agent
docker run -d \
--name="code-agent" \
--restart=always \
--network SnykBrokerNetwork \
-p 3001:3001 \
-e SNYK_TOKEN=$CODE_AGENT_SNYK_TOKEN \
-e PORT=3001 \
snyk/code-agent
