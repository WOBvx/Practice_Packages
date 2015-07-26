kmeans(x, centers, iter.max = 10, nstart = 1,
algorithm = c("Hartigan-Wong", "Lloyd", "Forgy",
"MacQueen"), trace=FALSE)

require(graphics);
x <- rbind(matrix(rnorm(100, sd = 1), ncol = 2),
matrix(rnorm(100, mean = 1, sd = 1), ncol = 2));
colnames(x) <- c("x", "y");
cl <- kmeans(x, 2);
colors<-rep("blue",nrow(x)); colors[cl$cluster==2]<-"red";
pchs<-rep(17,nrow(x)); pchs[cl$cluster==2]<-19;
plot(x, col = colors, pch=pchs);
txts<-c(rep("1",50), rep("2",50));
text(x,labels=txts);
