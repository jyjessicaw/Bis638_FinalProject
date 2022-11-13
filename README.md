# Bis638_FinalProject

TEAM NAME: PARTITION BY
 
For the final projects, the students need to apply what they have learned from the course (e.g., database, SQL, and ontology)  to the full MIMIC III datasets. It is not a requirement to use all the tables (it is required to use a subset of the tables).  Below is a list of example projects (some are published in journals)
https://people.cs.pitt.edu/~milos/courses/cs3750/Final_project/Final_Project_MIMIC_Primer.pdf
https://bmjopen.bmj.com/content/11/7/e044779
https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0232176
https://www.frontiersin.org/articles/10.3389/fendo.2021.797049/full
 
These projects provide some ideas based on what possible queries and analyses can be done using full MIMIC III data sets. One possibility is to replicate some parts of these projects or to expand what have been done. If any groups want to use MIMIC III data (e.g., lab tests, medications, patient cohorts, and so on) to explore certain clinical questions, please reach out to Dr. George Hauser for clinical domain expert advice/guidance.
The deliverables of the final project include the following:
A brief project proposal giving a list of tasks that is no more than one double-space page (due date: 11/18)
Eight-minute presentation including a short Q&A (due date: 12/8) -- 50% of the total score
A written report (maximum of 10 double-space pages including figures and references). Please include a contribution section that clearly identifies and describes each project member’s contribution (due date: 12/15) -- 50% of the total score
Project assessments will depend on the quality of the hypothesis under investigation, complexity of the data analysis (e.g., SQL queries), and clarity of the oral and written presentation. 
Thanks,
-Kei and George
 
 
 
Delirium is one of the most common conditions in the ICU setting yet it remains underdiagnosed1–3. The primary objective of our final project is to explore the prevalence of delirium in the MIMIC-III dataset. The tasks in our project will include: selecting relevant tables, data cleaning, computing descriptive statistics, and visualizations
Tasks:
Inna: Create the following tables in the mimic database: ADMISSIONS, PATIENTS, PRESCRIPTIONS, D_ICD, DIAGNOSIS_ICD, load data from csv files,  and upload to https://sqliteonline.com/
Diagnoses and Prescriptions:
Demographics team: Admissions, Patients
 
Add ontology
All: Explore the mimic database by using different queries and computing descriptive statistics of delirium patients by age, sex, gender, race-ethnicity.
All: Do a quick literature search to understand the risk factors for delirium to see if any patients with the risk factor have an increased odds/higher prevalence of delirium compared do patients who are not.  older age6, cognitive/functional impairment7, CAM/APACHE-II score8, depression7, excessive sedative use9, infection (with/without sepsis)7, and urea concentration8. 
Create a common list of ICD-9 codes to query the data and create variables that correspond to the 
 A patient cohort will be created by subsetting and joining these tables above using standardized inclusion/exclusion criteria based on demographics and  ICD-9 code diagnoses4,5. We define our cohort as follows: Adults age 18 years or older who are admitted to the ICU. Patients who have existing neuropsychiatric illnesses, aphasia, who are comatose, dead, or who have an ICU stay of less than one day or greater than 31 days, will be excluded since they are not at risk for delirium.
Basic descriptive statistics will be computed for our patient cohort by age, sex, gender, and race-ethnicity. Features will be selected based on exploratory data analysis, chi-square tests, and a literature review of risk factors for delirium such as
 
 
 
 
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
