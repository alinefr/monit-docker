#!/bin/bash

if [ ! -f /etc/monit/monitrc ]; then
  cp /etc/monitrc /etc/monit/ \
  && sed -i 's/^#.*include.*\/etc\/monit.d\/\*/include \/etc\/monit\/monit.d\/*/' /etc/monit/monitrc
fi

exec "$@"
