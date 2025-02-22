##################################################################
##
##

#The command lscpu displays information on processor architecture.
lscpu > "1-infra-config-lscpu-$(hostname)-$(date +%Y-%m-%d).txt"

#lscpu takes information from /proc/cpuinfo
cat /proc/cpuinfo > "1-infra-config-cpuinfo-$(hostname)-$(date +%Y-%m-%d).txt"
