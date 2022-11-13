https://docs.google.com/document/d/13OOm8WEAvJGgtcst43Rv0gE92GvOoeCGl2bWUtODVv0/edit?usp=sharing

BIS 638: Brief Project Proposal
Team Name: PARTITION BY
Group Names: Chenxi Li, Rui Li, Jessica Wang, Inna Cohen
Delirium is one of the most common conditions in the ICU setting yet it remains underdiagnosed1–3. The primary objective of our final project is to explore the prevalence of delirium in the MIMIC-III dataset. The tasks in our project will include: selecting relevant tables, data cleaning, computing descriptive statistics, and visualization.
Tasks:
Inna: Create the following tables in the mimic database: ADMISSIONS, PATIENTS, PRESCRIPTIONS, D_ICD, DIAGNOSIS_ICD, load data from csv files, and upload to https://sqliteonline.com/
Inna and Rui: Compute descriptive statistics from the diagnoses and prescriptions tables
Inna and Rui: Organize the tables using an ontological perspective and utilize API 
Chenxi and Jessica: Define a patient cohort using standardized inclusion/exclusion criteria based on demographics.
Chenxi and Jessica: Compute descriptive statistics from the Admissions and Patients tables
Chenxi and Jessica: Clean up missing values, re-code ages of older adults from 300 to 90+
All: Work on data visualization and analysis using R and Python
All: Do a quick literature search to understand the risk factors for delirium to see if any patients with the risk factor have an increased odds/higher prevalence of delirium compared do patients who are not.  older age6, cognitive/functional impairment7, CAM/APACHE-II score8, depression7, excessive sedative use9, infection (with/without sepsis)7, and urea concentration8.
 
 

 
References
1.	Cavallazzi, R., Saad, M. & Marik, P. E. Delirium in the ICU: an overview. Ann Intensive Care 2, 49 (2012).
2.	Ali, M. & Cascella, M. ICU Delirium. in StatPearls (StatPearls Publishing, 2022).
3.	Hercus, C. & Hudaib, A.-R. Delirium misdiagnosis risk in psychiatry: a machine learning-logistic regression predictive algorithm. BMC Health Services Research 20, 151 (2020).
4.	Coombes, C. E., Coombes, K. R. & Fareed, N. A novel model to label delirium in an intensive care unit from clinician actions. BMC Med Inform Decis Mak 21, 97 (2021).
5.	Ocagli, H. et al. A Machine Learning Approach for Investigating Delirium as a Multifactorial Syndrome. Int J Environ Res Public Health 18, 7105 (2021).
6.	Lindroth, H. et al. Systematic review of prediction models for delirium in the older adult inpatient. BMJ Open 8, e019223 (2018).
7.	Isfandiaty, R., Harimurti, K., Setiati, S. & Roosheroe, A. G. Incidence and predictors for delirium in hospitalized elderly patients: a retrospective cohort study. Acta Med Indones 44, 290–297 (2012).
8.	Boogaard, M. van den et al. Development and validation of PRE-DELIRIC (PREdiction of DELIRium in ICu patients) delirium prediction model for intensive care patients: observational multicentre study. BMJ 344, e420 (2012).
9.	Wang, J. et al. Establishment and validation of a delirium prediction model for neurosurgery patients in intensive care. Int J Nurs Pract 26, e12818 (2020).
