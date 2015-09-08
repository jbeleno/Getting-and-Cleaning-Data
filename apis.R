library(httr)

twitter <- function(){
    myapp = oauth_app("twitter",
                      key="U9XrtDvGnq5cCSqM4JoxjTRk9",
                      secret="mV5y8yg0MPNvzYV4Kh4qb9WvIrXu7DX6kdKBHt9VF83BuVpRHf")
    sig = sign_oauth1.0(myapp,
                        token="2939864487-JQcYvDHdtToUJG220WVHIGkG1BSie2p3lHcvvSN",
                        secret="8wZDArilE1NqyX3pZpvThaEzswstkt15a9DonGfMTXkPU")
    homeTL = GET("https://api.twitter.com/1.1/statuses/home_timeline.json",sig)
    
    json1 = content(homeTL)
    json2 = jsonlite::fromJSON(jsonlite::toJSON(json1))
    json2
}