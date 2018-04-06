# Usage
```
$ cat multilineReplace.sh | grep -E ' # |^# '
# multilineRemove.sh 
# @author: Nestor Urquiza
# @date: 20180405
# @description: Removes a whole block from a regex start to a regex end if it contains an inner regex
  # if line contains the inner string then flag the finding
  # if line contains the start block string then set the block array first element to be such string
  # if the block array is empty then print the line
  # otherwise, if it is not start or end (those are not handled here) then add the line to the block array
  # if line contains the end block string then ask if the inner string was found
    # if the inner string was found then ignore the block and flag no finding
    # otherwise print the block
    # then reset array
# accept lines from file or stdin
```

# Logic
```
$ cat multilineReplace.sh | grep ' # '
  # if line contains the inner string then flag the finding
  # if line contains start block string then set the array first element 
  # if the block array is empty then print the line
  # otherwise add the line to the array if it is not start or end because those are already managed
  # if line contains end block string then ask if the inner string was found
    # if the inner string was found then ignore the block and flag no finding
    # otherwise print the block
    # then reset array
``` 
