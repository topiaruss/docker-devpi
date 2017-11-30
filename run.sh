#!/bin/bash
# concourse trigger file
set -ex

creds=~/.concourse_credentials.yaml
CONCOURSE_HOST=${CONCOURSE_HOST-concourse}
fly_target=lite
fly -t ${fly_target} login -c http://${CONCOURSE_HOST}:8080
fly -t ${fly_target} sp configure -c pipeline.yaml -p docker-devpi --load-vars-from ${creds} -n
fly -t ${fly_target} unpause-pipeline --pipeline docker-devpi

# if you want to automatically trigger and watch
#fly -t ${fly_target} trigger-job -j docker-devpi/docker-devpi-publish
#fly -t ${fly_target} watch -j docker-devpi/docker-devpi-publish
