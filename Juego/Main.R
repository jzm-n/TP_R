source("Ruleta.R")
source("Act2.R")
source("Act3.R")
source("Act4.R")
source("Act5.R")

# ANTES DE PROBAR CUALQUIER CÓDIGO DE ESTE PROYECTO
# ASEGURARSE DE TENER CONFIGURADO CORRECTAMENTE EL ESPACIO DE TRABAJO PARA LA SESIÓN
# DESDE LA INTERFAZ DE RSTUDIO:
# BARRA SUPERIOR -> SESSION -> SET WORKING DIRECTORY -> TO SOURCE FILE LOCATION
# NORMALMENTE NO DEBERIA SER NECESARIO, PERO DEJAMOS AVISO POR LAS DUDAS

# ==========================================
# ACTIVIDAD 1 (la funcion se encuentra en Ruleta.R)
# ==========================================
for (i in 1:10){
  print(girar_ruleta())
}
# ==========================================
# ACTIVIDAD 2
# ==========================================
actividad_2()
# ==========================================
# ACTIVIDAD 3: simulacion de 1000 sesiones
# ==========================================
actividad_3()
# ==========================================
# ACTIVIDAD 4: resumen de las 10000 sesiones
# ==========================================
actividad_4()
# ============================================================
# ACTIVIDAD 5: Efectos de la apuesta maxima en la estrategia 2
# ============================================================
actividad_5()
