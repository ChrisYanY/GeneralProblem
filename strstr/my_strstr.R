args    = commandArgs(trailingOnly = TRUE)
sub.str = args[1]
whl.str = args[2]



source("../palindrome/palinFunc.R")
sub.len      = nchar(sub.str)
if (nchar(sub.str) == 0) {
    message("empty needle, consider as found")
    return(1)
}

if (nchar(whl.str) == 0) {
    message("empty haystack, consider as not found")
    return(1)
}


needle.place = which(whl.str == str.char(sub.str, 1))
if ((sub.len == 1)&& (length(needle.place) > 0)) {
    message("needle found in haystack")
    return(1)
}

if (length(needle.place) == 0) {
    message("needle not found in haystack")
    return(1)
} else {
    pin = 1
    while (pin <= sub.len - 1) {
        needle.place = intersect(needle.place, which(whl.str == str.char(sub.str, pin + 1)))
        if (length(needle.place) == 0) {
            message("needle not found in haystack")
            return(1)
            break
        }
        pin = pin + 1
    }
    
    if (length(needle.place) > 0) {
       message("needle found in haystack")
       return(1)
    }
}