# Quantum-Safe Assessment for Linux on IBM Z and LinuxONE environments
## About the methodology
### Overview

Today’s digital trust depends heavily on encryption, making it essential to ensure encryption mechanisms are secure and adhere to appropriate standards.

Future quantum computers pose potential risks, including the ability to rapidly break encryption algorithms and access sensitive data. Therefore, developing a quantum-safe strategy for critical business systems is a prudent step.

This assessment aims to evaluate encryption quality and provide recommendations to enhance IBM Z encryption both for today and the future.

This document serves as a guideline for customers to collect the necessary data to ensure the successful delivery of the Quantum-Safe Assessment for Linux on IBM Z and LinuxONE environments only (Not z/OS).

Contact for additional information and support regarding the assessment: guillaume_hoareau@fr.ibm.com

The following methodology relies on a 4 steps approaches:
* **Step 1 - one time configuration dumps for validation**
* **Step 2 - 04-24H logs for analysis**
* **Step 3 - Data Analysis and report generation**
* **Step 4 - Half a day final workshop**

### Introduction
To be able to analyze the hardware crypto utilization of Linux on IBM Z or LinuxONE, we need to gather operational data (logs, traces, dumps…  records for all systems that is part of the agreed scope (Number of LPARs).

This operational data collection allows us to analyze your Linux guest’s crypto activities, performance, and configuration to propose optimizations and recommendations.

To start a quantum-safe assessment on a Linux server, we typically need to evaluate the cryptographic algorithms in use and their potential vulnerabilities to quantum computing. There isn’t a single Linux command specifically designed for this, but we can use various tools and steps to initiate the assessment.

Then, we will need the following operational data collection:
  -	Infrastructure cryptographic services (hardware, software, process, device drivers, adjunct processors...)
  -	API cryptographic services (CCA, LIBICA, OpenSSL...)
  -	Key management services (zKey, CCA, .pem, .key, .asc, .cer, .der, .pckcs11, .pkcs12 ...)
  -	Network encryption services (OpenSSL, tcpdump, nmap, ssh, tshark...)
  -	Data at rest encryption services (LUKS, dmcrypt, cryptsetup...)
  -	Application encryption services (OpenPGP, JAVA...)

See detailed guidelines in incoming operational data collection chapters.

### Step 1 - one time configuration dumps for validation

A standard Quantum-Safe Assessment analyzes the hardware, software, Linux, KVM, APIs, network, files and their configurations. 

Operational data for a maximum of 1 day representing a period of significant activity (No weekend, no bank holidays). Before sending operational data, it is important to assess with your IBM TEL expert if target environment is able to satisfy all needs.

[This section](https://github.com/guikarai/QSA-LinuxONE/blob/main/sample-data-collection) will drive you through the process to collect sample and/or one time configuration dumps for validation. 

Once content of configuaration dumps is validated with your IBM TEL expert, you can proceed with Step 2. It will be about collecting various set of logs during 24 hours. 

### Step 2 - 04-24H hours logs dumps

To finish the quantum-safe assessment on a Linux server, we need to evaluate the cryptographic algorithms in use and their potential vulnerabilities to quantum computing. To do so we need data collection for a representative period of time (From 4hours to 24hours). There isn’t a single Linux command specifically designed for this, but we can use various tools and steps to initiate the assessment including: tcpdump, icastats, cpacfstats, pckstats.
  
[This section](https://github.com/guikarai/QSA-LinuxONE/blob/main/24-hour-data-collection.md) will drive you through the process to collect representative period of time (From 4hours to 24hours).
