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
