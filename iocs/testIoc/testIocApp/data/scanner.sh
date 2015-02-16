#!/bin/sh
cd "$(dirname $0)"
/dls_sw/work/R3.14.12.3/support/el2595_support/bin/linux-x86_64/scanner -q ./expanded.xml /tmp/scanner
