FROM ubuntu:xenial

RUN apt-get update && apt-get install -y curl wget jq

COPY check /opt/resource/check
COPY in    /opt/resource/in
COPY out   /opt/resource/out

RUN chmod +x /opt/resource/out /opt/resource/in /opt/resource/check
