rmtlos1.r <- function(){
	library(meta)
	library(Hmisc)
settings.meta('RevMan5')
osdf0 <-sas.get("./data","surv4sclc")
osdf <- osdf0[osdf0$flag4io == 1,]
study <- osdf$author 
## run function metagen to get estimates using generic inverse variance method
m<-metagen(
TE = rmtldiff2, seTE = sqrt(cvardiff2),data = osdf, sm = "MD", fixed=F,
	random=T, studlab = study, 
	method.tau = "DL",
	method.random.ci = "classic"
)
pbias <- metabias(m,k.min=5)
pdf(file="rmtlos1.pdf", width=10, height=6)
## Forest plot of the estimates
forest(m) 
dev.off()
list(m)
}
