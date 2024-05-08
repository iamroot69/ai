:- use_module(library(clpfd)).

sudoku(Rows) :-
    length(Rows, 9),
    maplist(same_length(Rows), Rows),
    append(Rows, Vs),
    Vs ins 1..9,
    maplist(all_distinct, Rows),
    transpose(Rows, Columns),
    maplist(all_distinct, Columns),
    Boxes = [A,B,C,D,E,F,G,H,I],
    maplist(box_constraint(Rows), Boxes),
    label(Vs).

box_constraint(Rows, Box) :-
    append([As,Bs,Cs], Rows),
    append(As, A),
    append(Bs, B),
    append(Cs, C),
    all_distinct(A),
    all_distinct(B),
    all_distinct(C),
    all_distinct(Box).

% Example query
?- sudoku([
    [5,3,_, _,7,_, _,_,_],
    [6,_,_, 1,9,5, _,_,_],
    [_,9,8, _,_,_, _,6,_],
    [8,_,_, _,6,_, _,_,3],
    [4,_,_, 8,_,3, _,_,1],
    [7,_,_, _,2,_, _,_,6],
    [_,6,_, _,_,_, 2,8,_],
    [_,_,_, 4,1,9, _,_,5],
    [_,_,_, _,8,_, _,7,9]
]).