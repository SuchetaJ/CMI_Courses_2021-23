
#Solution 3
z = rnorm(1000,mean=0,sd=1)

#Solution 3.a
zcinf = function(v){
  n = length(v)
  Z= qnorm(0.95/2,lower.tail=FALSE)
  c(mean(v)-Z*1.5/sqrt(n),mean(v)+Z*1.5/sqrt(n))
}
zcinf(z)

#Solution 3.b
#1-alpha = 0.95
tcinf = function(v){
  n = length(v)
  Z = qnorm(0.95/2,lower.tail=FALSE)
  c(mean(v)-Z*sd(v)/sqrt(n),mean(v)+Z*sd(v)/sqrt(n))
}
tcinf(z)


#Solution 5

data = c(94.0, 98.6, 96.8, 95.5, 93.8, 95.6, 99.3, 95.8, 93.9, 90.2, 91.0, 93.9)
ci = tcinf(data)
ci_round =c()
for (i in ci){
  ci_round=c(ci_round,round(i,1))
}
ci_round


#Solution 6

attach(iris)
head(iris)

#Confidence interval for sepal length of each species
set_sep_l = iris[iris$Species=='setosa',]$Sepal.Length
print(paste('The confidence Interval for Sepal.Length of Setosa is: (',tcinf(set_sep_l)[1],tcinf(set_sep_l)[2],')'))
vers_sep_l = iris[iris$Species=='versicolor',]$Sepal.Length
print(paste('The confidence Interval for Sepal.Length of versicolor is: (',tcinf(vers_sep_l)[1],tcinf(vers_sep_l)[2],')'))
virg_sep_l = iris[iris$Species=='virginica',]$Sepal.Length
print(paste('The confidence Interval for Sepal.Length of virginica is: (',tcinf(virg_sep_l)[1],tcinf(virg_sep_l)[2],')'))

#Confidence interval for sepal width of each species
set_sep_w = iris[iris$Species=='setosa',]$Sepal.Width
print(paste('The confidence Interval for Sepal.Width of Setosa is: (',tcinf(set_sep_w)[1],tcinf(set_sep_w)[2],')'))
vers_sep_w = iris[iris$Species=='versicolor',]$Sepal.Width
print(paste('The confidence Interval for Sepal.Width of versicolor is: (',tcinf(vers_sep_w)[1],tcinf(vers_sep_w)[2],')'))
virg_sep_w = iris[iris$Species=='virginica',]$Sepal.Width
print(paste('The confidence Interval for Sepal.Width of virginica is: (',tcinf(virg_sep_w)[1],tcinf(virg_sep_w)[2],')'))


#Confidence interval for petal width of each species
set_pet_l = iris[iris$Species=='setosa',]$Petal.Length
print(paste('The confidence Interval for Petal.Length of Setosa is: (',tcinf(set_pet_l)[1],tcinf(set_pet_l)[2],')'))
vers_pet_l = iris[iris$Species=='versicolor',]$Petal.Length
print(paste('The confidence Interval for Petal.Length of versicolor is: (',tcinf(vers_pet_l)[1],tcinf(vers_pet_l)[2],')'))
virg_pet_l = iris[iris$Species=='virginica',]$Petal.Length
print(paste('The confidence Interval for Petal.Length of virginica is: (',tcinf(virg_pet_l)[1],tcinf(virg_pet_l)[2],')'))


#Confidence interval for petal width of each species
set_pet_w = iris[iris$Species=='setosa',]$Petal.Width
print(paste('The confidence Interval for Petal.Width of Setosa is: (',tcinf(set_pet_w)[1],tcinf(set_pet_w)[2],')'))
vers_pet_w = iris[iris$Species=='versicolor',]$Petal.Width
print(paste('The confidence Interval for Petal.Width of versicolor is: (',tcinf(vers_pet_w)[1],tcinf(vers_pet_w)[2],')'))
virg_pet_w = iris[iris$Species=='virginica',]$Petall.Width
print(paste('The confidence Interval for Petal.Width of virginica is: (',tcinf(virg_pet_w)[1],tcinf(virg_pet_w)[2],')'))


