
#Solution 1

dice_toss = read.csv("C:\\Users\\user1\\Downloads\\dicetoss.csv")
df_dice = data.frame(dice_toss)
X = df_dice[1]
Y = df_dice[8]

zero = rep(0,42)
mat_dice = matrix(zero, nrow = 6, ncol = 7)
colnames(mat_dice) = c("Y=0","Y=1","Y=2","Y=3","Y=4","Y=5","Y=6")
rownames(mat_dice) = c("X=1","X=2","X=3","X=4","X=5","X=6")
print(mat_dice)

df_joint = as.data.frame(mat_dice)
dist_X = rep(NA,6)
for (i in c(1:6)){
    dist_X[i] = sum(X==i)
}

for (i in c(1:length(X))){
  for (j in c(1:6)){
    for (k in  c(1:7)){
      if (X[i] == j){
        if (Y[i]==k-1){
          df_joint[j,k] = df_joint[j,k]+1
        }
      }
    }  
  }
}
  
  
df_joint

