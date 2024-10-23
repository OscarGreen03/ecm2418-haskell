factorial( 0, 1 ).
factorial( N, W) :-
    N1 is N - 1,
    factorial(N1, V),
    W is N * V.

sum_list( [], 0).
sum_list( [H|T], S) :-
    sum_list( T, S1),
    S is S1 + H.

max_list( [X], X).

max_list( [X|XS], M) :-
    max_list(XS, M), X > M.

max_list( [X|XS], M) :-
    max_list(XS, M), M >= X.

member_list(E, []). - automatically false
member_list(E, [E|_]).
member_list(E, [_|T]) :-
    member_list(E, T).


reverse_list([], []).
reverse_list([H|T], R) :-
    reverse_list(T, R1),
    append(R1, [H], R).   


insert_list(E, [], [E]).
insert_list(E, [X|XS], [E,X|XS]):-
    E =< X.
insert_list(E, [X|XS], [X|YS]):-
    E > X,
    insert_list(E, XS, YS).


length_list( [], 0).
length_list([_|T], N) :-
    length_list(T, N1),
    N is N1 + 1.

take_list(0, _, []).
take_list(_, [], []).
take_list(N, [X|XS], [X|YS]) :-
    N > 0,
    N1 is N - 1,
    take_list(N1, XS, YS).

drop_list(0, XS, XS).
drop_list(N, [_|T], YS) :-
    N > 0,
    N1 is N - 1,
    drop_list(N1, T, YS).

split_list(_, [], [], []).
split_list(0, XS, [], XS).
split_list(N, [H|T], [H|A1], B1) :-
    N > 0,
    N1 is N - 1,
    split_list(N1, T, A1, B1).




squares([], []).
squares([X|XS], [Y|YS]) :-
    Y is X * X,
    squares(XS, YS).


evens( [], []).
evens( [X|XS], [X|YS]) :-
    0 is X mod 2,
    evens(XS, YS).
evens( [X|XS], YS) :-
    1 is X mod 2,
    evens(XS, YS).

    

main :-
    factorial(1000, X), write(X).
main.
