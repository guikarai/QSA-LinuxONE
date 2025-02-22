# *****************************************************************************************************
# QUANTUM-SAFE ON IBM Z AND LINUXONE WITH IBM
# AUTHOR: GUILLAUME HOAREAU
# PURPOSE OF THE FOLLOWING SCRIPT IS TO LIST FOUND KEY MATERIALS ATTRIBUTES IN A FILE FOR A GIVEN HOST
# 3-KEY-SCAN
# *****************************************************************************************************

#NOTE: SOME KEY ATTRIBUTES CAN'T BE RESOLVED BECAUSE FILES ARE PASSWORD PROTECTED.

import os
import socket
import datetime
import csv
import glob
import subprocess
from cryptography.hazmat.primitives import serialization
from cryptography.hazmat.primitives.asymmetric import rsa, ec, dsa
from OpenSSL import crypto

# Function to get the current datetime in the specified format
def get_timestamp():
    return datetime.datetime.utcnow().strftime("%Y-%m-%dT%H:%M:%S.%f")[:-3] + "Z"

# Function to determine the key type and size
def get_key_info(file_path):
    try:
        with open(file_path, 'rb') as f:
            data = f.read()
        
        # Try loading it as a PEM key
        try:
            key = serialization.load_pem_private_key(data, password=None)
        except ValueError:
            return None, None, "YES"  # Likely password-protected
        except TypeError:
            return None, None, "YES"  # Password required
        
        if isinstance(key, rsa.RSAPrivateKey):
            return "RSA", key.key_size, "NO"
        elif isinstance(key, ec.EllipticCurvePrivateKey):
            return "ECC", key.key_size, "NO"
        elif isinstance(key, dsa.DSAPrivateKey):
            return "DSA", key.key_size, "NO"
        else:
            return "UNKNOWN", None, "NO"
    except Exception:
        return None, None, "UNKNOWN"

# Get hostname
def get_hostname():
    return socket.gethostname()

# Get list of all files with .pem, .der, .cer extensions
def find_key_files():
    key_files = []
    for ext in ('pem', 'der', 'cer'):
        for root, _, files in os.walk('/'):
            for file in files:
                if file.endswith(f'.{ext}'):
                    key_files.append(os.path.join(root, file))
    return key_files

# Write results to a CSV file
def write_to_csv(results):
    hostname = get_hostname()
    timestamp = get_timestamp()
    filename = f"3-key-scan-{hostname}-{timestamp}.csv"
    
    with open(filename, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(["datetime", "filename", "file_path", "extension_type", "key_type", "key_size", "password_protection"])
        for row in results:
            writer.writerow(row)
    
    print(f"Scan complete. Results saved in {filename}")

# Main function
def main():
    results = []
    files = find_key_files()
    
    for file in files:
        file_ext = file.split('.')[-1].lower()
        key_type, key_size, password_protected = get_key_info(file)
        results.append([get_timestamp(), os.path.basename(file), file, file_ext, key_type, key_size, password_protected])
    
    write_to_csv(results)

if __name__ == "__main__":
    main()
