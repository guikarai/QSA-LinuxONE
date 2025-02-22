# *****************************************************************************************************
# QUANTUM-SAFE ON IBM Z AND LINUXONE WITH IBM
# AUTHOR: GUILLAUME HOAREAU
# PURPOSE OF THE FOLLOWING SCRIPT IS TO LIST TKE ATTRIBUTES IN A FILE FOR A GIVEN HOST
# 3-KEY-TKE
# *****************************************************************************************************

#!/bin/bash

#Display if TKE properties.
panel.exe --query-tke > "3-key-tke-$(hostname)-$(date +%Y-%m-%d).txt"

#To verify whether the catcher.exe daemon is running on your system, enter the following command and look for the daemon in the output list.
ps ax
