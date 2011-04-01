check_four(List) :- fd_all_different(List), fd_domain(List, 1, 4).

sudoku([P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16],
       [P1, P2, P3, P4, P5, P6, P7, P8, P9, P10, P11, P12, P13, P14, P15, P16]) :-
    check_four([P1, P2, P3, P4]),
    check_four([P5, P6, P7, P8]),
    check_four([P9, P10, P11, P12]),
    check_four([P13, P14, P15, P16]),

    check_four([P1, P5, P9, P13]),
    check_four([P2, P6, P10, P14]),
    check_four([P3, P7, P11, P15]),
    check_four([P4, P8, P12, P16]),

    check_four([P1, P2, P5, P6]),
    check_four([P3, P4, P7, P8]),
    check_four([P9, P10, P13, P14]),
    check_four([P11, P12, P15, P16]).
