Test statistics: how we use the data to decide between 2 hypothesis (function of iid rvs)

reject $H_0$ if test statistics matches $H_1$
|   | Not reject $H_0$  | reject $H_1$  |
|---|---|---|
| H_0 is true  | no error  |  type 1 Error ($\alpha$) |
| H_1 is false  | type 2 Error ($\beta$) | no error  |

choose c such that c==$\alpha$ (default=0.05) a.k.a significance level

P(reject H_1 when H_0 is true)==$\alpha$
1. set the equation with the corresponding distribution 
2. standardize it first
>qnorm(0.05, lower.tail=F)

$$\frac{\bar X-\mu_0}{\sigma/\sqrt{n}}$$

reject H_0 with the value of test statistics=rejection region

one sided greater/ less test:
$$\mu_0 \pm z_\alpha\frac{\sigma}{\sqrt{n}}$$
default 2-sided test:
$$(-\infty,\mu_0 - z_{\frac{\alpha}{2}}\frac{\sigma}{\sqrt{n}}) \cup (\mu_0 + z_{\frac{\alpha}{2}}\frac{\sigma}{\sqrt{n}},+\infty) $$

make sure power (1-$\beta$) is larger to reduce type 2 error 

find beta to find power:

beta=P(do not reject $H_0$ when $H_1$ is true)
1. set the equation with the corresponding distribution (usually <= c)
2. standardize it first
>pnorm(-0.355)

difference of H_0 and H_1 increase -> power increases

composite test: additional assumption of value $\mu$ under $H_1$

we cannot reject the H_0 instead of data support H_0

$n, \Delta\mu$ and $\sigma^2$ affects the power

ask for number to power:

1. set standardized equation to find power with unknown n
2. qnorm and solve the equation (round up the value)

#### t-test
when $\sigma^2$ is unknown, we can consider to replace it with $S_{n-1}$ and distribution become $t_{n-1,a}$
$$\frac{\bar x-\mu_0}{s_{n-1}/\sqrt{n}}$$
two-sided t-test:
$$|\frac{\bar x-\mu_0}{s_{n-1}/\sqrt{n}}|>t_{n-1,a/2}$$

p-value: probability of getting a result that is equal or more extreme than the observed result under H_0

reject null if p-value $\leq$ 0.05 ($\alpha$)

one-sided greater test:

$P(\frac{\bar X-\mu_0}{s_{n-1}/\sqrt{n}})\geq$ t-value =p-value
>t_value=qt(p-value, df=n-1, lower.tail=F)

two-sided:

$|P(\frac{\bar X-\mu_0}{s_{n-1}/\sqrt{n}})|$=$2P(\frac{\bar X-\mu_0}{s_{n-1}/\sqrt{n}})\geq$  t-value=p-value

>|t_value|=|qt(p-value/2, df=n-1, lower.tail=F)|

power of t-test:
>power.t.test(n=12, delta=5, sd=10, sig.level=0.05, type="one.sample", alternative="one.sided")

number of samples:
>power.t.test(n=12, delta=5, sd=10, sig.level=0.05, power=0.8, type="one.sample", alternative="one.sided")

testing of population variance:
$$P(\frac{(n-1)S_{n-1}^2}{\sigma_0^2}>\chi_{n-1,\alpha}^2)=\alpha$$
>qchisq(0.05, df=5-1, lower.tail=F)
>pchisq(16, df=9, lower.tail=F)
- equivalent: reject H0 when $\mu_0/\sigma_0^2 \notin CI$
>t.test(x, mu=10, alternative="two-sided"{"greater"}, conf.level=1-0.05)

two-sample
test statistics=$\bar X-\bar Y$

$$P(\frac{\bar X-\bar Y-(\mu_X-\mu_Y)}{\sqrt{\frac{\sigma_X^2}{n}+\frac{\sigma_Y^2}{m}}})=\alpha$$

$$S_p^2=\frac{(n-1)S_{n-1,X}^2+(m-1)S_{n-1,Y}^2}{n+m+2}$$
two-sided two sample t-test;
$$|\bar x -\bar y|>t_{n+m-2,\alpha/2}S_p\sqrt{\frac{1}{n}+\frac{1}{m}}$$

>t.test(x,y, mu=0, alternative="two.sided", var.equal=T, {conf.level=1-0.05})

unknown unequal variance:
>t.test(x,y,mu=0,alternative="two.sided")
$$welch\space df=\frac{(\frac{S_X^2}{n}+\frac{S_Y^2}{m})^2}{\frac{1}{n-1}(\frac{S_X^2}{n})^2+\frac{1}{m-1}(\frac{S_Y^2}{m})^2}$$

>table=read.csv('file.csv')\
head(table)\
str(table)\
conc=c(table$Fall.1976,na.omit(table$Fall.1977))\
n1=length(table$Fall.1976)\
n2=length(na.omit(table$Fall.1977))\
year=c(rep("Fall.1976",n1),rep("Fall.1977",n2))\
data=dara.frame(concentration=conc, year=as.factor(year))\
boxplot(concentration~year,data=data)

SST(n-1)=SS_treat(k-1)+SSE(n-k)

A large $\frac{SS_treat}{SSE}$ support H1

$F(k-1,n-k)=\frac{SS_{treat}/(k-1)}{SSE/(n-k)}=\frac{MS_{treat}}{MSE}$

reject H0 if $F > F_{k-1,n-k,a}$

$E(MS_{treat})=E(MSE)=E(MST)=\sigma^2$

>qf(0.05, df1=k-1, df2=n-k, lower.tail=F)

>treatment=c(rep(1,length(time1)),rep(2,length(time2)),rep(3,length(time3),rep(4,length(time4)))\
rat_poison=data.frame(time=c(time1,time2,time3,time4),treatment=as.factor(treatment))\
summary(aov(time~treatment,data=rat_poison))

welch's ANOVA

oneway.test(word~method,data=dat)

Welch'ANOVA and 2 sample 2 sided t-test

:same p-value F=2t

Tukey's HSD
>res=Tukey(aov(time~treatment,data=rat_poison))\
plot(res) // k(k-1)/2 groups

reject p-value < alpha
### Linear Regression
$L(b_0,b_1)=\sum_{i=1}^n[y_i-(b_0+b_1x_i)]^2$\
$\hat \beta_0, \hat \beta_1=arg\space min\space L(b_0,b_1) _{b_0,b_1}$
```R
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
```
Theorem:
$$\hat \beta_1 \sim N(\beta, \frac{\sigma^2}{S_{xx}})\space \hat \beta_0 \sim N(\beta_0,\frac{\sigma^2\bar x^2}{S_{xx}})$$
MSE:
$$\hat \sigma_{MLE}^2=\frac{1}{n}\sum_{i=1}^n(e_i)$$
$$S^2=\frac{1}{n-2}\sum_{i=1}^n(e_i^2)=\frac{S_{yy}-\hat \beta_1 S_{xy}}{n-2}\space :e_i=Y_i-(\hat \beta_0 +\hat \beta_1 x_i)$$
Unknown Variance:
$$\hat \beta_1 \sim N(\beta, \frac{S^2}{S_{xx}})\space \hat \beta_0 \sim N(\beta_0,\frac{S^2\bar x^2}{S_{xx}})$$
>summary(lm(son.height~father.height, data=height_data))

regression: E(dy) < dx -> $\beta_1 < 1$ used for calculating t value

$$\frac{1}{\sqrt{\frac{S^2}{S_{xx}}}}=\frac{\beta_1}{t-value}$$

$$S_{xx}=(st/\hat \beta_1)^2$$

>lm_res=lm(son.height~father.height, data=height_data)\
conflict(lm_res, level=0.90)

CI for $\hat Y_{new}:$
$$(\hat y_{new}-t_{n-2, a/2}s\sqrt{\frac{1}{n}+\frac{(x_{new}-\bar x)}{S_{xx}}},\hat y_{new}+t_{n-2, a/2}s\sqrt{\frac{1}{n}+\frac{(x_{new}-\bar x)}{S_{xx}}})$$

```R
fit=lm(mpg~wt, data=mtcars)
predict(fit, data.frame(wt=3.5), interval="prediction/confidence", level=0.95)
plot(x1x2_data$x1, x1x2_data$y, xlab="x1", ylab="y")
plot(x1x2_data$x2, x1x2_data$y, xlab="x2", ylab="y")
```
$R^2=\frac{RSS}{SST}=1-\frac{SSE}{SST}$

A larger $R^2$ means a better linear relation, a better explanation of y

MSE=SSE/(n-2)

$r=\sqrt{R^2}$

$-1\leq r\leq 1$
$$p=\frac{E[(X-E(X))(Y-E(Y))]}{\sqrt{Var(X)Var(Y)}}$$
>r=sqrt(summary(fit)$r.square)
```R
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
```
$$F_n(x)=\frac{Number\space of\space samples\leq x}{n}$$

$H_0:$ the distribution of X is F(X)

$H_1:$ the distribution of X is not F(X)

test-statistics: $D=sup|F_n(x)-F(x)|$
>CPAT::qkolmogorov(1-0.05)/sqrt(length(x))

reject $H_0$ if $D>K_a/\sqrt{n}$