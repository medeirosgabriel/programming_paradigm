:- include('game.pl').
:- include('util.pl').

clear:- write('\e[H\e[2J').

create_title(Title):-
    atomics_to_string(['\x1b[41m', '\x1b[37m', Title, '\x1b[0m'], R),
    writeln(R).
    
read_input(R):-
    read_line_to_string(user_input, R1),
    R = R1.

howToPlay():-
    clear,
    create_title("             COMO JOGAR?             "),
    writeln(""),
    writeln("  O JOGO CONSISTE EM FAZER  TIRINGA"),
    writeln("  ESCAPAR DA CHÁCARA (CHEGAR AO S),"),
    writeln("  ANTES QUE O LOBISOMEM O PEGUE."),
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
    read_input(Option),
    howToPlayAux(Option).

howToPlayAux(Opt):-
    string_lower(Opt, Opt_),
    ((Opt_ =:= "m" -> menu());
    (howToPlay)).

bestGame():-
    clear,
    create_title("            MELHOR JOGO              "),
    writeln(""),
    getTheBestPlayer(),
    writeln(""),
    writeln(" M - MENU"),
    writeln(""),
    read_input(Option),
    bestGameAux(Option).

bestGameAux(Opt) :-
    string_lower(Opt, Opt_),
    ((Opt_ =:= "m" -> menu());
    (bestTime())).

difficulty():-
    clear,
    writeln(""),
    create_title("             DIFICULDADE             "),
    writeln(""),
    writeln(" ESCOLHA UMA DIFICULDADE"),
    writeln(""),
    writeln(" 1 - FÁCIL"),
    writeln(" 2 - TRYHARD"),
    writeln(""),
    writeln(" M - MENU"),
    writeln(""),
    read_input(Option),
    difficultyAux(Option).

difficultyAux(Opt) :-
    string_lower(Opt, Opt_),
    ((Opt_ =:= "m" -> menu());
    (Opt_ =:= "1" -> startGame(Opt_));
    (Opt_ =:= "2" -> startGame(Opt_));
    (difficulty())).

startGame(Diff):-
    clear,
    writeln(""),
    create_title("  INFORME 3 LETRAS PARA REPRESENTAÇÃO: "),
    read_input(Name),
    prepareGame(Diff, Name),
    menu().

menu() :-
    tty_clear(),
    writeln(""),
    create_title("        TIRINGA VS. WEREWOLF         "),
    writeln(""),
    writeln(" 1 - INICIAR JOGO"),
    writeln(" 2 - VENCEDOR"),
    writeln(" 3 - COMO JOGAR?"),
    writeln(" S - SAIR"),
    writeln(""),
    read_input(Option),
    menuAux(Option).

menuAux(Option) :-
    string_lower(Option, Opt_),
    ((Opt_ =:= "1" -> difficulty()); 
    (Opt_ =:= "2" -> bestGame());
    (Opt_ =:= "3" -> howToPlay());
    (Opt_ =:= "s" -> writeln(""), halt);
    (menu())).

main :-
  menu(). 
  
