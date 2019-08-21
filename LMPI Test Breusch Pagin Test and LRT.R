data.5 = read.csv("C:\\Users\\Acer\\Desktop\\DataSet5.csv")
library(lmtest)

#Breusch Pagin Test of heteroscedasticity for our data
bptest(x~t, data = data.5)
bptest(x~t,studentize = FALSE,data = data.5)


#LMPI Test using the CCT approach

#First we fit an OLS model to the data
mod = lm(x~t,data = data.5)
CCT=sum(mod$residuals^2*data.5$t)/sum(mod$residuals^2)

#Then we can use a Monte Carlo approach to get a p value for this test statistic
#Let r be normal (I-Px)
X = matrix(data = c(rep(1,61),data.5$t),nrow = 61,ncol=2)
Px = X%*%solve(t(X)%*%X)%*%t(X)
I = diag(61)
sim1.CCT = function(){
  #this gives us one possible R
  sim.r = mvrnorm(mu=rep(0,61),Sigma=I-Px)
  #Our z value is the square root of the t values so we get
  CCT.sim = sum(sim.r^2*data.5$t)/sum(sim.r^2)
  return(CCT.sim)
}

CCT.sims = replicate(10000,sim1.CCT())
p = sum(CCT.sims>CCT)/10000
#We therefore get a p value of .0206

#Finally we have the likelihood ratio test in the SAS file