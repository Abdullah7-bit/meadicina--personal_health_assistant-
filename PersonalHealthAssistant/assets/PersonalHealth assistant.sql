-- create database health
-- use database health


create table Roles(
Role_Id int primary key identity,
role_name varchar(50),
-- if role Id = 1 admin
-- 2 doctor 
--  3 Patient
);



create table Users(
[User_Id] int primary key identity,
Full_name varchar(40)  ,
Email varchar(40),
[Password] varchar(40),
Role_Id int FOREIGN KEY REFERENCES Roles(Role_Id)
);


-- only add by Admin
create table Doctors(
Doc_Id int primary key identity,
-- will use to add degree
[Name] varchar(50),
Education varchar(50),
[Available_days] varchar(100),
[Available_time] varchar(100),
Hospital varchar(100),
Hospital_Address varchar(130),
City varchar(30),
-- About, Info 7 Experince can be add in Description
[Description] varchar(150),
Phone_number varchar(40),
Gender varchar(40),
Fees int,
[User_Id] int FOREIGN KEY REFERENCES Users([User_Id]),
[Image] varchar(1000),

);

create table Patients(
Patient_Id int primary key identity,
[Name] varchar(60),
[Address] varchar(100),
City varchar(70),
Phone_number varchar(40),
Gender varchar(40),
Age int,
[User_Id] int FOREIGN KEY REFERENCES Users([User_Id]),
[Image] varchar(1000)

);

create table Appointments(
-- Appointment Id
Apt_Id int primary key identity,
[Date] Date,
[Time] Time,
Patient_Id int FOREIGN KEY REFERENCES Patients(Patient_Id),
Doc_Id int FOREIGN KEY REFERENCES Doctors(Doc_Id)
);

create table Medicine_Dosage(
Medicine_Id int primary key identity,
Medicine_name varchar(100)  ,
Times_in_a_Day varchar(20),
Times_per_Week varchar(20),
Dosage_Quantity varchar(20),
[User_Id] int FOREIGN KEY REFERENCES Users([User_Id])
);

create table Health_Vital(
vital_Id int primary key identity,
Disease varchar(200),
[Weight] int,
[Height] int,
BloodPressure_upper int,
BloodPressure_lower int,
Glucose_Levels int ,
Covid_Test varchar(90),
Covid_Vaccine varchar(90),
Other_Vaccine varchar(90),
Other_Test varchar(90),
[User_Id] int FOREIGN KEY REFERENCES Users([User_Id]),
[Image] varchar(1000)

);

create table Feedbacks(
    Feed_Id int primary key identity,
    Email varchar(60), 
    [Subject] varchar(40),
    [Message] varchar(150),
    [User_Id] int FOREIGN KEY REFERENCES Users([User_Id])

);
create table Contacts(
    
    Contact_Id int primary key identity,
    Email varchar(60),
    [Message] varchar(150),
    [User_Id] int FOREIGN KEY REFERENCES Users([User_Id])
);




-- This is Dummy Data !!
-- Doctors
INSERT INTO Doctors ([Name], Education, [Available_days], [Available_time], Hospital, Hospital_Address, City, [Description], Phone_number, Gender, Fees)
VALUES ('Dr Furqan' , 'MBBS BHMS', 'Monday, Thursday, Friday', '8 am to 9 am, 9 am to 10 am, 10 am to 11 am','KMC Hospital','Main Avenue, Street 3, Karachi', 'Karachi', 'Working in this Field for the past 6 years & had an exceptional reputation in the field', '0310000000','Male', 4000);

INSERT INTO Doctors ([Name], Education, [Available_days], [Available_time], Hospital, Hospital_Address, City, [Description], Phone_number, Gender, Fees)
VALUES ('Dr Zeenish' , 'MBBS MS', 'Friday, Saturday, Sunday', '2 pm to 3 pm, 3 pm to 4 pm, 4 pm to 5 pm','Federal Hospital','Main Avenue, Street 1, Lahore', 'Lahore', 'Working in this Field for the past 2 years', '0310000000','Female', 5000);

INSERT INTO Doctors ([Name], Education, [Available_days], [Available_time], Hospital, Hospital_Address, City, [Description], Phone_number, Gender, Fees)
VALUES ('Dr Buzdar Ali', 'MBBS BPT', 'Monday, Tuseday, Wednesday', '5 pm to 6 pm, 5 pm to 7 pm, 7 pm to 8 pm, 8 pm to 9 pm','Charity Hospital','Main Avenue, Street 8, Islamabad', 'Islamabad', 'Working in this Field for the past 7 years & had an exceptional reputation in the field', '0310000000','Male', 3700);

INSERT INTO Doctors ([Name], Education, [Available_days], [Available_time], Hospital, Hospital_Address, City, [Description], Phone_number, Gender, Fees)
VALUES ('Dr Bisma' , 'MBBS BHMS', 'Friday, Saturday, Sunday', '2 pm to 3 pm, 3 pm to 4 pm, 4 pm to 5 pm','Federal Hospital','Main Avenue, Street 1, Faislabad', 'Faislabad', 'Working in this Field for the past 2 years', '0310000000','Female', 3000);

INSERT INTO Doctors ([Name], Education, [Available_days], [Available_time], Hospital, Hospital_Address, City, [Description], Phone_number, Gender, Fees)
VALUES ('Dr Muzammil', 'MBBS BNYS', 'Monday, Tuseday, Wednesday', '5 pm to 6 pm, 5 pm to 7 pm, 7 pm to 8 pm, 8 pm to 9 pm','Charity Hospital','Main Avenue, Street 8, Quetta', 'Quetta', 'Working in this Field for the past 10 years & had an exceptional reputation in the field', '0310000000','Male', 3300);

INSERT INTO Doctors ([Name], Education, [Available_days], [Available_time], Hospital, Hospital_Address, City, [Description], Phone_number, Gender, Fees)
VALUES ('Dr Anisha' , 'MBBS BUMS', 'Friday, Saturday, Sunday', '2 pm to 3 pm, 3 pm to 4 pm, 4 pm to 5 pm','Federal Hospital','Main Avenue, Street 1, Faislabad', 'Faislabad', 'Working in this Field for the past 2 years', '0310000000','Female', 3000);

INSERT INTO Doctors ([Name], Education, [Available_days], [Available_time], Hospital, Hospital_Address, City, [Description], Phone_number, Gender, Fees)
VALUES ('Dr Faiza' , 'MBBS MS', 'Friday, Saturday, Sunday', '2 pm to 3 pm, 3 pm to 4 pm, 4 pm to 5 pm','Federal Hospital','Main Avenue, Street 1, Lahore', 'Lahore', 'Working in this Field for the past 2 years', '0310000000','Female', 5000);

INSERT INTO Doctors ([Name], Education, [Available_days], [Available_time], Hospital, Hospital_Address, City, [Description], Phone_number, Gender, Fees)
VALUES ('Dr Qadir Ali', 'MBBS BPT', 'Monday, Tuseday, Wednesday', '5 pm to 6 pm, 5 pm to 7 pm, 7 pm to 8 pm, 8 pm to 9 pm','Charity Hospital','Main Avenue, Street 8, Islamabad', 'Islamabad', 'Working in this Field for the past 7 years & had an exceptional reputation in the field', '0310000000','Male', 3700);

INSERT INTO Doctors ([Name], Education, [Available_days], [Available_time], Hospital, Hospital_Address, City, [Description], Phone_number, Gender, Fees)
VALUES ('Dr Parveen Kumar' , 'MBBS BNYS', 'Friday, Saturday, Sunday', '2 pm to 3 pm, 3 pm to 4 pm, 4 pm to 5 pm','Federal Hospital','Main Avenue, Street 1, Faislabad', 'Faislabad', 'Working in this Field for the past 2 years', '0310000000','Female', 3000);

INSERT INTO Doctors ([Name], Education, [Available_days], [Available_time], Hospital, Hospital_Address, City, [Description], Phone_number, Gender, Fees)
VALUES ('Dr Noman' , 'MBBS BHMS', 'Monday, Thursday, Friday', '8 am to 9 am, 9 am to 10 am, 10 am to 11 am, 4 pm to 5 pm','KMC Hospital','Main Avenue, Street 3, Karachi', 'Karachi', 'Working in this Field for the past 6 years & had an exceptional reputation in the field', '0310000000','Male', 4000);




-- Patients
INSERT INTO Patients ([Name], [Address],  City, Phone_number, Gender, Age)
VALUES ('Buzdar', 'House A-1, Area B2,Karachi', 'Karachi', '03100034000', 'Male', 27);

INSERT INTO Patients ([Name], [Address],  City, Phone_number, Gender, Age)
VALUES ('Farooq Ali', 'House C-1, Area D2,Karachi', 'Karachi', '03107600000', 'Male', 25);

INSERT INTO Patients ([Name], [Address],  City, Phone_number, Gender, Age)
VALUES ('Namreen Ali', 'House A-7, Area N2,Lahore', 'Lahore', '03100004500', 'Female', 32);

INSERT INTO Patients ([Name], [Address],  City, Phone_number, Gender, Age)
VALUES ('Kirshan Das', 'House A-10, Area 2,Faislabad', 'Faislabad', '03100089000', 'Male', 37);

INSERT INTO Patients ([Name], [Address],  City, Phone_number, Gender, Age)
VALUES ('Furqan', 'House A-1, Area B2,Quetta', 'Quetta', '03100004300', 'Male', 27);

INSERT INTO Patients ([Name], [Address],  City, Phone_number, Gender, Age)
VALUES ('Namrita Singh', 'House A-7, Area N2,Lahore', 'Lahore', '03100930000', 'Female', 32);

INSERT INTO Patients ([Name], [Address],  City, Phone_number, Gender, Age)
VALUES ('Asad', 'House A-1, Area Z2,Islamabad', 'Islamabad', '03100003700', 'Male', 17);

INSERT INTO Patients ([Name], [Address],  City, Phone_number, Gender, Age)
VALUES ('Fauzia Kamran', 'House A-7, Area N2,Lahore', 'Lahore', '03100870000', 'Female', 32);

INSERT INTO Patients ([Name], [Address],  City, Phone_number, Gender, Age)
VALUES ('Arqam', 'House A-1, Area Z2,Peshawar', 'Peshawar', '03100005600', 'Male', 21);

INSERT INTO Patients ([Name], [Address],  City, Phone_number, Gender, Age)
VALUES ('Fareen Murtaza', 'House A-7, Area N2,Lahore', 'Lahore', '03100039000', 'Female', 32);

INSERT INTO Patients ([Name], [Address],  City, Phone_number, Gender, Age)
VALUES ('Tayyab', 'House j-1, Area Z9,Quetta', 'Quetta', '03100003700', 'Male', 19);

INSERT INTO Patients ([Name], [Address],  City, Phone_number, Gender, Age)
VALUES ('Namreen Ali', 'House A-7, Area N2,Lahore', 'Lahore', '03100004500', 'Female', 32);



