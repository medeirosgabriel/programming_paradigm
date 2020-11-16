main :- 
    read(L),
    length(L, Size),
    getMiddle(Size, M),
    list_sum_by_index(L, M, Left),
    list_sum_by_index(L, Size, Total),
    Right is Total - Left,
    message(Left, Right), halt.
    
message(Left, Right) :-
    (Left >= Right -> write("esquerda");
    write("direita")).
    
getMiddle(Size, R) :-
    (mod(Size, 2) =:= 0 -> R is Size/2;
    NS is (Size + 1)/2 - 1, R is NS).
    
list_sum_by_index(_, 0, S) :- S = 0.
list_sum_by_index([H|T], I, Total) :- 
    NI is I - 1,
    list_sum_by_index(T, NI, S),
    Total is S + H.