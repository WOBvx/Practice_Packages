##Uncomment if use this package for the first time
##install.packages("rpart");
library(rpart);

tmp <- read.table("germanCreditNum.Data",header=FALSE,sep="");
n <- nrow(tmp); p<-ncol(tmp);
colnames(tmp)<-paste("g", seq(1,p),sep="");
set.seed(999);
idx <- sample(1:n,floor(n/2), replace=FALSE);
gc_train <- tmp[idx,];
gc_test <- tmp[-idx,];

mygc <- rpart(g25~.,data=gc_train,method="class",cp=0.00001);
printcp(mygc);

#R Code on German
cp.opt <- mygc$cptable[which.min(mygc$cptable[,4]),1];
mygc.pruned <- prune(mygc,cp=cp.opt);

plot(mygc.pruned);
text(mygc.pruned);

#Test
mygc.predict <- as.numeric(predict(mygc.pruned,
newdata=gc_test)[,1] < 0.5);
conf<-table(mygc.predict,gc_test[,p]);
acc<-sum(diag(conf))/sum(conf);
cat("The accuracy on the test set is", acc,"\n");