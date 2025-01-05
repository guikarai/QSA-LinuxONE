#############################################################################
## Program to parse and to save a pcap file in a .csv file
## Author: Guillaume HOAREAU, IBM Technology Expert Labs, Solution Engineer
#############################################################################

#!/bin/bash

# Check if a file is provided as an argument
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <pcap_file>"
    exit 1
fi

# Input file
INPUT_FILE=$1

# Check if the file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: File '$INPUT_FILE' not found!"
    exit 1
fi

# Output CSV file
OUTPUT_FILE="${INPUT_FILE%.pcap}_processed.csv"

# Check if tshark is installed
if ! command -v tshark &> /dev/null; then
    echo "Error: tshark is not installed. Install it with 'sudo apt install tshark'."
    exit 1
fi

# Extract and analyze data using tshark
echo "Timestamp,Source IP,Source Port,Destination IP,Destination Port,Protocol,Ciphersuites,Packet Length" > "$OUTPUT_FILE"
tshark -r "$INPUT_FILE" \
    -T fields \
    -e frame.time \
    -e ip.src \
    -e tcp.srcport \
    -e ip.dst \
    -e tcp.dstport \
    -e _ws.col.Protocol \
    -e ssl.handshake.ciphersuite \
    -e frame.len \
    -E separator=, \
    -E quote=d \
    -E occurrence=f \
    >> "$OUTPUT_FILE"

echo "Processing complete. Output saved to: $OUTPUT_FILE"
