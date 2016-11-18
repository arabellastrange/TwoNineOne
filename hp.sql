create table ward(
	WNo int(2)  constraint pk_ward primary key,
	Name char(20),
	Number_of_beds int(3)	
);

create table nurse(
	Nid int(6) constraint pk_nurse primary key,
	Name char(20),
	Date_qualified date,
	Ward int(2) constraint ref_nurse_one references ward(WNo),
	Supervisor int(6) constraint ref_nurse_two references nurse(Nid)
);

create table team(
	Team_code int(3) constraint pk_team,
	Contact_number int(6)
);

create table consultant(
	staff_number int(6) constraint pk_con primary key,
	Specialism char(20),
	Leads int(3) constraint ref_con references team(Team_code)
);

create table doctor(
	staff_number int(6) constraint pk_doctor primary key,
	Name char(20),
	Appointment_date date
);

create table junior(
	staff_number int(6) constraint pk_junior primary key references doctor(staff_number),
	Works_in int(3) constraint ref_junior references team(Team_code)
);

create table patient(
	Pid int(6) constraint pk_patient primary key,
	Name char(20),
	Address char(40),
	Date_of_Birth date,
	Ward int(2) constraint ref_patient_one references Ward(WNo),
	Consultant int(6) constraint ref_patient_two references consultant(staff_number)
);

create table houseman(
	staff_number int(6) constraint pk_doctor primary key references junior(staff_number)
);

create table registrar(
	staff_number int(6) constraint pk_doctor primary key references junior(staff_number)
);