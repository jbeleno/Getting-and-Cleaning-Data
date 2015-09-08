cargarDatos <- function(){
    restData <- read.csv("./data/restaurantes.csv")
    restData[,"nearMe"] = restData[,"neighborhood"] %in% c("Roland Park", "Homeland")
    X <- table(restData[,"nearMe"])
    restData$zipWrong = ifelse(restData$zipCode < 0, TRUE, FALSE )
    Y <- table(restData$zipWrong, restData$zipCode < 0)
    restData$zipGroups <- cut(restData$zipCode, breaks=quantile(restData$zipCode))
    Z <- table(restData$zipGroups)
    W <- table(restData$zipGroups, restData$zipCode)
}

nuevasVariables <- function(){
    s1 <- seq(1,10,by=2)
    s2 <- seq(1,10,length=3)
    x <- c(1,3,8,25,100)
    s3 <- seq(along = x)
    s3
}

partirGrupos <- function(){
    restData <- read.csv("./data/restaurantes.csv")
    library(Hmisc)
    #library(plyr)
    #restData = mutate(restData,zipGroups=cut2(zipCode, g=4))
    restData$zipGroups = cut2(restData$zipCode,g=4)
    table(restData$zipGroups)
}
