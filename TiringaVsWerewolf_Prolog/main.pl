getTheBestPlayer(R) :-
    read_file_to_string("ranking.txt", Players, []),
    split_string(Players, "\n", "", PlayersList),
    splitPlayer(PlayersList, PlayersList2),
    bubble_sort(PlayersList2, SortedPlayers),
    nth0(0, SortedPlayers, R).

splitPlayer([], R) :- R = [].
splitPlayer([H|T], R) :-
    split_string(H, " ", "", Player),
    nth0(0, Player, Name), nth0(1, Player, N),
    number_codes(Mov, N),
    L = [Name, Mov],
    splitPlayer(T, NP),
    append([L], NP, R).

bubble_sort(List,Sorted):-b_sort(List,[],Sorted).
b_sort([],Acc,Acc).
b_sort([H|T],Acc,Sorted):-bubble(H,T,NT,Max),b_sort(NT,[Max|Acc],Sorted).
       
bubble(X,[],[],X).
bubble(X,[Y|T],[Y|NT],Max):- 
    [A1,B1] = X, [A2,B2] = Y, 
    B1 > B2, bubble(X,T,NT,Max).
bubble(X,[Y|T],[X|NT],Max):-
    [A1,B1] = X, [A2,B2] = Y, 
    B1 =< B2, bubble(Y,T,NT,Max).

/*test :-
    getTheBestPlayer(R),
    writeln(R).*/
