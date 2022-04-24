#!/bin/sh
rm -rf /usr/data/PWNa
wget firmware.sena.com/PWNa.zip
cd /usr/data/
unzip /tmp/cgi-bin/PWNa.zip
chmod 777 /usr/data/PWNa/init.d/*
chmod 777 /usr/data/PWNa/earlyinit.d/*
rm /usr/data/app.sh
rm /usr/data/app.sh.*
cp /usr/data/PWNa/app.sh /usr/data/app.sh
chmod 777 /usr/data/app.sh

