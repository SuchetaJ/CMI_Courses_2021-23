
#Solution 4

m = c(5,50,5000)
sample_avg = c()
sample_var = c()

for (i in m){
  exp_sample = c()
  sample_mean = c()
  for (j in c(1:100)){
    exp_sample = append(exp_sample, rexp(i,rate = 1))
    sample_mean = append(sample_mean, mean(exp_sample))
  }
  print(paste("The sample mean for m = ", i))
  print(" ")
  print(sample_mean)
  hist(sample_mean, main = paste("The sample mean for m = ", i))
  sample_avg = append(sample_avg, mean(sample_mean))
  sample_var = append(sample_var, var(exp_sample))
}

print(sample_avg)
print(sample_var)

#true average = 1/1 = 1
#true variance = 1/(1)^2 = 1


#We can see as we increase the value of m, the average value converges to 1 
#which is the true mean of Exp(1) Distribution.
#Also note that, as we increase the value of m, the variance of this 
#sample goes near to 1, which is the true variance of Exp(1) Distribution.