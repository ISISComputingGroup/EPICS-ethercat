#!/bin/sh
cd "$(dirname $0)"
OPTS="-q"
if [ "$1" = "-d" ]; then
    OPTS=""
fi
/dls_sw/work/R3.14.12.3/support/ethercat/bin/linux-x86_64/scanner ${OPTS} ./expanded.xml /tmp/socket
