#Solution 1.a

x_bern = rbern(100,1/3) #generates 100 iid Bernoulli(1/3)

#Solution 1.b 

runningmean = function (x,N){  #function to calculate the mean
  y = sample(x,N, replace=TRUE)
  c = cumsum(y)
  n = 1:N
  c/n
}

#Sample with n = 100, p =1/3
n=100
x_bern = rbern(n,1/3) #generates n iid Bernoulli(1/3)
u1 = runningmean(x_bern, n)
rangen=1:n
plot(u1~rangen, type ='l',ylim = c(0,1))
abline(h=1/3, col=2)


#solution 1.c

replicate(15,lines(runningmean(x_bern, 100)~rangen, type="l",lwd=2, col=rgb(runif(3),runif(3),runif(3))))

#solution 1.d

#Sample with n = 100, p =0.001
x_bern2 = rbern(n,0.001)  #generates n iid Bernoulli(0.001)
u2 = runningmean(x_bern2, n)
rangen=1:n
plot(u2~rangen, type ='l')
abline(h=0.001, col=2)

replicate(15,lines(runningmean(x_bern2, 100)~rangen, type="l",lwd=2, col=rgb(runif(3),runif(3),runif(3))))

#Sample with n = 100, p =0.5
x_bern3 = rbern(n,0.5)   #generates n iid Bernoulli(0.5)
u3 = runningmean(x_bern3, n)
rangen=1:n
plot(u3~rangen, type ='l')
abline(h=0.5, col=2)

replicate(15,lines(runningmean(x_bern3, 100)~rangen, type="l", col=rgb(runif(3),runif(3),runif(3))))

#Sample with n = 100, p =1/3
x_bern4 = rbern(n,0.99)   #generates n iid Bernoulli(0.99)
u4 = runningmean(x_bern4, n)
rangen=1:n
plot(u4~rangen, type ='l')
abline(h=0.99, col=2)

replicate(15,lines(runningmean(x_bern4, 100)~rangen, type="l",lwd=2, col=rgb(runif(3),runif(3),runif(3))))


#Solution 2.b

a=0 #lower bound
b=7 #upper bound
n=400
f = function(x){  #given function
  (16+sin(x))/(x^2+4)
}
x_unif = runif(n,min=a,max=b) #uniformly distributed random variables
f_x = sapply(x_unif,f) #apply the function to each random variable
sum_f = (b-a)*sum(f_x)/n  #calculate the left hand side of the given equation
print(paste("The approximate value of the integration is :",sum_f))

#Solution 2.c

sum_f1=rep(NA,100) 
for (i in 1:100){  #repeat 100 times
  x_unif = runif(n,min=a,max=b)
  f_x = sapply(x_unif,f)
  sum_f1[i] = (b-a)*sum(f_x)/n
}
mean_sum = mean(sum_f1)
print(paste("The approximate value comes as: ",mean_sum))

#Solution 2.d

int_f= integrate(f,a,b)
error= mean_sum - int_f$value
print(paste("The value of the integral is: ",int_f$value))
print(paste("The integral and the sum differ by: ",error))

#We can see that the two answers are very close to each other and have difference
#of about 0.07.
