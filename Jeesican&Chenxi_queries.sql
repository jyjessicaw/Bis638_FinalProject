select subject_id,diagnosis 
From Admissions
where DIAGNOSIS Like "%Pneumonia%"

CREATE VIEW VIEW0 AS
select *,
(CASE 
 WHEN CAST(SUBSTRING(ADMITTIME,1,4)AS INT)-CAST(SUBSTRING(DOB,1,4)AS Int)>=90 THEN 90 
 ELSE CAST(SUBSTRING(ADMITTIME,1,4)AS INT)-CAST(SUBSTRING(DOB,1,4)AS Int)
 END
)AS AGE
From Admissions
join Patients on Patients.SUBJECT_ID=Admissions.SUBJECT_ID
where DIAGNOSIS Like "%Pneumonia%"

create view VIEWD AS
select *
from admission join patients on Patients.SUBJECT_ID=Admissions.SUBJECT_ID
where admission.diagnosis not like "%Pneumonia%"
order by random()
limit 2000

select count(distinct subject_id)as n
from VIEWC

join
(select SUM(CASE WHEN DEATHTIME IS NOT NULL THEN 1 ELSE 0 END) as death,gender,age_group
 FROM VIEWC
 group by age_group, gender)as d
 on d.gender=viewc.gender and d.age_group=viewc.age_group
 
 select c.age_group,c.gender,d.death,c.gender_num, round((d.death*1.0/c.gender_num),3)as dealth_rate
from
(select gender,age_group,COUNT(gender)AS GENDER_NUM
from VIEWC
group by age_group, gender)as c join
(select SUM(CASE WHEN DEATHTIME IS NOT NULL THEN 1 ELSE 0 END) as death,gender,age_group
 FROM VIEWC
 group by age_group, gender)as d
 on d.gender=c.gender and d.age_group=c.age_group
 
select c.age_group,c.gender,c.gender_num,d.death, round((d.death*1.0/c.gender_num),3)as dealth_rate,h.duration
from
(select gender,age_group,COUNT(gender)AS GENDER_NUM
from VIEWC
group by age_group, gender)as c join
(select SUM(CASE WHEN DEATHTIME IS NOT NULL THEN 1 ELSE 0 END) as death,gender,age_group
 FROM VIEWC
 group by age_group, gender)as d
 on d.gender=c.gender and d.age_group=c.age_group 
 join 
 (select round(AVG(JULIANDAY(DEATHTIME)-JULIANDAY(ADMITTIME)),3)AS DURATION,gender,age_group
FROM VIEWC
WHERE DEATHTIME IS NOT NULL
group by age_group, gender) as h on h.gender=c.gender and h.age_group=c.age_group

select a.r_number, a.age_group, a.race, d.death, round((d.death*1.0/a.r_number),3)as dealth_rate,h.duration
from(
(select  
count(ethnicity) as r_number,age_group,
(case when ethnicity like "ASIAN%" then "ASIAN"
 when ethnicity like "HISPANIC%" then "HISPANIC/LATINO"
 when ethnicity like "WHITE%" THEN "WHITE"
 WHEN ethnicity LIKE "BLACK%" THEN "BLACK/AFRICAN"
 ELSE "OTHER"
 END)as Race
 From viewc
 group by RACE,AGE_GROUP)as a 
 join (select SUM(CASE WHEN DEATHTIME IS NOT NULL THEN 1 ELSE 0 END) as death, age_group,count(ethnicity) as r_number,age_group,
(case when ethnicity like "ASIAN%" then "ASIAN"
 when ethnicity like "HISPANIC%" then "HISPANIC/LATINO"
 when ethnicity like "WHITE%" THEN "WHITE"
 WHEN ethnicity LIKE "BLACK%" THEN "BLACK/AFRICAN"
 ELSE "OTHER"
 END)as Race
 FROM VIEWC
 group by race,age_group)as d
 on a.race=d.race and a.age_group=d.age_group)
 join 
 (select count(ethnicity) as r_number,age_group,
(case when ethnicity like "ASIAN%" then "ASIAN"
 when ethnicity like "HISPANIC%" then "HISPANIC/LATINO"
 when ethnicity like "WHITE%" THEN "WHITE"
 WHEN ethnicity LIKE "BLACK%" THEN "BLACK/AFRICAN"
 ELSE "OTHER"
 END)as Race,round(AVG(JULIANDAY(DEATHTIME)-JULIANDAY(ADMITTIME)),3)AS DURATION,age_group
FROM VIEWC
WHERE DEATHTIME IS NOT NULL
group by age_group, race) as h on h.race=a.race and h.age_group=a.age_group