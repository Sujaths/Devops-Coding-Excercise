#!/bin/bash

# File path
echo '"InstanceID", LaunchTime, InstanceFeautures, PublicIP, Instancetype' > ec2-instances_headers.csv
cat ec2-instances.csv >> ec2-instances_headers.csv
csv_file="ec2-instances_headers.csv"

# Given Target date 
target_date="2022-04-12T13:00:00"
min_dates_diff=25569
sec_in_day=86400

# Standard timestamp conversion for target date
target_timestamp=$(date -d "$target_date" +%s)

# Compare the timestamp and retrieve the required instances
awk -F',' -v target_timestamp="$target_timestamp" '

BEGIN {
    
    OFS = FS
	}
	
NR==1 {
    #Locate the LaunchTime and InstanceId columns
    for (i=1; i<=NF; i++) {
        if (tolower($i) ~ /launchtime/) launchtime_col=i
        if (tolower($i) ~ /instanceid/) instanceid_col=i
    }   
}
NR>1 {
    # Standard  timestamp conversion 
    #"date +%s -d \"" $launchtime_col "\" " | getline launchtime_timestamp
    

    # Compare LaunchTime with the target date
    if (launchtime_timestamp < target_timestamp) {
        print $instanceid_col
    }
}
' "$csv_file"
