squareBrackets := method(
    r := List clone
    call message arguments foreach(arg,
        r append(arg)
        )
    r
)

#s := File with("listbook.txt") openForReading contents
s := "[23, 22, 24, 99]"
numbers := doString(s)
numbers println
