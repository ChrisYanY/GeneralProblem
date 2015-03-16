args = commandArgs(trailingOnly = TRUE)


set.size = as.numeric(args[1])
targ.num = as.numeric(args[2])
upper    = 10
compt.set = sample(1:upper, set.size, replace = T)
pin      = 1
message("summary of set")
print(compt.set)
flag = FALSE
while (length(compt.set) > 1) {

    for (i in seq(2, length(compt.set), by = 1)) {
        print(compt.set[i])
        if (compt.set[i] + compt.set[1] == targ.num) {
            message("TA-DA, found!")
            message("1st number is: ", compt.set[1], " and 2nd number is: ", compt.set[i])
            message("1st index is: ", 1 + pin, " and 2nd index is: ", i + pin)
            flag = TRUE
            break
        }
    }
    
    if (flag) {
        break
    }
    if (!flag) {
        pin = pin + 1
        compt.set = compt.set[seq(2, length(compt.set), by = 1)]
    }

}

if (!flag) {
    message("I dont think there is any")
}
