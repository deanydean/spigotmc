#!/bin/bash
# Entrypoint for container startup
#
set -o errexit -o nounset -o pipefail

echo "Starting SpigotMC server...."
echo

if [ $# -gt 0 ]
then
    echo "Running $@"
    exec $@
else
    echo "Running interactive shell"
    exec /bin/bash
fi