rule(a, [a]).
rule(b, [b]).
rule(S, [a, b]).

start(S).

recognize(W) :-
    start(S),
    expand(S, W, []).

expand(X, [], W) :-
    rule(X, W).

expand(X, [H|T], W) :-
    rule(X, Y),
    append(Y, [H], Z),
    expand(Z, T, W).

% Example query
% ?- recognize([a, b]).
% true.