best_first_search(Start, Goal, Solution) :-
    best_first_search([[Start]], Goal, Solution).

best_first_search([[Goal|Path]|_], Goal, [Goal|Path]).

best_first_search([[Current|Path]|Paths], Goal, Solution) :-
    findall([Next, Current|Path],
            (move(Current, Next), \+ member(Next, [Current|Path])),
            Successors),
    append(Paths, Successors, NewPaths),
    sort_paths(NewPaths, SortedPaths),
    best_first_search(SortedPaths, Goal, Solution).

move(a, b).
move(b, c).
move(c, d).
move(d, e).

sort_paths(Paths, SortedPaths) :-
    predsort(compare_paths, Paths, SortedPaths).

compare_paths(Order, [Goal1|_], [Goal2|_]) :-
    heuristic(Goal1, H1),
    heuristic(Goal2, H2),
    compare(Order, H1, H2).

heuristic(a, 4).
heuristic(b, 3).
heuristic(c, 2).
heuristic(d, 1).
heuristic(e, 0).

% Sample query:
% ?- best_first_search(a, e, Solution).