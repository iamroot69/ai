maxlist([X],X).
maxlist([H|T],M):-
    maxlist(T,MTail),
    (H > MTail -> M = H; M=MTail).
