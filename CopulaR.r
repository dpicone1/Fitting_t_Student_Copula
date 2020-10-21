library(copula)
set.seed(101)

#t-Copula parameters
rho <- 0.35
df  <- 5

# copula object
t_Cop<- mvdc(tCopula(rho, dim = 2,df=df), margins=c("norm","norm"),
             paramMargins=list(list(mean=0, sd=1),list(mean=0, sd=1)))

#sample from the defined copula
size <- 1000
t_Cop_sample <- rMvdc(size, t_Cop)

# fitting
m     <- pobs(as.matrix(cbind(t_Cop_sample[1:size,1],t_Cop_sample[1:size,2])))
fit   <- fitCopula(t.cop, m, method='ml')
coef(fit)

# save the data into a csv filebv vcc
df_data <- data.frame(t_Cop_sample)
write.csv(df_data,"retunrs_02.csv")

#coef(fit)
#rho.1        df 
#0.6229496 9.7934965 
 
#coef(fit)
#rho.1        df 
#0.2936787 4.1509739 