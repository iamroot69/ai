state(a).
state(b).
state(c).
state(d).

move(a, b).
move(b, a).
move(b, c).
move(c, b).
move(c, d).
move(d, c).

terminal(d).

utility(d, 10).

minimax(State, Depth, MaximizingPlayer, Value) :-
    Depth = 0,
    terminal(State),
    utility(State, Value).

minimax(State, Depth, MaximizingPlayer, Value) :-
    Depth > 0,
    \+ terminal(State),
    (   MaximizingPlayer = true
    ;   MaximizingPlayer = false
    ),
    findall(NewState, move(State, NewState), NewStates),
    (   MaximizingPlayer = true
    ->  max_value(NewStates, Depth, Value)
    ;   min_value(NewStates, Depth, Value)
    ).

max_value([], _, Max) :-
    Max is -infinity.

max_value([State|Rest], Depth, Max) :-
    minimax(State, Depth, false, Value),
    max_value(Rest, Depth, NewMax),
    (   Value > NewMax
    ->  Max is Value
    ;   Max is NewMax
    ).

min_value([], _, Min) :-
    Min is infinity.

min_value([State|Rest], Depth, Min) :-
    minimax(State, Depth, true, Value),
    min_value(Rest, Depth, NewMin),
    (   Value < NewMin
    ->  Min is Value
    ;   Min is NewMin
    ).

% Example query
% ?- minimax(a, 3, _, Value).
% Value = 10.