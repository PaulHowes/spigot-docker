FROM openjdk:8-jre-alpine

# Builds the directory structure of the container.
RUN mkdir -p /opt/spigot/bin
RUN mkdir -p /var/lib/spigot/config
RUN mkdir -p /var/lib/spigot/worlds

# Copies the JAR files into the container.
ARG SPIGOT_REV
COPY craftbukkit-${SPIGOT_REV}.jar /opt/spigot/bin/craftbukkit.jar
COPY spigot-${SPIGOT_REV}.jar /opt/spigot/bin/spigot.jar

# Default Minecraft server port
EXPOSE 25565/tcp

# Command to launch the server
CMD cd /var/lib/spigot/config && java -Xms1G -Xmx1G -XX:+UseConcMarkSweepGC -jar /opt/spigot/bin/spigot.jar nogui --universe /var/lib/spigot/worlds