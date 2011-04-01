#matrix which is not zero indexed
Matrix := Object clone

Matrix dim := method(m, n,
    self m := m;
    self n := n;
    self rows := list()
    for (i, 1, m, self rows append(list() setSize(n)));
    self)

Matrix get := method(x, y,
    self rows at(x - 1) at(y - 1))

Matrix set := method(x, y, value,
    self rows at(x - 1) atPut(y - 1, value))

Matrix transpose := method(
    matrix_t := Matrix clone;
    matrix_t dim(n, m);
    for(x, 1, m,
        for(y, 1, n, 
            matrix_t set(y, x, get(x, y))));
    matrix_t)


matrix := Matrix clone

matrix dim(2, 4)
matrix set(1, 2, 1)
matrix get(1, 2) println

matrix set(2, 4, 2)
matrix get(2, 4) println

matrix set(1, 3, 3)
matrix get(1, 3) println

#should be nil
matrix get(1, 1) println

"===transpose test===" println

#test bounds
#matrix set(3, 3, 3)
#matrix get(3, 3) println

transposed := matrix transpose
(transposed get(2, 1) == matrix get(1, 2)) println
(transposed get(4, 2) == matrix get(2, 4)) println
(transposed get(3, 1) == matrix get(1, 3)) println

#test bounds
#transposed set(2, 3, 4)
#transposed get(2, 3) println

#should be nil
transposed get(1, 3) println
transposed get(4, 1) println

"===" println
matrix rows println
transposed rows println

"===" println
transposed m println
transposed n println
"===" println

matrix println
transposed println
"===" println

File with("matrix.txt") open write(matrix serialized) close
new_matrix := doString(File with("matrix.txt") open readLines join)

new_matrix get(1, 2) println
new_matrix get(2, 4) println
new_matrix get(1, 3) println
