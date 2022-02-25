#!/bin/bash
docker pull snyk/broker:gitlab
docker stop gitlab-broker
docker rm gitlab-broker
docker run -d \
--name="gitlab-broker" \
--restart=always \
--network SnykBrokerNetwork \
-p 8000:8000 \
-v ~/Workspace/snyk_broker/gitlab:/private \
-e BROKER_TOKEN=$GITLAB_BROKER_TOKEN \
-e LOG_LEVEL=info \
-e ACCEPT=/private/accept.json \
-e BITBUCKET_USERNAME=$BITBUCKET_USER \
-e BITBUCKET_PASSWORD=$BITBUCKET_PASSWORD \
-e BITBUCKET=bitbucket.797enterprises.com:7990 \
-e BITBUCKET_API=bitbucket.797enterprises.com:7990/rest/api/1.0 \
-e BROKER_CLIENT_URL=http://broker.797enterprises.com:8000 \
-e PORT=8000 \
-e GIT_CLIENT_URL=http://code-agent:3000 \
snyk/broker:gitlab