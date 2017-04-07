#Histogram
hist(table_final$Positive, col=rainbow(10), main = "Positive Score", xlab = "Rank", ylab = "# tweets showing positive feedback")
hist(table_final$Negative, col=rainbow(10),  main = "Nagetive Score", xlab = "Rank", ylab = "# tweets showing negitive feedback")
hist(table_final$Score, col=rainbow(10),  main = "Sentiment Analysis of Sunil_Grover_fight", xlab = "<-Negative  Score  Positive->", ylab = "# tweets")

#Pie
slices <- c(sum(table_final$Positive), sum(table_final$Negative))
labels <- c("Positive", "Negative")
pct <- round(slices/sum(slices)*100)
labels <- paste(labels, pct) # add percents to labels
labels <- paste(labels,"%",sep="") # ad % to labels
pie(slices, labels = labels, col=c("green", "red"), main = "Sentiment Analysis of Sunil_Grover_fight")
library(plotrix)
#pie(slices, labels = labels, col=rainbow(length(labels)), main="Sentiment Analysis")
pie3D(slices, labels = labels, col=c("green", "red"),explode=0.07, main="Sentiment Analysis of Sunil_Grover_fight")


# More types of emotions #
some_txt <- as.character(table_final$Text)
library(syuzhet)
mysentiment<-get_nrc_sentiment((some_txt))

# Get the sentiment score for each emotion
mysentiment.positive =sum(mysentiment$positive)
mysentiment.anger =sum(mysentiment$anger)
mysentiment.anticipation =sum(mysentiment$anticipation)
mysentiment.disgust =sum(mysentiment$disgust)
mysentiment.fear =sum(mysentiment$fear)
mysentiment.joy =sum(mysentiment$joy)
mysentiment.sadness =sum(mysentiment$sadness)
mysentiment.surprise =sum(mysentiment$surprise)
mysentiment.trust =sum(mysentiment$trust)
mysentiment.negative =sum(mysentiment$negative)


# Create the bar chart
yAxis <- c(mysentiment.positive,
           + mysentiment.anger,
           + mysentiment.anticipation,
           + mysentiment.disgust,
           + mysentiment.fear,
           + mysentiment.joy,
           + mysentiment.sadness,
           + mysentiment.surprise,
           + mysentiment.trust,
           + mysentiment.negative)

xAxis <- c("Positive","Anger","Anticipation","Disgust","Fear","Joy","Sadness","Surprise","Trust","Negative")
colors <- c("green","red","blue","orange","red","green","orange","blue","green","red")
yRange <- range(0,yAxis) + 1000
#barplot(yAxis, names.arg = xAxis, xlab = "Emotional valence", ylab = "Score", main = "Twitter sentiment for Movie Rangoon 2017", sub = "Feb 2017", col = colors, border = "black", ylim = yRange, xpd = F, axisnames = T, cex.axis = 0.8, cex.sub = 0.8, col.sub = "blue")
barplot(yAxis, names.arg = xAxis, xlab = "Emotional valence", ylab = "Score", main = "Twitter sentiment for Sunil_Grover_Fight", col = colors, border = "black", cex.axis = 0.8, cex.sub = 0.8, col.sub = "blue")

colSums(mysentiment)

