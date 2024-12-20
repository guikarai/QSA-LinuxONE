# Quantum-Safe Assessment for Linux on IBM Z and LinuxONE environments
## About the methodology
### Overview

Today’s digital trust depends heavily on encryption, making it essential to ensure encryption mechanisms are secure and adhere to appropriate standards.

Future quantum computers pose potential risks, including the ability to rapidly break encryption algorithms and access sensitive data. Therefore, developing a quantum-safe strategy for critical business systems is a prudent step.

This assessment aims to evaluate encryption quality and provide recommendations to enhance IBM Z encryption both for today and the future.

This document serves as a guideline for customers to collect the necessary data to ensure the successful delivery of the Quantum-Safe Assessment for Linux on IBM Z and LinuxONE environments only (Not z/OS).

Contact for additional information and support regarding the assessment: guillaume_hoareau@fr.ibm.com

### Introduction
To be able to analyze the hardware crypto utilization of Linux on IBM Z or LinuxONE, we need to gather operational data (logs, traces, dumps…  records for all systems that is part of the agreed scope (Number of LPARs).

This operational data collection allows us to analyze your Linux guest’s crypto activities, performance, and configuration to propose optimizations and recommendations.

We need the following operational data collection:
  -	Infrastructure cryptographic services
  -	API cryptographic services
  -	Key management services
  -	Network encryption services
  -	Data at rest encryption services
  -	Application encryption services

See detailed guidelines in incoming operational data collection chapters.

### Mandatory operational data

A standard Quantum-Safe Assessment analyzes the hardware, software, Linux, KVM, APIs, network, files and their configurations. 

Operational data for a maximum of 1 day representing a period of significant activity (No weekend, no bank holidays).

Please send all the following operational data in separated files and for <ins>each Linux/KVM guests</ins>:

* **One time configuration dumps:**
  -	lscpu
  -	cat /proc/cpuinfo
  -	cat /proc/cpuinfo 
  -	lsmod
  -	icainfo --version
  -	icainfo
  -	zkey
  -	openssh

* **24 hours logs dumps:**
  -	tcpdump
  -	icastats
  -	cpacfstats
  -	zcryptstats 
