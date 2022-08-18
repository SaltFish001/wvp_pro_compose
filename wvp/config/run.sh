#!/bin/bash
# echo ${WVP_IP}
# echo ${WVP_CONFIG}
# redis-server --daemonize yes --bind 0.0.0.0
cp /config/config.ini /opt/media/config.ini
cd /opt/assist
nohup java -jar *.jar --spring.config.location=/opt/assist/config/application.yml &
nohup /opt/media/MediaServer -d -m 3 &
cd /opt/wvp
java -jar *.jar --spring.config.location=/opt/wvp/config/application.yml
