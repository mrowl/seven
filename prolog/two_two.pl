miner([Head|[]], Head).
miner([Head|Tail], Min) :- miner(Tail, Test), =<(Test, Head), Min = Test.
miner([Head|Tail], Min) :- miner(Tail, Test), >(Test, Head), Min = Head.
