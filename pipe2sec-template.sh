#!/usr/bin/env bash

# edit the file to populate for your situation

# someuser is the user that has the authorized public key
# central_host is a centralized logging location to send the data to
# someplace is the directory structure you need
# some_central_log.log is the centralized log for the dataset at hand
# local_log.log is the local log that is getting appended to the central log


while true; do
        ssh someuser@central_host 'tail -f >> /someplace/some_central_log.log' < /someplace/local_log.log
done
