#
# Dockerfile that creates a SpigotMC server container image

FROM openjdk:8

# Set up the image for the server
RUN mkdir -p /spigotmc
WORKDIR /spigotmc

# Add the files we need
ADD ./etc /opt/spigotmc/etc
ADD ./scripts /opt/spigotmc/scripts

EXPOSE 25565
VOLUME [ "/spigotmc" ]

CMD [ "/opt/spigotmc/scripts/docker-run.sh" ]
ENTRYPOINT [ "/opt/spigotmc/scripts/docker-entrypoint.sh" ]