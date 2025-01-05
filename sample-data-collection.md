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

```
lscpu >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

**4. Evaluate IBM CCA configuration**

Show the compliance state of the current domain.
```
panel.exe --qcomp >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

Show and verify the outbound authentication (OA) certificate chain that represents the chain of trust for the adapter firmware.
```
panel.exe --epoc-cert-validate >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

Determine if a TKE is currently able to administer a specific active coprocessor.
```
panel.exe --query-tke >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

List the labels and key types for all the keys in a designated key storage file.
```
panel.exe --ks-list --ks-type=DES >> "$(hostname)_$(date +%Y-%m-%d).txt"
panel.exe --ks-list --ks-type=AES >> "$(hostname)_$(date +%Y-%m-%d).txt"
panel.exe --ks-list --ks-type=PKA >> "$(hostname)_$(date +%Y-%m-%d).txt"
panel.exe --ks-list --ks-type=CMB --kba-type=DES >> "$(hostname)_$(date +%Y-%m-%d).txt"
panel.exe --ks-list --ks-type=CMB --kba-type=AES >> "$(hostname)_$(date +%Y-%m-%d).txt"
panel.exe --ks-list --ks-type=CMB --kba-type=PKA >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

List the coprocessors currently active in the Linux® system and their master key status.
```
panel.exe --status
```

**5. Evaluate JAVA configuration**

Verify the installed Java version to ensure JCE is available.
```
java -version >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

If your Java application uses SSL/TLS, validate its configuration with the following command.
```
java -Djavax.net.debug=ssl -version >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

Display the installed security providers and their configuration.
```
java -Djava.security.debug=provider -version >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

**6. Evaluate OpenCryptoki configuration**

Display slot info.
```
pkcsconf -s >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

Display the list of available tokens by using the command.
```
pkcsconf -S >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

Show the accumulated statistics from all users. Only the root user can display the accumulated statistics from other users.
```
pkcsstats -A >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

Show the statistics from all users. Only the root user can display statistics from all users.
```
pkcsstats -t >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

**7. Evaluate zKey configuration**

To display the version number of zkey.
```
zkey --version >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

To list all secure keys in the secure key repository and display their attributes.
```
zkey list >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

**8. Evaluate OpenPGP configuration**
To assess OpenPGP (GPG) configuration, certificates, and key materials on a Linux system, you can use the following commands.

Verify the installed GPG version to ensure it supports modern algorithms.
```
gpg --version >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

To display all keys public in your GPG keyring.
```
gpg --list-keys >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

To display all keys private in your GPG keyring.
```
gpg --list-secret-keys >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

Inspect the trust model and trust levels assigned to keys.
```
gpg --check-trustdb >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

Inspect the GPG configuration file for custom settings.
```
cat ~/.gnupg/gpg.conf >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

To check the supported algorithms for encryption, signing, and compression.
```
gpg --version >> "$(hostname)_$(date +%Y-%m-%d).txt"
```

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
