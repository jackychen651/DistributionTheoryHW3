set.seed(42)
library(ggplot2)
n <- 1000
r_1 <- 2
r_2 <- 3
lambda <- 4
X_1 <- rgamma(n, r_1, lambda)
X_2 <- rgamma(n, r_2, lambda)
Y <- X_1 + X_2
Z <- X_1 / Y
Y_ <- rgamma(n, r_1 + r_2, lambda)
Z_ <- rbeta(n, r_1, r_2)
pdf("1.pdf")
qqplot(Y, Y_,
       main = "Q-Q Plot: Y vs Y_",
       xlab = "Theoretical Quantiles (Y_)",
       ylab = "Sample Quantiles (Y)",
       pch = 19, col = alpha("blue", 0.5))
abline(0, 1, col = "red", lwd = 2)
dev.off()
pdf("2.pdf")
qqplot(Z, Z_,
       main = "Q-Q Plot: Z vs Z_",
       xlab = "Theoretical Quantiles (Z_)",
       ylab = "Sample Quantiles (Z)",
       pch = 19, col = alpha("blue", 0.5))
abline(0, 1, col = "red", lwd = 2)
dev.off()

