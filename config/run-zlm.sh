#!/bin/bash
cp /config/config.ini /opt/media/config.ini
cd /opt/assist
nohup java -jar *.jar --spring.config.location=/opt/assist/config/application.assist.yml &
/opt/media/MediaServer -d -m 3
