adder := method(m,
    sum := 0;
    m foreach(v,
        v foreach(x,
            sum := sum + x));
    sum)
        
matrix := list(list(1, 1, 1), list(2, 2, 2), list(3, 3, 3))

adder(matrix) println

