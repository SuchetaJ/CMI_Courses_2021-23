set.seed(51)

#Solution 1
x = c(75, 76, 73, 75, 74, 73, 73, 76, 73, 79, 77, 75)

#Solution 1.a
#sigma = 1.5, 1-alpha=0.95
zcinf1 = function(v){
  n = length(v)
  Z= qnorm(0.95/2,lower.tail=FALSE)
  c(mean(v)-Z*1.5/sqrt(n),mean(v)+Z*1.5/sqrt(n))
}
zcinf(x)


#Solution 1.b
#1-alpha = 0.95
tcinf = function(v){
  n = length(v)
  Z = qnorm(0.95/2,lower.tail=FALSE)
  c(mean(v)-Z*sd(v)/sqrt(n),mean(v)+Z*sd(v)/sqrt(n))
}
tcinf(x)

#Solution 1.c

#Case 1-> Null hypothesis: mu = 0
t.test(x)
#The test statistic is t= 0 and the degrees of freedom is 11 
#since n = 12. p-value returns the probability of not rejecting the 
#null Hypothesis, p-value=2.2e-16. Since we have H0: mu =0, hence 
#alternate hypothesis is mu != 0. The t.test by default 
#finds the 95% confidence interval which for our sample is, 
#(73.72158, 76.11175). Since this is a one sample test it estimates
# mean, which is 74.91667.
#Since the p-value<0.05 , we the null hypothesis in this case.

#Case 2-> Null hypothesis: mu = mean(x)
t.test(x,mu=mean(x))
#The test statistic is t= 0 and the degrees of freedom is 11 
#since n = 12. p-value returns the probability of not rejecting the 
#null Hypothesis, p-value=1. Since we have H0: mu =mean(x), hence 
#alternate hypothesis is mu != mean(x). The t.test by default 
#finds the 95% confidence interval which for our sample is, 
#(73.72158, 76.11175). Since this is a one sample test it estimates
# mean, which is 74.91667. 
#Since the p-value>0.05 , we can't reject the null hypothesis in this case.

#Solution 2.a
x1 = rnorm(100,mean=0,sd=1)
x2 = rt(100,df=25)
boxplot(x1,x2, col=c(8,4))
par(mfrow=c(1,2))
qqnorm(x1,xlab='Standard Normal Distribution')
qqline(x1,col='red')
qqnorm(x2,xlab='t-ditribution with df=2')
qqline(x2,col='red')


#Solution 2.b
k=c(3, 33, 66, 99)
ran_x = seq(-4,4,by=0.1)
y1 =dnorm(ran_x)
plot(y1,type="l", lty=2,lwd=3)
y2= dt(ran_x,df=3)
lines(y2,col='yellow')
y2= dt(ran_x,df=33)
lines(y2,col='blue',lwd=3)
y2= dt(ran_x,df=66)
lines(y2,col='green',lwd=3)
y2= dt(ran_x,df=99)
lines(y2,col='red',lwd=3)

#We can see as we increase the degrees of freedom, the coloured smooth lines 
#start to overlap with the dashed line represneting normal distribution.
#We can say as the degree of freedom increases, t distribution starts behaving 
#like a normal distribution

#Solution 3

prop.test(45,100)
#We have 45 heads out of 100 tosses. The assumed null hypothesis is 0.5,
#since we are testing for a fair coin. X-squared us 0.81 which is the test 
#statistic and the degrees of freedom is df=1. We can see p-value is 0.3681.
#The 95% confidence interval is calculated to be (0.3514281, 0.5524574) and the
#sample estimate of the probability of a head is 0.45.
#Since p-value = 0.3681>1-0.95, we can't reject the null hypothesis. Also, note
#that 0.5 lies in the confidence interval calculated by prop.test(), hence
#the coin might or might not be a fair one.

#Solution 4
prop.test(4500,10000)

#We have 4500 heads out of 10000 tosses. The assumed null hypothesis is 0.5,
#since we are testing for a fair coin. X-squared us 99.8 which is the test 
#statistic and the degrees of freedom is df=1. p-value is less than 2.2e-16.
#The 95% confidence interval is calculated to be (0.4402205, 0.4598181) and the
#sample estimate of the probability of a head is 0.45.
#Since p-value<1-0.95, we reject the null hypothesis. Also, note
#that 0.5 does not lie in the confidence interval calculated by prop.test(), 
#hence the coin is not a fair one.


#Solution 5

#Claim: lifetime of a battery=25
alpha=0.05
Z= qnorm(0.95/2,lower.tail=FALSE)
c(21-Z*1.7/sqrt(10),21+Z*1.7/sqrt(10))
value = 1-pt(7.441,df=9)
value<0.05

#Since value<0.05, we can reject the null hypothesis, Also, note that
#the claimed mean 25, doesn't lie in the 95% confidence interval for 
#sample mean.
