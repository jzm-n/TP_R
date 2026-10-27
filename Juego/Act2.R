source("Ruleta.R")
source("Estrategia_1.R")
source("Estrategia_2.R")
source("Estrategia_3.R")
source("Pruebas.R")
source("Simulacion.R")

actividad_2 <- function() {
#Actividad 2
  C_prueba <- 10
  m_prueba <- 8
  n_prueba <- 10
  nRep_prueba <- 5
  
  # Estrategia 1
  prueba_e1 <- simular_repeticiones(e1_apuesta_fija,nRep_prueba, C_prueba, m_prueba, n_prueba)
  
  # Estrategia 2 - Opcion 1
  prueba_e2_op1 <- simular_repeticiones(e2_duplicacion_op1,nRep_prueba, C_prueba, m_prueba, n_prueba)
  
  # Estrategia 2 - Opcion 2
  prueba_e2_op2 <- simular_repeticiones(e2_duplicacion_op2,nRep_prueba, C_prueba, m_prueba, n_prueba)
  
  # Estrategia 3 - Opcion 1
  prueba_e3_op1 <- simular_repeticiones(e3_ciclo_dinamico_op1,nRep_prueba, C_prueba, m_prueba, n_prueba)
  
  # Estrategia 3 - Opcion 2
  prueba_e3_op2 <- simular_repeticiones(e3_ciclo_dinamico_op2,nRep_prueba, C_prueba, m_prueba, n_prueba)
  
  # Mostrar resumenes de las pruebas
  cat("\n===== ACTIVIDAD 2: RESULTADOS DE LAS PRUEBAS =====\n")
  
  print(prueba_e1$resumen)
  print(prueba_e2_op1$resumen)
  print(prueba_e2_op2$resumen)
  print(prueba_e3_op1$resumen)
  print(prueba_e3_op2$resumen)
  
  # Inspeccionar las apuestas de la primera sesion
  cat("\nApuestas de la primera sesion de cada variante:\n")
  print(prueba_e1$apuestas[[1]])
  print(prueba_e2_op1$apuestas[[1]])
  print(prueba_e2_op2$apuestas[[1]])
  print(prueba_e3_op1$apuestas[[1]])
  print(prueba_e3_op2$apuestas[[1]])
  
}
