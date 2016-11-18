create table ward(
	WNo number (2)  constraint pk_ward primary key,
	Name char(20),
	Number_of_beds number(3)
);

create table nurse(
	Nid number(6) constraint pk_nurse primary key,
	Name char(20),
	Date_qualified date,
	Ward number(2) constraint ref_nurse_one references ward(WNo),
	Supervisor number(6) constraint ref_nurse_two references nurse(Nid)
);

create table teams(
	Team_code number(3) constraint pk_teams primary key,
	Contact_number number(12)
);

create table consultant(
	staff_number number(6) constraint pk_con primary key,
	Specialism char(20),
	Leads number(3) constraint ref_con references teams(Team_code)
);

create table doctor(
	staff_number number(6) constraint pk_doctor primary key,
	Name char(20),
	Appointment_date date
);

create table junior(
	staff_number number(6) constraint pk_junior primary key references doctor(staff_number),
	Works_in number(3) constraint ref_junior references teams(Team_code)
);

create table patient(
	Pid number(6) constraint pk_patient primary key,
	Name char(20),
	Address char(40),
	Date_of_Birth date,
	Ward number(2) constraint ref_patient_one references Ward(WNo),
	Consultant number(6) constraint ref_patient_two references consultant(staff_number)
);

create table houseman(
	staff_number number(6) constraint pk_doctor_h primary key references junior(staff_number)
);

create table registrar(
	staff_number number(6) constraint pk_doctor_r primary key references junior(staff_number)
);
