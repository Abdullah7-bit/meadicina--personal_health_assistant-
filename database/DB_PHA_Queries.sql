create table Roles(
role_id int primary key identity,
role_name varchar(50),
-- if role id = 1 admin
-- 2 doctor 
--  3 Patient

);

create table Users(
[user_id] int primary key identity,
full_name varchar(40) not null,
email varchar(40) not null,
[password] varchar(40) not null,
role_id int,
FOREIGN KEY (role_id) REFERENCES Roles(role_id)
);




-- only add by Admin
create table Doctors(
doc_id int primary key identity,
-- will use to add degree
Education varchar(50) not null,
[Available_days] varchar(80),
[Available_time] varchar(80),
City varchar(30) not null,
-- About, Info 7 Experince can be add in Description
[Description] varchar(150),
phone_number varchar(40) not null,
gender varchar(40) not null,
age int not null,
[user_id] int,
FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

create table Patients(
Patient_id int primary key identity,
Name varchar(50),
[Address] varchar(50),
City varchar(50),
Contact varchar(50),
phone_number varchar(40) not null,
gender varchar(40) not null,
age int not null,
-- user id as Foreign Key
[user_id] int,
FOREIGN KEY (user_id) REFERENCES Users(user_id)

);

create table Appointments(
-- Appointment Id
apt_id int primary key identity,
[Date] Date not null,
[Time] Time not null,
Patient_id int,
doc_id int,
FOREIGN KEY (Patient_id) REFERENCES Patients(Patient_id),
FOREIGN KEY (doc_id) REFERENCES Doctors(doc_id)
-- Doctor Fk 
);

create table Medicine_Dosage(
medicine_id int primary key identity,
medicine_name varchar(100) not null,
Times_in_a_Day varchar(20),
Times_per_Week varchar(20),
Doage_Quantity varchar(20),
-- user_id foreign key
[user_id] int,
FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

create table Health_Vital(
vital_Id int primary key identity,
[Weight] int,
[Height] int,
BloodPressure_upper int,
BloodPressure_lower int,
Glucose_Levels int ,
Covid_Test varchar,
Other_Test varchar(90)
);





