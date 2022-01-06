#Solution 1

set.seed(40)
x = as.integer((runif(1,min=1,max=5)))
print(x)

#Solution 2
print(x/6)

#Solution 4
m= read.csv('D:\\Sucheta\\CMI\\PSWR\\matrix.csv', header = FALSE)
m
m1 = data.matrix(m)
m1

#Solution 5
g_10=graph.adjacency(adjmatrix=m1,mode="undirected",weighted=TRUE,diag=FALSE)
plot(g_10,main ='G(10,1/2)')
