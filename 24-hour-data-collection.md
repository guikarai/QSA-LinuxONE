# 04-24H data collection
This section is about collecting from 4 to 24 hours of data for each Linux Guest. Collected operational data is about their day to day workload and consumption of encryption services. This will allow IBM TEL expert resume and finish the Quantum-Safe assessment detecting what algorithm are used and what for.

Most of the data collection methodology is based on capturing from 4H to 24H data redirected into a file. There are many ways to do that, and it is customer responsability to get identify the best way to make it happened according to their operational constraints. IBM TEL expert to suggest approaches and to share samples only.

## Assessing your ability to collect required data

The following linux commands must display evidence of cryptographic activities. If command line result highlights packages are not installed, it will be needed to installed required suggest packages, or to reduce the scope of the Quantum-Safe Assessment.

**1. Test to perform a cpacfstats data collection**
```
cpacfstats
```
If **cpasftats** is not installed/started, you can find here information about [how to install it](https://www.ibm.com/docs/en/linux-on-systems?topic=reference-commands-linuxonibm-z) and [how to use it](https://www.ibm.com/docs/en/linux-on-systems?topic=c-cpacfstats-2).


**2. Test to  perform an icastats data collection**
```
icastats
```
If **icastats** is not installed/started, you can find here information about [how to install it](https://www.ibm.com/docs/en/linux-on-systems?topic=libica-installing-from-distribution-packages) and [how to use it](https://www.ibm.com/docs/en/linux-on-systems?topic=tools-icastats).

**3. Test to  perform an zcryptstats data collection**
```
zcryptstats
```
If **zcryptstats** is not installed/started, you can find here information about [how to install it](https://www.ibm.com/docs/en/linux-on-systems?topic=r-commands-linuxonibm-z) and [how to use it](https://www.ibm.com/docs/en/linux-on-systems?topic=clz-zcryptstats).


**4. Test to  perform an pkcsstats data collection**
```
pkcsstats
```
If **pkcsstats** is not installed/started, you can find here information about [how to install it and how to use it](https://www.ibm.com/docs/en/linux-on-systems?topic=tools-pkcsstats).


**5. Test to perform an TCP/IP dump**
```
tcpdump
```
If **tcpdump** is not installed, please according to your OS, install tcpdump utility.

## Collecting required data

### 1. Test to perform cpacfstats, icastats, zcryptstats data collection**
Here is the shell script that executes icastats, cpacfstats, and zcryptstats every 60 seconds for 24 hours in the background, with each command's output saved to a separate uniquely named file:
```
#!/bin/bash

# Get the hostname
HOSTNAME=$(hostname)

# Get the current date in YYYY-MM-DD format
DATE=$(date +%F)

# Define the output file names
ICASTATS_FILE="${HOSTNAME}_icastats_${DATE}.log"
CPACFSTATS_FILE="${HOSTNAME}_cpacfstats_${DATE}.log"
ZCRYPTSTATS_FILE="${HOSTNAME}_zcryptstats_${DATE}.log"

# Set the duration for 24 hours (in seconds)
DURATION=86400
INTERVAL=60
END_TIME=$(( $(date +%s) + DURATION ))

echo "Starting logging for 24 hours. Results will be saved in:"
echo "$ICASTATS_FILE"
echo "$CPACFSTATS_FILE"
echo "$ZCRYPTSTATS_FILE"

# Run the loop in the background
(
    while [ $(date +%s) -lt $END_TIME ]; do
        # Run icastats and save output to the file with a timestamp
        echo "Timestamp: $(date '+%Y-%m-%d %H:%M:%S')" >> "$ICASTATS_FILE"
        icastats >> "$ICASTATS_FILE" 2>&1
        echo "------------------------------------------" >> "$ICASTATS_FILE"

        # Run cpacfstats and save output to the file with a timestamp
        echo "Timestamp: $(date '+%Y-%m-%d %H:%M:%S')" >> "$CPACFSTATS_FILE"
        cpacfstats >> "$CPACFSTATS_FILE" 2>&1
        echo "------------------------------------------" >> "$CPACFSTATS_FILE"

        # Run zcryptstats and save output to the file with a timestamp
        echo "Timestamp: $(date '+%Y-%m-%d %H:%M:%S')" >> "$ZCRYPTSTATS_FILE"
        zcryptstats -o CSV >> "$ZCRYPTSTATS_FILE" 2>&1
        echo "------------------------------------------" >> "$ZCRYPTSTATS_FILE"

        # Wait for the specified interval (60 seconds)
        sleep $INTERVAL
    done
) &

echo "Script is running in the background."

```

**Script explanations:**
* Each command output is saved to a separate file named in the format: hostname_commandname_YYYY-MM-DD.log.
* Timestamps: Each command's output is prefixed with a timestamp for easier tracking.
* Loop Duration: The loop runs for 24 hours (86400 seconds), with a 60-second interval between iterations.
* Background Execution: The entire process runs in the background using &.

**Script usage:**
* Save the script as stats_logger.sh.
* Make it executable: chmod +x stats_logger.sh
* Run the script: ./stats_logger.sh

**Stop the script:**
* If you need to stop the script, identify its background process using: ps aux | grep stats_logger.sh
* Then kill the process: kill < the PID >

### 2. Test to perform an TCP/IP dump**

To monitor a Network Interface for TLS Activities, use **tcpdump** to capture traffic on a given interface (e.g., eth0) and filter for TLS-related traffic (ports 443 and 8443 are common):
```
sudo tcpdump -i eth0 -w "$(hostname)_$(date +%Y-%m-%d).pcap" -G 86400 'tcp port 443 or tcp port 8443'
```

**Explanation of the command:**
* -i eth0: Specifies the network interface to monitor.
* -w "$(hostname)_$(date +%Y-%m-%d).pcap": Saves the output to a file named with the host's name and date.
* -G 86400: Runs the capture for 24 hours (86400 seconds).
* 'tcp port 443 or tcp port 8443': Filters traffic for common TLS ports.
