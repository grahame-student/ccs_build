# Container image that runs your code
FROM alpine:3.16

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY build_project.sh /build_project.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/build_project.sh"]
