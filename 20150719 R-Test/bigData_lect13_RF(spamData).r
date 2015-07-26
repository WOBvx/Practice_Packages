##The spam data
##install.packages("randomForest");
library(randomForest);
x<-read.table("spam.Data",sep=",");
n<-nrow(x); p<-ncol(x);
x[,p]<-as.factor(x[,p]);
##Split the data according to HTF for comparison
T<-3065;
idx2<-sample(1:n,T, replace=FALSE);
xtrain<-x[idx2,1:(p-1)]; y<-x[idx2,p];
xtest<-x[-idx2,1:(p-1)]; ytest<-x[-idx2,p];

set.seed(111);
MTRY<-floor(sqrt(p))+1; NTREE<-100;
nc<-2; cutoff<-rep(1/nc,nc);
myrf<-randomForest(xtrain,y,xtest=xtest,ytest=ytest,
ntree=NTREE, mtry=MTRY,
replace=TRUE,classwt=NULL,cutoff,strata,
sampsize=nrow(xtrain),
nodesize=if(!is.null(y) && !is.factor(y)) 5 else 1,
importance=FALSE, localImp=FALSE,nPerm=1,
proximity=FALSE,oob.prox=FALSE,
norm.votes=TRUE,do.trace=FALSE,
keep.forest=!is.null(y) && is.null(xtest),corr.bias=FALSE,
keep.onbag=FALSE);

print(myrf);