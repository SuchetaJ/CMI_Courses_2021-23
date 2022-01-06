bin_dist = rbinom(500,10,1/3) #generating samples from distribution function

p = 1/3
n = 10
x_bin = rep(NA,500)
for (i in 1:500){        #generating samples using runif
  u = runif(n, min = 0, max = 1)
  x_bin[i] = sum(u < p)
}
print(x_bin)