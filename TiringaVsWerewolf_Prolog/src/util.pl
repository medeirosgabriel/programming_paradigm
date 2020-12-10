list_empty([]):-true.
list_empty([_|_]):-false.

findElement([], _, _, R) :- R = [-1, -1].
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

/* SELECT THE BEST PLAYER */

getTheBestPlayer() :-
    read_file_to_string("ranking.txt", Players, []),
    split_string(Players, "\n", "", PlayersList),
    splitPlayer(PlayersList, PlayersList2),
    bubble_sort(PlayersList2, SortedPlayers),
	((list_empty(SortedPlayers) -> write("        NÃO HÁ VENCEDORES"));
	(nth0(0, SortedPlayers, R), 
	 nth0(0, R, Name), 
	 nth0(1, R, Punct),
	 write("            "),
     write(Name),
     write(" - "),
     write(Punct))),
	writeln("").

splitPlayer([_], R) :- R = [].
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
    [_,B1] = X, [_,B2] = Y, 
    B1 > B2, bubble(X,T,NT,Max).
bubble(X,[Y|T],[X|NT],Max):-
    [_,B1] = X, [_,B2] = Y, 
    B1 =< B2, bubble(Y,T,NT,Max).

/* ---------------------------- */


