FROM jboss/base-jdk:8

COPY ./target/SampleApp-swarm.jar /usr/local/lib/

CMD ["java", "-jar" "/usr/local/lib/SampleApp-swarm.jar"]