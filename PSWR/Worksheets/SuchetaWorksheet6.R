#Solution 1.a

dice_toss = read.csv("C:\\Users\\user1\\Downloads\\dicetoss.csv")
df_dice = data.frame(dice_toss)

X = df_dice$Outcome.of.Roll
Y = df_dice$Y..Number.of.Heads

freq_tab = table(X,Y)     #creates a frequency table for X and Y

for (i in c(1:6)){
  for (j in c(1:7)){
    freq_tab[i,j] = freq_tab[i,j]/sum(freq_tab[i,])  #calculates P(Y=j|X=i)
  }
}

YconX = rep(NA,6)
for (i in c(1:6)){
  YconX[i] = sum(freq_tab[i,])
}

dist_tab = cbind(freq_tab,YconX)
dist_tab
write.csv(dist_tab, "D:\\Sucheta\\CMI\\PSWR\\Y_Condition_X")


#Solution 1.b

freq_tab1 = table(Y,X)     #creates a frequency table for X and Y

for (i in c(1:7)){
  sum = sum(freq_tab1[i,])
  for (j in c(1:6)){
    freq_tab1[i,j] = freq_tab1[i,j]/sum  #calculates P(X=j|Y=i)
  }
}

XconY = rep(NA,7)
for (i in c(1:7)){
  XconY[i] = sum(freq_tab1[i,])
}

dist_tab1 = cbind(freq_tab1,XconY)
dist_tab1

write.csv(dist_tab1, "D:\\Sucheta\\CMI\\PSWR\\X_Condition_Y")
