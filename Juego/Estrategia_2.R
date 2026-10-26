redoblar_apuesta <- function() {
  apostado <<- 2 * apostado
}


# Opción 1: termina si la siguiente apuesta supera m
e2_duplicacion_op1 <- function() {
  while (tiradas_realizadas < n_tiradas_dia && capital >= apostado && apostado <= apuesta_maxima) {
    apuestas_realizadas <<- c(apuestas_realizadas, apostado)
    
    hay_premio <- apostar(apostado)
    tiradas_realizadas <<- tiradas_realizadas + 1
    
    if (hay_premio) {
      apostado <<- 1
    } else {
      redoblar_apuesta()
    }
  }
  
  return(sesion())
}


# Opción 2: reinicia la apuesta a 1 si supera m
e2_duplicacion_op2 <- function() {
  while (tiradas_realizadas < n_tiradas_dia) {
    if (apostado > apuesta_maxima) {
      apostado <<- 1
    }
    #verifica si fichas suficientes
    if (capital < apostado || capital <= 0) {
      break
    }
    
    apuestas_realizadas <<- c(apuestas_realizadas, apostado)
    
    hay_premio <- apostar(apostado)
    tiradas_realizadas <<- tiradas_realizadas + 1
    
    if (hay_premio) {
      apostado <<- 1
    } else {
      redoblar_apuesta()
    }
  }
  return(sesion())
}
