os1.r <- function(){
	library(meta)
	library(Hmisc)
settings.meta('RevMan5')
osdf0 <-sas.get("./data","surv4sclc")
# 7 ICI studies
osdf <- osdf0[osdf0$flag4io == 1,]
study <- osdf$author 
HR <- osdf$hr2
lower.HR <- osdf$hr2l 
upper.HR <- osdf$hr2u 
## run function metagen to get estimates using generic inverse variance method
m<-metagen(
HR = log(HR), lower = log(lower.HR), upper = log(upper.HR), sm = "HR", fixed=F,
	random=T, studlab = study, 
	method.tau = "DL",
	method.random.ci = "classic"
)
pbias <- metabias(m,k.min=5)
pdf(file="forest4os1.pdf", width=10, height=6)
## Forest plot of the estimates
forest(m, xlim = c(0.4,1.5), label.left="Favor experimental arm", 
     label.right="Favor control arm")
dev.off()
pdf(file="funnel4os1.pdf")
## Funnel plot of the meta-analysis
funnel.meta(m, studlab = TRUE, xlab="Hazard Ratio (experimental vs control)",
	    xlim=c(0.55, 1))
dev.off()
list(m,pbias)
}
