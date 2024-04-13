#!/bin/bash

display_disk_space() {
    partition="$1"
    
    
    disk_space_info=$(df -h "$partition" | awk 'NR==2 {print $4}')

    echo "Free Disk Space on $partition:"
    echo "$disk_space_info"
}

while true; do
    clear  
      
    partition="/opt"

    display_disk_space "$partition"  
    echo ""  
    echo "Refreshing in 1 minute..."
    sleep 60  
done
