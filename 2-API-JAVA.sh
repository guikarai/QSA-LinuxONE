# ***************************************************************************************************
# QUANTUM-SAFE ON IBM Z AND LINUXONE WITH IBM
# AUTHOR: GUILLAUME HOAREAU
# PURPOSE OF THE FOLLOWING SCRIPT IS TO LIST IN A FILE JAVA API CONFIGURATION ATTRIBUTES OF A HOST
# 2-API-JAVA
# ****************************************************************************************************

#!/bin/bash

#Verify the installed Java version to ensure JCE is available.
java -version > "2-api-java-version-$(hostname)-$(date +%Y-%m-%d).txt"

#If your Java application uses SSL/TLS, validate its configuration with the following command.
java -Djavax.net.debug=ssl -version > "2-api-java-ssltls-version-$(hostname)-$(date +%Y-%m-%d).txt"

#Display the installed security providers and their configuration.
java -Djava.security.debug=provider -version > "2-api-java-security-providers-$(hostname)-$(date +%Y-%m-%d).txt"
