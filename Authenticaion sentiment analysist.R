library(twitteR)
library(ROAuth)

consumer_key <- "vn5HRzzx7rVvsVxsgHqIuO2RL"
consumer_secret <- "Ve5K2LcVR2t3c9xZsWa1si2t5iG8hPx8Mus2MuSdtyhzdDBOrv"
access_token <- "804564698515443712-LTAxs4YDBdkDindu6h21Ms0sJgiYNQp"
access_secret <- "1SPP8PPpSc5Pdz5DeNZfPf6bbR4Omj0wfK9A9hMlQOinC"
download.file(url = "http://curl.haxx.se/ca/cacert.pem", destfile = "cacert.pem")

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

cred <- OAuthFactory$new(consumerKey=consumer_key,
        consumerSecret=consumer_secret, requestURL= 'https://api.twitter.com/oauth/request_token', accessURL='https://api.twitter.com/oauth/access_token', authURL='https://api.twitter.com/oauth/authorize')
cred$handshake(cainfo="cacert.pem")
