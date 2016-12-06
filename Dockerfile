FROM python:2.7

MAINTAINER Martin Kuchynar <matokuchy@gmail.com>

RUN apt-get update && apt-get install -y cron
RUN touch /var/log/cron.log
RUN touch /etc/cron.d/packtpub-crawler

COPY requirements.txt /requirements.txt
COPY script /script
RUN pip install -r /requirements.txt

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

VOLUME ["/config", "/etc/cron.d"]

ENTRYPOINT ["/entrypoint.sh"]

CMD [ "crontab /etc/cron.d/* && cron && tail -f /var/log/cron.log" ]
