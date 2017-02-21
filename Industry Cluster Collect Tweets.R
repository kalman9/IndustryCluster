#Get tweets from @CafeBustelo and @Folgers
#Should I write algorithm to Stream future tweets into database?

#Load necessary libraries 
library(twitteR)
library(dplyr)

#Access Tokens
consumer_key <- "JHQBq3XDkZUBy49fg7PWP3Zrx" #API Key
consumer_secret <- "IdyToDcxaP2IBok7bJ77J8HcLxXU43hN1YQeoZzlJsp9peAXce" #API Secret
access_token <- "784134368394706944-TENc5wyOXYlot1jY0jcZzk1iDRiYhpx"
access_secret <- "NX7cFWhYCDIOBqK0TsSEAKCDa4Dg7G9vY3KN6pU1KKba1"

#Setup OAuth
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
1

#folgers <- searchTwitter('from:Folgers', n=4000)
#cafe_bustelo <- searchTwitter('from:CafeBustelo', n=4000)

#Get Tweets from @CafeBustelo and @Folgers timelines (max 3200 for each account, of which only ~ 500 are of interest)
folgers <- userTimeline('Folgers', n=3200, maxID=NULL, sinceID=NULL, includeRts=TRUE, excludeReplies=FALSE)
cafe_bustelo <- userTimeline('CafeBustelo', n=3200, maxID=NULL, sinceID=NULL, includeRts=TRUE, excludeReplies=FALSE)

#Convert tweets from list format to dataframe 
folgers <- twListToDF(folgers)
cafe_bustelo <- twListToDF(cafe_bustelo)

#Remove "replies" and "retweets" from data
folgers <- filter(folgers, is.na(replyToSN))
cafe_bustelo <- filter(cafe_bustelo, is.na(replyToSN))

folgers <- filter(folgers, isRetweet == FALSE)
cafe_bustelo <- filter(cafe_bustelo, isRetweet == FALSE)

#Export finished dataframes as csv files 
write.csv(folgers, file='/Users/Kalman/Documents/SENIOR/Business Analytics/Spring/folgers_data.csv', row.names = FALSE)
write.csv(cafe_bustelo, file='/Users/Kalman/Documents/SENIOR/Business Analytics/Spring/cafe_bustelo.csv', row.names = FALSE)

#Future:
#UTC -> East
#document term matrix
#wordcloud
#favs/tweets by word 
#CafeBustelo
  #half of tweets in Spanish
  #milk vs. leche
  
