FROM jre8.server

COPY ./target/SampleApp-swarm.jar /usr/lib/swarm.jar 
EXPOSE 8080
CMD java -jar  /usr/lib/swarm.jar
 
