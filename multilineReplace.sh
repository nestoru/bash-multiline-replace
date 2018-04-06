#!/bin/bash -e
# multilineRemove.sh 
#
# @author: Nestor Urquiza
# @date: 20180405
# @description: Removes a whole block from a regex start to a regex end if it contains an inner regex
#

USAGE="Usage: `basename $0` <start> <inner> <end> [file]"
USAGE=$(cat <<-END       
    Removes a whole block from a regex start to a regex end if it contains an inner regex 
    
    Usage: `basename $0` <start> <inner> <end> [file]
           
           start: The regex defining where a block starts
           start: The regex defining the pattern to look for inside a block
           end:   The regex defining where a block ends
           file:  The file to parse. If no file is provided it will read from stdin
END
)

if [ $# -lt "3" ] 
then
  echo "$USAGE"
  exit 1 
fi

start=$1
inner=$2
end=$3
file=$4

foundInner="false"

while IFS= read -r line; do
  # if line contains the inner string then flag the finding
  if [[ $line =~ $inner ]]; then
    foundInner="true"
  fi

  # if line contains start block string then set the array first element 
  if [[ $line =~ $start ]]; then
    count=0
    array[$count]="$line"
  fi
 
  # if the block array is empty then print the line
  if [ ${#array[@]} -eq 0 ]; then
    echo "$line"
  # otherwise add the line to the array if it is not start or end because those were already managed
  elif [[ ! $line =~ $start && ! $line =~ $end ]]; then
    count=$(( $count + 1 ))
    array[$count]="$line"
  fi

  # if line contains end block string then ask if the inner string was found
  if [[ $line =~ $end ]]; then
    # if the inner string was found then ignore the block and flag no finding
    if [[ "$foundInner" == "true" ]]; then
      foundInner="false"
    # otherwise print the block
    else
      for i in "${!array[@]}"; do 
        echo "${array[$i]}";
      done
      echo "$line"
    fi
    # then reset array
    unset array
  fi
 

done < "${file:-/dev/stdin}"


