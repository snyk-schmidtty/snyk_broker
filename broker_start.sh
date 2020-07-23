docker run --restart=always \
-p 8000:8000 \
-e BROKER_TOKEN= \
-e BITBUCKET_USERNAME= \
-e BITBUCKET_PASSWORD= \
-e BITBUCKET=bitbucket.797enterprises.com \
-e BITBUCKET_API=bitbucket.797enterprises.com/rest/api/1.0/ \
-e BROKER_CLIENT_URL=http://broker.797enterprises.com:8000 \
-e PORT=8000 \
-e ACCEPT=/private/accept.json \
-e LOG_LEVEL=info \
#-v /home/ubuntu/Workspace:/private \
snyk/broker:bitbucket-server
