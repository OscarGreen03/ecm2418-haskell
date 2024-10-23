person("Swift", 10, 30).
person("Bob", 10, 50).
person(Name, Age, Balance):-
    Name is 'Placeholder',
    Age is 50,
    Balance is 90.



main :-
    person(Name, 10, Bal), write(Name), write(Bal).

