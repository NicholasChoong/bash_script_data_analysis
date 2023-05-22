#!/usr/bin/env awk

# Author: Nicholas Choong 21980614

# Set the input and output field separators
BEGIN {FS = OFS = "\t"}

# Process the header row
NR == 1 {
    print $1, $2, $3, $4, $5, "Month", "Year"
}


# Process the data rows
NR > 1 {
    # Process the month
    split($4, date_arr, "/");
    month = date_arr[1];

    # Process the year
    year_dirty = date_arr[3];
    split(year_dirty, year_arr, "-");
    year = year_arr[1];
    gsub(/^[ \t]+|[ \t]+$/, "", year);
    if (length(year) == 2) {
        year = "20" year;
    }

    # Process the breach type
    split($5, breach_arr, "[,/]");
    breach_type = breach_arr[1];
    print $1, $2, $3, $4, breach_type, month, year;
}