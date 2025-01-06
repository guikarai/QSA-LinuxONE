# 04-24H data collection
This section is about collecting from 4 to 24 hours of data for each Linux Guest. Collected operational data is about their day to day workload and consumption of encryption services. This will allow IBM TEL expert resume and finish the Quantum-Safe assessment detecting what algorithm are used and what for.

Most of the data collection methodology is based on capturing from 4H to 24H data redirected into a file. There are many ways to do that, and it is customer responsability to get identify the best way to make it happened according to their operational constraints. IBM TEL expert to suggest approaches and to share samples only.

## Assessing your ability to collect required data

The following linux commands must display evidence of cryptographic activities. If command line result highlights packages are not installed, it will be needed to installed required suggest packages, or to reduce the scope of the Quantum-Safe Assessment.

**1. To perform a cpacfstats data collection**
```
cpacfstats
```
If cpasftats is not installed/started, you can find here [instructions to turn it on](https://www.ibm.com/docs/de/linux-on-systems?topic=c-cpacfstats).

**2. To perform an icastats data collection**
```
icastats
```
If icastats is not installed/started, you can find here [instructions to turn it on](https://www.ibm.com/docs/en/linux-on-systems?topic=reference-commands-linuxonibm-z).

**3. To perform an zcryptstats data collection**
```
zcryptstats
```
If icastats is not installed/started, you can find here [instructions to turn it on](https://www.ibm.com/docs/en/linux-on-systems?topic=libica-installing-from-distribution-packages).


**4. To perform an pkcsstats data collection**
```
pkcsstats
```

**5. To perform an TCP/IP dump**
```
tcpdump
```
