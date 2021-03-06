###
# Mainflux GTTP Sender Dockerfile
###

FROM golang:alpine
MAINTAINER Mainflux

ENV MONGO_HOST mongo
ENV MONGO_PORT 27017

###
# Install
###
# Copy the local package files to the container's workspace.
ADD . /go/src/github.com/mainflux/mainflux-manager
RUN cd /go/src/github.com/mainflux/mainflux-manager && go install

###
# Run main command with dockerize
###
CMD mainflux-manager -m $MONGO_HOST
