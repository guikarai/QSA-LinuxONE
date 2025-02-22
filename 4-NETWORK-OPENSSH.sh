# *****************************************************************************************************
# QUANTUM-SAFE ON IBM Z AND LINUXONE WITH IBM
# AUTHOR: GUILLAUME HOAREAU
# PURPOSE OF THE FOLLOWING SCRIPT IS TO LIST OPENSSH CONFIGURATIONS IN A FILE FOR A GIVEN HOST
# 4-NETWORK-OPENSSH
# *****************************************************************************************************

#!/bin/bash

#Dumping configuration of SSH_CONFIG
cat /etc/ssh/ssh_config > "4-network-ssh-sshconfig-$(hostname)-$(date +%Y-%m-%d).txt"

#Dumping configuration of SSHD_CONFIG
cat /etc/ssh/sshd_config > "4-network-ssh-sshdconfig-$(hostname)-$(date +%Y-%m-%d).txt"

#Debbuging localhost SSH Connection
ssh localhost >&1 tee "4-network-ssh-localhost-$(hostname)-$(date +%Y-%m-%d).txt"
