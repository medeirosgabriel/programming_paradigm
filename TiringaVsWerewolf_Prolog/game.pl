
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
    moveWerewolf(NM1, [NTX, NTY], WP, RT2),
    [S2, [NWX1, NWY1], NM2] = RT2,
    ifTryHard(Diff, NM2, S2, [NTX, NTY], [NWX1, NWY1], RT3),
    [S3, [NWX2, NWY2], NM3] = RT3,
    NCount is Count + 1,
    startGame(NM3, [NTX,NTY], [NWX2, NWY2], Diff, Name, NCount).

ifTryHard(Diff, M, S, TPosition, WPosition, R) :- 
    (Diff =:= "2" -> moveWerewolf(M, TPosition, WPosition, NP), R = NP;
    R = [S, WPosition, M]).

:- prepareGame("1", "Gabriel").