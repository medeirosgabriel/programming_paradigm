main :-
    read(N1),
    read(N2),
    read(N3),
    read(N4),
    verification(N1, N2, N3, N4, R),
    write(R), halt.

%Functions

verification(N1,N2,N3,N4, R) :-
    ((N1 > N2, N1 < N3, N4 =:= (N2 + N3), odd(N1), N1 =:= (N2 + 1)) -> R = "Sim";
    (R = "Nao")).

odd(N) :- mod(N,2) =:= 1.
