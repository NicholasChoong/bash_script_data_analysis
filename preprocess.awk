#!/usr/bin/env awk

# Description:
#     Performs several operations on the data, including adding a month and year column,
#     removing everything in the Type of Breach field after the first comma or slash,
#     dropping the Location of Breached Information and Summary columns.
#     The output of preprocess is sent to standard output. 

# Author: Nicholas Choong 21980614

# Set the input and output field separators
BEGIN {FS = OFS = "\t"}

# Process the header row
NR == 1 {
    print $1, $2, $3, $4, $5, "Month", "Year"
}

# Process the data rows
NR > 1 {
    # Process the month and remove leading zero
    split($4, date_arr, "/");
    month = date_arr[1];
    if (substr(month, 1, 1) == "0") {
        month = substr(month, 2);
    }

    # Check if the month value is correct
    if (int(month) < 1 || int(month) > 12) {
        next
    }

    # Process the year
    year_dirty = date_arr[3];
    split(year_dirty, year_arr, "-");
    year = year_arr[1];
    gsub(/^[ \t]+|[ \t]+$/, "", year);
    if (length(year) == 2) {
        if (year >= "30") {
            year = "19" year;
        } else {
            year = "20" year;
        }
    }

    # Check if the year value is correct
    if (int(year) < 1900 || int(year) > 2100) {
        next
    }

    # Process the breach type
    split($5, breach_arr, "[,/]");
    breach_type = breach_arr[1];
    print $1, $2, $3, $4, breach_type, month, year;
}