#!/bin/bash
set -o errexit   # abort on nonzero exit status
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes

# run test project
docker compose -f /opt/conf/nginx.docker-compose.yml up -d

echo "STAND IS READY!"
exit 0