x_generator4(N):-
    x_generator4_loop( [ [[9 ,6 ,7] ,[4 ,0 ,1] ,[2 ,8 ,3] ,[5]] , [[9 ,8 ,3] ,[6 ,0 ,1] ,[5] ,[4 ,7] ,[2]] , [[9 ,8 ,3] ,[6 ,7] ,[4 ,2 ,0 ,1] ,[5]] , [[9 ,8 ,5 ,1] ,[2] ,[4 ,3] ,[6 ,0 ,7]] , [[9 ,8 ,5 ,1] ,[2] ,[3] ,[6 ,0 ,4 ,7]] , [[9 ,8 ,5 ,1] ,[2] ,[7] ,[4 ,6 ,0 ,3]] , [[8 ,9] ,[7] ,[6 ,0 ,1] ,[2 ,5 ,4 ,3]] , [[8 ,9] ,[7] ,[5 ,6 ,3] ,[4 ,0 ,2 ,1]] , [[8 ,9] ,[5] ,[4 ,7] ,[6 ,0 ,1] ,[3] ,[2]] , [[3] ,[5] ,[6 ,0 ,7] ,[2] ,[4 ,1] ,[8 ,9]] ] , 0 , N ) .
x_generator4_loop( [] , C , C ).
x_generator4_loop( [ T | TS ] , C , N ):- 
    generator4( T ),
    C1 is C + 1 ,
    x_generator4_loop( TS , C1 , N ).
x_generator4_loop( [ _ | TS ] , C , N ):-
    x_generator4_loop( TS , C , N ).


x_tester4( N ):-
    x_tester4_loop( [ [[8 ,2 ,7] ,[6 ,1] ,[5 ,3] ,[4 ,0 ,9]] , [[8 ,2 ,7] ,[6 ,1] ,[4 ,0 ,9] ,[5 ,3]] , [[8 ,2 ,7] ,[5 ,3] ,[6 ,1] ,[4 ,0 ,9]] , [[8 ,2 ,7] ,[4 ,0 ,9] ,[6 ,1] ,[5 ,3]] , [[6 ,1] ,[8 ,2 ,7] ,[4 ,0 ,9] ,[5 ,3]] , [[6 ,1] ,[4 ,0 ,9] ,[5 ,3] ,[8 ,2 ,7]] , [[5 ,3] ,[6 ,1] ,[4 ,0 ,9] ,[8 ,2 ,7]] , [[5 ,3] ,[4 ,0 ,9] ,[6 ,1] ,[8 ,2 ,7]] , [[4 ,0 ,9] ,[5 ,3] ,[8 ,2 ,7] ,[6 ,1]] , [[4 ,0 ,9] ,[8 ,2 ,7] ,[6 ,1] ,[5 ,3]] ] , 0 , N ) .
x_tester4_loop( [] , C , C ).
x_tester4_loop( [ T | TS ] , C , N ):- 
    tester4( T ),
    C1 is C + 1 , x_tester4_loop( TS , C1 , N ).
x_tester4_loop( [ _ | TS ] , C , N ):- 
    x_tester4_loop( TS , C , N ).

isPrime(2).
isPrime(3).
isPrime(N) :-
    N > 2,
    N mod 2 =\= 0,
    \+hasDivisor(N, 3).

hasDivisor(N, D) :-
    D*D =< N,
    ( N mod D =:= 0 ; D2 is D + 2, hasDivisor(N, D2)). % 



combinations(0, Digits, [], Digits).
combinations(N, Digits, [X|Xs], Remaining):-
    N > 0,
    N1 is N - 1,
    select(X, Digits, Rest),
    combinations(N1, Rest, Xs, Remaining).




list_to_num(L, N) :-
    list_to_num(L, 0, N).
list_to_num([], A, A).
list_to_num([H|T], A, N) :-
    B is 10*A + H,
    list_to_num(T, B, N).


first_digit_zero([0|_]).


generate_runs([], Runs, Runs).
generate_runs(Digits, CurrentRuns, Runs):-
    between(1, 4, N),
    combinations(N, Digits, Comb, Remaining),
    list_to_num(Comb, Num),
    \+ first_digit_zero(Comb),
    isPrime(Num),
    generate_runs(Remaining, [Comb|CurrentRuns], Runs).


generate_prime_runs(PrimeRuns):-
    Digits = [0,1,2,3,4,5,6,7,8,9],
    generate_runs(Digits, [], PrimeRuns).


isCube(N):-
    N >= 0,
    isCubeLoop(N, 0).
isCubeLoop(N, C):-
    CubeNum is C * C * C,
    N =:= CubeNum.
isCubeLoop(N, C):-
    CubeNum is C * C * C,
    CubeNum < N,
    C1 is C + 1,
    isCubeLoop(N, C1).



generator4(N):-
    generate_prime_runs(N).
    %% permutation of list3



removeTail([], []).
removeTail([_], []).
removeTail([H|T], [H|T1]):-
    removeTail(T, T1).

permutations([], []).
permutations(L, [H|T]):-
    select(H, L, L1),
    permutations(L1, T).


subsetOrdered([], [], []).
subsetOrdered([H|T], [H|Sub], Rest) :-
    subsetOrdered(T, Sub, Rest).
subsetOrdered([H|T], Sub, [H|Rest]) :-
    subsetOrdered(T, Sub, Rest).


% Helper predicate to collect the rest of the elements
subsetRest([], []).
subsetRest([H|T], [H|R]) :-
    subsetRest(T, R).




subsetRepeat([], []).
subsetRepeat(List, Return):-
    length(List, X),
    X > 0,
    subsetOrdered(List, Subset, Remainder),
    write("List:      "),write(List), nl,
    write("Subset:    "),write(Subset), nl,
    write("Remainder: "),write(Remainder), nl,
    length(Subset, Y),
    Y > 0,
    subsetRepeat(Remainder, Return).
subsetRepeat(List, Return):-
    length(List, X), 
    X =:= 0,
    Return = List.
subsetRepeat(List, Return):-
    length(List, X), 
    X > 0,
    subsetOrdered(List, Return, Remainder),
    write("List:      "),write(List), nl,
    write("Subset:    "),write(Return), nl,
    write("Remainder: "),write(Remainder), nl,
    length(Return, Y),
    Y =:= 0.


    

splitList(0, XS, [], XS).
splitList(N, [H|T], [H|A1], B1) :-
    N > 0,
    N1 is N - 1,
    splitList(N1, T, A1, B1).
splitList(_, [], [], []).

makeSubset([], []).
makeSubset(List, Output):-
    length(List, ListLen),
    ListLen >= 0,
    between(1, ListLen, N),
    splitList(N, List, Output1, Remainder),
    makeSubset(Remainder, Output2),
    Output = [Output1|Output2].



% digits into a single number.
digits_to_number(Digits, Number) :-
    digits_to_number(Digits, 0, Number).

digits_to_number([], Number, Number).
digits_to_number([H|T], Acc, Number) :-
    NewAcc is Acc * 10 + H,
    digits_to_number(T, NewAcc, Number).

% Process each sublist 
processLists([], []).
processLists([H|T], [N|NT]) :-
    digits_to_number(H, N),
    processLists(T, NT).




allCubes([]).
allCubes([H|T]):-
    isCube(H),
    allCubes(T).




tester4(N):-
    sort(N, N1), %% sort from largest to small  
    
    removeTail(N1, N2),
    flatten(N2, N3),  
    makeSubset(N3, N4),
    processLists(N4, N5),
    allCubes(N5).

    


main:-
    x_tester4(X), write(X).
    