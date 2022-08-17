FROM alpine:3

RUN apk update && apk add logrotate nano

RUN mkdir /backups

COPY logrotate.conf /etc/logrotate.conf
RUN chmod 644 /etc/logrotate.conf

COPY remove_backups.sh /remove_backups.sh
RUN chmod +x /remove_backups.sh

RUN echo '7  6,18  *  *  * /bin/sh /remove_backups.sh >> /var/log/remove_backups.log' >> /etc/crontabs/root

WORKDIR /backups

CMD [ "crond", "-l", "4", "-f", "-L", "/var/log/cron.log" ]
