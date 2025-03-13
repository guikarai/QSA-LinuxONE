# *****************************************************************************************************
# QUANTUM-SAFE ON IBM Z AND LINUXONE WITH IBM
# AUTHOR: GUILLAUME HOAREAU
# PURPOSE OF THE FOLLOWING SCRIPT IS TO LIST OPENSSL CONFIGURATIONS IN A FILE FOR A GIVEN HOST
# 4-NETWORK-OPENSSL
# *****************************************************************************************************

#!/bin/bash
echo "******************** WARNING ********************"
echo "* Execution of this script takes minutes. *"
echo "* CPU Bound activity in 1 thread is expected. *"
echo "* Please do not abort. *"
echo "******************** WARNING ********************"
echo ""

#OpenSSL is commonly used for cryptographic operations on Linux. Check the version and algorithms used:
openssl version > "4-network-openssl-version-$(hostname)-$(date +%Y-%m-%d).txt"

#Let's check whether the dynamic engine loading support is enabled by default and the engine ibmca is available and used in the installation.
openssl engine -c > "4-network-openssl-engine-$(hostname)-$(date +%Y-%m-%d).txt"

#Performance test to assess hardware encryption adherence with CPACF (AES128):
echo "AES ENCRYPTION BENCHMARK"
openssl speed -evp aes-128-cbc > "4-network-openssl-aes-benchmark-$(hostname)-$(date +%Y-%m-%d).txt"
echo "AES DECRYPTION BENCHMARK"
openssl speed -evp aes-128-cbc -decrypt >> "4-network-openssl-aes-benchmark-$(hostname)-$(date +%Y-%m-%d).txt"

#Performance test to assess hardware encryption adherence with CPACF (SHA512):
echo "SHA512 ENCRYPTION BENCHMARK"
openssl speed -evp sha512 > "4-network-openssl-sha512-benchmark-$(hostname)-$(date +%Y-%m-%d).txt"

#Performance test to assess hardware encryption adherence with CPACF (RSA2048):
echo "RSA2024 ENCRYPTION BENCHMARK"
openssl speed rsa2048 > "4-network-openssl-rsa2048-benchmark-$(hostname)-$(date +%Y-%m-%d).txt"

#Performance test to assess hardware encryption adherence with CPACF (ECC-P256):
echo "ECC-P256 ENCRYPTION BENCHMARK"
openssl speed ecdsap256 > "4-network-openssl-eccp256-benchmark-$(hostname)-$(date +%Y-%m-%d).txt"
