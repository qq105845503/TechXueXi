#!/bin/sh
git -C /xuexi/code/TechXueXi config pull.ff only
printenv >> /etc/environment
touch /var/log/cron.log
./run.sh 2>&1 &
echo -e "$CRONTIME $USER /xuexi/run.sh >> /var/log/cron.log 2>&1\n#empty line" > /etc/cron.d/mycron
crontab /etc/cron.d/mycron
cron && tail -f /var/log/cron.log
