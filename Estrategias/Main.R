source("Ruleta.R")
source("Estrategia_1.R")
source("Estrategia_2.R")
source("Pruebas.R")
source("Simulacion.R")

#Actividad 2: simulacion repitiendo nrep veces la estrategia
#probamos con valores pequeños y luego, nRep = 1000, C = 50, m = 64 y n = 100.
#estrategia 1
prueba_e1 <- simular_repeticiones(e1_apuesta_fija,nRep = 5,C = 10,m = 8,n = 10)

print(prueba_e1$resumen)
print(prueba_e1$apuestas[[1]])

#estrategia 2
prueba_e2 <- simular_repeticiones(e2_duplicacion,nRep = 5,C = 10,m = 8,n = 10)

print(prueba_e2$resumen)
print(prueba_e2$apuestas[[1]])

#Actividad 3: C = 50, m = 64, n = 100

# Estrategia 1
reiniciar_simulacion(C = 50, m = 64, n = 100)
resultado_e1 <- e1_apuesta_fija()

# Estrategia 2
reiniciar_simulacion(C = 50, m = 64, n = 100)
resultado_e2 <- e2_duplicacion()

#Casos de prueba para estrategia 2

"test_capital_ganancia(resultado_e2, 50)
test_cantidad_tiradas(resultado_e2)
test_maximo_tiradas(resultado_e2, 100)
test_apuestas_positivas(resultado_e2)
test_apuesta_maxima(resultado_e2, 64)"