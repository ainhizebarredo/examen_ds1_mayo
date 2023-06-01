library(httr)
library(dplyr)
library("jsonlite")

#3.	Construye una funci?n de R en un fichero de c?digo llamado 'function' donde construyas un proceso que realice las siguientes acciones (3 puntos)
#a.	Que acceda a la API de Banco de Alimentos (https://www.givefood.org.uk/api/2/docs/) y localice a trav?s de un nombre aproximado los ids de los Bancos de Alimentos que hay en esa localidad


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
  #intento añadir el id pero no lo consigo 
  #id<-response[[i]][15]
  #id_loc<-id$registration_id
  length(slug) <- 1
  
  length(email) <- length(name)
  length(address) <- length(name)
  length(postcode) <- length(name)
  length(closed) <- length(name)
  length(country) <- length(name)
  length(created) <- length(name)
  
  
  art_list[[i]]<-data.frame(name,slug,email,address,postcode,closed,country,created, id_loc)
}

df<-do.call(rbind, art_list)

#id<-response[[1]][15]
#id_loc<-id$charity[1]

#id_list<-list()



#b.	Que seleccione el id con mayor antig?edad
mas_antiguo<-df%>%
  group_by(name)%>%
  arrange(created)%>%
  head(1)

posicion<-536
charity<-response[[536]]
url<-charity$urls
lista_compra<-list()
for (i in 1:length(url)){
  url<-url[[i]]
  shopping_list<-url$shopping_list
}
df2<-do.call(rbind, id_list)
url<-url[4]
shopping_list<-url$shopping_list

