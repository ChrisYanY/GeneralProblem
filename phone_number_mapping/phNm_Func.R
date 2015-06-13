# string.matching: find all valid substrings
string.matching = function(dictionary, wrds.set.one) {
    valid.set = c()
    
    
    for (i in 1:length(wrds.set.one)) {
        for (j in 1:length(dictionary)) {
            if (wrds.set.one[i] == dictionary[j]) {
                valid.set = c(valid.set, wrds.set.one[i])
            }
        }
    }
    return(valid.set)
}

# mapping.const: constructing digits to words mapping
mapping.const = function(mapping, digits) {
    substring = mapping[[ digits[1] ]]
    
    if (length(digits) == 1) {
        return(substring)
    }
    for (j in seq(from = 2, to = length(digits), by = 1)) {
        temp = c()
        for (k in 1:length(substring)) {
            temp = c(temp, paste0(substring[k], mapping[[ digits[j] ]]))
        }
        substring = temp
    }

    return(substring)
}