:- include('game.pl').

howToPlay() :-
    writeln("             COMO JOGAR?             "),
    writeln(""),
    writeln("  O JOGO CONSISTE EM FAZER  TIRINGA  "),
    writeln("  ESCAPAR DA CHÁCARA (CHEGAR AO S),  "),
    writeln("  ANTES QUE O LOBISOMEM O PEGUE.     "),
    writeln(""),
    writeln("  REPRESENTAÇÃO :"),
    writeln("    T - TIRINGA"),
    writeln("    W - LOBISOMEM"),
    writeln("    S - SAÍDA"),
    writeln(""),
    writeln("  COMANDOS :"),
    writeln("    W - CIMA"),
    writeln("    A - ESQUERDA"),
    writeln("    S - BAIXO"),
    writeln("    D - DIREITA"),
    writeln(""),
    writeln("  M - MENU"),
    writeln(""),
    read_line_to_string(user_input, Option),
    howToPlayAux(Option).

howToPlayAux(Opt) :-
    (Opt =:= "m" -> menu();
    howToPlay).

winner() :-
    writeln("   MELHOR NÚMERO DE MOVIMENTAÇÕES    "),
    writeln(""),
    write("            "),
    (getTheBestPlayer(R) -> writeln(R); writeln("")),
    writeln(""),
    writeln(" M - MENU"),
    writeln(""),
    read_line_to_string(user_input, Option),
    winnerAux(Option).

winnerAux(Opt) :-
    (Opt =:= "m" -> menu();
    winner).

difficulty() :-
    writeln(""),
    writeln("             DIFICULDADE             "),
    writeln(""),
    writeln(" ESCOLHA UMA DIFICULDADE"),
    writeln(""),
    writeln(" 1 - FÁCIL"),
    writeln(" 2 - TRYHARD"),
    writeln(""),
    writeln(" M - MENU"),
    writeln(""),
    read_line_to_string(user_input, Diff),
    diffAux(Diff).

diffAux(Diff) :-
    (Diff =:= "m" -> menu();
    Diff =:= "1" -> startGame(Diff);
    Diff =:= "2" -> startGame(Diff);
    difficulty()).

startGame(Diff):-
    writeln(""),
    write(" INFORME 3 LETRAS PARA REPRESENTAÇÃO: "),
    read_line_to_string(user_input, Name),
    prepareGame(Diff, Name).

menu() :-
    writeln(""),
    writeln("        TIRINGA VS. WEREWOLF         "),
    writeln(""),
    writeln(" 1 - INICIAR JOGO"),
    writeln(" 2 - VENCEDOR"),
    writeln(" 3 - COMO JOGAR?"),
    writeln(" S - SAIR"),
    writeln(""),
    read_line_to_string(user_input, Option),
    menuAux(Option).

menuAux(Option) :-
    (Option =:= "1" -> difficulty(); 
    Option =:= "2" -> winner();
    Option =:= "3" -> howToPlay();
    Option =:= "s" -> writeln(""), halt;
    menu()).

main :-
  menu().

/* Select the best player */ 

getTheBestPlayer(R) :-
    read_file_to_string("ranking.txt", Players, []),
    split_string(Players, "\n", "", PlayersList),
    splitPlayer(PlayersList, PlayersList2),
    bubble_sort(PlayersList2, SortedPlayers),
    nth0(0, SortedPlayers, R).

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

/*test :-
    winner().*/
