#!/bin/bash
docker pull snyk/broker:gitlab
docker stop gitlab-broker
docker rm gitlab-broker
docker run -d \
--name="gitlab-broker" \
--restart=always \
--network SnykBrokerNetwork \
-p 8003:8003 \
-v ~/Workspace/snyk_broker/gitlab:/private \
-e BROKER_TOKEN=$GITLAB_BROKER_TOKEN \
-e LOG_LEVEL=info \
-e ACCEPT=/private/accept.json \
-e BITBUCKET_USERNAME=$BITBUCKET_USER \
-e BITBUCKET_PASSWORD=$BITBUCKET_PASSWORD \
-e BITBUCKET=bitbucket.797enterprises.com:7990 \
-e BITBUCKET_API=bitbucket.797enterprises.com:7990/rest/api/1.0 \
-e BROKER_CLIENT_URL=http://broker.797enterprises.com:8003 \
-e PORT=8003 \
-e GIT_CLIENT_URL=http://code-agent:3001 \
snyk/broker:gitlab
