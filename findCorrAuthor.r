#install.packages("RISmed")
#install.packages("dplyr")
library(RISmed)

search_topic <- 'danio rerio'
search_query <- EUtilsSummary(search_topic,retmax=100, mindate=2015,maxdate=2016)
summary(search_query)

# see the ids of our returned query
QueryId(search_query)

# get actual data from PubMed
records<- EUtilsGet(search_query)
class(records)

# store it
#pubmed_data <- data.frame('Title'=ArticleTitle(records),'Abstract'=AbstractText(records))
pubmed_data_Author <- Author(records)
cAuthor <- c()
for(i in 1:length(pubmed_data_Author) ) {
    cAuthor$LastName[i] <- pubmed_data_Author[[i]][nrow(pubmed_data_Author[[i]]),1]
    cAuthor$ForeName[i] <- pubmed_data_Author[[i]][nrow(pubmed_data_Author[[i]]),2]
    cAuthor$Initials[i] <- pubmed_data_Author[[i]][nrow(pubmed_data_Author[[i]]),3]
    cAuthor$order[i] <- pubmed_data_Author[[i]][nrow(pubmed_data_Author[[i]]),4]
}

cAuthor$FullName <- paste(cAuthor$LastName,cAuthor$ForeName)

#head(pubmed_data,1)

#pubmed_data$Abstract <- as.character(pubmed_data$Abstract)
#pubmed_data$Abstract <- gsub(",", " ", pubmed_data$Abstract, fixed = TRUE)


# see what we have
#str(pubmed_data)
