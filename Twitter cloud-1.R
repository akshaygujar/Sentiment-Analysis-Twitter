require(twitteR)
require(RCurl)
require(wordcloud)
require(tm)
consumer_key <- 'c4M4HJpMHmznrLRmSVyzoETE1'
consumer_secret <- '5TuSbC2TifnkvrUe1IyW0PGR91TZ8NafitTjaPwVHOlKRzATTt'
access_token <- '804564698515443712-rKr8KgcCzStnp5onK6jPQL1l5cuk4zo'
access_secret <- 'SihldVxSjMBpYZXmSYxihPUMBM8zDkDgXDyxI8kZPJjKq'
setup_twitter_oauth(consumer_key,consumer_secret, access_token, access_secret)

LFC_tweets <- searchTwitter("LFC", n=10, lang = "en")

ML <- searchTwitter('Machine+Learning', lang = "en", n= 500, resultType = "recent")
class(ML)
ML_text <- sapply(ML, function(x) x$getText())
class(ML_text)
str(ML_text)
ML_corpus <- Corpus(VectorSource(ML_text))
inspect(ML_corpus[100])

#Clean Corpus#
ML_clean <- tm_map(ML_corpus, removePunctuation)
ML_clean <- tm_map(ML_clean, content_transformer(tolower))
ML_clean <- tm_map(ML_clean, removeWords, stopwords("en"))
ML_clean <- tm_map(ML_clean, removeNumbers)
ML_clean <- tm_map(ML_clean, removeWords, c("MAchine", "Learning"))

#Making Wordcloud#
wordcloud(ML_clean)
wordcloud(ML_clean, random.order = F)
wordcloud(ML_clean, random.order = F, scale = c(3, 0.5))
wordcloud(ML_clean, random.order = F, scale = c(6, 0.5))
wordcloud(ML_clean, random.order = F, scale = c(6, 0.5), col = "red")
wordcloud(ML_clean, random.order = F, scale = c(6, 0.1), col = rainbow(30))
wordcloud(ML_clean, random.order = F, max.words = 40, scale = c(6, 0.5), col = rainbow(30))
wordcloud(ML_clean, random.order = F, max.words = 40, col = rainbow(30))
wordcloud(ML_clean, random.order = F, col = rainbow(30))
