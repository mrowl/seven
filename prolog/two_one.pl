getlast([Head|[]], Last) :- Last = Head.
getlast([Head|Tail], Last) :- getlast(Tail, Last).

reverser([], []).
reverser([Head|[]], [Head]).
reverser([Head1|Tail1], [Head2|Tail2]) :- getlast(Tail1, Head2), getlast(Tail2, Head1), append(New1, [Head2], Tail1), append(New2, [Head1], Tail2), reverser(New1, New2).
