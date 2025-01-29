create database Hospital_Management_system;
use hospital_management_system;

create table Patients(
Patient_id int primary key,
Name varchar(25),
Age int not null,
Gender varchar(25),
Phone varchar(25),
Address varchar(25));

Desc Patients;


create table Doctors(
Doctor_id int primary key,
Name varchar(25),
Specialization varchar(25),
Phone varchar(25),
Experience int not null
);
Desc Doctors;

create table appointments(
appointment_id int primary key,
patient_id int,
doctor_id int,
appointmentdate varchar(25),
purpose varchar(25),
foreign key (patient_id) references patients(patient_id),
foreign key (doctor_id) references doctors(doctor_id)
);
Desc Appointments;

Create table treatment(
Treatment_id int primary key,
Appointment_id int,
Diagnosis varchar(25),
prescription varchar(25),
foreign key (appointment_id) references appointments(appointment_id)
);


Create table Billing(
Bill_id int primary key,
Appointment_id int,	
Treatment_Cost	decimal(10,2),
Consultation_Fee decimal(10,2),	
Total_Amount decimal(10,2),
foreign key (appointment_id) references appointments(appointment_id)
);






insert into Patients (patient_id,name,age,gender,phone,address) values
(1,'Rahul Mehra',32,'Male','9876543210','New Delhi'),
(2,'Priya Singh',28,'Female','9876543211','Mumbai'),
(3,'Aman Verma',45,'Male','9876543212','Kolkata'),
(4,'Anjali Sharma',30,'Female','9876543213','Bengaluru'),
(5,'Ravi Kumar',50,'Male','9876543214','Chennai'),
(6,'Sneha Patil',35,'Female','9876543215','Pune'),
(7,'Vijay Gupta',60,'Male','9876543216','Hyderabad'),
(8,'Sunita Jain',40,'Female','9876543217','Jaipur'),
(9,'Karan Malhotra',27,'Male','9876543218','Ahmedabad'),
(10,'Neha Kapoor',33,'Female','9876543219','Lucknow');
SELECT * FROM Patients;


insert into Doctors (doctor_id,name,specialization,phone,experience) values
(101,'Dr. Arun Sharma','Cardiologist','8765432100',15),
(102,'Dr. Meena Rao','Neurologist',	'8765432101',12),
(103,'Dr. Rajesh Nair','Dentist','8765432102',20),
(104,'Dr. Kavita Joshi','Cardiologist','8765432103',10),
(105,'Dr. Mohan Lal','General Physician','8765432104',18),
(106,'Dr. Alok Tripathi','Endocrinologist','9456123780',14),
(107,'Dr. Kavita Patel','ENT Specialist','9561234789',11),
(108,'Dr. Simran Kaur','Physiotherapist','9845123678',9);
SELECT * FROM Doctors;


insert into Appointments(appointment_id,patient_id,doctor_id,appointmentdate,purpose) values
(301,1,101,'2025-01-05','Routine Checkup'),
(302,2,103,'2025-01-06','Follow-up'),
(303,3,102,'2025-01-07','Consultation'),
(304,4,104,'2025-01-08','Vaccination'),
(305,5,106,'2025-01-09','Surgery Prep'),
(306,6,null,'2025-01-10','Routine Checkup'),
(307,7,107,'2025-01-11','Diagnosis'),
(308,8,105,'2025-01-12','Consultation'),
(309,9,108,'2025-01-13','Routine Checkup'),
(310,10,103,'2025-01-14','Surgery Follow-up');

insert into treatment (treatment_id,appointment_id,diagnosis,prescription)values
(401,301,'High BP','Amlodipine Aspirin'),
(402,302,'Dental Cavity','Root Canal Treatment'),
(403,303,'Migraine', 'Ibuprofen,Acetaminophen'),
(404,304,'High BP','Amlodipine Aspirin'),
(405,305,'Type-2 Diabetes','Metformin, Insulin'),
(406,306,'Common Cold','Paracetamol, Cetirizine'),
(407,307,'Chronic Sinusitis','Fluticasone'),
(408,308,'Common Cold','Paracetamol, Cetirizine'),
(409,309,'Lower Back Pain','Heat or cold therapy'),
(410,310,'Dental Cavity','Root Canal Treatment');

insert into billing(bill_id,Appointment_id,treatment_cost,consultation_fee,total_amount)values
(501,301,500.00,300.00,800.00),
(502,302,1500.00,500.00,2000.00	),
(503,303,2000.00,800.00,2800.00),
(504,304,700.00,400.00,1100.00),
(505,305,2500.00,1000.00,3500.00),
(506,306,400.00,300.00,700.00),
(507,307,1500.00,300.00,1800.00	),
(508,308,2000.00,500.00,2500.00),
(509,309,600.00,500.00,1100.00),
(510,310,2200.00,700.00,2900.00);



SELECT * FROM Appointments;
select * from patients;
select * from doctors;
select * from treatment;
select * from billing;


select * from patients where Gender = 'Male';

Select * From Patients where Gender = 'Female' and Age >=35;

Select * From Patients Where Age between 40 and 60;

Select * From Doctors where specialization in ('Cardiologist','neurologist','general physician');

Select * From Patients where name like 'a%';

Select * From Patients order by age asc limit 5;

select * from billing order by total_amount desc limit 5 offset 4;
Select * From Doctors order by experience desc limit 5 offset 4;

select distinct purpose from appointments;

select * from patients where name is not null;

Select doctor_id , name , specialization , experience ,
case
when experience >= 12 then 'Best Doctor'
else 'Good Doctor'
end as Remark
from Doctors;

Select name,upper(name) as U_name, address,lower(address) as L_address 
from patients;

Select name,length(name) as L_name from patients;

Select specialization, substring(specialization,1,5) as s_specialization
from doctors;

Select name, replace(name,'Ravi Kumar','Saurabh Mhatre') as replace_name from patients;

Select name, reverse(name) as reversename from doctors;

select age,sqrt(age) as sqrt_age, (round(sqrt(age),2)) as r_sqrt_age ,ceil(sqrt(age)) as c_sqrt_age, floor(sqrt(age)) as f_sqrt_age 
from patients;

select age,power(age,2) as sq_id from patients;

select * from appointments where doctor_id is null;

Select Gender, COUNT(*) AS Total_Patients 
from Patients 
group by  Gender;


Select appointmentdate, year(appointmentdate) as year_of_adate,
month( appointmentdate) as month_of_adate,
day( appointmentdate) as day_of_adate from
appointments;

select count(patientid) as total_patient from patients;
select * from patients;

Select 
min(age) as min_age,
max(age) as max_age,
sum(age) as sum_age,
round(avg(age)) as avg_age,
count(age) as count_age
from patients;
select * from billing;
select round(avg(treatment_cost),2) as Avg_treatment_cost from billing;

select * from appointments;

select gender,count(patient_id)as count_patient from patients group by gender;
select * from doctors;
Select specialization, count(specialization) as count_specialization from doctors group by specialization
having count(specialization) > 1;
Select specialization, count(doctor_id) as count_doctor from doctors group by specialization
having count(doctor_id) >= 1;
select diagnosis,count(treatment_id) as count_treatment from treatment group by diagnosis
having count(treatment_id) > 1;






select * from 
doctors left join
appointments on 
doctors.doctor_id=appointments.doctor_id;


select Doctors.doctorid,Doctors.name,doctors.specialization,doctors.experience,
appointments.appointmentid,appointments.patientid,appointments.purpose
from doctors
join appointments
on doctors.doctorid=appointments.doctorid;

select patients.patientid,doctors.doctorid,appointments.appointmentid,patients.name as patient_name,patients.age,patients.address,
doctors.name as doctor_name,doctors.specialization,
appointments.appointmentdate,appointments.purpose
from patients
join appointments
on patients.patientid=appointments.patientid
join doctors
on doctors.doctorid=appointments.doctorid;
