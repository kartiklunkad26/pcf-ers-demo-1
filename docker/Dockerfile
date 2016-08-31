FROM openjdk
MAINTAINER James Williams "williams_jt@yahoo.com"
RUN wget -O cf-cli.deb https://cli.run.pivotal.io/stable?release=debian64
RUN wget -O cf-autopilot https://github.com/contraband/autopilot/releases/download/0.0.2/autopilot-linux

RUN dpkg -i cf-cli.deb
RUN chmod 755 cf-autopilot
RUN cf install-plugin -f cf-autopilot

RUN git clone https://github.com/jwilliams-pivotal/pcf-ers-demo.git
RUN cd ./pcf-ers-demo && ./mvnw -f ./pom.xml package -DskipTests=true
RUN rm -rf ./pcf-ers-demo

WORKDIR /data