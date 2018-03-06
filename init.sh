#!/bin/bash
set -e
if [ -n "$SENSORS_HOST" ]; then
	if [ -z "$SENSORS_PORT" ]; then
        sed -i "s/\$SENSORS_HOST/$SENSORS_HOST/g" /etc/logagent.conf
        sed -i "s/\$SENSORS_PORT/8106/g" /etc/logagent.conf
        sed -i "s/\$LOGAGENT_ID//g" /etc/logagent.conf
    else
    	sed -i "s/\$SENSORS_HOST/$SENSORS_HOST/g" /etc/logagent.conf
    	sed -i "s/\$SENSORS_PORT/$SENSORS_PORT/g" /etc/logagent.conf
        sed -i "s/\$LOGAGENT_ID/$LOGAGENT_ID/g" /etc/logagent.conf
    fi
fi

exec "$@"
