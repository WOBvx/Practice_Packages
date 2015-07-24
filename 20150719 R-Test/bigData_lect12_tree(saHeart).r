##Uncomment if use this package for the first time
##install.packages("tree");
library(rpart);

SA <- read.table("saHeart.Data",header=TRUE,sep=",")[,2:11];
SA$famhist <- as.numeric(SA$famhist == "Present");

N <- nrow(SA);
idx <- sample(1:N,100);
SA.test <- SA[idx,];
SA <- SA[-idx,];

SA.tree <- rpart(chd~.,data=SA,method="class",cp=0.00001);
printcp(SA.tree);

#R Code on saHeart(test)
cp.opt <- SA.tree$cptable[which.min(SA.tree$cptable[,4]),1];
SA.tree.pruned <- prune(SA.tree,cp=cp.opt)

plot(SA.tree.pruned);
text(SA.tree.pruned);

#Test
tree.predict<-as.numeric(predict(SA.tree.pruned,
newdata=SA.test)[,1] < 0.5);
conf<-table(tree.predict,SA.test$chd);
acc<-sum(diag(conf))/sum(conf);
cat("The accuracy on the test set is", acc,"\n");