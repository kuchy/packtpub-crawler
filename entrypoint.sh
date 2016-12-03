#!/bin/sh

# for download now
if [ "$1" = "singleRun" ]; then
	shift
	python /script/spider.py $@
	exit 0;
fi

# load and run cron demon
crontab /etc/cron.d/* && cron && tail -f /var/log/cron.log
