#!/bin/sh
# This file was automatically generated on Thu 29 Jan 2015 09:31:26 GMT from
# source: /dls_sw/prod/R3.14.12.3/support/ethercat/4-1/etc/makeIocs/led.xml
# 
# *** Please do not edit this file: edit the source file instead. ***
# 
cd "$(dirname "$0")"
if [ -n "$1" ]; then
    export EPICS_CA_SERVER_PORT="$(($1))"
    export EPICS_CA_REPEATER_PORT="$(($1 + 1))"
    [ $EPICS_CA_SERVER_PORT -gt 0 ] || {
        echo "First argument '$1' should be a integer greater than 0"
        exit 1
    }
fi
exec ./led stled.boot
