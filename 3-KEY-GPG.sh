# *****************************************************************************************************
# QUANTUM-SAFE ON IBM Z AND LINUXONE WITH IBM
# AUTHOR: GUILLAUME HOAREAU
# PURPOSE OF THE FOLLOWING SCRIPT IS TO LIST GPG KEYS A FILE FOR A GIVEN HOST
# 3-KEY-GPG
# *****************************************************************************************************

#!/bin/bash

#To display all keys public in your GPG keyring.
gpg --list-keys > "3-key-gpg-publickeylist-$(hostname)-$(date +%Y-%m-%d).txt"

#To display all keys private in your GPG keyring.
gpg --list-secret-keys > "3-key-gpg-privatekeylist-$(hostname)-$(date +%Y-%m-%d).txt"
