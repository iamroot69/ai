nele(1, [H|T],H).
nele(N,[H|T],X):-
    N1 is N - 1,
    nele(N1,T,X).

# nth_element(1,[H|T],H).
# nth_element(N,[H|T],X):-
#     N1 is N - 1,
#     nth_element(N1,T,X).