# Estrategia 2: duplicación

redoblar_apuesta <- function() {
  apostado <<- 2 * apostado
}


e2_duplicacion <- function() {
  while (tiradas_realizadas < n_tiradas_dia && suficientes_fichas()) {
    apuestas_realizadas <<- c(apuestas_realizadas,apostado)
    
    hay_premio <- apostar(apostado)
    
    tiradas_realizadas <<- tiradas_realizadas + 1
    
    if (!hay_premio) {
      redoblar_apuesta()
    } else {
      apostado <<- 1
    }
  }
  
  return(sesion())
}
