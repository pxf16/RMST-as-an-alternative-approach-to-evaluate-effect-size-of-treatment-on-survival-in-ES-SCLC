options ls = 78;
libname fu "./data";
Proc import datafile = "./data/surv4sclc.xlsx" out=surv4sclc dbms=xlsx replace;
data fu.surv4sclc;
        set surv4sclc;
	rmtldiff1 = rmtlpfs1 - rmtlpfs2;
	cvardiff1 = sec11*sec11 + sec12 * sec12;
	rmtldiff2 = rmtlos1 - rmtlos2;
	cvardiff2 = sec21*sec21 + sec22 * sec22;

	rmstdiff1 = rmstpfs1 - rmstpfs2;
	logrmst1 = log(rmstpfs1) - log(rmstpfs2);
	vardiff1 = se11*se11 + se12 * se12;
	rmstdiff2 = rmstos1 - rmstos2;
	logrmst2 = log(rmstos1) - log(rmstos2);
	vardiff2 = se21*se21 + se22 * se22;
	if pid = 12 then flag = 0; else flag = 1; /* No ORR data */
if OR = -99 then OR = .;
if ORU = -99 then ORU = .;
if ORL = -99 then ORL = .;
a = n1 * r1;
b = n1 * (1 - r1);
c = n2 * r2;
d = n2 * (1 - r2);
var_LOR = 1/a + 1/b + 1/c + 1/d;
if OR = . then do;
        OR = r1 * (1 - r2) / ((1 - r1) * r2);
        var_OR = OR * OR * var_LOR;
        ORL = OR - 1.96 * sqrt(var_OR);
        ORU = OR + 1.96 * sqrt(var_OR);
end;
seOR = (ORU - ORL)/(2 * 1.96);
varOR = seOR * seOR;
wgt = 1/varOR;
weight = wgt;
/* Weight based on HR of OS */
seHR2 = (HR2U - HR2L)/(2 * 1.96);
varHR2 = seHR2 * seHR2;
wgtos = 1/varHR2;
diffORR = r1 - r2;
logOR = log (OR);
logHR1 = log(HR1); /* log HR for PFS */
logHR2 = log(HR2); /* log HR for OS */
if pid in (2,3,7,8,10,12,13) then flag4io = 1; else flag4io = 0;
proc freq;
	tables flag4io;
proc contents;
run;
