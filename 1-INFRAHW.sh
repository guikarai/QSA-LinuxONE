# *******************************************************************************************
# QUANTUM-SAFE ON IBM Z AND LINUXONE WITH IBM
# AUTHOR: GUILLAUME HOAREAU
# PURPOSE OF THE FOLLOWING SCRIPT IS TO LIST IN A FILE HW CONFIGURATION ATTRIBUTES OF A HOST
# 1-INFRA
# *******************************************************************************************

#!/bin/bash

#The command lscpu displays information on processor architecture.
lscpu > "1-infra-config-lscpu-$(hostname)-$(date +%Y-%m-%d).txt"

#lscpu takes information from /proc/cpuinfo
cat /proc/cpuinfo > "1-infra-config-cpuinfo-$(hostname)-$(date +%Y-%m-%d).txt"
