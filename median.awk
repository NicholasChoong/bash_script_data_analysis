#!/usr/bin/env awk

# Description:
#     Performs

# Author: Nicholas Choong 21980614

{ 
  counts[NR] = $1 
}

END {
  n = asort(counts)

  if (n % 2 == 1) {
    print counts[int(n/2)+1]
  } else {
    print (counts[n/2] + counts[n/2+1]) / 2
  }
}