createDataFrame <- function(){
    set.seed(12345)
    X <- data.frame(
        "var1"=sample(1:5),
        "var2"=sample(6:10),
        "var3"=sample(11:15))
    X <- X[sample(1:5),]
    X$var2[c(1,3)]=NA
    X
}

#X[,1] First column
#X[,"var1"] First column
#X[1:2,"var2"] Primeras 2 filas y la columna "var2"
#X[X$var1 <= 3 & X$var3 > 11, ] seleccionar filas por condicionales
#X[which(X$var2 > 8),] Which procesa la logica e ignora los NA
#sort(X$var2, decreasing=TRUE, na.last=TRUE) orden creciente por defecto y los NA aleatorios
#X[order(X$var1, X$var3),] ordena un data.frame segun una variable o varias
#Otra forma de ordenar:
#library(plyr)
#arrange(X, var1)
#arrange(X, desc(var1))
#X$var4 <- rnom(5) agregar columnas
#rbind y cbind para filas y columnas
