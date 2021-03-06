# Pull base image.
FROM quay.io/datawerk/docker_centos_java7:latest

# Install Vert.x
RUN wget http://dl.bintray.com/vertx/downloads/vert.x-2.1.5.tar.gz -P /tmp
RUN mkdir -p /usr/local/vertx; tar zxf /tmp/vert.x-2.1.5.tar.gz -C /usr/local/vertx --strip-components=1
RUN rm /tmp/vert.x-2.1.5.tar.gz
ENV PATH $PATH:/usr/local/vertx/bin

# Add app
ADD vertxrun.sh /root/
RUN chmod +x /root/vertxrun.sh
ADD server.js /root/server.js

# Expose
EXPOSE 8080

# Run
CMD ["/root/vertxrun.sh"]
