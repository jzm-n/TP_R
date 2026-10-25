#capital_inicial <- as.numeric(readline(prompt =  "Capital inicial"))

capital_inicial <- 1000
capital <- 1000
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
    return(TRUE)
  } else {
    apostador_pierde(fichas)
    return(FALSE)
  }
  
}

apostador_gana <- function(fichas){
  capital <<- capital + fichas
  ganancia_neta <<- ganancia_neta + fichas
  
  #cat("Ahora hay un total de ", capital, "fichas \n")
}

apostador_pierde <- function(fichas){
  capital <<- capital - fichas
  ganancia_neta <<- ganancia_neta - fichas
  #cat("Ahora hay un total de ", capital, "fichas \n")
}

suficientes_fichas <- function() {
  # Si la apuesta supera el límite, reiniciar a 1
  if (!apuesta_permitida()) {
    apostado <<- 1
  }

  # Verificamos que haya capital suficiente
  return(capital >= apostado && capital > 0)
}

apuesta_permitida <- function(){
  if (apostado > apuesta_maxima){
    return(FALSE)
  } 
  return(TRUE)
}

redoblar_apuesta <- function(){
  apostado <<- 2*apostado
}

sesion <- function(){
  cat("Capital inicial: ", capital_inicial, "\n")
  cat("ganancia neta: ", ganancia_neta, "\n")  
  cat("Apuestas realizadas: ",  paste(apuestas_realizadas, collapse = ", "), "\n\n")
}

#Estrategia 2: duplicación con límite
e2_duplicacion <- function (){
  while (suficientes_fichas()) {
    apuestas_realizadas <<- c(apuestas_realizadas, apostado)
    hay_premio <- apostar(apostado)
    if (!hay_premio){
      redoblar_apuesta()
    } else {
      apostado <<- 1
    }
  }  
  sesion()
}

e2_duplicacion()
