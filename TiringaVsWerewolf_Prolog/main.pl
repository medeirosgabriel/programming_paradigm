players(R) :-
    read_file_to_string("ranking.txt", Players, []),
    split_string(Players, "\n", "", PlayersList),
    splitPlayer(PlayersList, R).

splitPlayer([], R) :- R = [].
splitPlayer([H|T], R) :-
    split_string(H, " ", "", Player),
    nth0(0, Player, Name), nth0(1, Player, N),
    number_codes(Mov, N),
    L = [Name, Mov],
    splitPlayer([T], NP),
    append([L], NP, R).

test :-
    players(R),
    writeln(R).
