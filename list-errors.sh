#!/bin/bash
./compile.sh  2>&1 >/dev/null | grep -v i686-w64-mingw32 | awk '!seen[$0]++' | grep error |  tee current-errors.txt
