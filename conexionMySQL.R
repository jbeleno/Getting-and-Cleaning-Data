library(RMySQL)

conectar <- function(){
    ucscDb <- dbConnect(MySQL(), user="genome",
                        host="genome-mysql.cse.ucsc.edu")
    result <- dbGetQuery(ucscDb, "show databases;")
    dbDisconnect(ucscDb)
    result
}

conectarGenoma <-function(){
    hg19 <- dbConnect(MySQL(), user="genome", db="hg19",
                        host="genome-mysql.cse.ucsc.edu")
    allTables <- dbListTables(hg19)
    allTables[1:5]
    
    campos <- dbListFields(hg19, "affyU133Plus2")
    num_campos <- dbGetQuery(hg19, "SELECT COUNT(*) FROM affyU133Plus2")
    
    datosTabla <- dbReadTable(hg19, "affyU133Plus2")
    
    #seleccionar solo parte de los datos
    subconjuntoDatos <- dbSendQuery(hg19, "SELECT * FROM affyU133Plus2 WHERE misMatches BETWEEN 1 AND 3")
    affMis <- fetch(subconjuntoDatos)
    affyMisSmall <- fetch(subconjuntoDatos, 10)
    dbClearResult(subconjuntoDatos)
    quantile(affMis$misMatches)
    
    dbDisconnect(hg19)
    
}