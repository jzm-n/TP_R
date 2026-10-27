#Casos de prueba para estrategia 2
# Test 1: el capital final coincide con la ganancia neta
test_capital_ganancia <- function(resultado, C) {
  resultado$capital_final == C + resultado$ganancia_neta
}

# Test 2: cantidad de apuestas igual a cantidad de tiradas
test_cantidad_tiradas <- function(resultado) {
  length(resultado$apuestas_realizadas) ==
    resultado$tiradas_realizadas
}

# Test 3: no superar la cantidad máxima de tiradas
test_maximo_tiradas <- function(resultado, n) {
  resultado$tiradas_realizadas <= n
}

# Test 4: todas las apuestas son positivas
test_apuestas_positivas <- function(resultado) {
  all(resultado$apuestas_realizadas > 0)
}

# Test 5: ninguna apuesta supera el máximo permitido
test_apuesta_maxima <- function(resultado, m) {
  all(resultado$apuestas_realizadas <= m)
}

"test_capital_ganancia(resultado_e2, 50)
test_cantidad_tiradas(resultado_e2)
test_maximo_tiradas(resultado_e2, 100)
test_apuestas_positivas(resultado_e2)
test_apuesta_maxima(resultado_e2, 64)"

