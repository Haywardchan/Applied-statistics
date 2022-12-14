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
