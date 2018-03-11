---
title: "Using Twitter data to create Wordclouds in R"
layout: post
date: 2018-03-09 15:00
tag:
- R Programming
- Wordcloud
- Analytics
- Tutorial
- Data Science
image: /assets/images/worldcloud_tut/finished_wc.png
headerImage: true
category: blog
author: chevoniedaniel
description: "A simple tutorial detailing how to create wordclouds in R from Twitter data."
---

Worldclouds can be very useful to determine what customers are saying about your product or service. They can be created using the R Programming Language in a relatively short amount of time and customized in a variety of ways. I'll walk you through the process of creating your own wordclouds and customizing it based on Twitter data.

The first thing you'd want to do is install the R Programming Language. The most recent version can be found on the [official website](https://cran.r-project.org/). When that's completed, I strongly recommend installing [RSudio](https://www.rstudio.com/products/rstudio/download/). It can make your programming in R a lot easier, unless of course if you really enjoy programming in the terminal.

Now that you've installed the required software, the next step is setting up an account with Twitter and creating the wordcloud app. This will allow you to interface with their API in order to download the tweet data.

Go to https://apps.twitter.com and click on the "Create New App" button. Fill out the relevant information and click on the "Create your Twitter application" button. Now that you have the app set up, head over to the "Keys and Access Tokens" section and click on the "Generate my Access Token" button. Take extreme care to avoid posting your access tokens or private keys online or sharing them with anyone in general. Any malicious use of your keys will be associated with your account, which could get you in trouble with Twitter.

Now that setup in complete, lets start programming!

Open up RStudio and type the following:

```rconsole
install.packages("twitteR")
install.packages("tm")
install.packages("wordcloud")

require(twitteR)
require(tm)
require(wordcloud)
```

All this does is import the necessary packages required to create the wordcloud. The `twitteR` package will be used to interface with the Twitter API, The `tm` package is used for mining the Twitter data. The `wordcloud` is used to create the wordcloud.

Next we're going to authenticate our app information with Twitter. Enter the following code:

```rconsole
consumer_key  <- 'Your Key Here'
consumer_secret  <- 'Your Key Here'
access_token  <- 'Your Key Here'
access_secret  <- 'Your Key Here'
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
```

The next step is the most important. We will now craft how much (that's what the `n` is for), and what kind of tweets (we're searching for Tweets where `cheese` is mentioned) we want to collect from Twitter. Type the following:

```rconsole
coll_tweets = searchTwitter("cheese",n=500,lang="en")
coll_text = sapply(coll_tweets, function(x) x$getText())
```

The above code can be modified in a wide variety of ways using different [functions](https://www.rdocumentation.org/packages/twitteR/versions/1.1.9) of the `twitteR` package; feel free to experiment with it.

Next we will create a `Corpus`, which is just a fancy way of saying a collection of data.

```rconsole
coll_corpus = Corpus(VectorSource(coll_text))
```

Now that we've created the corpus, lets clean it up. We'll make all the words lowercase and remove punctuations, numbers and whitespace from the tweets. Sometimes it may be useful to remove the main word from the wordcloud. This is due to the fact that the words will be displayed larger based on their frequency, and since we're searching for a particular word, we know that it will appear all the time. By excluding it, you get to see what people are saying about it without the word itself occupying a large amount of space in the word cloud.

```rconsole
coll_clean <- tm_map(coll_clean, tolower)
coll_clean  <- tm_map(coll_corpus, removePunctuation)
coll_clean  <- tm_map(coll_clean, removeNumbers)
coll_clean  <- tm_map(coll_clean, stripWhitespace)
```

If you're on a Mac and got some errors, the piece of code might help

```rconsole
coll_clean  <- iconv(coll_clean,to="utf-8-mac")
```

Okay! Lets can finally run the code the creates the wordcloud from the tweets we've collected.

```rconsole
wordcloud(coll_clean)
```

If everything worked out, you should be seeing something like this:

![Unfinished Wordcloud](/assets/images/worldcloud_tut/unfinished_wc.png "Unfinished Wordcloud")


Not very impressive I know, but we can spruce it up a bit with this:

```rconsole
wordcloud(coll_clean, random.order = F, random.color = T, max.words = 50, scale = c(3, 0.5), colors = rainbow(51))
```

This code limits the number of words to 50, determines the range of the size of words and adds color to the wordcloud. After running it, your world cloud should look something like this:

![Unfinished Wordcloud](/assets/images/worldcloud_tut/finished_wc.png "Finished Wordcloud")


Now you have a swanky new wordcloud, don't stop here, tinker with it, try new functions and have some fun!
