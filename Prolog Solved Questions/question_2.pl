main :-
    M = [[ 0, 23, 43, 26, 42, 56],
         [-1,  0, 20, 40, 19, 33],
         [-1, -1,  0, 20, -1, 19],
         [-1, -1, -1,  0, -1, 30],
         [-1, -1, -1, -1,  0, 14],
         [-1, -1, -1, -1, -1,  0]],
    
    read(A),
    read(B),
    char_code(A, X),
    char_code(B, Y),
    IndA is (X - 97),
    IndB is (Y - 97),
    findElement(M, IndA, IndB, R),
    message(R, Message),
    write(Message), halt.
    
findElement([], _, _, R) :- R = -1.
findElement([H|T], Row, Col, R) :- (NRow is Row - 1),
                                   ((Row =:= 0) -> findInRow(H, Col, R);
                                   findElement(T, NRow, Col, R)).
                                   
findInRow([], _, R) :- R = -1.
findInRow([H|T], Col, R) :- (NCol is Col - 1),
                            (((Col =:= 0) -> R = H);
                            findInRow(T, NCol, R)).
                            
message(Value, R) :- (((Value =:= (-1)) -> R = "Caminho impossível");
                      R = Value).