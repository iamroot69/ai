water_jug(Start, Goal, Path) :-
    astar(Start, Goal, Path, _).

astar(Start, Goal, Path, Cost) :-
    heuristic(Start, H),
    astar_search(Start, Goal, [Start], H, Path, Cost).

astar_search(Goal, Goal, _, _, [], 0).

astar_search(Current, Goal, Visited, H, [Current|Path], Cost) :-
    \+ member(Current, Visited),
    findall(Next, successor(Current, Next), Nexts),
    Nexts \= [],
    maplist(heuristic, Nexts, Hs),
    minimum(Hs, Hmin),
    select(Hmin, Hs, Hrest),
    select(Next, Nexts, Nrest),
    Cost1 is Cost + Hmin,
    astar_search(Next, Goal, [Next|Visited], Hrest, Path, Cost1).

successor(State, Next) :-
    State = [J1, J2],
    Next = [J11, J22],
    (J11 = J1, J22 = J2; J11 is min(J1, max(0, J2 - J1)), J22 is J2 + J1 - J11),
    (J11 =< 10, J22 =< 10),
    J11 >= 0,
    J22 >= 0.

heuristic(State, H) :-
    State = [J1, J2],
    H is abs(Goal - J1) + abs(Goal - J2).

% Example query
?- water_jug([0, 0], [7, 0], Path).