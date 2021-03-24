FROM snyk/broker:bitbucket-server

USER root
RUN apt-get update -y && apt-get upgrade -y && apt-get install iputils-ping -y && apt-get install wget -y && apt-get install curl -y && apt-get install tcpdump -y

# Don't run as root
WORKDIR /home/node
USER node 

# Generate default accept filter
RUN broker init bitbucket-server

######################################
# Custom Broker Client configuration #
# Redefine in derived Dockerfile,    #
# or provide as runtime args `-e`    #
######################################

# Your unique broker identifier
ENV BROKER_TOKEN <broker-token>

# Your personal username to your bitbucket server account
ENV BITBUCKET_USERNAME <username>

# Your personal password to your bitbucket server account
ENV BITBUCKET_PASSWORD <password>

# Your Bitbucket Server host, excluding scheme
ENV BITBUCKET your.bitbucket.server.hostname

# The Bitbucket server API URL
ENV BITBUCKET_API $BITBUCKET/rest/api/1.0

# The port used by the broker client to accept internal connections
# Default value is 8000
# ENV PORT 8000

# The URL of your broker client (including scheme and port)
# This will be used as the webhook payload URL coming in from
# your Bitbucket Server.
# ENV BROKER_CLIENT_URL http://<broker.client.hostname>:$PORT

EXPOSE $PORT

CMD ["broker", "--verbose"]
