#cvr
ds <- data.frame(
  item1 = c(3, 3, 3, 3, 2),
  item2 = c(2, 3, 3, 2, 3),
  item3 = c(1, 1, 1, 1, 1),
  item4 = c(3, 3, 3, 3, 3))

psychometric::CVratio(NTOTAL = lengths(ds),
                      NESSENTIAL = colSums(ds == 3))

#cvi
ds <- data.frame(
  item1 = c(4, 3, 4, 2, 4),
  item2 = c(3, 2, 4, 3, 2),
  item3 = c(2, 2, 3, 2, 1),
  item4 = c(4, 4, 4, 3, 4))
# Compute I-CVI
i_cvi <- function(x) {
  n <- length(x)
  n_relevant <- sum(x >= 3)  # Count ratings 3 and 4 as relevant
  return(n_relevant / n)}
i_cvi_values <- apply(ds, 2, i_cvi)
# Compute S-CVI
s_cvi_ave <- mean(i_cvi_values)
s_cvi_ua <- sum(i_cvi_values == 1) / length(i_cvi_values)
print(i_cvi_values)
print(s_cvi_ave)
print(s_cvi_ua)