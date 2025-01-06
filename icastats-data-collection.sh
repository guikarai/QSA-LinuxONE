# *******************************************************************************************
# QUANTUM-SAFE ON IBM Z AND LINUXONE WITH IBM
# AUTHOR: GUILLAUME HOAREAU
# PURPOSE OF THE FILLOWING IS TO ICASTATS RECORDS INTO A FILE DURING 24HOURS EVERY 10 SECONDS
# SC241
# *******************************************************************************************

#!/bin/bash

# Get the hostname
HOSTNAME=$(hostname)

# Get the current date in YYYY-MM-DD format
DATE=$(date +%F)

# Define the output file name
OUTPUT_FILE="${HOSTNAME}_icastats_${DATE}.log"

# Calculate the total duration in seconds (24 hours = 86400 seconds)
TOTAL_DURATION=86400

# Define the interval (10 seconds)
INTERVAL=10

# Initialize elapsed time
ELAPSED_TIME=0

# Run the loop
echo "Starting icastats logging for 24 hours..."
while [ "$ELAPSED_TIME" -lt "$TOTAL_DURATION" ]; do
  # Append the timestamp and icastats output to the file
  echo "Timestamp: $(date '+%Y-%m-%d %H:%M:%S')" >> "$OUTPUT_FILE"
  icastats >> "$OUTPUT_FILE" 2>&1
  echo "-----------------------------" >> "$OUTPUT_FILE"

  # Wait for the interval
  sleep "$INTERVAL"

  # Increment elapsed time
  ELAPSED_TIME=$((ELAPSED_TIME + INTERVAL))
done

echo "Logging completed. Results saved to $OUTPUT_FILE."
