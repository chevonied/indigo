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
image: /assets/images/st3favs/codepic.jpg
headerImage: true
category: blog
author: chevoniedaniel
description: "A simple tutorial detailing how to create wordclouds in R from Twitter data."
---

Worldclouds can be very useful to determine what customers are saying about your product or service. They can be created using the R Programming Language in a relatively short amount of time and customized in a variety of ways. I'll walk you through the process of creating your own wordclouds and customizing it based on Twitter data.

The first thing you'd want to do is install the R Programming Language. The most recent version can be found on the [official website](https://cran.r-project.org/). When that's completed, I strongly recommend installing RSudio. It can make your programming in R a lot easier, unless of course if you really enjoy programming in the terminal.

Now that you've installed the required software, the next step is setting up an account with Twitter and creating the worldcloud app. This will allow you to interface with their API in order to download the tweet data.

Go to https://apps.twitter.com and click on the "Create New App" button. Fill out the relevant information and click on the "Create your Twitter application" button. Now that you have the app set up, head over to the "Keys and Access Tokens" section and click on the "Generate my Access Token" button.