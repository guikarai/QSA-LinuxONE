# *******************************************************************************************
# QUANTUM-SAFE ON IBM Z AND LINUXONE WITH IBM
# AUTHOR: GUILLAUME HOAREAU
# PURPOSE OF THE FOLLOWING SCRIPT IS TO LIST IN A FILE SW CONFIGURATION ATTRIBUTES OF A HOST
# 1-INFRA
# *******************************************************************************************

#!/bin/bash

#Version of the OS and the release
cat /etc/*issue* > "1-infra-sw-os-version-$(hostname)-$(date +%Y-%m-%d).txt"

#Use the lsmod command to check that all s390x crypto modules are properly loaded.
lsmod > "1-infra-sw-loaded-modules-$(hostname)-$(date +%Y-%m-%d).txt"
