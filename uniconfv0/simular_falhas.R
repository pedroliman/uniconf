
library(lhs)
library(fitdistrplus)

nreg = 200

# Weibull
# Parâmetro de Forma - BETA - SLOPE:
# Parametro de escala - N 
# Parâmetro de Localização Y

# O parametro de Forma influencia a taxa de falha:
# B < 1 - Taxa de Falha Diminui com o tempo
# B =~ 1 - Taxa de Falha Constante
# B > 1 - Taxa de Falha aumenta com o Tempo


# ttfs = qweibull(lhs,0.8,50)

shape_inf = 0.8
shape_fim = 4
shape_vida_util = 1
scale = 1000

ttfs_vida_util = rweibull(nreg,shape_vida_util,scale)
ttfs_infantil = rweibull(nreg,shape_inf,scale)
ttfs_fim_vida_util = rweibull(nreg,shape_fim,scale)

weibull_inf = fitdist(ttfs_infantil,"weibull")
weibull_fim = fitdist(ttfs_fim_vida_util,"weibull")
weibull_vida_util = fitdist(ttfs_vida_util,"weibull")

plot(weibull_fim)
plot(weibull_inf)
plot(weibull_vida_util)

resultado
"H0 = Os Dados utilizados seguem uma distribuicao Weibull"
"H1 = Os Dados utilizados nao seguem uma distribuicao Weibull"
"Teste CVM"
resultado$cvmtest
"Teste KS"
resultado$kstest
"Teste AD"
resultado$adtest


resultado = gofstat(weibull_fim)
resultado$adtest
gofstat(weibull_inf)

# write.csv(ttfs,file="falhas_simuladas.txt",row.names = FALSE,)

# Retirando a virgula (isto não deveria travar o problema)
ttfs_vida_util = round(ttfs_vida_util,2)
ttfs_infantil = round(ttfs_infantil,2)
ttfs_fim_vida_util = round(ttfs_fim_vida_util,2)


ttfs_vida_util = as.matrix(ttfs_vida_util)
colnames(ttfs_vida_util) = "Horas"
ttfs_infantil = as.matrix(ttfs_infantil)
colnames(ttfs_infantil) = "Horas"
ttfs_fim_vida_util = as.matrix(ttfs_fim_vida_util)
colnames(ttfs_fim_vida_util) = "Horas"


write.csv(ttfs_vida_util,file="t_vida_util.txt",row.names = FALSE)
write.csv(ttfs_infantil,file="t_infantil.txt",row.names = FALSE)
write.csv(ttfs_fim_vida_util,file="t_fim_vida_util.txt",row.names = FALSE)