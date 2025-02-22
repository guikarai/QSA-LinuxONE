# *****************************************************************************************************
# QUANTUM-SAFE ON IBM Z AND LINUXONE WITH IBM
# AUTHOR: GUILLAUME HOAREAU
# PURPOSE OF THE FOLLOWING SCRIPT IS TO LIST ZKEY KEYS A FILE FOR A GIVEN HOST
# 3-KEY-ZKEY
# *****************************************************************************************************

#!/bin/bash

#Display zkey version.
zkey --version > "3-key-zkey-version-$(hostname)-$(date +%Y-%m-%d).txt"

#List keys managed by zKEY.
zkey list > "3-key-zkey-list-$(hostname)-$(date +%Y-%m-%d).txt"
