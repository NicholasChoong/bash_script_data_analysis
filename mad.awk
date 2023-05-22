#!/usr/bin/env awk

# Description:
#     Performs the median absolute deviation (MAD) calculation on a list of numbers.

# Author: Nicholas Choong 21980614

# append the counts to an array
{
  counts[NR] = $1
}

# calculate the difference between each count and the median and find the median of the differences
END {
  n_counts = asort(counts)

  for (i = 1; i <= n_counts; i++) {
    diff = counts[i] - median
    if (diff < 0) {
      diffs[i] = -diff
    } else {
      diffs[i] = diff
    }
  }

  n_diffs = asort(diffs)

  if (n_diffs % 2 == 1) {
    print diffs[int(n_diffs/2) + 1]
  } else {
    print (diffs[n_diffs/2] + diffs[n_diffs/2 + 1]) / 2
  }
}