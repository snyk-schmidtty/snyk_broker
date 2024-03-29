#!/bin/bash
docker pull snyk/broker:bitbucket-server
docker stop bitbucket-server-broker
docker rm bitbucket-server-broker
docker run -d \
--name="bitbucket-server-broker" \
--restart=always \
--network SnykBrokerNetwork \
-p 8000:8000 \
-v ~/Workspace/snyk_broker/bitbucket:/private \
-e BROKER_TOKEN=$BITBUCKET_BROKER_TOKEN \
-e LOG_LEVEL=info \
-e ACCEPT=/private/accept.json \
-e BITBUCKET_USERNAME=$BITBUCKET_USER \
-e BITBUCKET_PASSWORD=$BITBUCKET_PASSWORD \
-e BITBUCKET=bitbucket.797enterprises.com:7990 \
-e BITBUCKET_API=bitbucket.797enterprises.com:7990/rest/api/1.0 \
-e BROKER_CLIENT_URL=http://broker.797enterprises.com:8000 \
-e PORT=8000 \
-e GIT_CLIENT_URL=http://code-agent:3000 \
snyk/broker:bitbucket-server