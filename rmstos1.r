rmstos1.r <- function(){
	library(meta)
	library(Hmisc)
settings.meta('RevMan5')
osdf0 <-sas.get("./data","surv4sclc")
osdf <- osdf0[osdf0$flag4io == 1,]
study <- osdf$author 
## run function metagen to get estimates using generic inverse variance method
m<-metagen(
TE = rmstdiff2, seTE = sqrt(vardiff2),data = osdf, sm = "MD", fixed=F,
	random=T, studlab = study, 
	method.tau = "DL",
	method.random.ci = "classic"
)
pbias <- metabias(m,k.min=5)
pdf(file="rmstos1.pdf", width=10, height=6)
## Forest plot of the estimates
forest(m) 
dev.off()
list(m)
}
