
:- include('util.pl').
:- include('tiringa.pl').
:- include('maps.pl').

prepareGame :- 
    findElement(Matrix, 0, "T", TPosition),
    findElement(Matrix, 0, "W", WPosition),
    getMaps(Maps),
    length(Maps, Size),
    random(0, Size, N),
    nth0(N, Maps, M),
    startGame(M, TPosition, WPosition).

startGame(M, TP, WP) :- 
    