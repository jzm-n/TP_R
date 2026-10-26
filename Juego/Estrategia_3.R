#Estrategia 3

# Opción 1: el día termina cuando se completa un ciclo
e3_ciclo_dinamico_op1 <- function() {
  lista <- list(1, 2, 1, 2, 1, 2, 1)
  
  while (length(lista) > 0 && tiradas_realizadas < n_tiradas_dia) {
    if (length(lista) >= 2) {
      apuesta <- lista[[1]] + lista[[length(lista)]]
    } else {
      apuesta <- lista[[1]]
    }
    
    if (apuesta > capital || apuesta > apuesta_maxima) {
      break
    }
    
    apuestas_realizadas <<- c(apuestas_realizadas, apuesta)
    hay_premio <- apostar(apuesta)
    tiradas_realizadas <<- tiradas_realizadas + 1
    
    if (hay_premio) {
      if (length(lista) >= 2) {
        lista <- lista[-c(1, length(lista))]
      } else {
        lista <- list()
      }
    } else {
      lista <- c(lista, list(apuesta))
    }
  }
  
  return(sesion())
}


# Opción 2: al completar un ciclo, se reinicia la lista
e3_ciclo_dinamico_op2 <- function() {
  lista_inicial <- list(1, 2, 1, 2, 1, 2, 1)
  lista <- lista_inicial
  
  while (tiradas_realizadas < n_tiradas_dia) {
    # Si se completó el ciclo, comenzar uno nuevo
    if (length(lista) == 0) {
      lista <- lista_inicial
    }
    
    if (length(lista) >= 2) {
      apuesta <- lista[[1]] + lista[[length(lista)]]
    } else {
      apuesta <- lista[[1]]
    }
    
    #condiciones de finalización
    if (apuesta > capital || apuesta > apuesta_maxima) {
      break
    }
    
    apuestas_realizadas <<- c(apuestas_realizadas, apuesta)
    hay_premio <- apostar(apuesta)
    tiradas_realizadas <<- tiradas_realizadas + 1
    
    if (hay_premio) {
      if (length(lista) >= 2) {
        lista <- lista[-c(1, length(lista))]
      } else {
        lista <- list()
      }
    } else {
      lista <- c(lista, list(apuesta))
    }
  }
  
  return(sesion())
}
