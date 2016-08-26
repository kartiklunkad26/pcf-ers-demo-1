#
# Super simple example of a Dockerfile
#
FROM openjdk
MAINTAINER James Williams "williams_jt@yahoo.com"
RUN wget -O cf-cli.deb https://cli.run.pivotal.io/stable?release=debian64
RUN wget -O cf-autopilot https://github.com/contraband/autopilot/releases/download/0.0.2/autopilot-linux

RUN dpkg -i cf-cli.deb
RUN chmod 755 cf-autopilot
RUN cf install-plugin -f cf-autopilot

WORKDIR /data