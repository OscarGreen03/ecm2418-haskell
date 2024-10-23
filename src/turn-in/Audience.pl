x_generator3( N ):- 
    x_generator3_loop( [ 1024 , 9409 , 23716 , 51529 , 123904 , 185761 , 868624 , 962361 , 982081 , 1000000 ] , 0 , N ) . 
x_generator3_loop( [] , C , C ). 
x_generator3_loop( [ T | TS ] , C , N ):- 
    generator3( T ) , C1 is C + 1 , x_generator3_loop( TS , C1 , N ) .
 x_generator3_loop( [ _ | TS ] , C , N ):-
     x_generator3_loop( TS , C , N ).

x_tester3( N ):- 
    x_tester3_loop( [ 123056 , 128036 , 139076 , 142076 , 148056 , 159076 , 173096 , 189036 , 193056 , 198076 ] , 0 , N ) . 
x_tester3_loop( [] , C , C ).
 x_tester3_loop( [ T | TS ] , C , N ):- 
    tester3( T ) , C1 is C + 1 , x_tester3_loop( TS , C1 , N ) .  
x_tester3_loop( [ _ | TS ] , C , N ):- 
    x_tester3_loop( TS , C , N ).

perfect_square(N) :-
    Q is sqrt(N),
    Q =:= round(Q).


nub( [], [] ).
nub( [H|T], R ) :-
    member( H, T ),
    nub( T, R ).
nub( [H|T], [H|R] ) :-
    \+ member( H, T ),
    nub( T, R ).

%%checks if number has a 0 in it
has_zero(N):-
    member('0', N).

generator3(N):-
    between(1000, 1000000, N),
    perfect_square(N).

no_dupes(N):-
    nub(N, NoRepeats),
    length(N, Len),
    length(NoRepeats, Len).

length_match_end_element(N):-
    last(N, Last),
    atom_number(Last, LastNum),
    length(N, LastNum).


is_odd(N):-
    1 is mod(N, 2).


last_but_one_odd(N):-
    length(N, Len),
    LenM2 is Len - 2,
    nth0(LenM2, N, LastButOne),
    atom_number(LastButOne, LastButOneNum),
    is_odd(LastButOneNum).



multiples_of_first_digit(Digits):-
    nth0(0, Digits, FirstChar),
    nth0(1, Digits, SecondChar),
    nth0(2, Digits, ThirdChar),
    length(Digits, Len),
    LenM2 is Len - 2,
    nth0(LenM2, Digits, LastButOneChar),
    atom_number(FirstChar, First),
    atom_number(SecondChar, Second),
    atom_number(ThirdChar, Third),
    atom_number(LastButOneChar, LastButOne),
    is_multiple(First, Second),
    is_multiple(First, Third),
    is_multiple(First, LastButOne).

is_multiple(X, Y) :-
    Y \= 0,
    Y mod X =:= 0.


tester3(N):-
    number_chars(N, Digits),
    no_dupes(Digits),
    length_match_end_element(Digits),
    last_but_one_odd(Digits),
    has_zero(Digits),
    multiples_of_first_digit(Digits).



%% 1. No Duplicates
%% 2. Length of number matches last element
%% 3. Last but one digit is odd.
%% 4. Only one 0 in the number
%% 5. Second, third and last-but-one digits are multiples of first digit

test_speed(Query) :-
    statistics(walltime, [Start|_]),
    Query,
    statistics(walltime, [End|_]),
    TimeTaken is End - Start,
    format('Time taken: ~w milliseconds.', [TimeTaken]).




main :-
    %% test values for tester3
    generator3(N), tester3(N), write(N).



