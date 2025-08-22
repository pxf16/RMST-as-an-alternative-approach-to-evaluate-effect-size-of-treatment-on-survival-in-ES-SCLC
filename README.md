# RMST-as-an-alternative-approach-to-evaluate-effect-size-of-treatment-on-survival-in-ES-SCLC
R and SAS code along with the summary metrics either from published papers/abstracts or estimated using pseudo 
individual patient data (IPD) extracted from published Kaplan-Meier plots of thirteen trials 
(see the Kaplan-Meier plots from IOtrials.docx) using R package IPDfromKM. Cox model and Kaplan-Meier meethod were 
used to fit the pseudo IPD from each of the trial to generate summary metrics (e.g. HR if missing from the papers, RMST, RMTL)
for overall survival (OS) and progression-free survival (PFS). The summary metrics (either from published
papers/abstracts or estimated based on pseudo IPD data were compiled (see surv4sclc.xlsx). con.sas reads the excel file 
surv4sclc.xlsx into SAS dataset. Weighted Pearson correlations among the HRs, RMSTs RMTLs for OS and PFS were 
estimated (see corr1b.sas). Meta-analysis was done using mixed-effects model approach and was implemented using R 
meta package (see R programs os1.r, pfs1.r, rmstos1.r, rmstpfs1.r, rmtlos1.r and rmtlpfs1.r).
