library(XML)
readPage <- function(){
    con = url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
    htmlCode = readLines(con)
    close(con)
    htmlCode
}

parseWithXML <-function(){
    con <- url("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
    html <- htmlTreeParse(url, useInternalNodes = T)
    close(con)
    
    xpathSApply(html, "//title", xmlValue)
    ##xpathSApply(html, "//td[@id='col-citedby']", xmlValue)
    
}

readHTTTR <- function(){
    library(httr)
    html = GET("http://scholar.google.com/citations?user=HI-I6C0AAAAJ&hl=en")
    content2 = content(html, as="text")
    parseHtml = htmlParse(content2,asText = TRUE)
    xpathSApply(parseHtml, "//title", xmlValue)
}

loginWeb <- function(){
    library(httr)
    pg2 = GET("http://httpbin.org/basic-auth/user/passwd")
    authenticate("user", "passwd")
    pg2
    names(pg2)
}

#to keep authenticated
handleWeb <- function(){
    library(httr)
    google = handle("http://google.com")
    pg1 = GET(handle=google, path="/")
    pg2 = GET(handle=google, path="search")
}

