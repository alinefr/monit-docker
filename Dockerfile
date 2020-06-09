FROM alpine:latest

RUN apk add --update monit bash curl docker-cli bind-tools \
  && mkdir -p /var/lib/monit /etc/monit/monit.d
COPY docker-entrypoint.sh /

VOLUME /etc/monit
EXPOSE 2812
ENTRYPOINT ["bash", "/docker-entrypoint.sh"]
CMD ["monit", "-c", "/etc/monit/monitrc", "-I"]
