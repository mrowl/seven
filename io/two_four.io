List myAverage := method(self foreach(x,
    if(x proto != Number, Exception raise("only numbers are allowed")));
    self sum / self size)

test_list := list(1, 2, 3, 4, 5)
test_list := list(1, 2, "e", 4, 5)

(test_list myAverage) println
