#!/bin/bash
# TO BE DONE: some of the errors are different from "-1". Find a basic regular expression that has "-" optional
# followed by a sequence of number 
 

cat /Users/giuseppe/Library/Application Support/Google/Google Photos Backup/network.log | grep "Resumable Upload failed" > file_error.txt
mkdir tmp 
sed s/\[[0-9]*\]\ Resumable\ Upload\ failed\ with\ error\ -1\:\ /""/ < file_error.txt | while read
 in; do cp "$in" ./tmp/ ; done

