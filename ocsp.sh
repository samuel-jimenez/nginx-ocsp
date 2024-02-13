#!/bin/sh

echo QUIT | openssl s_client -connect $1:443 -servername $1 -status 2> /dev/null | grep -A 17 'OCSP response:' | grep -B 17 'Next Update'
