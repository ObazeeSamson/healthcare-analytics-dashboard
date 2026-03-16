/* Create database Healthcare_db;
use Healthcare_db;
select count(*) from healthcare;
*/
/* Change column name
alter table healthcare change ï»¿Name Name text;
select * from healthcare;*/
/* Addding primary key to the table
alter table healthcare 
add column ID int auto_increment primary key;
select * from healthcare;*/
/*  Fixing Name letter Casing
Update healthcare
set Name=lower(Name)
where ID>0; */
/*-- Check for null values/DATA TYPE
select * from  healthcare
-- where `Date of Admission` is null;
-- describe healthcare;
-- update healthcare
-- set `Date of Admission` = str_to_date(`Date of Admission`,'%m/%d/%Y') where ID >0
-- alter table healthcare
-- Modify column `Date of Admission`Date;
update healthcare
set `Discharge Date` = str_to_date(`Discharge Date`,'%m/%d/%Y') where ID >0
alter table healthcare
Modify column `Discharge Date` Date

select `Date of Admission` from healthcare
where `Date of Admission` is null */
/* Ceating Views
Create OR REPLACE View healthcare_new AS
select  
ID,
Name,
Age,
Gender,
`Blood Type`,
`Medical Condition`, 
`Date of Admission`,
`Discharge Date`,
Doctor,
Hospital,
`Insurance Provider`,
`Billing Amount`,
`Admission Type`
from healthcare;
select * from healthcare_new
*/
/* -- Calculating length of stay 
select Name, `Discharge Date`,`Date of Admission`,datediff(`Discharge Date`,`Date of Admission`)as 'Length_of_Stay' from healthcare_new
*/
/*-- Revenue analysis
select hospital, sum(`Billing Amount`)as Total_Revenue from healthcare_new
Group by hospital
Order by Total_Revenue;
Select `Medical Condition`,Avg(`Billing Amount`) as Average_Billing from healthcare_new 
Group by `Medical condition`
Order by Average_Billing DESC;
Which disease cost the most - Obesity
*/
/*-- High Risk Patient 
select * from healthcare_new 
where `Billing Amount` > 30000
*/
/*-- Admission type 
select `Admission Type`, count(*) patient_count from healthcare_new3
group by `Admission Type`
*/
/* -- Windows Function 
select * from (
select hospital, Name, `Billing Amount`,
Rank() over(partition by hospital order by `Billing Amount` DESC) AS RNK
from healthcare_new
) t
where rnk = 1;*/
/* -- Data quality check 
-- Duplicates
select NAME,Count(*)
from healthcare_new
group by Name
Having count(*) > 1;
-- Missing Values
select count(*) from healthcare_new
where `Billing Amount` is null
*/
/* -- Age Grouping (Patient Segmentation)
Select 
Case
	When Age < 18 then 'Child'
    When Age Between 18 And 40 Then 'Young Adult'
    When Age Between 41 and 65 Then 'Adult'
    Else 'Senior'
End as 'Age_Group', count(*) as patient
from healthcare_new
Group by Age_Group;
*/

select * from healthcare_new;
select * from healthcare