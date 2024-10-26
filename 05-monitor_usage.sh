#!/bin/bash

# Log file location
LOGFILE="system_usage.log"

# Function to log system usage
log_usage() {
    # Get the current timestamp
    TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

    # Get CPU usage
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    
    # Get Memory usage
    MEM_USAGE=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

    # Get Disk usage
    DISK_USAGE=$(df / | grep / | awk '{ print $5 }')

    # Log the data
    echo "$TIMESTAMP - CPU Usage: ${CPU_USAGE}% - Memory Usage: ${MEM_USAGE}% - Disk Usage: ${DISK_USAGE}" >> $LOGFILE
}

# Run the monitoring in an infinite loop
while true; do
    log_usage
    sleep 10
done
