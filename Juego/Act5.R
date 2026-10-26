source("Ruleta.R")
source("Estrategia_1.R")
source("Estrategia_2.R")
source("Estrategia_3.R")
source("Pruebas.R")
source("Simulacion.R")

# ============================================================
# ACTIVIDAD 5: Efectos de la apuesta maxima en la estrategia 2
# ============================================================

C <- 50     #capital
n <- 100    #cant tiradas
nRep <- 1000
valores_m <- c(8, 16, 32, 64)

estrategias <- list(
  "Opcion 1" = e2_duplicacion_op1,
  "Opcion 2" = e2_duplicacion_op2
)

resultados_act5 <- list()
resumenes <- list()

for (nombre_estrategia in names(estrategias)) {
  for (m_actual in valores_m) {
    cat(
      "\nSimulando", nombre_estrategia,
      "con m =", m_actual, "\n"
    )
    
    sim <- simular_repeticiones(
      estrategias[[nombre_estrategia]],
      nRep,
      C,
      m_actual,
      n
    )
    
    clave <- paste(nombre_estrategia, m_actual, sep = "_")
    resultados_act5[[clave]] <- sim
    
    datos <- sim$resumen
    
    resumenes[[clave]] <- data.frame(
      estrategia = nombre_estrategia,
      apuesta_maxima = m_actual,
      ganancia_promedio = mean(datos$ganancia_neta),
      proporcion_sesiones_ganadoras =
        mean(datos$ganancia_neta > 0),
      proporcion_sesiones_con_perdida_total =
        mean(datos$capital_final <= 0)
    )
  }
}

# Unimos los resultados en una tabla
tabla_act5 <- do.call(rbind, resumenes)
rownames(tabla_act5) <- NULL

cat("\n===== ACTIVIDAD 5: EFECTO DE LA APUESTA MÁXIMA =====\n")
print(tabla_act5)

# Proporciones como porcentajes
tabla_act5$proporcion_sesiones_ganadoras <-
  100 * tabla_act5$proporcion_sesiones_ganadoras

tabla_act5$proporcion_sesiones_con_perdida_total <-
  100 * tabla_act5$proporcion_sesiones_con_perdida_total

cat("\n===== PROPORCIONES EN PORCENTAJE =====\n")
print(tabla_act5)
