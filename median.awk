#!/usr/bin/env awk

# Description:
#     Performs the median operation on a list of numbers.

# Author: Nicholas Choong 21980614

# append the counts to an array
{ 
  counts[NR] = $1 
}

# find the median of the counts
END {
  n = asort(counts)

  if (n % 2 == 1) {
    print counts[int(n/2) + 1]
  } else {
    print (counts[n/2] + counts[n/2 + 1]) / 2
  }
}