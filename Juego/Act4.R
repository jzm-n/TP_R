source("Ruleta.R")
source("Estrategia_1.R")
source("Estrategia_2.R")
source("Estrategia_3.R")
source("Pruebas.R")
source("Simulacion.R")
# ==========================================
# ACTIVIDAD 4: resumen de las 10000 sesiones
# ==========================================

actividad_4 <- function(){
  simulaciones <- list(
    "Estrategia 1"            = sim_e1,
    "Estrategia 2 - Opcion 1" = sim_e2_op1,
    "Estrategia 2 - Opcion 2" = sim_e2_op2,
    "Estrategia 3 - Opcion 1" = sim_e3_op1,
    "Estrategia 3 - Opcion 2" = sim_e3_op2
  )
  
  # Calcula los indicadores solicitados para una estrategia
  calcular_indicadores <- function(sim, nombre) {
    resumen <- sim$resumen
    apuestas <- sim$apuestas
    
    # Máxima apuesta y total apostado en cada sesión
    apuesta_maxima_dia <- sapply(apuestas, function(x) {
      if (length(x) == 0) 0 else max(x)
    })
    
    total_apostado_dia <- sapply(apuestas, sum)
    
    data.frame(
      estrategia = nombre,
      ganancia_neta_promedio = mean(resumen$ganancia_neta),
      proporcion_dias_ganancia = mean(resumen$ganancia_neta > 0),
      proporcion_dias_perdida = mean(resumen$ganancia_neta < 0),
      proporcion_dias_sin_capital = mean(resumen$capital_final <= 0),
      media_apuesta_maxima = mean(apuesta_maxima_dia),
      media_total_apostado = mean(total_apostado_dia),
      varianza_ganancia_neta = var(resumen$ganancia_neta)
    )
  }
  
  tabla_resultados <- do.call(
    rbind,
    Map(calcular_indicadores, simulaciones, names(simulaciones))
  )
  
  cat("\n===== INDICADORES DE LAS 10000 SESIONES =====\n")
  print(tabla_resultados)
  
  # Mostrar las proporciones como porcentajes
  cat("\n===== PROPORCIONES EN PORCENTAJE =====\n")
  tabla_porcentajes <- tabla_resultados
  tabla_porcentajes$proporcion_dias_ganancia <-
    100 * tabla_porcentajes$proporcion_dias_ganancia
  tabla_porcentajes$proporcion_dias_perdida <-
    100 * tabla_porcentajes$proporcion_dias_perdida
  tabla_porcentajes$proporcion_dias_sin_capital <-
    100 * tabla_porcentajes$proporcion_dias_sin_capital
  
  print(tabla_porcentajes)
  
  # Preparar datos diarios para los histogramas
  datos_histogramas <- do.call(
    rbind,
    lapply(names(simulaciones), function(nombre) {
      sim <- simulaciones[[nombre]]
      
      data.frame(
        estrategia = nombre,
        ganancia_neta = sim$resumen$ganancia_neta,
        total_apostado = sapply(sim$apuestas, sum)
      )
    })
  )
  
  # ==========================================
  # HISTOGRAMAS PARA CADA ESTRATEGIA
  # ==========================================
  # Ganancia neta diaria
  estrategias <- names(simulaciones)
  rango_ganancia <- range(datos_histogramas$ganancia_neta, finite = TRUE)
  cortes_ganancia <- pretty(rango_ganancia, n = 30)
  
  par(mfrow = c(3, 2))
  for (nombre in estrategias) {
    valores <- datos_histogramas$ganancia_neta[
      datos_histogramas$estrategia == nombre
    ]
    
    hist(
      valores,
      breaks = cortes_ganancia,
      main = paste("Ganancia neta diaria\n", nombre),
      xlab = "Ganancia neta",
      ylab = "Cantidad de sesiones",
      col = "lightblue",
      border = "white"
    )
  }
  par(mfrow = c(1, 1))
  
  # Total apostado diario
  rango_apostado <- range(datos_histogramas$total_apostado, finite = TRUE)
  cortes_apostado <- pretty(rango_apostado, n = 30)
  
  par(mfrow = c(3, 2))
  for (nombre in estrategias) {
    valores <- datos_histogramas$total_apostado[
      datos_histogramas$estrategia == nombre
    ]
    
    hist(
      valores,
      breaks = cortes_apostado,
      main = paste("Total apostado diario\n", nombre),
      xlab = "Total apostado",
      ylab = "Cantidad de sesiones",
      col = "lightgreen",
      border = "white"
    )
  }
  par(mfrow = c(1, 1))
  
  # ==========================================
  # HISTOGRAMAS COMPARATIVOS
  # ==========================================
  colores <- c("blue", "red", "darkgreen", "orange", "purple")
  
  
  # ==========================================
  # Ganancia neta diaria
  # ==========================================
  rango_ganancia <- range(datos_histogramas$ganancia_neta, finite = TRUE)
  cortes_ganancia <- pretty(rango_ganancia, n = 30)
  
  hist(
    datos_histogramas$ganancia_neta[
      datos_histogramas$estrategia == estrategias[1]
    ],
    breaks = cortes_ganancia,
    col = adjustcolor(colores[1], alpha.f = 0.4),
    border = colores[1],
    main = "Comparación de ganancia neta diaria",
    xlab = "Ganancia neta",
    ylab = "Cantidad de sesiones",
    ylim = c(0, max(sapply(estrategias, function(e) {
      hist(
        datos_histogramas$ganancia_neta[
          datos_histogramas$estrategia == e
        ],
        breaks = cortes_ganancia,
        plot = FALSE
      )$counts
    })))
  )
  
  for (i in 2:length(estrategias)) {
    hist(
      datos_histogramas$ganancia_neta[
        datos_histogramas$estrategia == estrategias[i]
      ],
      breaks = cortes_ganancia,
      col = adjustcolor(colores[i], alpha.f = 0.4),
      border = colores[i],
      add = TRUE
    )
  }
  
  legend(
    "topright",
    legend = estrategias,
    fill = adjustcolor(colores, alpha.f = 0.4),
    border = colores,
    cex = 0.8
  )
  
  # ==========================================
  # Total apostado diario
  # ==========================================
  
  rango_apostado <- range(datos_histogramas$total_apostado, finite = TRUE)
  cortes_apostado <- pretty(rango_apostado, n = 30)
  
  hist(
    datos_histogramas$total_apostado[
      datos_histogramas$estrategia == estrategias[1]
    ],
    breaks = cortes_apostado,
    col = adjustcolor(colores[1], alpha.f = 0.4),
    border = colores[1],
    main = "Comparación del total apostado diario",
    xlab = "Total apostado",
    ylab = "Cantidad de sesiones",
    ylim = c(0, max(sapply(estrategias, function(e) {
      hist(
        datos_histogramas$total_apostado[
          datos_histogramas$estrategia == e
        ],
        breaks = cortes_apostado,
        plot = FALSE
      )$counts
    })))
  )
  
  for (i in 2:length(estrategias)) {
    hist(
      datos_histogramas$total_apostado[
        datos_histogramas$estrategia == estrategias[i]
      ],
      breaks = cortes_apostado,
      col = adjustcolor(colores[i], alpha.f = 0.4),
      border = colores[i],
      add = TRUE
    )
  }
  
  legend(
    "topright",
    legend = estrategias,
    fill = adjustcolor(colores, alpha.f = 0.4),
    border = colores,
    cex = 0.8
  )
}
