
generator( T ) :-
    between(0, 10000, T).


length_list( [], 0).
length_list([_|T], N) :-
    length_list(T, N1),
    N is N1 + 1.



decreasing( [] ).
decreasing( [_] ).
decreasing( [D1, D2|DS]) :-
    D1 > D2, 
    decreasing([D2|DS]).


increasing( [] ).
increasing( [_] ).
increasing( [D1, D2|DS]) :-
    D1 < D2, 
    increasing([D2|DS]).

    


celsius_to_fahrenheit(C, F) :-
    F is (C * 1.8) + 32.


whole_number( X ) :-
    Y is truncate(X),
    X =:= Y.

digits(N, [N]) :-
    N < 10.

digits(N, W) :-
    N >= 10,
    div_mod(N, 10, D, M),
    digits(D, R),
    append( R, [M], W).

div_mod(A, B, D, M) :-
    D is A div B, 
    M is A mod B.


nub( [], [] ).
nub( [H|T], R ) :-
    member( H, T ),
    nub( T, R ).
nub( [H|T], [H|R] ) :-
    \+ member( H, T ),
    nub( T, R ).



interection( [], _, [] ).
interection( [H|T], L2, [H|R] ) :-
    member( H, L2 ),
    interection( T, L2, R ).
interection( [H|T], L2, R ) :-
    \+ member( H, L2 ),
    interection( T, L2, R ).





    
    









