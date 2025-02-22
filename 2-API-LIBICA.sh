# *****************************************************************************************************
# QUANTUM-SAFE ON IBM Z AND LINUXONE WITH IBM
# AUTHOR: GUILLAUME HOAREAU
# PURPOSE OF THE FOLLOWING SCRIPT IS TO LIST IN A FILE LIBICA API CONFIGURATION ATTRIBUTES OF A HOST
# 2-API-LIBICA
# *****************************************************************************************************

#!/bin/bash

#Display version of icainfo
icainfo --version > "2-api-libica-icainfoversion-$(hostname)-$(date +%Y-%m-%d).txt"

#Display supported algorithms
icainfo > "2-api-libica-config-icainfo-$(hostname)-$(date +%Y-%m-%d).txt"

#Validate that the libica crypto API is working properly. Please issue the following command:
icastats >"2-api-libica-config-icastats-$(hostname)-$(date +%Y-%m-%d).txt"
