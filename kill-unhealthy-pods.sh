kubectl get pods -A --field-selector status.phase!="Running" | awk '{if ($4 != "Running") system ("kubectl -n " $1 " delete pods " $2 " --grace-period=0 " " --force ")}'
