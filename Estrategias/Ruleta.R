
# Parámetros y estado de la simulación
capital_inicial <- 3
capital <- capital_inicial
apuesta_maxima <- 64
n_tiradas_dia <- 100

tiradas_realizadas <- 0
ganancia_neta <- 0
apuestas_realizadas <- c()
apostado <- 1

reiniciar_simulacion <- function(C = 50, m = 64, n = 100) {
  capital_inicial <<- C
  capital <<- C
  apuesta_maxima <<- m
  n_tiradas_dia <<- n
  
  tiradas_realizadas <<- 0
  ganancia_neta <<- 0
  apuestas_realizadas <<- c()
  apostado <<- 1
}

girar_ruleta <- function() {
  sample(
    c("rojo", "negro", "cero"),
    size = 1,
    prob = c(18/37, 18/37, 1/37)
  )
}

apostar <- function(fichas) {
  resultado <- girar_ruleta()
  
  if (resultado == "rojo") {
    capital <<- capital + fichas
    ganancia_neta <<- ganancia_neta + fichas
    return(TRUE)
  } else {
    capital <<- capital - fichas
    ganancia_neta <<- ganancia_neta - fichas

    return(FALSE)
  }
}

suficientes_fichas <- function() {
  if (apostado > apuesta_maxima) {
    apostado <<- 1
  }
  
  return(capital >= apostado && capital > 0)
}

sesion <- function() {
  resultado <- list(
    capital_final = capital,
    ganancia_neta = ganancia_neta,
    apuestas_realizadas = apuestas_realizadas,
    tiradas_realizadas = length(apuestas_realizadas)
  )
  
  print(resultado)
  return(resultado)
}
