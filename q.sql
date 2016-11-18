/*Question 1*/

/*Question 2*/
select Name, Consultant 
from patient 
where ward = (select WNo from ward where Name = 'A&E');

/*Question 3*/
select nurse.Name, Date_qualified, ward.name
from nurse, ward 
where Number_of_beds > (select avg(Number_of_beds) from ward);

/*Question 4*/
select nurse.Name,super.name
from nurse, nurse super
where nurse.supervisor = super.Nid;