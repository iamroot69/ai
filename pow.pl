pow(X,0,1).
pow(X,P,A):-
    P>0,
    P1 is P - 1,
    pow(X,P1,Temp),
    A is Temp*X.