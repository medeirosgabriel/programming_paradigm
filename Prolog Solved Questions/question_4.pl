main :-
    read(L),
    read(I),
    removeElement(L, I, R),
    write(R), halt.
    
removeElement([_|T], 0, R) :- R = T.
removeElement([H|T], I, R) :-
    NI is I - 1,
    removeElement(T, NI, PL),
    append([H], PL, R).
