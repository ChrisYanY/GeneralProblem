args = commandArgs(trailingOnly = TRUE)

palin.string = args[1]
message("string for checking is: ", palin.string)

source("palinFunc.R")


if (nchar(palin.string) == 0) {
    message("empty string input, we consider as a null palindrome")
} else {
    tail = nchar(palin.string)
    head = 1
    flag = 0
    while (head < tail) {
        
        h.char = str.char(palin.string, head)
        if (length(grep("^[[:alpha:]]*$", h.char)) == 0) {
            head = head + 1
            next
        }
        t.char = str.char(palin.string, tail)
        if (length(grep("^[[:alpha:]]*$", t.char)) == 0) {
            tail = tail - 1
            next
        }
        
        # .... both t.char and h.char are alphabet .... #
        if (t.char == h.char) {
            #message("head char is ", h.char)
            #message("tail char is ", t.char)
            tail = tail - 1
            head = head + 1
        } else {
            message("string is not palindrome, return")
            flag = 1
            break
        }
    }
    if (flag == 0) {
        message("we consider the string is palindrome")
    }
}




#function = str.char(palin.string, pin) {
#    return(substr(palin.string, start = pin, stop = pin))
#}