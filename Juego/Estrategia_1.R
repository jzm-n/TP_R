
# Estrategia 1: apostar siempre 1 ficha al rojo sin importar el resultado

e1_apuesta_fija <- function() {
  while (tiradas_realizadas < n_tiradas_dia &&capital >= 1) {
    apuestas_realizadas <<- c(apuestas_realizadas,1)
    
    apostar(1)
    
    tiradas_realizadas <<- tiradas_realizadas + 1
  }
  
  return(sesion())
}

  
