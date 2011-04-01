fib := method(n, if(n == 1 or n == 2, 1, fib(n - 1) + fib(n - 2)))

fib(1) println
fib(2) println
fib(3) println
fib(4) println
fib(5) println
fib(6) println
fib(7) println
fib(8) println

fib_loop := method(n, sum := 1; sum_one := 1; sum_two := 1;
                   for(i, 3, n, sum := sum_one + sum_two;
                                sum_two := sum_one;
                                sum_one := sum);
                   sum)

fib_loop(1) println
fib_loop(2) println
fib_loop(3) println
fib_loop(4) println
fib_loop(5) println
fib_loop(6) println
fib_loop(7) println
fib_loop(8) println
