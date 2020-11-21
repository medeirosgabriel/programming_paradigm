﻿findElement([], _, _, R) :- R = [-1, -1].
findElement([H|T], Row, Element, R) :- 
    (NRow is Row + 1),
    findInRow(H, 0, Element, Col),
    (Col =\= (-1) -> R = [Row, Col];
    findElement(T, NRow, Element, R)).

findInRow([], _, _, R) :- R = -1.
findInRow([H|T], CR, E, R) :- 
    (NCol is CR + 1),
    ((H =:= E) -> R = CR;
    findInRow(T, NCol, E, R)).

countRows([], Count, R) :- R = Count.
countRows([_|T], Count, R) :- 
    NC is Count + 1,
    countRows(T, NC, R).

countColumns([H|_], R) :- 
    countRows(H, 0, R).

printMatrix([]) :- write("").
printMatrix([H|T]) :-
    printRow(H),
    write("\n"),
    printMatrix(T).

printRow([]) :- write("").
printRow([H|T]) :- 
    ((H =:= " ") -> write("\x1b[47m   \x1b[0m");
    (H =:= "#") -> write("\x1b[47m\x1b[32m###\x1b[0m");
    (H =:= "T") -> write("\x1b[47m\x1b[34m T \x1b[0m");
    (H =:= "S") -> write("\x1b[47m\x1b[35m S \x1b[0m");
    (H =:= "W") -> write("\x1b[47m\x1b[31m W \x1b[0m")),
    printRow(T).

setElement([], _, _, R) :- R = [].
setElement([H|T], [X,Y], E, R) :- 
    NX is X - 1,
    ((X =:= 0) -> setElementAux(H, Y, E, L), append([L], T, NL), R = NL;
    setElement(T, [NX,Y], E, NL), append([H], NL, R)).

setElementAux([], _, _, R) :- R = [].
setElementAux([H|T], Y, E, R) :-
    NY is Y - 1,
    ((Y =:= 0) -> append([E], T, NL), R = NL;
    setElementAux(T, NY, E, NL), append([H], NL, R)).

getElementPosition(Mat, Row, Col, Val) :- nth0(Row, Mat, Elem), nth0(Col, Elem, Val).