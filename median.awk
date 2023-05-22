#!/usr/bin/env awk

# Description:
#     Performs

# Author: Nicholas Choong 21980614

BEGIN {
  PROCINFO["sorted_in"] = "@val_num_asc"
}

{ 
  a[NR] = $1 
}

END {
  n = length(a)

  if (n % 2 == 1) {
    median = a[int(n/2)+1]
  } else {
    median = (a[n/2] + a[n/2+1]) / 2
  }
  
  print median
}