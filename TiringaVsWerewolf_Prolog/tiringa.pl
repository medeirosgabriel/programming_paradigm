﻿:- include('util.pl').
:- include('positions.pl').

% 0 == LOST THE GAME
% 1 == CONTINUE THE GAME
% 2 == WON THE GAME

moveTiringa(M, Movement, TPosition, WPosition, R) :- 
    defineNewPosition(M, Movement, TPosition, [NX,NY]),
    getElementPosition(M, NX, NY, E),
    setElement(M, TPosition, " ", NM1),
    (equalsPosition([NX,NY], WPosition) -> setElement(NM1, [NX,NY], "W", NM2), R = [0, [NX,NY], NM2];
    (not(checkIsNotExit(M, [NX,NY]))) -> R = [2, [NX,NY], NM1];
    setElement(NM1, [NX,NY], "T", NM2), R = [1, [NX,NY], NM2]).

defineNewPosition(M, Movement, Position, R) :-
    string_lower(Movement, Mov),
    (Mov =:= "w" -> upPosition(M, Position, R);
    Mov =:= "a" -> leftPosition(M, Position, R);
    Mov =:= "s" -> downPosition(M, Position, R);
    Mov =:= "d" -> rightPosition(M, Position, R);
    R = Position).