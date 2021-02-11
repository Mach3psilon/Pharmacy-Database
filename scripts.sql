
alter session set nls_language='ENGLISH' 
;

alter session set nls_date_format='DD-MON-YYYY' 
;

CREATE TABLE Pharmacy_location (  
zip NUMBER(5) NOT NULL,  
city VARCHAR2(255),  
CONSTRAINT city_uk UNIQUE (city), 
CONSTRAINT zip_pk PRIMARY KEY (zip)  
) 
;

CREATE TABLE Person (   
person_ID NUMBER(4) NOT NULL,    
sex VARCHAR2(255),   
date_of_birth DATE,   
first_name VARCHAR2(255),   
second_name VARCHAR2(255),   
last_name VARCHAR2(255),   
CONSTRAINT person_ID_pk PRIMARY KEY (person_ID)   
) 
;

CREATE TABLE Doctor (   
doctor_ID NUMBER(4) NOT NULL REFERENCES Person(person_ID),   
speciality VARCHAR2(255),   
work_place VARCHAR2(255),   
CONSTRAINT doctor_ID_pk PRIMARY KEY (doctor_ID)   
) 
;

CREATE TABLE Pharmacy (   
pharmacy_ID NUMBER(4) NOT NULL,   
pharmacy_name VARCHAR2(255),   
zip NUMBER(5),   
apartment_number NUMBER(10),   
street_name VARCHAR2(255),   
CONSTRAINT pharmacy_zip_fk FOREIGN KEY(zip) REFERENCES Pharmacy_location(zip),  
CONSTRAINT pharmacy_ID_pk PRIMARY KEY (pharmacy_ID)   
) 
;

CREATE TABLE Patient (   
patient_ID NUMBER(4) NOT NULL REFERENCES Person(person_ID),   
insurance_info VARCHAR2(255),   
CONSTRAINT patient_ID_pk PRIMARY KEY (patient_ID)   
) 
;

CREATE TABLE Employee (   
employee_ID NUMBER(4) NOT NULL REFERENCES Person(person_ID),   
employee_type VARCHAR2(255),   
salary NUMBER(10),   
CONSTRAINT employee_ID_pk PRIMARY KEY (employee_ID)   
) 
;

CREATE TABLE Drug (   
drug_ID NUMBER(20) NOT NULL,   
drug_mg NUMBER(10) NOT NULL,   
drug_name VARCHAR2(255),   
drug_form VARCHAR2(255),   
drug_amount NUMBER(10),   
price NUMBER(10),   
expiration_date DATE,   
CONSTRAINT drug_ID_pk PRIMARY KEY (drug_ID)   
) 
;

CREATE TABLE Pharmacy_phone (   
pharmacy_ID NUMBER(4) NOT NULL REFERENCES Pharmacy(Pharmacy_ID),   
phone_number NUMBER(11) NOT NULL,   
CONSTRAINT pharmacy_phone_ID_pk PRIMARY KEY (pharmacy_ID,phone_number)   
) 
;

CREATE TABLE Inventory (   
inventory_ID NUMBER(10) NOT NULL,   
drug_ID NUMBER(4) NOT NULL ,   
drug_amount NUMBER(10),   
last_update_date DATE,   
pharmacy_ID NUMBER(4) NOT NULL,  
CONSTRAINT pharmacy_ID_fk FOREIGN KEY (pharmacy_ID) REFERENCES Pharmacy(pharmacy_ID),  
CONSTRAINT drug_ID_fk FOREIGN KEY (drug_ID) REFERENCES Drug(drug_ID),  
CONSTRAINT inventory_drug_pk PRIMARY KEY (inventory_ID,drug_ID)   
) 
;

CREATE TABLE Payment (   
payment_ID NUMBER(20) NOT NULL,   
drug_amount NUMBER(11) NOT NULL,   
payment_date DATE,    
drug_ID NUMBER(4) NOT NULL, 
pharmacy_ID NUMBER(4) NOT NULL,   
CONSTRAINT payment_pharmacy_ID_fk FOREIGN KEY (pharmacy_ID) REFERENCES Pharmacy(pharmacy_ID),   
CONSTRAINT payment_drug_ID_fk FOREIGN KEY (drug_ID) REFERENCES Drug(drug_ID), 
CONSTRAINT payment_ID_pk PRIMARY KEY (payment_ID)   
) 
;

CREATE TABLE Prescribes (   
drug_ID NUMBER(4) NOT NULL REFERENCES Drug(drug_ID),   
doctor_ID NUMBER(4) NOT NULL REFERENCES Doctor(doctor_ID),   
quantity NUMBER(10),   
prescription_date DATE,   
CONSTRAINT doctor_drug_pk PRIMARY KEY (doctor_ID,drug_ID)   
) 
;

CREATE TABLE Uses (   
person_ID NUMBER(4) NOT NULL REFERENCES Person(person_ID),   
drug_ID NUMBER(4) NOT NULL REFERENCES Drug(drug_ID),   
CONSTRAINT person_drug_pk PRIMARY KEY (person_ID,drug_ID)   
) 
;

CREATE TABLE Serves (   
employee_ID NUMBER(4) NOT NULL REFERENCES Employee(employee_ID),   
person_ID  NUMBER(4) NOT NULL REFERENCES Person(person_ID),   
CONSTRAINT serves_pk PRIMARY KEY (employee_ID,person_ID)   
) 
;

CREATE TABLE Visits (   
person_ID NUMBER(4) NOT NULL REFERENCES Person(person_ID),   
doctor_ID NUMBER(4) NOT NULL REFERENCES Doctor(doctor_ID),   
CONSTRAINT visits_pk PRIMARY KEY (person_ID,doctor_ID)   
) 
;

CREATE TABLE Person_phone (  
person_phone_ID NUMBER(4) NOT NULL REFERENCES Person(person_ID),  
phone_number NUMBER(11) NOT NULL,  
CONSTRAINT person_phone_pk PRIMARY KEY (person_phone_ID,phone_number)  
) 
;

INSERT INTO Pharmacy_location VALUES(45000,'Manisa')
;

INSERT INTO Pharmacy_location VALUES(46000,'K.Maraş')
;

INSERT INTO Pharmacy_location VALUES(47000,'Mardin')
;

INSERT INTO Pharmacy_location VALUES(48000,'Muğla')
;

INSERT INTO Pharmacy_location VALUES(49000,'Muş')
;

INSERT INTO Pharmacy_location VALUES(50000,'Nevşehir')
;

INSERT INTO Pharmacy_location VALUES(51000,'Niğde')
;

INSERT INTO Pharmacy_location VALUES(52000,'Ordu')
;

INSERT INTO Pharmacy_location VALUES(53000,'Rize')
;

INSERT INTO Pharmacy_location VALUES(54000,'Sakarya')
;

INSERT INTO Pharmacy_location VALUES(55000,'Samsun')
;

INSERT INTO Pharmacy_location VALUES(56000,'Siirt')
;

INSERT INTO Pharmacy_location VALUES(57000,'Sinop')
;

INSERT INTO Pharmacy_location VALUES(58000,'Sivas')
;

INSERT INTO Pharmacy_location VALUES(59000,'Tekirdağ')
;

INSERT INTO Pharmacy_location VALUES(60000,'Tokat')
;

INSERT INTO Pharmacy_location VALUES(61000,'Trabzon')
;

INSERT INTO Pharmacy_location VALUES(62000,'Tunceli')
;

INSERT INTO Pharmacy_location VALUES(63000,'Ş.Urfa')
;

INSERT INTO Pharmacy_location VALUES(64000,'Uşak')
;

select * from pharmacy_location
;

INSERT INTO Pharmacy VALUES(1,'Aynur Pharmacy',45000,2,'Aynur Street')
;

INSERT INTO Pharmacy VALUES(2,'Mert Yatır Pharmacy',46000,3,'Yatır Street')
;

INSERT INTO Pharmacy VALUES(3,'Mert Türker Pharmacy',47000,4,'Türker Street')
;

INSERT INTO Pharmacy VALUES(4,'İlayda Pharmacy',48000,5,'İlayda Street')
;

INSERT INTO Pharmacy VALUES(5,'Göktay Pharmacy',49000,6,'Göktay Street')
;

INSERT INTO Pharmacy VALUES(6,'Eray Pharmacy',50000,7,'Eray Street')
;

INSERT INTO Pharmacy VALUES(7,'Damla Pharmacy',51000,8,'Damla Street')
;

INSERT INTO Pharmacy VALUES(8,'Büşra Pharmacy',52000,9,'Büşra Street')
;

INSERT INTO Pharmacy VALUES(9,'Leyla Pharmacy',53000,10,'Leyla Street')
;

INSERT INTO Pharmacy VALUES(10,'Hüseyin Pharmacy',54000,11,'Hüseyin Street')
;

INSERT INTO Pharmacy VALUES(11,'Damla Pharmacy',55000,12,'Damla Street')
;

INSERT INTO Pharmacy VALUES(12,'A Pharmacy',56000,13,'A Street')
;

INSERT INTO Pharmacy VALUES(13,'B Pharmacy',57000,14,'B Street')
;

INSERT INTO Pharmacy VALUES(14,'C Pharmacy',58000,15,'C Street')
;

INSERT INTO Pharmacy VALUES(15,'D Pharmacy',59000,16,'D Street')
;

INSERT INTO Pharmacy VALUES(16,'E Pharmacy',60000,17,'E Street')
;

INSERT INTO Pharmacy VALUES(17,'F Pharmacy',61000,18,'F Street')
;

INSERT INTO Pharmacy VALUES(18,'G Pharmacy',62000,19,'D Street')
;

INSERT INTO Pharmacy VALUES(19,'H Pharmacy',63000,20,'H Street')
;

INSERT INTO Pharmacy VALUES(20,'I Pharmacy',64000,21,'I Street')
;

select * from pharmacy
;

Insert into Drug values (1,20,'Aferin','Pill', 12, 20, '15-FEB-2022')
;

Insert into Drug values (2,10,'Parol','Pill', 12, 20, '15-FEB-2022')
;

Insert into Drug values (3,5,'Aferin','Liquid', 0, 30, '16-FEB-2022')
;

Insert into Drug values (21,10,'Azarga','Pill', 35, 25, '17-FEB-2022')
;

Insert into Drug values (4,20,'Afinitor','Pill', 25, 12, '18-FEB-2022')
;

Insert into Drug values (5,10,'Cataflam','Injection', 0, 20, '19-FEB-2022')
;

Insert into Drug values (6,50,'Certican','Drop', 0, 50, '20-FEB-2022')
;

Insert into Drug values (7,10,'Ciloxan','Pill', 15, 27, '21-FEB-2022')
;

Insert into Drug values (8,20,'Azopt',' Liquid ', 0, 10, '22-FEB-2022')
;

 Insert into Drug values (9,10,'Diovan','Troches ', 20, 8, '23-FEB-2022')
;

Insert into Drug values (10,25,'Duotrav','Troches ', 62, 9, '24-FEB-2022')
;

Insert into Drug values (11,5,'Exelon','Pill', 40, 2, '25-FEB-2022')
;

 Insert into Drug values (12,5,'Exforge','Pill', 17, 1, '26-FEB-2022')
;

Insert into Drug values (13,5,'Flarex','Pill', 40, 1, '27-FEB-2022')
;

Insert into Drug values (14,10,'Galvus','Pill', 10, 16, '28-FEB-2022')
;

Insert into Drug values (15,10,'Jakavi','Injection ', 0, 20, '1-MAR-2022')
;

Insert into Drug values (16,10,'Lescol','Pill', 12, 22, '2-MAR-2022')
;

Insert into Drug values (17,5,'Lopresor','Pill', 15, 29, '3-MAR-2022')
;

Insert into Drug values (18,5,'Miflodile','Drop', 0, 3, '4-MAR-2022')
;

Insert into Drug values (19,15,'Myfortic','Pill', 35, 5, '5-MAR-2022')
;

Insert into drug values(20, 200, 'Nurofen', 'Pill', 24, 19, '15-SEP-2022')
;

select * from drug
;

Insert into Inventory values (1000, 1, 150, '01-JAN-2021', 1)
;

Insert into Inventory values (1000, 2, 230, '01-JAN-2021', 1)
;

Insert into Inventory values (1000, 3, 300, '03-JAN-2021', 1)
;

Insert into Inventory values (1000, 4, 400, '01-JAN-2021', 1)
;

Insert into Inventory values (1000, 5, 500, '09-JAN-2021', 1)
;

Insert into Inventory values (2000, 6, 600, '10-JAN-2021', 2)
;

Insert into Inventory values (2000, 7, 700, '01-JAN-2021', 2)
;

Insert into Inventory values (2000, 8, 100, '01-JAN-2021', 2)
;

Insert into Inventory values (2000, 9, 120, '3-JAN-2021', 2)
;

Insert into Inventory values (3000, 10, 150, '27-JAN-2021', 3)
;

Insert into Inventory values (3000, 11, 200, '01-JAN-2021', 3)
;

Insert into Inventory values (3000, 12, 210, '13-JAN-2021', 3)
;

Insert into Inventory values (3000, 13, 300, '01-JAN-2021', 3)
;

Insert into Inventory values (3000, 14, 250, '23-JAN-2021', 3)
;

Insert into Inventory values (4000, 9, 210, '11-JAN-2021', 4)
;

Insert into Inventory values (4000, 10, 260, '01-JAN-2021', 4)
;

Insert into Inventory values (5000, 11, 120, '01-FEB-2021', 5)
;

Insert into Inventory values (5000, 12, 250, '01-FEB-2021', 5)
;

Insert into Inventory values (5000, 13, 205, '12-FEB-2021', 5)
;

Insert into Inventory values (6000, 14, 510, '01-FEB-2021', 6)
;

Insert into Inventory values (6000, 15, 190, '16-JAN-2021', 6)
;

Insert into Inventory values (6000, 16, 180, '01-JAN-2021', 6)
;

Insert into Inventory values (7000, 17, 250, '01-MAR-2021', 7)
;

Insert into Inventory values (7000, 18, 500, '01-JAN-2021', 7)
;

Insert into Inventory values (8000, 19, 100, '01-JAN-2021', 8)
;

Insert into Inventory values (8000, 20, 150, '06-JAN-2021', 8)
;

Insert into Inventory values (8000, 17, 200, '03-AUG-2021', 8)
;

Insert into Inventory values (9000, 13, 100, '01-AUG-2021', 9)
;

Insert into Inventory values (9000, 14, 281, '12-JUL-2021', 9)
;

Insert into Inventory values (9000, 15, 392, '01-AUG-2021', 9)
;

Insert into Inventory values (9000, 16, 240, '01-JAN-2021', 9)
;

Insert into Inventory values (10000, 1, 500, '27-DEC-2020', 10)
;

Insert into Inventory values (10000, 2, 600, '02-DEC-2020', 10)
;

Insert into Inventory values (10000, 3, 700, '01-OCT-2020', 10)
;

Insert into Inventory values (10000, 4, 200, '14-JAN-2021', 10)
;

Insert into Inventory values (10000, 5, 250, '01-JAN-2021', 10)
;

Insert into Inventory values (10000, 17, 270, '01-MAR-2021', 10)
;

Insert into Inventory values (10000, 18, 200, '22-JAN-2021', 10)
;

Insert into Inventory values (11000, 15, 250, '01-JUN-2021', 11)
;

Insert into Inventory values (11000, 4, 200, '01-JUN-2021', 11)
;

Insert into Inventory values (12000, 3, 500, '07-JUN-2021', 12)
;

Insert into Inventory values (12000, 2, 850, '08-JUN-2021', 12)
;

Insert into Inventory values (12000, 1, 290, '01-JUN-2021', 12)
;

Insert into Inventory values (12000, 7, 250, '14-JAN-2021', 12)
;

Insert into Inventory values (13000, 8, 850, '01-JAN-2021', 13)
;

Insert into Inventory values (13000, 5, 125, '18-NOV-2021', 13)
;

Insert into Inventory values (13000, 10, 530, '01-NOV-2021', 13)
;

Insert into Inventory values (14000, 15, 235, '01-NOV-2021', 14)
;

Insert into Inventory values (14000, 20, 233, '06-NOV-2021', 14)
;

Insert into Inventory values (15000, 8, 257, '01-DEC-2021', 15)
;

Insert into Inventory values (16000, 11, 250, '01-DEC -2021', 16)
;

Insert into Inventory values (17000, 9, 580, '01-DEC -2021', 17)
;

Insert into Inventory values (18000, 13, 450, '12-DEC -2021', 18)
;

Insert into Inventory values (18000, 11, 450, '12-DEC -2021', 18)
;

Insert into Inventory values (19000, 12, 190, '01-DEC -2021', 19)
;

Insert into Inventory values (20000, 19, 181, '28-DEC -2021', 20)
;

Insert into Inventory values (20000, 20, 164, '11-DEC-2021', 20)
;

select * from inventory
;


Insert Into Payment values (100, 2, '12-Jan-2019', 1, 1)
;

Insert Into Payment values (101, 5, '12-Jan-2020', 1,1)
;

Insert Into Payment values (102, 3, '12-Jan-2020', 7,2)
;

Insert Into Payment values (103, 2, '12-Jan-2020', 11,3)
;

Insert Into Payment values (104, 3, '12-Jan-2020', 9,4)
;

Insert Into Payment values (105, 6, '12-Jan-2020',12,5)
;

Insert Into Payment values (106, 1, '12-Jan-2020',13,5)
;

Insert Into Payment values (107, 4, '12-Jan-2020',16,6)
;

Insert Into Payment values (108, 7, '12-Jan-2020',18,7)
;

Insert Into Payment values (109, 2, '12-Jan-2020',17,8)
;

Insert Into Payment values (110, 3, '12-Jan-2020',15,9)
;

Insert Into Payment values (111, 1, '12-Jan-2020',4,10)
;

Insert Into Payment values (112, 15, '12-Jan-2020', 15,11)
;

Insert Into Payment values (113, 6, '12-Jan-2020', 2,12)
;

Insert Into Payment values (114, 3, '12-Jan-2020',1,12)
;

Insert Into Payment values (115, 2, '12-Jan-2020', 8,13)
;

Insert Into Payment values (116, 12, '12-Jan-2020', 20,14)
;

Insert Into Payment values (117, 9, '12-Jan-2020',8,15)
;

Insert Into Payment values (118, 4, '12-Jan-2020', 11,18)
;

Insert Into Payment values (119, 1, '12-Jan-2020', 12,19)
;

Insert Into Payment values (120, 6, '12-Jan-2020', 20,20)
;

select * from payment
;


update inventory set drug_amount = drug_amount - (select drug_amount from payment where payment_ID = 100)  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID =100)  
and drug_ID= (select drug_ID from payment where payment_ID = 100)
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment where payment_ID = 101)  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID =101)  
and drug_ID= (select drug_ID from payment where payment_ID = 101)
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment where payment_ID = 104)  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID =104)  
and drug_ID= (select drug_ID from payment where payment_ID = 104)
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment where payment_ID = 102)  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID =102)  
and drug_ID= (select drug_ID from payment where payment_ID = 102)
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment where payment_ID = 103)  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID =103)  
and drug_ID= (select drug_ID from payment where payment_ID = 103)
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment where payment_ID = 105)  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID =105)  
and drug_ID= (select drug_ID from payment where payment_ID = 105)
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment where payment_ID = 106)  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID =106) 
and drug_ID= (select drug_ID from payment where payment_ID = 106)
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment where payment_ID = 107)  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID =107)  
and drug_ID= (select drug_ID from payment where payment_ID = 107)
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment  
where payment_ID =  108 )  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID = 108 )  
and drug_ID= (select drug_ID from payment where payment_ID =  108 )
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment  
where payment_ID =  109 )  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID = 109 )  
and drug_ID= (select drug_ID from payment where payment_ID =  109 )
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment  
where payment_ID =  110 )  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID = 110 )  
and drug_ID= (select drug_ID from payment where payment_ID =  110 )
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment  
where payment_ID =  111 )  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID = 111 )  
and drug_ID= (select drug_ID from payment where payment_ID =  111 )
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment  
where payment_ID =  112 )  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID = 112 )  
and drug_ID= (select drug_ID from payment where payment_ID =  112 )
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment  
where payment_ID =  113 )  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID = 113 )  
and drug_ID= (select drug_ID from payment where payment_ID =  113 )
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment  
where payment_ID =  114 )  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID = 114 )  
and drug_ID= (select drug_ID from payment where payment_ID =  114 )
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment  
where payment_ID =  115 )  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID = 115 )  
and drug_ID= (select drug_ID from payment where payment_ID =  115 )
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment  
where payment_ID =  116 )  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID = 116 )  
and drug_ID= (select drug_ID from payment where payment_ID =  116 )
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment  
where payment_ID =  117 )  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID = 117 )  
and drug_ID= (select drug_ID from payment where payment_ID =  117 )
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment  
where payment_ID =  118 )  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID = 118 )  
and drug_ID= (select drug_ID from payment where payment_ID =  118 )
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment  
where payment_ID =  119 )  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID = 119 )  
and drug_ID= (select drug_ID from payment where payment_ID =  119 )
;

update inventory set drug_amount = drug_amount - (select drug_amount from payment  
where payment_ID =  120 )  
where pharmacy_ID= (select pharmacy_ID  from payment where payment_ID = 120 )  
and drug_ID= (select drug_ID from payment where payment_ID =  120 )
;

select * from inventory
;

Insert into Person values (1, 'Male ', '17-AUG-1999', ' Goktay ', ' Tufan ', ' Incekara ') 
;

Insert into Person values (2, 'Female ', '05-JUN-2000', ' İlayda',  'None ', ' Özel ') 
;

Insert into Person values (3, 'Male ', '13-FEB-1999', ' Mert ', ' None ', ' Atış ') 
;

Insert into Person values (4, 'Male ', '01-JAN-1999', ' Cem ', ' Tufan ', ' Okutay ') 
;

Insert into Person values (5, 'Male ', '11-FEB-1989', ' Duhan ', ' None ', ' Yatır ') 
;

Insert into Person values (6, 'Male ', '19-JUN-2000', ' Efe ', ' None', ' Özdemir ') 
;

Insert into Person values (7, 'Male ', '10-JUL-1999', ' Eray ', ' Efe ', ' Yılmaz ') 
;

Insert into Person values (8, 'Male ', '14-AUG-1969', ' Mehmet ', ' Ali ', ' Öz ') 
;

Insert into Person values (9, 'Male ', '16-SEP-1990', ' Gökhan ', ' None ', ' Yıldız ') 
;

Insert into Person values (10, 'Male ', '27-NOV-1989', ' Arslan ', ' Kaplan ', ' Saygı ') 
;

Insert into Person values (11, 'Male ', '23-DEC-1999', ' Kaplan ', 'Efe ', ' Öz ') 
;

Insert into Person values (12, 'Male ', '21-OCT-1999', ' Celal ', ' Kurt ', ' Ince') 
;

Insert into Person values (13, 'Female ', '16-AUG-1999', ' Ceren ', ' Can ', ' Gürsel ') 
;

Insert into Person values (14, 'Female ', '15-AUG-1999', ' Merve ', ' Kurtoğlu ', ' Ince ') 
;

Insert into Person values (15, 'Female ', '21-AUG-1999', ' Aynur ', ' Aslı ', ' Kelebek ') 
;

Insert into Person values (16, 'Female ', '02-AUG-1979', ' Zeynep ', ' None ', ' Gürses') 
;

Insert into Person values (17, 'Male ', '01-FEB-1959', ' Çağman ', ' None ', ' Deniz ') 
;

Insert into Person values(18, 'Male ', '05-AUG-1959', ' Kutluhan ', ' Tufan ', ' TATAR') 
;

Insert into Person values (19, 'Female ', '06-AUG-1990', ' Defne', ' Aslı ', ' Arman ') 
;

Insert into Person values (20, 'Female ', '07-OCT-1989', ' Servi ', ' None ', ' Saylık ') 
;

Insert into Person values (21, 'Female ', '08-AUG-1998', ' Eylül ', ' Ekin ', ' Hasret ') 
;

Insert into Person values (22, 'Male ', '27-NOV-1899', ' Ege ', ' None ', ' Arısoy ') 
;

Insert into Person values (23, 'Male ', '17-OCT-1699', ' Onat ', ' Efe ', ' Arat ') 
;

Insert into Person values (24, 'Male ', '15-APR-2004', ' Mehmet ', ' Arslan ', ' Okutay') 
;

Insert into Person values (25, 'Male ', '07-APR-2007', ' Mert ', ' Atar ', ' Tatar') 
;

Insert into Person values (26, 'Male ', '15-AUG-1999', ' Ahmet ', ' Esen ', ' Çınardalı ') 
;

Insert into Person values (27, 'Male ', '14-MAR-1999', ' Ahmetcan ', ' Akıl ', ' Özdemir ') 
;

Insert into Person values (28, 'Male ', '11-AUG-1999', ' Salih ', ' Amel ', ' Ur') 
;

Insert into Person values (29, 'Male ', '12-JUN-1999', ' Enver ', ' Hasim ', ' Özçelik ') 
;

Insert into Person values (30, 'Male ', '09-AUG-1599', ' Muhammed ', ' Arslan ', ' Karasu ') 
;

Insert into Person values (31, 'Male ', '13-AUG-1989', ' Ali ', ' Tufan ', ' Ateş ') 
;

Insert into Person values (32, 'Female ', '15-DEC-1979', ' Nil ', ' None ', ' Akar ') 
;

Insert into Person values (33, 'Female ' , '22-AUG-1990', ' Merve ', ' Cebeci ', ' Ayatalay ') 
;

Insert into Person values (34, 'Female ', '21-NOV-1999', ' Açelya', ' Gül ', ' Çiçek ') 
;

Insert into Person values (35, 'Female ', '04-SEP-1999', ' Ada ', ' Deniz ', ' Tenekeci ') 
;

Insert into Person values (36, 'Female ', '24-AUG-1999', ' Sevinç ', ' Öfke ', ' Oğuz ') 
;

Insert into Person values (37, 'Female ', '05-FEB-1999', ' Deniz ', ' Nehir ', ' Toprak ') 
;

Insert into Person values (38, 'Female ', '14-JUL-1999', ' Seher ', ' Yıldız ', ' Tamer') 
;

Insert into Person values (39, 'Female ', '15-AUG-1990', ' Aslıhan ', ' None', ' Çınar ') 
;

Insert into Person values (40, 'Female ', '07-MAY-2000', ' İlknur ', ' Bahar ', ' Incekara ') 
;

Insert into Person values (41, 'Female ', '15-JUN-1969', ' Pelinsu', ' None ', ' Güven ') 
;

Insert into Person values (42, 'Female ', '06-NOV-1979', ' Yağmur', ' Şimşek ', ' Tanrıversin ') 
;

Insert into Person values(43, 'Female ', '01-OCT-1959', ' Ilgın ', ' None ', ' Ekim ') 
;

Insert into Person values(44, 'Male ', '12-FEB-1970', ' Yusuf ', ' None ', ' Yıldırım ') 
;

Insert into Person values(45, 'Male ', '13-AUG-1981', ' Âdem ', ' İnsan ', ' Demir ') 
;

Insert into Person values (46, 'Female ', '11-SEP-1989', ' Havva ', ' Bade', ' Türköz ') 
;

Insert into Person values (47, 'Male ', '01-SEP-1909', ' Emre ', ' None ', ' Akyıldız') 
;

Insert into Person values (48, 'Female ', '17-JAN-1974', ' Melis ', ' None ', ' Türker ') 
;

Insert into Person values(49, 'Male ', '12-FEB-1989', ' Ege ', ' Efe ', ' Gürsel ') 
;

Insert into Person values(50, 'Female ', '19-DEC-1990', ' Aynur ', ' None ', ' Cevahirci ') 
;

Insert into Person values(51, 'Male ', '17-NOV-1973', ' Mert ', ' Can', ' Incekara ') 
;

Insert into Person values(52, 'Male ', '17-AUG-1975', ' Goktay ', ' Yıldız ', ' Yılmaz') 
;

Insert into Person values(53, 'Female ', '26-FEB-1989', ' İlayda ', ' Mihriban ', ' Yağmur') 
;

Insert into Person values(54, 'Female ', '01-AUG-1982', ' Ceren ', ' None ', ' Güven ') 
;

Insert into Person values(55, 'Male ', '20-AUG-1979', ' Oğuz ', ' Tufan ', ' Onur ') 
;

Insert into Person values (56, 'Male ', '12-JUN-1985', ' Ahmet', ' Efe ', ' Tuğullar ') 
;

Insert into Person values (57, 'Male ', '11-FEB-1973', ' Ege ', ' Kürşat', ' Öz ') 
;

Insert into Person values(58, 'Female ', '15-DEC-1985', ' Büşra ', ' Peri ', ' Tekin ') 
;

Insert into Person values (59, 'Male ', '13-AUG-1984', ' Erdem ', ' Ali ', ' Kıran') 
;

Insert into Person values (60, 'Female ', '15-JUN-1979', ' Ekin ', ' None ', 'Aygün ') 
;

Insert into Person values (61, 'Male ', '12-JUN-1986', ' Ali ', ' Efe ', ' Tuğullar ') 
;

Insert into Person values (62, 'Male ', '11-FEB-1976', ' Barkın ', ' Kürşat', ' Özkan ') 
;

Insert into Person values (63, 'Female ', '15-DEC-1989', ' Melis ', ' Peri ', ' Tekin ') 
;

Insert into Person values(64, 'Male ', '13-AUG-1985', ' Kerem ', ' Ali ', ' Polat') 
;

Insert into Person values(65, 'Female ', '15-JUN-1980', ' Ekin ', ' Bölük ', 'Ay ') 
;

Insert into Person values (66, 'Female ', '15-DEC-1989', ' Melis ', ' Peri ', ' Tekin ') 
;

Insert into Person values (67, 'Male ', '11-JUN-1982', ' Berk ', ' Korkmaz ', ' Polat') 
;

Insert into Person values (68, 'Female ', '10-AUG-1987', ' Ekin ', ' Işıl ', 'Ay ')
;

select * from Person
;

Insert into Patient values (1,274787)
;

Insert into Patient values (2,274788)
;

Insert into Patient values (3,274789)
;

Insert into Patient values (4,274790)
;

Insert into Patient values (5,274791)
;

Insert into Patient values (6,274792)
;

Insert into Patient values (7,274793)
;

Insert into Patient values (8,274794)
;

Insert into Patient values (9,274795)
;

Insert into Patient values (10,274796)
;

Insert into Patient values (11,274797)
;

Insert into Patient values (12,274798)
;

Insert into Patient values (13,274799)
;

Insert into Patient values (14,274800)
;

Insert into Patient values (15,274801)
;

Insert into Patient values (16,274802)
;

Insert into Patient values (17,274803)
;

Insert into Patient values (18,274804)
;

Insert into Patient values (19,274805)
;

Insert into Patient values ( 20,274806)
;

select * from Patient
;

Insert into Doctor values(41, ' Neurologist ', 'Hospital ')
;

Insert into Doctor values(42, '  Endocrinologist ', 'Hospital ')
;

Insert into Doctor values (43, ' Psychiatrist ', 'Hospital ')
;

Insert into Doctor values (44, ' Psychiatrist ', 'Health Clinic ')
;

Insert into Doctor values  (45, ' Surgeon ', 'Hospital ')
;

Insert into Doctor values (46, ' Neurologist ', ' Health clinic ')
;

Insert into Doctor values (47, ' Psychiatrist ', 'Hospital ')
;

Insert into Doctor values (48, ' Dermatologist ', 'Hospital ')
;

Insert into Doctor values (49, ' Surgeon ', 'Hospital ')
;

Insert into Doctor values (50, ' Psychiatrist ', 'Health clinic ')
;

Insert into Doctor values (51, ' Endocrinologist ', 'Policlinic')
;

Insert into Doctor values (52, ' Dermatologist ', 'Hospital ')
;

Insert into Doctor values (53, ' Psychiatrist ', ' Health clinic ')
;

Insert into Doctor values (54, ' Surgeon ', 'Hospital ')
;

Insert into Doctor values (55, ' Psychiatrist ', ' Policlinic ')
;

Insert into Doctor values (56, ' Surgeon ', 'Health clinic ')
;

Insert into Doctor values (57, ' Psychiatrist ', 'Policlinic')
;

Insert into Doctor values (58, ' Surgeon ', 'Health clinic ')
;

Insert into Doctor values (59, ' Dermatologist ', 'Policlinic')
;

Insert into Doctor values (60, ' Surgeon ', 'Health clinic ')
;

select * from doctor
;

INSERT INTO Pharmacy_phone VALUES(1, 05364954394)
;

INSERT INTO Pharmacy_phone VALUES(1, 05364953624)
;

INSERT INTO Pharmacy_phone VALUES(2, 05386927503)
;

INSERT INTO Pharmacy_phone VALUES(3, 05472062860)
;

INSERT INTO Pharmacy_phone VALUES(4, 05458782967)
;

INSERT INTO Pharmacy_phone VALUES(4, 05478106893)
;

INSERT INTO Pharmacy_phone VALUES(5, 05371968396)
;

INSERT INTO Pharmacy_phone VALUES(6, 05348691860)
;

INSERT INTO Pharmacy_phone VALUES(7, 05306919681)
;

INSERT INTO Pharmacy_phone VALUES(7, 05329671063)
;

INSERT INTO Pharmacy_phone VALUES(7, 05404869348)
;

INSERT INTO Pharmacy_phone VALUES(8, 05367173828)
;

INSERT INTO Pharmacy_phone VALUES(9, 05365782828)
;

INSERT INTO Pharmacy_phone VALUES(10, 05348964968)
;

INSERT INTO Pharmacy_phone VALUES(10, 05404363572)
;

INSERT INTO Pharmacy_phone VALUES(11, 05350975073)
;

INSERT INTO Pharmacy_phone VALUES(12, 05394684969)
;

INSERT INTO Pharmacy_phone VALUES(13, 05304968486)
;

INSERT INTO Pharmacy_phone VALUES(14, 05305987935)
;

INSERT INTO Pharmacy_phone VALUES(15, 05403617235)
;

INSERT INTO Pharmacy_phone VALUES(16, 05357589783)
;

INSERT INTO Pharmacy_phone VALUES(17, 05324675745)
;

INSERT INTO Pharmacy_phone VALUES(18, 05403463464)
;

INSERT INTO Pharmacy_phone VALUES(18, 05359456750)
;

INSERT INTO Pharmacy_phone VALUES(19, 05304986943)
;

INSERT INTO Pharmacy_phone VALUES(20, 05340964096)
;

INSERT INTO Pharmacy_phone VALUES(20, 05404869348)
;

select * from pharmacy_phone
;

INSERT INTO Person_phone VALUES(1,05479469911)
;

INSERT INTO Person_phone VALUES(2,05413033854)
;

INSERT INTO Person_phone VALUES(3,05490009987)
;

INSERT INTO Person_phone VALUES(4,05450512768)
;

INSERT INTO Person_phone VALUES(5,05300934700)
;

INSERT INTO Person_phone VALUES(6,05457786319)
;

INSERT INTO Person_phone VALUES(7,05494642593)
;

INSERT INTO Person_phone VALUES(8,05331057623)
;

INSERT INTO Person_phone VALUES(9,05399535686)
;

INSERT INTO Person_phone VALUES(10,05363498210)
;

INSERT INTO Person_phone VALUES(11,05451059285)
;

INSERT INTO Person_phone VALUES(12,05404519069)
;

INSERT INTO Person_phone VALUES(13,05345244529)
;

INSERT INTO Person_phone VALUES(14,05376964348)
;

INSERT INTO Person_phone VALUES(15,05364849993)
;

INSERT INTO Person_phone VALUES(16,05481925059)
;

INSERT INTO Person_phone VALUES(17,05482711151)
;

INSERT INTO Person_phone VALUES(18,05453487961)
;

INSERT INTO Person_phone VALUES(19,05459391315)
;

INSERT INTO Person_phone VALUES(20,05400936820)
;

INSERT INTO Person_phone VALUES(21,05418278248)
;

INSERT INTO Person_phone VALUES(22,05376563043)
;

INSERT INTO Person_phone VALUES(23,05363345441)
;

INSERT INTO Person_phone VALUES(24,05319138381)
;

INSERT INTO Person_phone VALUES(25,05493201643)
;

INSERT INTO Person_phone VALUES(26,05408831881)
;

INSERT INTO Person_phone VALUES(27,05330203913)
;

INSERT INTO Person_phone VALUES(28,05372468329)
;

INSERT INTO Person_phone VALUES(29,05494287211)
;

INSERT INTO Person_phone VALUES(30,05450750808)
;

INSERT INTO Person_phone VALUES(31,05485473736)
;

INSERT INTO Person_phone VALUES(32,05481423686)
;

INSERT INTO Person_phone VALUES(33,05302324701)
;

INSERT INTO Person_phone VALUES(34,05450347391)
;

INSERT INTO Person_phone VALUES(35,05402912856)
;

INSERT INTO Person_phone VALUES(36,05329554753)
;

INSERT INTO Person_phone VALUES(37,05342194994)
;

INSERT INTO Person_phone VALUES(38,05465723772)
;

INSERT INTO Person_phone VALUES(39,05475826191)
;

INSERT INTO Person_phone VALUES(40,05337657828)
;

INSERT INTO Person_phone VALUES(41,05429005882)
;

INSERT INTO Person_phone VALUES(42,05479893133)
;

INSERT INTO Person_phone VALUES(43,05368423269)
;

INSERT INTO Person_phone VALUES(44,05347108179)
;

INSERT INTO Person_phone VALUES(45,05335273020)
;

INSERT INTO Person_phone VALUES(46,05313051545)
;

INSERT INTO Person_phone VALUES(47,05336776666)
;

INSERT INTO Person_phone VALUES(48,05376077445)
;

INSERT INTO Person_phone VALUES(49,05362640054)
;

INSERT INTO Person_phone VALUES(50,05459499733)
;

INSERT INTO Person_phone VALUES(51,05448126670)
;

INSERT INTO Person_phone VALUES(52,05309289330)
;

INSERT INTO Person_phone VALUES(53,05433436475)
;

INSERT INTO Person_phone VALUES(54,05306289547)
;

INSERT INTO Person_phone VALUES(55,05319976014)
;

INSERT INTO Person_phone VALUES(56,05348022127)
;

INSERT INTO Person_phone VALUES(57,05425958462)
;

INSERT INTO Person_phone VALUES(58,05427709568)
;

INSERT INTO Person_phone VALUES(59,05344850402)
;

INSERT INTO Person_phone VALUES(60,05388309666)
;

INSERT INTO Person_phone VALUES(61,05405738038)
;

INSERT INTO Person_phone VALUES(62,05355113250)
;

INSERT INTO Person_phone VALUES(63,05300246798)
;

INSERT INTO Person_phone VALUES(64,05360436429)
;

INSERT INTO Person_phone VALUES(65,05396079707)
;

INSERT INTO Person_phone VALUES(66,05481112536)
;

INSERT INTO Person_phone VALUES(67,05314597748)
;

INSERT INTO Person_phone VALUES(68,05365416493)
;

select * from person_phone
;
Insert Into Uses values (1, 1); 

Insert Into Uses values (2, 2); 

Insert Into Uses values (3, 3); 

Insert Into Uses values (4, 5); 

Insert Into Uses values (5, 1); 

Insert Into Uses values (6, 2); 

Insert Into Uses values (7, 3); 

Insert Into Uses values (8, 5); 

Insert Into Uses values (7, 1); 

Insert Into Uses values (10, 2); 

Insert Into Uses values (11, 3); 

Insert Into Uses values (1, 5); 

Insert Into Uses values (2, 1); 

Insert Into Uses values (4, 2); 

Insert Into Uses values (13, 3); 

Insert Into Uses values (12, 5); 

Insert Into Uses values (15, 1); 

Insert Into Uses values (17, 2); 

Insert Into Uses values (18, 3); 

Insert Into Uses values (12, 16); 

Insert Into Uses values (12, 8) ; 

Insert Into Uses values (16, 1); 

Insert Into Uses values (15, 9 ); 

Insert Into Uses values (19, 7); 

Insert Into Uses values (9, 6); 

Insert Into Uses values (12, 18) ; 

Insert Into Uses values (15, 13); 

Insert Into Uses values (4, 20); 

Insert Into Uses values (18, 13); 


select * from uses
;
 

Insert into Employee values (21, ' Pharmacist ',6000); 

Insert into Employee values (22, ' Pharmacist ',6000); 

Insert into Employee values(23, ' Pharmacist ', 7000); 

Insert into Employee values(24, ' Pharmacist ', 5000); 

Insert into Employee values(25, ' Pharmacist ', 5000); 

Insert into Employee values(26, ' Pharmacist ', 5000); 

Insert into Employee values(27, ' Pharmacist ', 5000); 

Insert into Employee values(28, ' Pharmacist ', 5000); 

Insert into Employee values(29, ' Pharmacist ', 9000); 

Insert into Employee values (30, ' Pharmacist ', 10000); 

Insert into Employee values (31, ' Pharmacist ', 7000); 

Insert into Employee values (32, ' Pharmacist ', 8000); 

Insert into Employee values (33, ' Pharmacist ', 9000); 

Insert into Employee values (34, ' Pharmacist ', 5000); 

Insert into Employee values(35, ' Pharmacist ', 6000); 

Insert into Employee values (36, ' Pharmacist ', 7000); 

Insert into Employee values (37, ' Pharmacist ',6000 ); 

Insert into Employee values (38, ' Pharmacist ',6000 ); 

Insert into Employee values (39, ' Pharmacist ',8000 ); 

Insert into Employee values (40, ' Pharmacist ',10000); 

Insert into Employee values (61, ' Asistant ',5000 ); 

Insert into Employee values (62, ' Asistant ', 6000); 

Insert into Employee values (63, ' Asistant ',6000 ); 

Insert into Employee values (64, ' Asistant ', 5000); 

Insert into Employee values (65, ' Asistant ',4000 ); 

Insert into Employee values (66, ' Asistant ',3000 ); 

Insert into Employee values (67, ' Asistant ',4000 ); 

Insert into Employee values (68, ' Asistant ',6000 ); 

select * from employee
;
Insert Into Visits values (1, 41);  

  

Insert Into Visits values (2, 51);  

  

Insert Into Visits values (3, 55);  

  

Insert Into Visits values (4, 56);  

  

Insert Into Visits values (5, 48);  

  

Insert Into Visits values (6, 45);  

  

Insert Into Visits values (7, 51);  

  

Insert Into Visits values (8, 47);  

  

Insert Into Visits values (9, 45);  

  

Insert Into Visits values (10, 46);  

  

Insert Into Visits values (1, 45);  

  

Insert Into Visits values (2, 52);  

  

Insert Into Visits values (3, 56);  

  

Insert Into Visits values (4, 57);  

  

Insert Into Visits values (5, 49);  

  

Insert Into Visits values (6, 48);  

  

Insert Into Visits values (7, 57);  

  

Insert Into Visits values (8, 48);  

  

Insert Into Visits values (9, 46);  

  

Insert Into Visits values (10, 44);  

  

Insert Into Visits values(11, 42);  

  

Insert Into Visits values(11, 56);  

  

Insert Into Visits values(11, 58);  

  

Insert Into Visits values(12, 41);  

  

Insert Into Visits values(12, 60);  

  

Insert Into Visits values(13, 44);  

  

Insert Into Visits values(13, 46);  

  

Insert Into Visits values(13, 48);  

  

Insert Into Visits values(14, 59);  

  

Insert Into Visits values(14, 52);  

  

Insert Into Visits values(15, 48);  

  

Insert Into Visits values(15, 41);  

  

Insert Into Visits values(15, 60);  

  

Insert Into Visits values(16, 46);  

  

Insert Into Visits values(16, 43);  

  

Insert Into Visits values(17, 47);  

  

Insert Into Visits values(17, 57);  

  

Insert Into Visits values(18, 45);  

  

Insert Into Visits values(18, 41);  

  

Insert Into Visits values(19, 47);  

  

Insert Into Visits values(19, 41);  

  

Insert Into Visits values(19, 42);  

  

Insert Into Visits values(20, 47);  

  

Insert Into Visits values(20, 53);  

  

Insert Into Visits values(20, 51);  

  

Insert Into Visits values (3, 52);  

  

Insert Into Visits values (4, 58);  

  

Insert Into Visits values (5, 42);  

  

Insert Into Visits values (6, 46);  

  

Insert Into Visits values (7, 56); 

select * from visits
;

Insert Into Serves values (23, 1);  

  

Insert Into Serves values (21, 2);  

  

Insert Into Serves values (22, 3);  

  

Insert Into Serves values (25, 4);  

  

Insert Into Serves values (27, 5);  

  

Insert Into Serves values (28, 6);  

  

Insert Into Serves values (31, 7);  

  

Insert Into Serves values (21, 8);  

  

Insert Into Serves values (21, 9);  

  

Insert Into Serves values (29, 10);  

  

Insert Into Serves values (24, 11);  

  

Insert Into Serves values (32, 12);  

  

Insert Into Serves values (34, 13);  

  

Insert Into Serves values (33, 14);  

  

Insert Into Serves values (24, 15);  

  

Insert Into Serves values (35, 16);  

  

Insert Into Serves values (66, 17);  

  

Insert Into Serves values (67, 18);  

  

Insert Into Serves values (68, 19);  

  

Insert Into Serves values (62, 20);  

  

Insert Into Serves values (34, 1);  

  

Insert Into Serves values (35, 2);  

  

Insert Into Serves values (36, 3);  

  

Insert Into Serves values (37, 4);  

  

Insert Into Serves values (38, 5);  

  

Insert Into Serves values (39, 6);  

  

Insert Into Serves values (31, 17);  

  

Insert Into Serves values (40, 8);  

  

Insert Into Serves values (61, 9);  

  

Insert Into Serves values (29, 13);  

  

Insert Into Serves values (64, 1);  

  

Insert Into Serves values (62, 2);  

  

Insert Into Serves values (34, 3);  

  

Insert Into Serves values (63, 14);  

  

Insert Into Serves values (24, 5);  

  

Insert Into Serves values (35, 19);  

  

Insert Into Serves values (66, 18);  

  

Insert Into Serves values (67, 1);  

  

Insert Into Serves values (68, 9);  

  

Insert Into Serves values (62, 5); 

select * from serves
;


Insert Into Prescribes values (1, 41, 3, '21-DEC-2020');  

  

Insert Into Prescribes values (2, 42, 4, '21-JAN-2021');  

  

Insert Into Prescribes values (3, 43, 7, '12-FEB-2021');  

  

Insert Into Prescribes values (1, 44, 2, '11-NOV-2020');  

  

Insert Into Prescribes values (1, 45, 1, '15-OCT-2020');  

  

Insert Into Prescribes values (1, 46, 3, '21-DEC-2020');  

  

Insert Into Prescribes values (2, 47,94, '21-JAN-2021');  

  

Insert Into Prescribes values (3, 48, 7, '12-FEB-2021');  

  

Insert Into Prescribes values (1, 50, 2, '11-NOV-2020');  

  

Insert Into Prescribes values (10, 51, 1, '18-OCT-2020');  

  

Insert Into Prescribes values (1, 52, 3, '21-DEC-2020');  

  

Insert Into Prescribes values (2, 52, 4, '25-JAN-2021');  

  

Insert Into Prescribes values (3, 52, 7, '04-FEB-2021');  

  

Insert Into Prescribes values (1, 54, 2, '01-NOV-2020');  

  

Insert Into Prescribes values (1, 55 ,1, '12-OCT-2020');  

  

Insert Into Prescribes values (1, 43, 3, '29-DEC-2020');  

  

Insert Into Prescribes values (2, 53, 4, '27-JAN-2021');  

  

Insert Into Prescribes values (3, 44, 7, '16-FEB-2021');  

  

Insert Into Prescribes values (1, 56, 2, '21-NOV-2020');  

  

Insert Into Prescribes values (1, 59, 1, '19-OCT-2020'); 

select * from prescribes
;
