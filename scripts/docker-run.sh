#!/bin/bash
# Run script for docker container
#
set -o errexit -o nounset -o pipefail

: ${JAVA_HOME:="/usr/local/openjdk-8"}
: ${SERVER_VERSION:=""}

# Do we need to build the server?
if [ ! -f spigot.jar ]
then
    echo "SpigotMC jar is missing. Building it now...."
    echo
    SPIGOT_VERSION="${SERVER_VERSION}"\
        /opt/spigotmc/scripts/build-spigot-server.sh
fi

echo
echo "Running SpigotMC server...."
echo
exec ${JAVA_HOME}/bin/java -jar spigot.jar