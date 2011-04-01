Number divide := Number getSlot("/")
Number / := method(num, if(num == 0, 0, self divide(num)))

(4 / 5) println
(4 / 0) println
(5 / 4) println
(0 / 2) println
