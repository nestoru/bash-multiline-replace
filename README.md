== Usage
```
$ ./multilineReplace.sh 
    Removes a whole block from a regex start to a regex end if it contains an inner regex 
    
    Usage: multilineReplace.sh <start> <inner> <end> [file]
           
           start: The regex defining where a block starts
           start: The regex defining the pattern to look for inside a block
           end:   The regex defining where a block ends
           file:  The file to parse. If no file is provided it will read from stdin
```

== Logic
```
$ cat multilineReplace.sh | grep ' # '
  # if line contains the inner string then flag the finding
  # if line contains start block string then set the array first element 
  # if the block array is empty then print the line
  # otherwise add the line to the array if it is not start or end because those were already managed
  # if line contains end block string then ask if the inner string was found
    # if the inner string was found then ignore the block and flag no finding
    # otherwise print the block
    # then reset array
``` 
