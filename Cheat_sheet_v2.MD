```R
qnorm(0.05, lower.tail=F)
pnorm(-0.355)
t_value=qt(p-value, df=n-1, lower.tail=F)
|t_value|=|qt(p-value/2, df=n-1, lower.tail=F)|
power.t.test(n=12, delta=5, sd=10, sig.level=0.05, type="one.sample", alternative="one.sided")
power.t.test(n=12, delta=5, sd=10, sig.level=0.05, power=0.8, type="one.sample", alternative="one.sided")
qchisq(0.05, df=5-1, lower.tail=F)
pchisq(16, df=9, lower.tail=F)
t.test(x, mu=10, alternative="two-sided"{"greater"}, conf.level=1-0.05)
t.test(x,y, mu=0, alternative="two.sided", var.equal=T, {conf.level=1-0.05})
t.test(x,y,mu=0,alternative="two.sided")
table=read.csv('file.csv')
head(table)
str(table)
conc=c(table$Fall.1976,na.omit(table$Fall.1977))
n1=length(table$Fall.1976)
n2=length(na.omit(table$Fall.1977))
year=c(rep("Fall.1976",n1),rep("Fall.1977",n2))
data=dara.frame(concentration=conc, year=as.factor(year))
boxplot(concentration~year,data=data)
qf(0.05, df1=k-1, df2=n-k, lower.tail=F)
treatment=c(rep(1,length(time1)),rep(2,length(time2)),rep(3,length(time3),rep(4,length(time4)))
rat_poison=data.frame(time=c(time1,time2,time3,time4),treatment=as.factor(treatment))
summary(aov(time~treatment,data=rat_poison))
oneway.test(word~method,data=dat)
res=Tukey(aov(time~treatment,data=rat_poison))
plot(res) // k(k-1)/2 groups
dx=x-mean(x); dy=y-mean(y);
sxy=sum(dx\*dy); sxx=sum(dx^2); syy=sum(dy^2);
b1=sxy/sxx; b0=mean(y)-b1*mean(x);
s2=(syy-b1\*sxy)/(n-2);
plot(x, y, xlab="Father's height", ylab="Sons's height");
abline(a=b0, b=b1, col="red");
lm(y~x); or lm(son.height~father.height, data=data.frame(father.height=x, son.height=y));
xnew=175;
ynew=b0+b1*xnew
s=sqrt((syy-b1*sxy)/(n-2))
tc=qt(1-0.05/2, df=n-2)
ci_d=tc*s*sqrt(1/n+(xnew-mean(x))^2/sxx)
ci_d=tc*s*sqrt(1+1/n+(xnew-mean(x))^2/sxx) //widen CI (Prediction interval)
ci_ynew=c(ynew-ci_d, ynew+ci_d)
summary(lm(son.height~father.height, data=height_data))
lm_res=lm(son.height~father.height, data=height_data)\
conflict(lm_res, level=0.90)
fit=lm(mpg~wt, data=mtcars)
predict(fit, data.frame(wt=3.5), interval="prediction/confidence", level=0.95)
plot(x1x2_data$x1, x1x2_data$y, xlab="x1", ylab="y")
plot(x1x2_data$x2, x1x2_data$y, xlab="x2", ylab="y")
r=sqrt(summary(fit)$r.square)
x=c(0.48,0.71..)
qtheory=qnorm((seq(n)-0.5)/n, mean=mean(x), sd=sd(x))
qtheory=qunif((seq(n)-0.5)/n, min=min(x), max=max(x))
plot(qtheory, sort(x))
q_z=qnorm((seq(n)-0.5)/n)
abline(a=mean(x), b=sd(x), col="red")
qqnorm(x)
abline(a=0, b=1, col="red")
//check whether its coming from a given continous distribution
ks.test(x,punif)
//self defined function
Fx=function(x){
    return(1-1/(1+x)^4)
}
ks.test(x, Fx)
ks.test(x,pnorm,mean(x),sd(x))
shapiro.test(x)
str(iris)
iris$Sepal.Width[iris$Species=="versicolor"]
iris$Sepal.Width[iris$Species=="virginica"]
ks.test(x,y)
CPAT::qkolmogorov(1-0.05)/sqrt(length(x))
qchisq(0.05,df=6-1,lower.tail=F)
t=matrix(c(25,6,8,15),nrow=2,ncol-2,byrow=T,dimnames=list(c("Attend","Skip"),c("Pass","Fail")))
chisq.test(t, correct=F) //Pearsons Chi-Squared test
```