data=c(76,118,15,14,44,289,123,54);
Fx=function(x){
    return(1-exp(-x/100))#cdf
}
print(ks.test(data,Fx));
# install.packages("CPAT");
library(CPAT);
print(CPAT:::qkolmogorov(1-0.05)/sqrt(length(data)));