source("Ruleta.R")
source("Estrategia_1.R")
source("Estrategia_2.R")
source("Estrategia_3.R")
source("Pruebas.R")
source("Simulacion.R")

actividad_3 <- function() {
#Actividad 3
  C <- 50
  m <- 64
  n <- 100
  nRep <- 1000
  
  # Simular cada variante
  sim_e1 <- simular_repeticiones(e1_apuesta_fija, nRep, C, m, n)
  
  sim_e2_op1 <- simular_repeticiones(e2_duplicacion_op1, nRep, C, m, n)
  
  sim_e2_op2 <- simular_repeticiones(e2_duplicacion_op2, nRep, C, m, n)
  
  sim_e3_op1 <- simular_repeticiones(e3_ciclo_dinamico_op1, nRep, C, m, n)
  
  sim_e3_op2 <- simular_repeticiones(e3_ciclo_dinamico_op2, nRep, C, m, n)
  
  
  # Mostrar las primeras sesiones de cada simulacion
  cat("\n===== ACTIVIDAD 3: PRIMERAS SESIONES =====\n")
  
  print(head(sim_e1$resumen))
  print(head(sim_e2_op1$resumen))
  print(head(sim_e2_op2$resumen))
  print(head(sim_e3_op1$resumen))
  print(head(sim_e3_op2$resumen))
  
  
  # ==========================================
  # Comparacion de las estrategias
  # ==========================================
  
  # Comparacion de UNA SESION por estrategia
  #(toma los datos y los dibuja en un  cuadro comparativo)
  # Parametros: C = 50, m = 64, n = 100
  
  reiniciar_simulacion(C = 50, m = 64, n = 100)
  resultado_e1 <- e1_apuesta_fija()
  
  reiniciar_simulacion(C = 50, m = 64, n = 100)
  resultado_e2_op1 <- e2_duplicacion_op1()
  
  reiniciar_simulacion(C = 50, m = 64, n = 100)
  resultado_e2_op2 <- e2_duplicacion_op2()
  
  reiniciar_simulacion(C = 50, m = 64, n = 100)
  resultado_e3_op1 <- e3_ciclo_dinamico_op1()
  
  reiniciar_simulacion(C = 50, m = 64, n = 100)
  resultado_e3_op2 <- e3_ciclo_dinamico_op2()
  
  # Comparacion de una sesion por estrategia
  
  comparacion <- data.frame(
    estrategia = c(
      "Estrategia 1",
      "Estrategia 2 - Opcion 1",
      "Estrategia 2 - Opcion 2",
      "Estrategia 3 - Opcion 1",
      "Estrategia 3 - Opcion 2"
    ),
    ganancia_neta = c(
      resultado_e1$ganancia_neta,
      resultado_e2_op1$ganancia_neta,
      resultado_e2_op2$ganancia_neta,
      resultado_e3_op1$ganancia_neta,
      resultado_e3_op2$ganancia_neta
    ),
    capital_final = c(
      resultado_e1$capital_final,
      resultado_e2_op1$capital_final,
      resultado_e2_op2$capital_final,
      resultado_e3_op1$capital_final,
      resultado_e3_op2$capital_final
    ),
    tiradas_realizadas = c(
      resultado_e1$tiradas_realizadas,
      resultado_e2_op1$tiradas_realizadas,
      resultado_e2_op2$tiradas_realizadas,
      resultado_e3_op1$tiradas_realizadas,
      resultado_e3_op2$tiradas_realizadas
    )
  )
  
  cat("\n===== COMPARACION DE UNA SESION =====\n")
  print(comparacion)
  
  cat("\n===== MAYOR GANANCIA =====\n")
  print(comparacion[which.max(comparacion$ganancia_neta), ])
  
  cat("\n===== MAYOR PERDIDA =====\n")
  print(comparacion[which.min(comparacion$ganancia_neta), ])
}