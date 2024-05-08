sumlist([X],X).
sumlist([H|T],A):-
    sumlist(T,Temp),
    A is H+Temp.