
library(lhs)

nreg = 50

lhs = randomLHS(nreg,1,FALSE)
ttfs = qweibull(lhs,0.8,50)
colnames(ttfs) = "Horas"

# write.csv(ttfs,file="falhas_simuladas.txt",row.names = FALSE,)

# Retirando a virgula (isto não deveria travar o problema)
ttfs = round(ttfs)

write.csv2(ttfs,file="falhas_simuladas.txt",row.names = FALSE)