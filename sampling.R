# 3a
x = c(3,4,11,15,16,17,22,44,37,16,14,24,25,15,26,27,33,29,35,44,13,21,22,10,12,8,40,32,26,27,31,34,29,17,8,24,18,47,33,34)
y = c(3,14,11,5,16,17,28,41,31,18,14,14,26,25,21,22,31,2,35,44,23,21,21,16,12,18,41,22,16,25,33,34,29,13,18,24,23,42,33,29)
install.packages("Matching")
library("Matching")
print(ks.boot(x,y,alternative="two.sided"))

# # 3bi
# install.packages("pyramid")
# library("pyramid")
# frequencies = c("[0.5, 6.5)","[6.5, 12.5)","[12.5, 18.5)","[18.5, 24.5)","[24.5, 30.5)","[30.5, 36.5)","[36.5, 42.5)","[42.5, 48.5)")
# Group1 = c(2,5,9,5,7,7,2,3)
# Group2 = c(3,2,11,8,6,6,3,1)
# data = data.frame(Group1, Group2, frequencies)
# pyramid(data, Llab = "Group I", Rlab = "Group II", Clab = "Intervals")

# # 3bii
# data = matrix(c(2,5,9,5,7,7,2,3,3,2,11,8,6,6,3,1), ncol = 8, byrow = T)
# colnames(data) = c("[0.5, 6.5)","[6.5, 12.5)","[12.5, 18.5)","[18.5, 24.5)","[24.5, 30.5)","[30.5, 36.5)","[36.5, 42.5)","[42.5, 48.5)")
# rownames(data) = c("Group I", "Group II")
# # print(data)
# print(chisq.test(data))
