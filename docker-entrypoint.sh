#!/bin/bash

if [ -f /etc/monitrc ]; then
  mv /etc/monitrc /etc/monit/ \
  && sed -i 's/^#.*include.*\/etc\/monit.d\/\*/include \/etc\/monit\/monit.d\/*/' /etc/monit/monitrc
fi

exec "$@"
