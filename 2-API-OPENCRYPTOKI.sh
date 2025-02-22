# ***********************************************************************************************************
# QUANTUM-SAFE ON IBM Z AND LINUXONE WITH IBM
# AUTHOR: GUILLAUME HOAREAU
# PURPOSE OF THE FOLLOWING SCRIPT IS TO LIST IN A FILE API OPENCRYPTOKI CONFIGURATION ATTRIBUTES OF A HOST
# 2-API-OPENCRYPTOKI
# ***********************************************************************************************************

#!/bin/bash

#Display slot info.
pkcsconf -s > "2-api-opencryptoki-config-slotinfo-$(hostname)-$(date +%Y-%m-%d).txt"

#Display the list of available tokens by using the command.
pkcsconf -S > "2-api-opencryptoki-config-tokensinfo-$(hostname)-$(date +%Y-%m-%d).txt"

#Show the accumulated statistics from all users. Only the root user can display the accumulated statistics from other users.
pkcsstats -A > "2-api-opencryptoki-stats-accumulatedallusers-$(hostname)-$(date +%Y-%m-%d).txt"

#Show the statistics from all users. Only the root user can display statistics from all users.
pkcsstats -t > "2-api-opencryptoki-stats-allusers-$(hostname)-$(date +%Y-%m-%d).txt"
