#!/bin/bash
./compile.sh 2>&1 >/dev/null | grep "error: use of enum" | awk '!seen[$0]++'
