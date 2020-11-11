import Data.Matrix
import Game
import Maps
import System.Exit (exitSuccess)
import System.Process
import System.IO
import Control.Exception

comoJogar :: IO ()
comoJogar = do
  system "clear"
  putStrLn ""
  putStrLn ("\x1b[41m" ++ "\x1b[37m" ++ "             COMO JOGAR?             " ++ "\x1b[0m")
  putStrLn ""
  putStrLn "  O JOGO CONSISTE EM FAZER  TIRINGA  "
  putStrLn "  ESCAPAR DA CHÁCARA (CHEGAR AO S),  "
  putStrLn " ANTES  QUE  O LOBISOMEM O PEGUE."
  putStrLn ""
  putStrLn "  REPRESENTAÇÃO :"
  putStrLn "    T - TIRINGA"
  putStrLn "    W - LOBISOMEM"
  putStrLn "    S - SAÍDA"
  putStrLn ""
  putStrLn "  COMANDOS :"
  putStrLn "    W - CIMA"
  putStrLn "    A - ESQUERDA"
  putStrLn "    S - BAIXO"
  putStrLn "    D - DIREITA"
  putStrLn ""
  putStrLn "  M - MENU"
  putStrLn ""
  opcaoComoJogar <- getLine
  redirecionaComoJogar opcaoComoJogar

redirecionaComoJogar :: String -> IO ()
redirecionaComoJogar st
  | st == "M" || st == "m" = menu
  | otherwise = comoJogar

vencedor :: IO ()
vencedor = do
  system "clear"
  putStrLn ""
  putStrLn ("\x1b[41m" ++ "\x1b[37m" ++ "            MELHOR TEMPO             " ++ "\x1b[0m")
  putStrLn ""
  bestPlayer
  putStrLn ""
  putStrLn " M - MENU"
  putStrLn ""
  opcaoVencedor <- getLine
  redirecionaVencedor opcaoVencedor

redirecionaVencedor :: String -> IO ()
redirecionaVencedor st
  | st == "M" || st == "m" = menu
  | otherwise = vencedor

dificuldade :: IO ()
dificuldade = do
  system "clear"
  putStrLn ""
  putStrLn ("\x1b[41m" ++ "\x1b[37m" ++ "             DIFICULDADE             " ++ "\x1b[0m")
  putStrLn ""
  putStrLn " ESCOLHA UMA DIFICULDADE"
  putStrLn ""
  putStrLn " 1 - FÁCIL"
  putStrLn " 2 - TRYHARD"
  putStrLn ""
  putStrLn " M - MENU"
  putStrLn ""
  opcaoDificuldade <- getLine
  redirecionaDificuldade opcaoDificuldade
  menu

redirecionaDificuldade :: String -> IO ()
redirecionaDificuldade st
  | st == "M" || st == "m" = menu
  | st /= "1" && st /= "2" = dificuldade
  | otherwise = iniciaJogo st

iniciaJogo :: String -> IO()
iniciaJogo dificuldade = do
  system "clear"
  putStrLn ""
  putStrLn ("\x1b[41m" ++ "\x1b[37m" ++ " INFORME 3 LETRAS PARA REPRESENTAÇÃO:" ++ "\x1b[0m")
  nome <- getLine
  prepare dificuldade nome

menu :: IO ()
menu = do
  system "clear"
  putStrLn ""
  putStrLn ("\x1b[41m" ++ "\x1b[37m" ++  "        TIRINGA VS. WEREWOLF         " ++ "\x1b[0m")
  putStrLn ""
  putStrLn " 1 - INICIAR JOGO"
  putStrLn " 2 - VENCEDOR"
  putStrLn " 3 - COMO JOGAR?"
  putStrLn " S - SAIR"
  putStrLn ""

  opcaoMenu <- getLine
  redirecionaMenu opcaoMenu

redirecionaMenu :: String -> IO ()
redirecionaMenu st
  | st == "1" = dificuldade 
  | st == "2" = vencedor 
  | st == "3" = comoJogar 
  | st == "S" || st == "s" = exitSuccess
  | otherwise = menu

bestPlayer :: IO()
bestPlayer = do
  arq <- openFile "ranking.txt" ReadMode
  content <- hGetContents arq
  let ranking = words content
  let (bestN, bestM) = getTheBest ((length ranking) - 1) ranking (" ", "99999999999")
  putStrLn ("\x1b[47m" ++ "\x1b[31m" ++ "         " ++ bestN ++ " - " ++ bestM ++ " MOVIMENTOS" ++ "         " ++ "\x1b[0m")
  hClose arq

getTheBest :: Int -> [String] -> (String, String) -> (String, String)

getTheBest (-1) _ _ = ("", "")

getTheBest 1 l (p2,m2) | m1 < m2Int = ((l Prelude.!! 0), (l Prelude.!! 1) )
                       | otherwise = (p2,m2)
                       where m1 = read (l Prelude.!! 1) :: Int
                             p1 = read (l Prelude.!! 0) :: Int
                             m2Int = read (m2) :: Int

getTheBest i l (p, m) | moves < mInt = getTheBest (i - 2) l (player, (l Prelude.!! (i)))
                      | otherwise = getTheBest (i - 2) l (p, m)
                      where player = (l Prelude.!! (i - 1))
                            moves = read (l Prelude.!! (i)) :: Int
                            mInt = read m :: Int

main :: IO ()
main = do
  system "clear"
  menu
