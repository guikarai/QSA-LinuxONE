# *************************************************************************************************************
# QUANTUM-SAFE ON IBM Z AND LINUXONE WITH IBM
# AUTHOR: GUILLAUME HOAREAU
# PURPOSE OF THE FOLLOWING SCRIPT IS TO LIST DMCRYPT PROPERTIES AND CONFIGURATION IN A FILE FOR A GIVEN HOST
# 5-DATA-DMCRYPT
# *************************************************************************************************************

#!/bin/bash

#To list all active dm-crypt mappings.
dmsetup status > "5-data-dmcrypt-status-$(hostname)-$(date +%Y-%m-%d).txt"

#Alternate way to list all active dm-crypt mappings.
lsblk > "5-data-dmcrypt-lsblk-$(hostname)-$(date +%Y-%m-%d).txt"

#Inspect the system logs for dm-crypt related errors.
sudo dmesg | grep dm-crypt > "5-data-dmcrypt-systemslogs-$(hostname)-$(date +%Y-%m-%d).txt"

#To evaluate the encryption algorithm and cipher being used.
sudo dmsetup table > "5-data-dmcrypt-dmsetuptable-$(hostname)-$(date +%Y-%m-%d).txt"

#Inspect /etc/crypttab to verify how encrypted devices are set up for auto-mounting.
cat /etc/crypttab > "5-data-dmcrypt-crypptab-$(hostname)-$(date +%Y-%m-%d).txt"
