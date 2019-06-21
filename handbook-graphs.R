# Unemployment rate data

unrate.raw <- read.csv("unrate.csv", header=TRUE)
unrate <- ts(unrate.raw[,2], start=c(1948,1), frequency=4)

# Inflation rate data

inf.raw <- read.csv("dcpi.csv", header=TRUE)
inf <- ts(inf.raw[,2], start=c(1958,1), frequency=4)

# Oil price data

oil.raw <- read.csv("wpu0561-quarterly.csv", header=TRUE, skip=3)
oil <- ts(oil.raw[,2], start=c(1947,1), frequency=4)
doil <- 100*(log(oil) - log(lag(oil,-4)))

# Plot data for 1970-1984

# Create .eps file

setEPS()
postscript("graphs-1970-1984.eps")

# Put 3 plots on the same page

par(mfrow=c(3,1))
par(cex.axis=1.3)

inf.7084 <- window(inf, start=c(1970,1), end=c(1984,4))
plot(inf.7084, xlab="", ylab="", yaxt="n", lwd=1.3,
	ylim=c(2,15), main="Core Inflation Rate")
axis(2, at=c(2, 6, 10, 14), labels=c(2, 6, 10, 14))

unrate.7084 <- window(unrate, start=c(1970,1), end=c(1984,4))
plot(unrate.7084, xlab="", ylab="", ylim=c(3,12), yaxt="n", 
	main="Unemployment Rate", lwd=1.3)
axis(2, at=c(3, 6, 9, 12), labels=c(3, 6, 9, 12))

doil.7084 <- window(doil, start=c(1970,1), end=c(1984,4))
plot(doil.7084, ylim=c(-20,60), xlab="", ylab="", yaxt="n",
	main="Change in Price of Crude Oil", lwd=1.3)
axis(2, at=c(-20, 20, 60), labels=c(-20, 20, 60))

dev.off()

# Redo for 1995-2017

postscript("graphs-1995-2017.eps")
par(mfrow=c(3,1))
par(cex.axis=1.3)

inf.9517 <- window(inf, start=c(1995,1), end=c(2017,4))
plot(inf.9517, xlab="", ylab="", yaxt="n", lwd=1.3,
	ylim=c(0,4), main="Core Inflation Rate")
axis(2, at=c(0, 2, 4), labels=c(0, 2, 4))

unrate.9517 <- window(unrate, start=c(1995,1), end=c(2017,4))
plot(unrate.9517, xlab="", ylab="", ylim=c(3,12), yaxt="n", 
	main="Unemployment Rate", lwd=1.3)
axis(2, at=c(3, 6, 9, 12), labels=c(3, 6, 9, 12))

doil.9517 <- window(doil, start=c(1995,1), end=c(2017,4))
plot(doil.9517, ylim=c(-120,120), xlab="", ylab="", yaxt="n",
	main="Change in Price of Crude Oil", lwd=1.3)
axis(2, at=c(-100, -50, 0, 50, 100), labels=c(-100, -50, 0, 50, 100))

dev.off()
