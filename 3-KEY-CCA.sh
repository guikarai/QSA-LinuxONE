# *****************************************************************************************************
# QUANTUM-SAFE ON IBM Z AND LINUXONE WITH IBM
# AUTHOR: GUILLAUME HOAREAU
# PURPOSE OF THE FOLLOWING SCRIPT IS TO LIST CCA KEYS A FILE FOR A GIVEN HOST
# 3-KEY-CCA
# *****************************************************************************************************

#!/bin/bash

#List the labels and key types for all the keys in a designated key storage file.
panel.exe --ks-list --ks-type=DES > "3-key-cca-kslistdes-$(hostname)-$(date +%Y-%m-%d).txt"
panel.exe --ks-list --ks-type=AES > "3-key-cca-kslistaes-$(hostname)-$(date +%Y-%m-%d).txt"
panel.exe --ks-list --ks-type=PKA > "3-key-cca-kslistpka-$(hostname)-$(date +%Y-%m-%d).txt"
panel.exe --ks-list --ks-type=CMB --kba-type=DES > "3-key-cca-kslistcmbdes-$(hostname)-$(date +%Y-%m-%d).txt"
panel.exe --ks-list --ks-type=CMB --kba-type=AES > "3-key-cca-kslistcmbaes-$(hostname)-$(date +%Y-%m-%d).txt"
panel.exe --ks-list --ks-type=CMB --kba-type=PKA > "3-key-cca-kslistcmbpka-$(hostname)-$(date +%Y-%m-%d).txt"
