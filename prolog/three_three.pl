my_domain([]).
my_domain([Head|Tail]) :- member(Head, [1, 2, 3, 4, 5, 6, 7, 8]), my_domain(Tail).

valid_and_diff(List) :- fd_all_different(List), my_domain(List).

check_diag(_, []).
check_diag((X1, Y1), [(X2, Y2)|Tail]) :-
    =\=((Y1 - X1), (Y2 - X2)),
    =\=((X1 + Y1), (X2 + Y2)),
    check_diag((X1, Y1), Tail).

check_diags([]).
check_diags([Head|Tail]) :- check_diag(Head, Tail), check_diags(Tail).

eight_queens([Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8]) :-
    Points = [(1, Y1), (2, Y2), (3, Y3), (4, Y4), (5, Y5), (6, Y6), (7, Y7), (8, Y8)],
    valid_and_diff([Y1, Y2, Y3, Y4, Y5, Y6, Y7, Y8]),
    check_diags(Points).

    

%%% other approaches

%four_queens(Points) :-
    %Points = [(X1, Y1), (X2, Y2), (X3, Y3), (X4, Y4)],
    %rows(Points, Rows),
    %cols(Points, Cols),
    %valid_and_diff(Rows),
    %valid_and_diff(Cols),
    %check_diags(Points).
%
%plus([], []).
%plus([(X, Y)|Tail], [P|PTail]) :- P is Y + X, plus(Tail, PTail).
%
%minus([], []) :- Minused = Accum.
%minus([(X, Y)|Tail], [D|DTail]) :- D is Y - X, minus(Tail, DTail).
%
%rows([], []).
%rows([(X, _)|Tail], [X|XTail]) :- rows(Tail, XTail).
%
%cols([], []).
%cols([(_, Y)|Tail], [Y|YTail]) :- cols(Tail, YTail).
