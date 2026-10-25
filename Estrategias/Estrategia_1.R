#capital_inicial <- as.numeric(readline(prompt =  "Capital inicial"))

capital_inicial <- 3
capital <- 3
n_tiradas_dia <- 0
apuesta_maxima <- 20

ganancia_neta <- 0
apuestas_realizadas <- c()

apostado  <- 1
# actividad 1: girar ruleta

girar_ruleta <- function(){
  ruleta <- c("rojo","negro","cero")
  probabilidades <- c(18/37,18/37,1/37)
  res <- sample(ruleta, size = 1, replace=TRUE, prob = probabilidades)
  return(res)
}

#se apuesta una cantidad de fichas
apostar <- function(fichas){
  resultado <- girar_ruleta()
  
  if (resultado == "rojo") {
    apostador_gana(fichas)
  } else {
    apostador_pierde(fichas)
  }
  
}

#se suma la cantidad de fichas apostadas como ganancia positiva
apostador_gana <- function(fichas){
  capital <<- capital + fichas
  ganancia_neta <<- ganancia_neta + fichas
}

#se resta la cantidad de fichas apostadas como ganancia negativa
apostador_pierde <- function(fichas){
  capital <<- capital - fichas
  ganancia_neta <<- ganancia_neta - fichas
}

#se verifica que haya suficientes fichas para poder apostar
suficientes_fichas <- function(){
  if (capital<=0 | capital < apostado){
    return(FALSE)
  }
  return(TRUE)
}

sesion <- function(){
  cat("Capital inicial: ", capital_inicial, "\n")
  cat("ganancia neta: ", ganancia_neta, "\n")  
  cat("Apuestas realizadas: ",  paste(apuestas_realizadas, collapse = ", "), "\n\n")
}

#Estrategias:  

#Estrategia 1: se apuesta siempre 1 ficha al rojo

e1_apuesta_fija <- function() {
  while (suficientes_fichas()){
    apostar(apostado)
    apuestas_realizadas <<- c(apuestas_realizadas, apostado)
  }
  sesion()
}

e1_apuesta_fija()

