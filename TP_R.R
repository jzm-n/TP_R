#C <- as.numeric(readline(prompt =  "Capital inicial"))

C <- 3

# actividad 1: girar ruleta

girar_ruleta <- function(){
  ruleta <- c("rojo","negro","cero")
  probabilidades <- c(18/37,18/37,1/37)
  res <- sample(ruleta, size = 1, replace=TRUE, prob = probabilidades)
  print(res)
  return(res)
}

#se apuesta una cantidad de fichas
apostar <- function(fichas){
  resultado <- girar_ruleta()
  if (resultado == "rojo") {
    apostador_gana(fichas)
  } else {
    apostador_pierde(fichas)
  }
}

apostador_gana <- function(fichas){
  C <<- C + fichas
  cat("Ahora hay un total de ", C, "fichas \n")
}

apostador_pierde <- function(fichas){
  C <<- C - fichas
  cat("Ahora hay un total de ", C, "fichas \n")
}

suficientes_fichas <- function(){
  if (C==0){
    print(C)
    return(FALSE)
  } else
    print(C)
    return(TRUE)
}

#Estrategias:  

#Estrategia 1: se apuesta siempre 1 ficha al rojo

e1_apuesta_fija <- function() {
  while (suficientes_fichas()==TRUE){
    apostar(1)
  }
  print("Dia terminado")
}
  
e1_apuesta_fija()

