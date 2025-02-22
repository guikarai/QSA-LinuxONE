# *****************************************************************************************************
# QUANTUM-SAFE ON IBM Z AND LINUXONE WITH IBM
# AUTHOR: GUILLAUME HOAREAU
# PURPOSE OF THE FOLLOWING SCRIPT IS TO LIST IN A FILE CCA API CONFIGURATION ATTRIBUTES OF A HOST
# 2-API-CCA
# *****************************************************************************************************

#!/bin/bash
#Show the compliance state of the current domain.
panel.exe --qcomp > "2-api-cca-config-panelqcomp-$(hostname)-$(date +%Y-%m-%d).txt"

#Show and verify the outbound authentication (OA) certificate chain that represents the chain of trust for the adapter firmware.
panel.exe --epoc-cert-validate > "2-api-cca-config-epoccertvalidate-$(hostname)-$(date +%Y-%m-%d).txt"

#List the coprocessors currently active in the Linux® system and their master key status.
panel.exe --status > "2-api-cca-config-panelstatus-$(hostname)-$(date +%Y-%m-%d).txt"
