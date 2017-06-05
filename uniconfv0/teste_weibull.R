# Fit Test

library(fitdistrplus)

dados = ttfs

weibull = fitdist(dados[,1],"weibull")
shape = weibull$estimate["shape"]
scale = weibull$estimate["scale"]

weibull