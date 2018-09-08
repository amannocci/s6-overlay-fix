# Base image
FROM ubuntu

# Install s6-overlay
ADD https://github.com/just-containers/s6-overlay/releases/download/v1.21.4.0/s6-overlay-amd64.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C /

# Install python
RUN apt-get update > /dev/null \
  && apt-get install -y strace

# Runtime environments
ENV S6_SERVICES_GRACETIME=10000

# Copy files
COPY rootfs /

# Fix permission
RUN chmod +x /etc/s6/init/init-stage3

# Entrypoint s6-overlay
ENTRYPOINT ["/init"]
