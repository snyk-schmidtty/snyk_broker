#!/bin/bash
docker pull snyk/broker:github-com
docker stop github-com-broker
docker rm github-com-broker
docker run -d \
--name="github-com-broker" \
--restart=always \
--network SnykBrokerNetwork \
-p 8001:8001 \
-v ~/Workspace/snyk_broker/github.com:/private \
-e BROKER_TOKEN=$GH_BROKER_TOKEN \
-e LOG_LEVEL=info \
-e ACCEPT=/private/accept.json \
-e GITHUB_TOKEN=$GH_BROKER_GITHUB_TOKEN \
-e BROKER_CLIENT_URL=http://broker.797enterprises.com:8001 \
-e PORT=8001 \
-e GIT_CLIENT_URL=http://code-agent:3000 \
snyk/broker:github-com