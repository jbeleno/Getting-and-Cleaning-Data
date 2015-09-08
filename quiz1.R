descargar <- function(){
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
    download.file(fileUrl, destfile = "./data/quiz1.csv")
}

descargar2 <- function(){
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
    download.file(fileUrl, destfile = "./data/quiz1.xlsx", mode='wb')
}

#How many properties are worth $1,000,000 or more?
primero <- function(){
    x <- read.csv("./data/quiz1.csv")
    x <- subset(x, VAL==24)
    nrow(x)
}

segundo <- function(){
    x <- read.csv("./data/quiz1.csv")
    x <- subset(x, VAL==24)
    x[,c("FES")]
}

tercero <-function(){
    library(xlsx)
    colIndex <- 18:23
    rowIndex <- 7:15
    dat <- read.xlsx("./data/quiz1.xlsx", 
                     sheetIndex=1, 
                     colIndex= colIndex, 
                     rowIndex= rowIndex)
    sum(dat$Zip*dat$Ext,na.rm=T) 
}

cuarto <-function(){
    library(XML)
    library(RCurl)
    fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
    xData <- getURL(fileUrl, ssl.verifypeer = FALSE)
    doc <- xmlParse(xData)
    rootNode <- xmlRoot(doc)
    x <- xpathSApply(rootNode, "//zipcode", xmlValue)
    x <- sum(x==21231)
    x
}