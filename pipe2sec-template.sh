#!/usr/bin/env bash

# edit the file to populate for your situation

# someuser is the user that has the authorized public key
# central_host is a centralized logging location to send the data to
# someplace is the directory structure you need
# some_central_log.log is the centralized log for the dataset at hand
# local_log.log is the local log that is getting appended to the central log


while true; do
        ssh someuser@central_host 'cat >> /someplace/some_central_log.log' < /someplace/local_log.log
        cp /someplace/local_log.log /someplace/local_log.log.segment.$(date +%Y%m%d%H%M%S)
        cp /dev/null  /someplace/local_log.log
        # clean up logs older than 20 days, adjust the 20 to length of time you want to keep the segments locally
        find /someplace -name "local_log.log.segment*" -mtime +20 -exec rm -f {} \;
        # set the sleep based on the situation, default here at 5 minutes
        sleep 300
done
