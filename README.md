# RMST-as-an-alternative-approach-to-evaluate-effect-size-of-treatment-on-survival-in-ES-SCLC
R and SAS code along with the raw pseudo individual patient data generated using R package IPDfromKM
Pseudo individual patient data (IPD) from thirteen trials (see the Kaplan-Meier plots from IOtrials.docx) 
were extracted from Kaplan-Meier plots using R package IPDfromKM. Cox model and Kaplan-Meier meethod were 
used to fit the pseudo IPD data to generate summary metrics (e.g. HR, RMST, RMTL) for overall survival (OS)
and progression-free survival (PFS). The summary metrics (either from published papers/abstracts or pseudo
IPD data were compiled (see surv4sclc.xlsx). con.sas reads the excel file surv4sclc.xlsx into SAS dataset. 
Weighted Pearson correlations among the HRs and RMSTs for OS and PFS were estimated using corr1b.sas.  
Meta-analysis using mixed-effects model was done using R meta package (see R programs os1.r, pfs1.r, 
rmstos1.r, rmstpfs1.r, rmtlos1.r and rmtlpfs1.r).
