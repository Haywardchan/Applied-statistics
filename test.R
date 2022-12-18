# data=c(0.8,1.9,0.6,0.3,1.1)
# fx=function(x) {
#     if (x<0)return(0)
#     if (0<=x && x<=1) {return (x*x/2)}
#     if (1<=x && x<=2) {return (2*x-(x*x/2))}
#     return (1)
# }
# print(ks.test(data,fx)) 
# data=c(37.05,38,37.45,37.7,37.4,37.95,38.35,37.75,37.8,38.55,38.95,38.4,38.15)
# t_val=qt(0.05,df=length(data)-1,lower.tail=F)
# xbar=mean(data)
# var=var(data)
# len=length(data)
# print((xbar-37.5)/sqrt(var)*sqrt(len))
# x=c(12,11,7,13,8,9,10,13)
# print(sd(x))
print(qf(0.05,df1=2,df2=15,lower.tail=F))