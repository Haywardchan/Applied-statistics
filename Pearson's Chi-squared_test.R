samples=556;
P=c(9/16,3/16,3/16,1/16);
e_i=samples*P;
o_i=c(315,101,108,32);
G=sum((o_i-e_i)^2/e_i);
print(G);
print(chisq.test(o_i,p=P));
