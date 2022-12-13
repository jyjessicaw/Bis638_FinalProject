-- Programmer: Inna Cohen
-- Date Modified: December 12, 2022
-- Purpose: Query mimic database on https://sqliteonline.com/

-- Demographics table
CREATE VIEW VIEW0 AS
SELECT *, CASE WHEN AGE>= 65 then 1 ELSE 0 END AS AGE_GROUP FROM (
  SELECT *,
(CASE
 WHEN CAST(SUBSTRING(admittime,1,4)as INT) - CAST(SUBSTRING(dob,1,4) as INT) >=90 THEN 90
 ELSE CAST(SUBSTRING(admittime,1,4)AS INT) - CAST(SUBSTRING(dob,1,4) AS INT)
 END)
 AS AGE
 FROM Admissions
 Join Patients on Patients.subject_id=Admissions.subject_id)

-- Cleaning the ICD-9 tables
CREATE VIEW VIEW_ICD AS
select subject_id, hadm_id, d.icd9_code, long_title,
CASE WHEN d.icd9_code between 480 AND 488 THEN 1 ELSE 0 END AS PNEUMONIA,
CASE WHEN subject_id IN (SELECT subject_id FROM VIEW0 where AGE_GROUP = 1) THEN 1 ELSE 0 END AS AGE_GROUP
from Diagnoses_icd d
join D_icd_diagnoses dd ON d.icd9_code = dd.icd9_code;


-- Number of patients
SELECT  PNEUMONIA, count(DISTINCT subject_id) as n
FROM VIEW_ICD
GROUP BY PNEUMONIA



-- Number of subtypes of pneumonia
SELECT count(distinct subtype) from
(select subtype, count(*) as n,
ROUND(count(*)*100.00/sum(count(subtype)) over(),1) as percent
from (select distinct subject_id, icd9_code, long_title as subtype FROM VIEW_ICD WHERE PNEUMONIA = 1)
group by subtype)

-- Identifying top 10 subtypes of pneumonia
select subtype, count(*) as n,
ROUND(count(*)*100.00/sum(count(subtype)) over(),1) as percent
from (select distinct subject_id, icd9_code, long_title as subtype FROM VIEW_ICD WHERE PNEUMONIA = 1)
group by subtype
order by 2 desc
LIMIT 10;

-- subtypes in young adults
select subtype, count(*) as n,
ROUND(count(*)*100.00/sum(count(subtype)) over(),1) as percent
from (select distinct subject_id, icd9_code, long_title as subtype FROM VIEW_ICD WHERE PNEUMONIA = 1 and age_group = 0)
group by subtype
order by 2 desc
LIMIT 10;

-- subtypes in older adults
select subtype, count(*) as n,
ROUND(count(*)*100.00/sum(count(subtype)) over(),1) as percent
from (select distinct subject_id, icd9_code, long_title as subtype FROM VIEW_ICD WHERE PNEUMONIA = 1 and age_group = 1)
group by subtype
order by 2 desc
LIMIT 10;

-- absence/presence of pneumonia by age group
select pneumonia, age_group, count(distinct subject_id) as n
from VIEW_ICD
group by pneumonia, age_group
order by 3 desc


-- Cleaning Prescription tables
CREATE VIEW VIEW_PRESCRIPTIONS AS
Select p.subject_id, p.hadm_id, drug, pneumonia, age_group,
dose_val_rx as QUANTITY,
dose_unit_rx as UNIT,
prod_strength as FREQUENCY,
route,
CASE WHEN drug IN (SELECT Drug_id from drugs where class = 'opiods') THEN 'opiods'
	 WHEN drug IN (SELECT Drug_id from drugs where class = 'benzodiazepines') then 'benzos'
     ELSE 'other'
     END as 'CLASS'
FROM VIEW_ICD as v
join Prescriptions as p on
p.subject_id = v.subject_id

-- Number of distinct pneumonia patients with prescriptions
SELECT count(DISTINCT subject_id) as n
FROM VIEW_PRESCRIPTIONS
WHERE PNEUMONIA = 1

-- Number of distinct prescriptions for pneumonia patients
SELECT count(DISTINCT drug) as count_drug
FROM VIEW_PRESCRIPTIONS
WHERE PNEUMONIA = 1

-- Identifying number of opiods
select drug as opiod_type, count(*) as n,
from (select drug FROM VIEW_PRESCRIPTIONS WHERE DRUG IN(SELECT Drug_id from drugs where class = 'opiods'))
group by drug
order by 2 desc;
