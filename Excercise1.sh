#!/bin/bash

# create the headers for the given csv file
echo '"InstanceID", LaunchTime, InstanceFeautures, PublicIP, Instancetype' > ec2-instances_headers.csv
cat ec2-instances.csv >> ec2-instances_headers.csv
csv_file="ec2-instances_headers.csv"

# Given Target date
target_date="2022-04-12T13:00:00"
# Timestamp conversion for comparison
target_timestamp=$(date -d "$target_date" +%s)
#echo $target_timestamp 

# Retrieve instances
awk -F',' -v target_date="$target_date" '

BEGIN {
    # Ignore case and remove quotes from headers if any
    OFS = FS
	}
NR==1 {
    # Get the column numbers for InstanceId and LaunchTime
    for (i=1; i<=NF; i++) {
        if (tolower($i) ~ /instanceid/) instanceid_col=i
        if (tolower($i) ~ /launchtime/) launchtime_col=i
    }
}
NR>1 {
    # LaunchTime and target date comparison
    if ($launchtime_col < target_date) {
        print $instanceid_col
	}
}
' "$csv_file"


