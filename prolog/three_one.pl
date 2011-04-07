%sudoku([7, _, _, _, 9, 4, 1, _, _, _, 9, _, _, _, _, _, _, 4, _, _, 5, _, _, _, _, _, 3, _, _, _, 3, _, 2, _, 9, _, 8, _, _, _, _, _, _, _, 2, _, 1, _, _, _, _, 3, _, 6, _, 2, 4, 5, _, 3, 8, _, _, _, _, 7, _, 6, _, _, _, _, _, _, _, _, _, _, _, _, 9], Solution).
%
%sudoku([9, _, 4, 1, _, _, _, 2, _, 6, _, 8, _, _, 3, 5, _, _, _, _, 2, _, 5, _, _, _, 6, _, _, 3, _, _, 2, 9, _, _, 4, _, _, _, _, _, _, _, _, _, _, _, _, 4, 6, _, 8, _, _, _, 7, _, 8, 1, 4, 5, _, 2, _, _, 4, _, _, _, _, 1, _, _, _, 2, 3, _, _, 7, 8], Solution).
%

range(N, _, N).
range(N, Range, I) :- INext is I + 1, nth(INext, Range, INext), range(N, Range, INext).
range(N, Range) :- length(Range, N), range(N, Range, 0).

my_domain([], _).
my_domain([Head|Tail], Range) :- member(Head, Range), my_domain(Tail, Range).

groups([], _, Cols, Rows, Squares, _).
groups([V|Tail], X, Cols, Rows, Squares, I) :- 
    Y is floor(sqrt(X)),
    range(X, Range),
    member(V, Range),

    ColBucket is (I mod X) + 1,
    ColSubBucket is (I // X) + 1,
    length(ColBucketList, X),
    nth(ColBucket, Cols, ColBucketList),
    nth(ColSubBucket, ColBucketList, V),
    fd_all_different(ColBucketList),

    SquareBucket is (Y * (I // (X * Y))) + ((I mod X) // Y) + 1,
    SquareSubBucket is (Y * ((I mod (X * Y)) // X)) + (I mod Y) + 1,
    length(SquareBucketList, X),
    nth(SquareBucket, Squares, SquareBucketList),
    nth(SquareSubBucket, SquareBucketList, V),
    fd_all_different(SquareBucketList),

    RowBucket is (I // X) + 1,
    RowSubBucket is (I mod X) + 1,
    length(RowBucketList, X),
    nth(RowBucket, Rows, RowBucketList),
    nth(RowSubBucket, RowBucketList, V),
    fd_all_different(RowBucketList),

    ITail is I + 1,
    groups(Tail, X, Cols, Rows, Squares, ITail).
groups(Board, X) :-
    length(Cols, X),
    length(Rows, X),
    length(Squares, X),
    groups(Board, X, Cols, Rows, Squares, 0).

sudoku(Board, Solution) :-
    Solution = Board,
    length(Board, N),
    X is floor(sqrt(N)),

    groups(Solution, X).
