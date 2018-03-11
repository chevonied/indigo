#Instructions and code for creating world clouds in R using Twitter data
#Watch the video for details
# Install and load the following packages
install.packages("twitteR")
install.packages("tm")
install.packages("wordcloud")
require(twitteR)
require(tm)
require(wordcloud)

# Create a developer account at apps.twitter.com to create an app and to get the following keys

consumer_key  <- 'Bh9EzGKosjPT6ktARrkw8axKi'
consumer_secret  <- 'KhZdktRxrtrSowr0GdZy49rXoyRZm3MhNJqoPxmg0Pbs5dcxid'
access_token  <- '92632514-TCpQw7PAU7t9sgIxOMQonNeEwKEr8km3Y7Aind6EM'
access_secret  <- 'GAcvmRxiYTyL2RrXVuKr9jfR8eGJ0zQMfoFMooIp9sC6U'
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

# Get the tweets from Twitter 
coll_tweets = searchTwitter("cheese",n=500,lang="en")
coll_text = sapply(coll_tweets, function(x) x$getText())

# Create a corpus
coll_corpus = Corpus(VectorSource(coll_text))

# Clean the corpus by removing punctuation, numbers, and white spaces
coll_clean  <- tm_map(coll_corpus, removePunctuation)
coll_clean <- tm_map(coll_clean, tolower)
coll_clean  <- tm_map(coll_clean, removeNumbers)
coll_clean  <- tm_map(coll_clean, stripWhitespace)

# Optional: Add this code if you run into errors on Macs
coll_clean  <- iconv(coll_clean,to="utf-8-mac")

# Create Word Cloud from clean data
wordcloud(coll_clean)

# Modify your Word Cloud
wordcloud(coll_clean, random.order = F, max.words = 100, scale = c(3, 0.5))

wordcloud(coll_clean, random.order = F, random.color = T, max.words = 100, scale = c(3, 0.5), colors = rainbow(51))

