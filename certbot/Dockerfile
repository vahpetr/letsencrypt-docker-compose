FROM certbot/certbot:v1.31.0

RUN apk --update --no-cache upgrade
RUN apk add --no-cache bash

COPY certbot.sh /opt/

RUN chmod +x /opt/certbot.sh

ENTRYPOINT ["/opt/certbot.sh"]