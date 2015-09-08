getDatos <- function(){
    if(!file.exists("./data")){
        dir.create("./data")
    }
    fileURL <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
    download.file(fileURL,destfile = "./data/restaurantes.csv")
    restData <- read.csv("./data/restaurantes.csv")
}

# str(X) and summary(X) para ver información del data Frame
# table(X$zipCode, useNA="ifany") muestra el número de NA
# table(X$councilDistrict, X$zipCode) tabla de X vs Y
# sum(is.na(X$zipCode)) muestra el número de NA en esa columna
# any(is.na(X$zipCOde)) si algún valor es NA
# all(X$zipCode > 0 ) si todos los zipCode son mayores que 0
# colSums(is.na(X))
# Y <- table(X$zipCode %in% c("21212")) muestra una tabla logica con los que hacen match
# Z <- X[X$zipCode %in% c("21212")] esto si me da el conjunto de datos que cumplen la condicion
# Cross tab algo parecido a tabla X vs Y
# xt <- xtabs(Freq ~ Gender + Admit, data=DF)
# ftable(xt) Flat table, eso resume más la info
# object.size(X) tamaño en bytes
# print(objectr.size(X), units="Mb")

