#!/bin/bash
docker pull snyk/broker:bitbucket-server
docker pull snyk/broker:github-com
docker pull snyk/broker:gitlab
docker pull snyk/code-agent
docker pull snyk/container-registry-agent

docker container stop bitbucket-server-broker
docker container rm bitbucket-server-broker