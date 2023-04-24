#!/bin/bash

log_dir="/var/log"

log_file=$(mktemp "$log_dir/mylog.XXXXXX")

echo "This is some example data for the log file." > "$log_file"

remote_server="admini@192.168.2.53"
remote_dir="/var/log"

scp "$log_file" "$remote_server:$remote_dir"

max_age=7

ssh "$remote_server" "find $remote_dir -type f -mtime +$max_age -delete"
