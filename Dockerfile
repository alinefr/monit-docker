FROM alpine:latest

RUN apk add --update monit bash curl
COPY docker-entrypoint.sh /

VOLUME /etc/monit
EXPOSE 2812
ENTRYPOINT ["bash", "/docker-entrypoint.sh"]
CMD ["monit", "-c", "/etc/monit/monitrc", "-I"]
