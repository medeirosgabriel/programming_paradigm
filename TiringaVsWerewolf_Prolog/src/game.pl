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

endGame(Opt):-
	writeln(""),
    ((Opt =:= 1 -> writeln("\x1b[41m\x1b[30m          VOCÊ PERDEU. FIM DE JOGO.             \x1b[0m"), finalize);
    (writeln("\x1b[44m\x1b[37m             VOCÊ GANHOU! PARABÉNS!             \x1b[0m"),finalize)).
    
finalize:-
    writeln("\x1b[47m\x1b[31m    --> APERTE ENTER PARA VOLTAR AO MENU <--    \x1b[0m"),
    read_line_to_string(user_input, F).

startGame(M, TP, WP, Diff, Name, Count) :- 
    tty_clear(),
    printMatrix(M),
    writeln("\n\x1b[47m\x1b[31m             SELECIONE UMA DIREÇÃO:             \x1b[0m"),
    read_line_to_string(user_input, Direction),
    moveTiringa(M, Direction, TP, WP, RT),
    [S1, [NTX,NTY], NM1] = RT,
    (S1 =:= 0 -> tty_clear(), printMatrix(NM1), endGame(1);
     S1 =:= 2 -> tty_clear(), printMatrix(NM1), writePlayer(Name, Count), endGame(2);
     S1 =:= 1 -> moveWerewolf(NM1, [NTX, NTY], WP, RT2),
                 [S2, [NWX1, NWY1], NM2] = RT2,
                 (S2 =:= 0 -> tty_clear(), printMatrix(NM2), endGame(1);
                  S2 =:= 1 -> ifTryHard(Diff, NM2, S2, [NTX, NTY], [NWX1, NWY1], RT3),
                             [S3, [NWX2, NWY2], NM3] = RT3,
                             (S3 =:= 0 -> tty_clear(), printMatrix(NM3), endGame(1);
                              S3 =:= 1 -> NCount is Count + 1, 
                                          startGame(NM3, [NTX,NTY], [NWX2, NWY2], Diff, Name, NCount)))).

ifTryHard(Diff, M, S, TPosition, WPosition, R) :- 
    (Diff =:= "2" -> moveWerewolf(M, TPosition, WPosition, NP), R = NP;
    R = [S, WPosition, M]).

writePlayer(Name, Count):-
    open("ranking.txt", append, Out),
    string_concat(Name, " ", Name_),
    number_string(Count, StrCount),
    string_concat(Name_, StrCount, Player),
    string_concat(Player, "\n", FPlayer),
    write(Out, FPlayer),
    close(Out).
