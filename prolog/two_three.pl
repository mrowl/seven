miner([Head|[]], Head).
miner([Head|Tail], Min) :- miner(Tail, Test), =<(Test, Head), Min = Test.
miner([Head|Tail], Min) :- miner(Tail, Test), >(Test, Head), Min = Head.

extract(List, Val, NewList) :- extract(List, Val, [], NewList).
extract([Head|Tail], Val, Begin, NewList) :- =(Val, Head), append(Begin, Tail, NewList).
extract([Head|Tail], Val, Begin, NewList) :- =\=(Val, Head), append(Begin, [Head], Hort), extract(Tail, Val, Hort, NewList).

sorter(List, Sorted) :- sortee(List, [], Sorted).
sortee([], Accum, Sorted) :- Sorted = Accum.
sortee(List, Accum, Sorted) :- miner(List, Min), extract(List, Min, ListLeft), append(Accum, [Min], AccumTmp), sortee(ListLeft, AccumTmp, Sorted).
