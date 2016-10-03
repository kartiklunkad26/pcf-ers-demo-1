FROM openjdk
MAINTAINER Kartik Lunkad "klunkad@pivotal.io"
RUN wget -O cf-cli.deb https://cli.run.pivotal.io/stable?release=debian64
RUN wget -O cf-autopilot https://github.com/contraband/autopilot/releases/download/0.0.2/autopilot-linux

RUN dpkg -i cf-cli.deb
RUN chmod 755 cf-autopilot
RUN cf install-plugin -f cf-autopilot

RUN git clone https://github.com/kartiklunkad26/pcf-ers-demo.git
RUN cd ./pcf-ers-demo && ./mvnw -f ./pom.xml package -DskipTests=true
RUN rm -rf ./pcf-ers-demo

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g newman

WORKDIR /data
