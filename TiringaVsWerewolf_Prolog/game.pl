:- include('util.pl').
:- include('tiringa.pl').
:- include('maps.pl').
:- include('werewolf.pl').

prepareGame(Diff, Name):- 
    getMaps(Maps),
    length(Maps, Size),
    random(0, Size, N),
    nth0(N, Maps, M),
    findElement(M, 0, "T", TPosition),
    findElement(M, 0, "W", WPosition),
    startGame(M, TPosition, WPosition, Diff, Name, 0).

startGame(M, TP, WP, Diff, Name, Count) :- 
    printMatrix(M),
    write("Selecione uma direcao: "),
    read_line_to_string(user_input, Direction),
    moveTiringa(M, Direction, TP, WP, RT),
    [S1, [NTX,NTY], NM1] = RT,
    (S1 =:= 0 -> printMatrix(NM1), writeln("Perdeu Playboy!");
     S1 =:= 2 -> printMatrix(NM1), writeln("Voce ganhou!"), writePlayer(Name, Count);
     S1 =:= 1 -> moveWerewolf(NM1, [NTX, NTY], WP, RT2),
                 [S2, [NWX1, NWY1], NM2] = RT2,
                 (S2 =:= 0 -> printMatrix(NM2), writeln("Perdeu Playboy!");
                  S2 =:= 1 -> ifTryHard(Diff, NM2, S2, [NTX, NTY], [NWX1, NWY1], RT3),
                             [S3, [NWX2, NWY2], NM3] = RT3,
                             (S3 =:= 0 -> printMatrix(NM3), writeln("Perdeu Playboy!");
                              S3 =:= 1 -> NCount is Count + 1, 
                                          startGame(NM3, [NTX,NTY], [NWX2, NWY2], Diff, Name, NCount)))).

ifTryHard(Diff, M, S, TPosition, WPosition, R) :- 
    (Diff =:= "2" -> moveWerewolf(M, TPosition, WPosition, NP), R = NP;
    R = [S, WPosition, M]).

writePlayer(Name, Count) :-
    open("ranking.txt", append, Out),
    string_concat(Name, " ", Name_),
    number_string(Count, StrCount),
    string_concat(Name_, StrCount, Player),
    string_concat(Player, "\n", FPlayer),
    write(Out, FPlayer),
    close(Out).

:- prepareGame("1", "Gabriel").