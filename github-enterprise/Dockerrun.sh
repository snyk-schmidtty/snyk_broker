docker run -d \
--name="github-enterprise-broker" \
--restart=always \
--network SnykBrokerNetwork \
-p 8002:8002 \
-v ~/Workspace/snyk_broker/github.com:/private \
-e BROKER_TOKEN=$GHE_BROKER_TOKEN \
-e LOG_LEVEL=info \
-e ACCEPT=/private/accept.json \
-e GITHUB_TOKEN=$GH_BROKER_GITHUB_TOKEN \
-e BROKER_CLIENT_URL=http://broker.797enterprises.com:8002 \
-e PORT=8002 \
-e GIT_CLIENT_URL=http://code-agent:3000 \
snyk/broker:github-enterprise
