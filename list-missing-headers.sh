#!/bin/bash
./compile.sh 2>&1 >/dev/null | grep "fatal error" | awk -F'[ :]' '{ printf("%s;%s\n",  $1, $8) }' | tee missing-headers.tmp
awk '!seen[$0]++' missing-headers.tmp > missing-headers.txt
