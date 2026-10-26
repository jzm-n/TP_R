#ejecuta nrep veces la estrategia
simular_repeticiones <- function(estrategia, nRep, C, m, n) {
  
  resultados <- vector("list", nRep)
  
  for (i in 1:nRep) {
    cat("SESION", i ,"\n")
    reiniciar_simulacion(C, m, n)
    resultados[[i]] <- estrategia()
  }
  #dibuja un cuadro haciendo filas con los resultados
  resumen <- data.frame(
    dia = 1:nRep,
    capital_final = sapply(resultados, function(x) x$capital_final),
    ganancia_neta = sapply(resultados, function(x) x$ganancia_neta),
    tiradas_realizadas = sapply(resultados, function(x) x$tiradas_realizadas)
  )
  
  apuestas <- lapply(resultados, function(x) x$apuestas_realizadas)
  
  return(list(
    resumen = resumen,
    apuestas = apuestas
  ))
}
