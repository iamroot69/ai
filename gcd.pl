gcd(X,0,X):-
    X>0.
gcd(0,Y,Y):-
    Y>0.
gcd(X,Y,G):-
    X>0,
    Y>0,
    X>=Y,
    X1 is X mod Y,
    gcd(Y,X1,G).
gcd(X,Y,G):-
    X>0,
    Y>0,
    X<Y,
    Y1 is Y mod X,
    gcd(X,Y1,G).