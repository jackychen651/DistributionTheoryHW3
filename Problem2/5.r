set.seed(42)
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
qqplot(Y, Y_,
       main = "Q-Q Plot: Y vs Y_",
       xlab = "Theoretical Quantiles (Y_)",
       ylab = "Sample Quantiles (Y)",
       pch = 19, col = alpha("blue", 0.5))
abline(0, 1, col = "red", lwd = 2)

plot(Z, Z_,
     main = "Scatter Plot: Z vs Z_",
     xlab = "Z (Sample)",
     ylab = "Z_ (Theoretical Sample)",
     pch = 19, col = alpha("darkgreen", 0.5))

qq_data <- data.frame(Y = sort(Y), Y_ = sort(Y_))
ggplot(qq_data, aes(x = Y_, y = Y)) +
  geom_point(color = "blue", alpha = 0.5) +
  geom_abline(intercept = 0, slope = 1, color = "red") +
  ggtitle("Q-Q Plot: Y vs Y_") +
  xlab("Theoretical Quantiles (Y_)") +
  ylab("Sample Quantiles (Y)") +
  theme_minimal()

scatter_data <- data.frame(Z = Z, Z_ = Z_)
ggplot(scatter_data, aes(x = Z, y = Z_)) +
  geom_point(color = "darkgreen", alpha = 0.5) +
  geom_abline(intercept = 0, slope = 1, color = "red") +
  ggtitle("Scatter Plot: Z vs Z_") +
  xlab("Z (Sample)") +
  ylab("Z_ (Theoretical Sample)") +
  theme_minimal()