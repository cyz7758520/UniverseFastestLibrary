#!/bin/bash
set -x

clear
./b编译.sh
if [ $? -ne 0 ]; then exit -1; fi
