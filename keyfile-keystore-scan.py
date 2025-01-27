# *******************************************************************************************
# QUANTUM-SAFE ON IBM Z AND LINUXONE WITH IBM
# AUTHOR: GUILLAUME HOAREAU
# PURPOSE OF THE FILLOWING IS TO LIST ALL KEYFILES AND KEYSTORES IN A LINUX VM
# *******************************************************************************************

import os
import socket
import pwd
import csv
from datetime import datetime

# Define the file extensions
file_extensions = {
    "Certificate File Extension": [".ca-bundle", ".pfx", ".p12", ".der", ".pem", ".crt", ".cer"],
    "Key File Extension": [".pkcs12", ".jks", ".rsa", ".key"],
    "OpenPGP Extension": [".gpg", ".sig", ".asc"],
    "Other Related Extensions": [".sst", ".pvk", ".spc", ".p7b", ".p7c", ".csr"]
}

# Get current user and hostname
hostname = socket.gethostname()
userid = pwd.getpwuid(os.getuid())[0]

# Get current datetime
current_datetime = datetime.now().strftime("%Y-%m-%dT%H:%M:%S.%fZ")

# Prepare a list to collect results
results = []

# Traverse the file system
for root, dirs, files in os.walk("/"):
    for file in files:
        file_path = os.path.join(root, file)
        file_ext = os.path.splitext(file)[1]
        
        for ext_category, extensions in file_extensions.items():
            if file_ext in extensions:
                try:
                    file_size = os.path.getsize(file_path)
                except (OSError, FileNotFoundError):
                    file_size = 0  # Set to 0 if the file is inaccessible
                results.append({
                    "Datetime": current_datetime,
                    "Hostname": hostname,
                    "Userid": userid,
                    "Fileextension": ext_category,
                    "Extension": file_ext,
                    "Filelocation": file_path,
                    "Filesize": file_size
                })

# Write results to a CSV file
output_file = "file_extensions_report.csv"
with open(output_file, mode="w", newline="") as csvfile:
    fieldnames = ["Datetime", "Hostname", "Userid", "Fileextension", "Extension", "Filelocation", "Filesize"]
    writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

    writer.writeheader()
    writer.writerows(results)

print(f"Report generated: {output_file}")
