main :: IO()
main = do
    opcao <- getLine
    case opcao of
        "1" -> do
            color <- getLine
            print (situation1 color)
            
        "2" -> do
            color1 <- getLine
            color2 <- getLine
            print (situation2 color1 color2)

situation1 :: String -> String
situation1 color | (color == "roxo") = "vermelho + azul"
                | (color == "verde") = "azul + amarelo"
                | (color == "laranja") = "amarelo + vermelho"
                | otherwise = color
                
situation2 :: String -> String -> String
situation2 color1 color2 | (color1 == "amarelo" && color2 == "vermelho") || 
                           (color2 == "amarelo" && color1 == "vermelho") = "laranja"
                         | (color1 == "azul" && color2 == "vermelho") || 
                           (color2 == "azul" && color1 == "vermelho")= "roxo"
                         | (color1 == "amarelo" && color2 == "azul") || 
                           (color2 == "amarelo" && color1 == "azul") = "verde"
                         | otherwise = color1