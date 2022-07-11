#!/bin/bash
if [ "$1" == "-h" ] || [[ -z "$2" ]] || [[ -z "$3" ]] || [[ -z "$4" ]] || [ "$3" != "-o" ]; then
echo "testme.sh: Extract emails from file and output to GoPhish CSV upload format"
echo "Usage: ./testme.sh -f in_file -o out_file"
exit 0
fi
if [ "$1" == "-f" ]; then
filename=$2
n=1
c1="First Name"
c2="Last Name"
c3="Email"
c4="Position"
printf '%s\n' "First Name" "Last Name" "Email Address" "Position" | paste -sd ',' >> $4
while read line; do
# reading each line
IFS='@' read -r id string <<< "$line"
IFS='.' read -r fname lname <<< "$id"

printf '%s\n' ${fname^} ${lname^} $line POSITION | paste -sd ','>>$4
n=$((n+1))
done < $filename
fi