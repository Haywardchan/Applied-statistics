# lead_conc= read.csv("C:/Users/miruh/Downloads/lead_concentration.csv")
# # fall_1976<-na.omit(lead_conc$Fall.1976)
# fall_1977<-na.omit(lead_conc$Fall.1977)
# # boxplot(fall_1976,fall_1977, names=c("Fall.1976", "Fall.1977"))

# # #remove ouliers
# # outliers_1976 <- boxplot(fall_1976, plot=FALSE)$out
# # rm_fall_1976<-na.omit(lead_conc$Fall.1976) 
# # rm_fall_1976<- rm_fall_1976[-which(rm_fall_1976 %in% outliers_1976)]

# # outliers_1977 <- boxplot(fall_1977, plot=FALSE)$out
# # rm_fall_1977<-na.omit(lead_conc$Fall.1977) 
# # rm_fall_1977<- rm_fall_1977[-which(rm_fall_1977 %in% outliers_1977)]

# # #print mean and sd of the data
# # print(mean(rm_fall_1976))
# # print(sd(rm_fall_1976))
# # print(mean(rm_fall_1977))
# # print(sd(rm_fall_1977))

# n=length(fall_1977);
# xbar=mean(fall_1977);
# s=sd(fall_1977);
# z_alpha=qnorm(1-(1-0.9)/2);
# print(z_alpha);
# data=c(xbar-z_alpha*s/sqrt(n),xbar+z_alpha*s/sqrt(n))
# print(data);

# qchi=qchisq((1-0.9)/2,df=n-1);
# qchi_2=qchisq(1-(1-0.9)/2,df=n-1);
# sigma_1=((n-1)*s*s)/qchi;
# sigma_2=((n-1)*s*s)/qchi_2;
# one_over_sd=c(1/sqrt(sigma_1),1/sqrt(sigma_2));
# print(qchi)
# print(qchi_2)
# print(s)
# print(sigma_1)
# print(sigma_2);
# print(one_over_sd);

# print(qt(0.025,df=11,lower.tail=FALSE))
# help(pbinom)
# print(pbinom(7,size=10,prob=0.5, lower.tail=FALSE))
# install.packages("readxl")

# library(readxl);
# cold=read_excel("C:/Users/miruh/Downloads/cold.xlsx");
# placebo<-na.omit(cold$Placebo)
# vitamin_c<-na.omit(cold$Vitamin.C)#space can be replaced by dot
# print(sd(placebo))
# print(sd(vitamin_c))
# print(mean(placebo))
# print(mean(vitamin_c))
# print(vitamin_c)
# print(placebo)
# print(t.test(placebo,vitamin_c,alternative="greater",var.equal=T,conf.level=1-0.05))

# print(power.t.test(delta=1,sd=1,sig.level=0.05,power=0.8,type="two.sample",alternative="one.sided"))

data=read.csv("C:/Users/miruh/Downloads/concrete_data.csv")
absorbed=c(
    data$X1,
    data$X2,
    data$X3,
    data$X4,
    data$X5
)
aggregate=as.factor(
    c(
        rep('1',length(data$X1)),
        rep('2',length(data$X2)),
        rep('3',length(data$X3)),
        rep('4',length(data$X4)),
        rep('5',length(data$X5))
    )
)
print(absorbed)
concrete=data.frame(
    absorbed,aggregate
)
print(str(concrete))
print(summary(aov(absorbed~aggregate,data=concrete)))
print(qf(1-0.03,4,25))

print(TukeyHSD(aov(absorbed~aggregate,data=concrete),conf.level=1-0.03))

print(oneway.test(absorbed~aggregate,data=concrete,var.equal=FALSE))