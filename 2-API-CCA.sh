
panel.exe --qcomp > "2-api-cca-config-panelqcomp-$(hostname)-$(date +%Y-%m-%d).txt"

panel.exe --epoc-cert-validate > "2-api-cca-config-epoccertvalidate-$(hostname)-$(date +%Y-%m-%d).txt"

panel.exe --status > "2-api-cca-config-panelstatus-$(hostname)-$(date +%Y-%m-%d).txt"
