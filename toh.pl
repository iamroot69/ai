toh(1,X,Y,_):-
    write('move top disk from '),
    write(X),
    write(' to '),
    write(Y),
    nl.

toh(N,X,Y,Z):-
    N > 1,
    N1 is N-1,
    toh(N1,X,Z,Y),
    toh(1,X,Y,_), 
    toh(N1,Z,Y,X).