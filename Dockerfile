FROM alpine:latest

RUN apk add --update monit bash curl
RUN mkdir -p /var/lib/monit /etc/monit/monit.d \
  && mv /etc/monitrc /etc/monit/ \
  && sed -i 's/^#.*include.*\/etc\/monit.d\/\*/include \/etc\/monit\/monit.d\/*/' /etc/monit/monitrc

VOLUME /etc/monit
EXPOSE 2812
ENTRYPOINT ["monit", "-c", "/etc/monit/monitrc", "-I"]
