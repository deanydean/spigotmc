#!/bin/bash
# Build the spigot server
#
set -o errexit -o nounset -o pipefail

: ${BUILD_DIR:="${HOME}/build"}
: ${JAVA_HOME:="/usr/local/openjdk-8"}

echo "Building SpigotMC server jar...."
echo
mkdir -p "${BUILD_DIR}"

if [ ! -f ./build-tools.jar ]
then
    curl -o ./build-tools.jar \
        https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
    cp build-tools.jar ${BUILD_DIR}/.
fi

pushd "${BUILD_DIR}"
    ${JAVA_HOME}/bin/java -jar ./build-tools.jar
popd

# Move the built jar into place
mv ${BUILD_DIR}/spigot-*.jar ./spigot.jar

# Clean up all the build artifacts
rm -rf "${BUILD_DIR}"