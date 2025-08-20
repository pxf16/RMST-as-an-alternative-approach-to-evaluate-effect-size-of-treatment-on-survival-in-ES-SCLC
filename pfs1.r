pfs1.r <- function(){
	library(meta)
	library(Hmisc)
settings.meta('RevMan5')
pfsdf0 <-sas.get("./data","surv4sclc")
pfsdf <- pfsdf0[pfsdf0$flag4io == 1,]
study <- pfsdf$author 
HR <- pfsdf$hr1
lower.HR <- pfsdf$hr1l 
upper.HR <- pfsdf$hr1u 
## run function metagen to get estimates using generic inverse variance method
m<-metagen(
HR = log(HR), lower = log(lower.HR), upper = log(upper.HR), sm = "HR", fixed=F,
	random=T, studlab = study, 
	method.tau = "DL",
	method.random.ci = "classic"
)
pbias <- metabias(m,k.min=5)
pdf(file="forest4pfs1.pdf", width=10, height=6)
## Forest plot of the estimates
forest(m, xlim = c(0.3,1.8), label.left="Favor experimental arm", 
     label.right="Favor control arm")
dev.off()
pdf(file="funnel4pfs1.pdf")
## Funnel plot of the meta-analysis
funnel.meta(m, studlab = TRUE, xlab="Hazard Ratio (experimental vs control)",
	    xlim=c(0.45, 1))
dev.off()
list(m,pbias)
}
