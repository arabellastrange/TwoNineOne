/*carry out a join between two tables and use a function and a group by clause.*/
/*Question 1: Return the number of doctors working in the surgery team */
select Specialism, Count(*) Number_of_JMemebrs
from consultant, teams, junior, doctor
where Leads = Team_code AND Works_in = Team_code AND junior.staff_number = doctor.staff_number AND Specialism = 'Surgen'
Group by Specialism;

/*Question 2: Select all patients checked into A&E and return their consultants*/
select Name, Consultant
from patient
where ward = (select WNo from ward where Name = 'A and E');

/*Question 3: Select all nurses working in larger than average wards and return the name of the ward they work in*/
select nurse.Name, Date_qualified, ward.name
from nurse, ward
where Number_of_beds > (select avg(Number_of_beds) from ward) AND WNO = Ward;

/*Question 4: Select all nurses and return the names of their super*/
select nurse.Name,super.name
from nurse, nurse super
where nurse.supervisor = super.Nid;
