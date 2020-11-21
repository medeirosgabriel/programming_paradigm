:- include('util.pl').

leftPosition(M, [X,Y], R) :- 
    countColumns(M, NC),
    NY is (Y - 1),
    (evaluateY(NY, NC), checkIsNotWall(M, [X, NY])  -> R = [X, NY];
    R = [X, Y]).

rightPosition(M, [X,Y], R) :- 
    countColumns(M, NC),
    NY is (Y + 1),
    (evaluateY(NY, NC), checkIsNotWall(M, [X, NY]) -> R = [X, NY];
    R = [X, Y]).

upPosition(M, [X,Y], R) :- 
    countRows(M, 0, NR),
    NX is (X - 1),
    (evaluateX(NX, NR), checkIsNotWall(M, [NX, Y]) -> R = [NX, Y];
    R = [X, Y]).

downPosition(M, [X,Y], R) :- 
    countRows(M, 0, NR),
    NX is (X + 1),
    (evaluateX(NX, NR), checkIsNotWall(M, [NX, Y]) -> R = [NX, Y];
    R = [X, Y]).

evaluateX(X, NR) :- X >= 0, X < NR.

evaluateY(Y, NC) :- Y >= 0, Y < NC.

checkIsNotWall(M, [Row, Col]) :- 
    getElementPosition(M, Row, Col, Val),
    Val =\= "#".

checkIsNotExit(M, [Row, Col]) :- 
    getElementPosition(M, Row, Col, Val),
    Val =\= "S".

equalsPosition([NX,NY], [CX,CY]) :- NX =:= CX, NY =:= CY.