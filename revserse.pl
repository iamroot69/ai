rev([],[]).
rev([H|T],R):-
    rev(T,RevT),
    conc(RevT,[H],R).