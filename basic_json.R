json_basico <- function(){
    library(jsonlite)
    jsonData <- fromJSON("https://api.github.com/users/jtleek/repos")
    names(jsonData$owner)
}

convertJSON <- function(){
    myjson <- toJSON(iris, pretty = TRUE)
    cat(myjson)
    iris2 <- fromJSON(myjson)
    head(iris2)
}