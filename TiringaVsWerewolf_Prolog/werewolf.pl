:- include('util.pl').
:- include('positions.pl').

% 0 == LOST THE GAME
% 1 == CONTINUE THE GAME

moveWerewolf(M, TPosition, WPosition, R) :-
    allPositions(M, WPosition, PL),
    filterPositions(M, PL, WPosition, FL),
    euclideanList(FL, TPosition, EL),
    bubble_sort(EL, L),
    [H|T] = L,
    [NX,NY,_] = H,
    setElement(M, WPosition, " ", NM1),
    setElement(NM1, [NX,NY], "W", NM2),
    (equalsPosition([NX,NY], TPosition) -> R = [0, [NX,NY], NM2];
    R = [1, [NX,NY], NM2]).


allPositions(M, Position, PL) :- 
    leftPosition(M, Position, LP),
    rightPosition(M, Position, RP),
    upPosition(M, Position, UP),
    downPosition(M, Position, DP),
    PL = [LP, RP, UP, DP].

filterPositions(_, [], _, NPL) :- NPL = [].
filterPositions(M, [H|T], Position, NPL) :-
    (not(equalsPosition(H, Position)), checkIsNotExit(M, H) -> 
        filterPositions(M, T, Position, R), append([H], R, NPL);
    filterPositions(M, T, Position, NPL)).

euclideanDistance([TX, TY], [WX,WY], R) :- 
    DX is float(TX) - float(WX),
    DY is float(TY) - float(WY),
    SX is DX*DX,
    SY is DY*DY,
    ED is sqrt(SX + SY),
    R = [WX,WY,ED].

euclideanList([], _, R) :- R = [].
euclideanList([H|T], TPosition, R) :- 
    euclideanList(T, TPosition, EL), 
    euclideanDistance(TPosition, H, ED),
    append([ED], EL, R).

% Bubble_Sort

bubble_sort(List,Sorted):-b_sort(List,[],Sorted).
b_sort([],Acc,Acc).
b_sort([H|T],Acc,Sorted):-bubble(H,T,NT,Max),b_sort(NT,[Max|Acc],Sorted).
       
bubble(X,[],[],X).
bubble(X,[Y|T],[Y|NT],Max):- 
    [A1,B1,C1] = X, [A2,B2,C2] = Y, 
    C1 > C2, bubble(X,T,NT,Max).
bubble(X,[Y|T],[X|NT],Max):-
    [A1,B1,C1] = X, [A2,B2,C2] = Y, 
    C1 =< C2, bubble(Y,T,NT,Max).

test :- 

    M1=[["#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#"],
        ["T", " ", " ", " ", "#", "#", " ", "#", "#", "#", "#", "#", " ", " ", " ", "#"],
        ["#", "#", "#", " ", " ", " ", " ", "#", "#", "#", "#", "#", " ", "#", " ", "#"],
        ["#", "#", "#", " ", "#", "#", " ", " ", " ", " ", " ", " ", " ", "#", " ", "#"],
        ["#", "#", "#", " ", "#", "#", "#", "#", " ", "#", "#", "#", "#", "#", " ", "#"],
        ["#", "#", "#", " ", "#", "#", "#", "#", " ", "#", "#", "#", "#", "#", " ", "#"],
        ["#", "#", "#", " ", " ", " ", " ", "#", " ", "#", "#", "#", "#", "#", " ", "#"],
        ["#", "#", "#", " ", "#", "#", " ", "#", " ", "#", "#", "#", "#", "#", " ", "#"],
        ["#", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", "#"],
        ["#", "#", "#", " ", "#", "#", " ", "#", " ", "#", "#", "#", " ", "#", "#", "#"],
        ["#", "#", " ", " ", "#", "#", " ", "#", " ", "#", "#", "#", " ", "#", "#", "#"],
        ["#", "#", " ", "#", "#", "W", " ", " ", " ", " ", " ", " ", " ", " ", " ", "S"],
        ["#", "#", " ", "#", "#", "#", "#", "#", " ", "#", " ", "#", "#", "#", "#", "#"],
        ["#", "#", " ", "#", "#", "#", "#", " ", " ", "#", " ", "#", "#", "#", "#", "#"],
        ["#", "#", " ", "#", "#", "#", "#", " ", "#", "#", " ", "#", "#", "#", "#", "#"],
        ["#", " ", " ", " ", "#", "#", "#", " ", "#", "#", " ", "#", "#", "#", "#", "#"],
        ["#", " ", "#", " ", "#", " ", " ", " ", "#", "#", " ", "#", "#", "#", "#", "#"],
        ["#", " ", "#", " ", " ", " ", "#", "#", "#", "#", " ", "#", "#", "#", "#", "#"],
        ["#", " ", "#", "#", "#", " ", "#", "#", "#", "#", " ", " ", " ", " ", "#", "#"],
        ["#", " ", "#", "#", "#", " ", " ", " ", " ", " ", " ", "#", "#", " ", "#", "#"],
        ["#", " ", "#", "#", "#", " ", "#", "#", "#", "#", " ", "#", "#", " ", "#", "#"],
        ["#", " ", "#", "#", "#", " ", "#", "#", "#", "#", " ", "#", "#", " ", "#", "#"],
        ["#", " ", "#", "#", "#", " ", "#", "#", "#", "#", " ", " ", " ", " ", "#", "#"],
        ["#", " ", "#", "#", "#", " ", "#", "#", "#", "#", " ", "#", "#", "#", "#", "#"],
        ["#", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", "#", "#", "#", "#", "#"],
        ["#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#", "#"]],

    L = [[1,2,13.456],[2,6,7.89432],[15,6,54.78987]],
    bubble_sort(L, R),

    write(R).