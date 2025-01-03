# One time configuration dumps
This section is about collecting at first for each Linux Guest, information about their configuration, and existing packages. This will allow IBM TEL expert to plan better next phase of the Quantum-Safe assessment.

Results of a list of Linux commands to be redirected into a unique file per Linux Guest.

**0. To create the target a file to persist results of linux commands**
```
touch "$(hostname)_$(date +%Y-%m-%d).txt"
```

**1. Evaluate IBM Z harware configuration**
A Linux on IBM Z user can easily check whether the Crypto Enablement feature is installed and which algorithms are supported in hardware. Hardware-acceleration for DES, TDES, AES, and GHASH requires CPACF. Issue the command shown below to discover whether the CPACF feature is enabled on your hardware.
```
cat /proc/cpuinfo >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

**2. Evaluate IBM Z processor configuration**

**3. Evaluate Linux-390x-utils configuration**

**4. Evaluate IBM CCA configuration**

**5. Evaluate JAVA configuration**

**6. Evaluate OpenCryptoki configuration**

**7. Evaluate zKey configuration**

**8. Evaluate OpenPGP configuration**

**9. Evaluate Libica configuration**
Use the icainfo command to check on the CPACF feature code enablement. The icainfo command displays which CPACF functions are supported by the implementation inside the libica library. Issue the following command to show which cryptographic algorithms will be hardware-accelerated by the libica driver, and which one will remain software-only implementations.
```
icainfo --version >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

```
icainfo >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

Validate that the libica crypto API is working properly. Please issue the following command:
```
icastats >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

**10. Evaluate dmcrypt configuration**
To list all active dm-crypt mappings.
```
dmsetup status >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

Alternate way to list all active dm-crypt mappings.
```
lsblk >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

Inspect the system logs for dm-crypt related errors.
```
sudo dmesg | grep dm-crypt >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

To evaluate the encryption algorithm and cipher being used:
```
sudo dmsetup table >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

Inspect /etc/crypttab to verify how encrypted devices are set up for auto-mounting.
```
cat /etc/crypttab >> "$(hostname)_$(date +%Y-%m-%d).txt"
```


**11. Evaluate module configuration**
Use the lsmod command to check that all s390x crypto modules are properly loaded.
```
lsmod >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

**12. Evaluate OpenSSL configuration**
OpenSSL is commonly used for cryptographic operations on Linux. Check the version and algorithms used:
```
openssl version >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

Let's check whether the dynamic engine loading support is enabled by default and the engine ibmca is available and used in the installation.
```
openssl engine -c >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

**1. Evaluate OpenSSH Server Configuration**

**1. Evaluate OpenSSH Client Configuration**
