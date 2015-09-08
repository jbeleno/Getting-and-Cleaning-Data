descargar <- function(){
    if(!file.exists("data")){
        dir.create("data")
    }
    
    fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
    download.file(fileUrl, destfile = "./data/cameras.csv")
    # Es posible que debas usar en ocaciones method = "curl"
    list.files("./data")
    dateDownloaded <- date()
    dateDownloaded
}

leer <- function(){
    cameraData <- read.table("./data/cameras.csv", sep =",", header = TRUE)
    head(cameraData)
}

#library(xlsx)