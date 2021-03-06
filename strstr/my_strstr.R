args    = commandArgs(trailingOnly = TRUE)
sub.str = args[1]
whl.str = args[2]

source("../palindrome/palinFunc.R")
message("subs tring is: ", sub.str)
message("whole string is: ", whl.str)
sub.len      = nchar(sub.str)
if (nchar(sub.str) == 0) {
    message("empty needle, consider as found")

}

if (nchar(whl.str) == 0) {
    message("empty haystack, consider as not found")

}

needle.place = which(strsplit(whl.str, split = "")[[1]] == str.char(sub.str, 1))

if ((sub.len == 1)&& (length(needle.place) > 0)) {
    message("needle found in haystack")

}

if (length(needle.place) == 0) {
    message("needle not found in haystack")

} else {
    pin = 1
    while (pin <= sub.len - 1) {
    	cur.char     = str.char(sub.str, pin + 1)
        needle.place = intersect(needle.place, which(strsplit(whl.str, split = "")[[1]] == cur.char) - pin)
        if (length(needle.place) == 0) {
            message("needle not found in haystack")
            break
        }
        pin = pin + 1
    }
    
    if (length(needle.place) > 0) {
       message("needle found in haystack")

    }
}

