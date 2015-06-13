args = commandArgs(trailingOnly = TRUE)

mapping  = new.env()

dictionary = c("cat", "bob", "mary", "dot", "dog", "flow", "rachel", "em")


mapping[["1"]] = c("a", "b", "c")
mapping[["2"]] = c("d", "e", "f")
mapping[["3"]] = c("g", "h", "i")
mapping[["4"]] = c("j", "k", "l")
mapping[["5"]] = c("m", "n", "o")
mapping[["6"]] = c("p", "q", "r")
mapping[["7"]] = c("s", "t", "u")
mapping[["8"]] = c("v", "w", "x")
mapping[["9"]] = c("y", "z")

# phn.num = args[1]
phn.num = c("1", "1", "7", "5", "1", "6", "9")
valid.set = c()
for (i in 1:6) {
    mapping.one = phn.num[seq(1, i, by = 1)]
    mapping.two = phn.num[seq(i + 1, 7, by = 1)]
    wds.set.one = mapping.const(mapping, mapping.one)
    wds.set.two = mapping.const(mapping, mapping.two)
    
    valid.words.one = string.matching(dictionary, wds.set.one)
    valid.words.two = string.matching(dictionary, wds.set.two)

if ((length(valid.words.one) > 0) && (length(valid.words.two) > 0)) {
        
        for (j in 1:length(valid.words.one)) {
            for (k in 1:length(valid.words.two)) {
                valid.set = c(valid.set, paste(valid.words.one[j], valid.words.two[k], collapse = "-"))
            }
        }
    }

}
message("possible valid outputs:")
print(valid.set)