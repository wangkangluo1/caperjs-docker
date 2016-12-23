#!/bin/bash
set -x
source /etc/profile
service ssh restart

while true; do sleep 1000; done
