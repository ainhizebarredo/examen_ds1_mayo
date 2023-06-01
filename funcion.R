funcion<-function(banco_alimentos=""){
  library(httr)
  library(dplyr)
  library("jsonlite")
  url<-paste0('https://www.givefood.org.uk/api/2/foodbanks/')
  request <- GET(url)
  response <- content(request, as = "parsed")
  
  response[[1]]
  
  art_list<-list()
  
  for (i in 1:length(response)) {
    art<-response[[i]]
    name<-art$name
    slug<-art$slug
    email<-art$email
    address<-art$address
    postcode<-art$postcode
    closed<-art$closed
    country<-art$country
    created<-art$created
    
    length(slug) <- 1
    length(email) <- length(name)
    length(address) <- length(name)
    length(postcode) <- length(name)
    length(closed) <- length(name)
    length(country) <- length(name)
    length(created) <- length(name)
    
    
    art_list[[i]]<-data.frame(name,slug,email,address,postcode,closed,country,created)
  }
  
  df<-do.call(rbind, art_list)
  mas_antiguo<-df%>%
    filter(name==banco_alimentos)%>%
    arrange(created)%>%
    head(1)
  #selecciono ewl nombre porque el id no he podido
  paste0('el banco de alimentos mas antigu es ', mas_antiguo$name)
}
funcion('Hillingdon')
