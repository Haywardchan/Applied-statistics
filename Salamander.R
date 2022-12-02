data=read.csv("C:/Users/miruh/Downloads/salamander.csv");
print(head(data));
wa=data$weight_loss_A;
wb=data$weight_loss_B;
temp=data$temperature;
frame=data.frame(wa,wb,temp);
print(summary(lm(wb~temp,data=frame)));
