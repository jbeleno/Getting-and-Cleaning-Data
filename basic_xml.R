procesar_xml <- function(){
    library(XML)
    fileUrl <- "http://www.w3shools.com/xml/simple.xml"
    doc <-xmlTreeParse(fileUrl, useInternal=TRUE)
    rootNode <- xmlRoot(doc)
    xmlName(rootNode)
    #xmlSApply(rootNode, xmlValue)
    xpathSApply(rootNode, "//name", xmlValue)   
}

xml_ravens <-function(){
    library(XML)
    fileUrl <- "http://espn.go.com/nfl/team/schedule/_/name/bal/year/2014"
    doc <- htmlTreeParse(fileUrl, useInternal=TRUE)
    scores <- xpathSApply(doc, "//li[@class='score']", xmlValue)
    teams <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)
    scores
    teams
}