CREATE DATABASE Online_Food_Orders1;
Go 
USE Online_Food_Orders1;

-- create dimension tables 
-- create customer table 
CREATE TABLE Dim_Customer(
Customer_ID INT Primary KEY,
Customer_Name VARCHAR(150),
Customer_Email VARCHAR(150),
Customer_Address  VARCHAR(255),
Phone_Number VARCHAR(20),
Device_Type VARCHAR(250),
Preffered_Cusine VARCHAR(250),
Sign_Up_Date DATE,
Total_Spend DECIMAL(15),
Last_Order_Date DATE
);

--create resturant table
CREATE TABLE Dim_Restaurant(
Restaurant_ID INT Primary Key,
Restaurant_Name VARCHAR(100),
Restaurant_Email VARCHAR(50), 
Restaurant_Address  VARCHAR(255),
Phone_Number VARCHAR(20),
Cusine_Type  VARCHAR(20),
Average_Rating DECIMAL(10,2),
Average_Preparation_Time TIME
);

--Create Product Table
Create TABLE Dim_Product(
Product_ID INT Primary Key,
Product_Name VARCHAR(100),
Product_Category VARCHAR(255),
Product_Price DECIMAL(10,2),
Average_Product_Rating DECIMAL(10,2),
Stock_Availability VARCHAR(250),

Restaurant_ID INT
FOREIGN KEY (Restaurant_ID)
REFERENCES Dim_Restaurant(Restaurant_ID)
);

--Create Location Table 
Create TABLE Dim_Location(
Location_ID INT Primary Key,
Counrty VARCHAR(150),
Province VARCHAR(150),
City VARCHAR(150),
City_Type VARCHAR(150),
Zip_Code INT
);

--Create Date Table 
Create TABLE Dim_Date(
Date_ID INT Primary Key,
Year INT,
Quarter INT,
MONTH INT, 
DAY INT,
Weekday_Weekend VARCHAR(20),
Holiday_Flag VARCHAR(3),
);

--Create Delivery Person Table
Create TABLE Dim_Dlivery_Partner(
Partner_ID INT Primary Key,
Partner_Name VARCHAR(255),
License_Number VARCHAR(10),
Phone_Number VARCHAR(10),
Vehicle_Type VARCHAR(250),
Average_Delivery_Time TIME,
Total_Deliveries INT
);

--Create Order_Facts Table
Create TABLE Order_Facts(
Order_ID INT Primary Key,

Order_Amount DECIMAL(10,2),

Order_Quantity INT,

Discount DECIMAL(10,2),

Unit_Price DECIMAL(10,2),

Order_Status VARCHAR(150),

Delivery_Type VARCHAR(250),

Order_Channel VARCHAR(250),

Order_hour TIME,

Estimated_Delivery_Time TIME,

Actual_Delivery_Time TIME,

Total_Price DECIMAL(10,2),

Promo_Code VARCHAR(10),

Customer_ID INT
FOREIGN KEY(Customer_ID)
REFERENCES Dim_Customer(Customer_ID),

Restaurant_ID INT
FOREIGN KEY(Restaurant_ID)
REFERENCES Dim_Restaurant(Restaurant_ID),

Location_ID INT
FOREIGN KEY(Location_ID)
REFERENCES Dim_Location(Location_ID),

Product_ID INT
FOREIGN KEY(Product_ID)
REFERENCES Dim_Product(Product_ID),

Date_ID INT
FOREIGN KEY(Date_ID)
REFERENCES Dim_Date(Date_ID),

Partner_ID INT
FOREIGN KEY(Partner_ID)
REFERENCES Dim_Dlivery_Partner(Partner_ID)
);
 
INSERT INTO Dim_Customer VALUES
(1, 'Lungile Dlala', 'Lungile.d@gmail.com', '45 Pine Street, Pretoria', '0723456789', 'Android', 'Fast Food', '2023-05-12', 2450.75, '2026-03-28'),
(2, 'Naledi Mokoena', 'naledi.m@gmail.com', '12 Sunset Blvd, Johannesburg', '0812345678', 'iOS', 'Italian', '2024-01-20', 1320.50, '2026-03-25'),
(3, 'Sipho Dlamini', 'sipho.d@gmail.com', '89 Vilakazi Street, Soweto', '0739876543', 'Android', 'African', '2022-11-05', 3890.20, '2026-03-30'),
(4, 'Aisha Khan', 'aisha.khan@gmail.com', '22 Long Street, Cape Town', '0741122334', 'Web', 'Indian', '2023-07-18', 2755.00, '2026-03-27'),
(5, 'Michael Smith', 'm.smith@gmail.com', '10 Beach Road, Durban', '0825566778', 'iOS', 'Seafood', '2024-02-10', 980.00, '2026-03-22'),
(6,'Kabelo Sithole','kabelo.s@gmail.com','23 Market St, Johannesburg','0711111111','Android','Fast Food','2023-08-10',1850.50,'2026-03-29'),
(7,'Nomsa Zulu','nomsa.z@gmail.com','11 Palm Ave, Durban','0722222222','iOS','African','2024-02-14',950.00,'2026-03-26'),
(8,'Peter Adams','peter.a@gmail.com','5 Church St, Cape Town','0733333333','Web','Italian','2022-12-01',4200.75,'2026-03-30'),
(9,'Thandi Molefe','thandi.m@gmail.com','77 Nelson Rd, Pretoria','0744444444','Android','Indian','2023-09-21',2100.00,'2026-03-28'),
(10,'Brian Jacobs','b.jacobs@gmail.com','9 Sea Point, Cape Town','0755555555','iOS','Seafood','2024-01-05',1200.20,'2026-03-24'),

(11,'Lungile Khumalo','lungile.k@gmail.com','14 Umlazi Rd, Durban','0766666666','Android','Fast Food','2023-03-11',3000.00,'2026-03-27'),
(12,'Sarah Daniels','sarah.d@gmail.com','44 Green St, Stellenbosch','0777777777','Web','Italian','2023-06-18',1750.80,'2026-03-25'),
(13,'Mandla Ncube','mandla.n@gmail.com','88 Freedom Way, Soweto','0788888888','Android','African','2022-10-10',3900.00,'2026-03-30'),
(14,'Kevin Naidoo','kevin.n@gmail.com','3 Ridge Rd, Durban','0799999999','iOS','Indian','2024-02-28',1100.00,'2026-03-23'),
(15,'Zodwa Cele','zodwa.c@gmail.com','21 Hill St, Pietermaritzburg','0712121212','Android','Fast Food','2023-11-15',800.50,'2026-03-22'),

(16,'Andre Botha','andre.b@gmail.com','6 Farm Rd, Bloemfontein','0723434343','Web','Steakhouse','2023-01-09',2600.00,'2026-03-26'),
(17,'Tshepo Mokoena','tshepo.m@gmail.com','101 Main Rd, Pretoria','0735656565','Android','Fast Food','2022-08-12',5000.00,'2026-03-30'),
(18,'Nandi Dube','nandi.d@gmail.com','45 Lake View, Richards Bay','0747878787','iOS','Seafood','2023-07-07',1900.30,'2026-03-28'),
(19,'Jason Williams','jason.w@gmail.com','67 Beach Rd, Cape Town','0759090909','Web','Italian','2024-03-01',670.00,'2026-03-24'),
(20,'Faith Modise','faith.m@gmail.com','12 Sunrise Blvd, Midrand','0762323232','Android','Healthy','2023-05-25',2100.00,'2026-03-29'),

(21,'Oscar Phiri','oscar.p@gmail.com','34 Park St, Polokwane','0774545454','Android','African','2023-02-14',1450.00,'2026-03-27'),
(22,'Lebo Ramaphosa','lebo.r@gmail.com','9 Central Ave, Sandton','0786767676','iOS','Fine Dining','2024-01-11',3200.00,'2026-03-30'),
(23,'Emma Stone','emma.s@gmail.com','18 Vineyard Rd, Stellenbosch','0798989898','Web','Desserts','2023-09-09',890.00,'2026-03-26'),
(24,'Chris Brown','chris.b@gmail.com','56 Industrial Rd, Rustenburg','0710101010','Android','Fast Food','2022-11-20',2750.00,'2026-03-25'),
(25,'Ayanda Ngcobo','ayanda.n@gmail.com','7 Coastal Rd, Durban','0720202020','iOS','Seafood','2023-12-05',1600.00,'2026-03-28'),

(26,'Neo Mashaba','neo.m@gmail.com','12 River Rd, Pretoria','0731112233','Android','Fast Food','2023-06-12',2100.00,'2026-03-30'),
(27,'Karabo Seema','karabo.s@gmail.com','8 Sunset Ave, Johannesburg','0742223344','iOS','Italian','2024-02-02',980.50,'2026-03-28'),
(28,'Lerato Phiri','lerato.p@gmail.com','55 Central St, Polokwane','0753334455','Web','African','2023-09-15',1500.75,'2026-03-27'),
(29,'Bongani Zungu','bongani.z@gmail.com','77 Coastal Rd, Durban','0764445566','Android','Seafood','2022-11-11',3200.00,'2026-03-29'),
(30,'Mpho Nkuna','mpho.n@gmail.com','21 Freedom Rd, Soweto','0775556677','Android','Fast Food','2023-08-08',1750.20,'2026-03-26'),

(31,'Zanele Mthembu','zanele.m@gmail.com','4 Palm Rd, Durban','0786667788','iOS','Indian','2024-01-21',1200.00,'2026-03-24'),
(32,'Thato Molefe','thato.m@gmail.com','89 Market St, Pretoria','0797778899','Web','Healthy','2023-05-19',950.00,'2026-03-25'),
(33,'Ayabonga Ndlovu','aya.n@gmail.com','15 Hill Rd, Cape Town','0718889900','Android','Desserts','2022-12-30',600.00,'2026-03-23'),
(34,'Reece Daniels','reece.d@gmail.com','100 Beach Rd, Cape Town','0729990011','iOS','Seafood','2023-10-05',2100.40,'2026-03-29'),
(35,'Sizwe Khumalo','sizwe.k@gmail.com','33 Umlazi Rd, Durban','0730001122','Android','African','2023-03-22',2600.00,'2026-03-30'),

(36,'Megan Smith','megan.s@gmail.com','9 Park Rd, Johannesburg','0741112233','Web','Italian','2024-02-12',890.00,'2026-03-28'),
(37,'Tumi Ramokgopa','tumi.r@gmail.com','44 Green Rd, Pretoria','0752223344','Android','Fast Food','2023-07-07',3300.00,'2026-03-27'),
(38,'Brandon Peters','brandon.p@gmail.com','76 Ocean Rd, Cape Town','0763334455','iOS','Seafood','2022-09-14',4100.00,'2026-03-30'),
(39,'Naledi Seema','naledi.s@gmail.com','5 City Rd, Sandton','0774445566','Android','Fine Dining','2023-11-18',2900.00,'2026-03-29'),
(40,'Siphesihle Dube','sipho.d@gmail.com','60 Main Rd, Durban','0785556677','Web','Fast Food','2023-06-01',1200.00,'2026-03-25'),

(41,'Kagiso Mokoena','kagiso.m@gmail.com','88 Central Ave, Midrand','0796667788','Android','Healthy','2024-01-10',1450.00,'2026-03-26'),
(42,'Zama Cele','zama.c@gmail.com','13 Coastal Rd, Richards Bay','0717778899','iOS','Seafood','2023-08-15',2100.00,'2026-03-28'),
(43,'Ryan Jacobs','ryan.j@gmail.com','22 Industrial Rd, Rustenburg','0728889900','Web','Steakhouse','2022-10-10',3100.00,'2026-03-30'),
(44,'Boitumelo Phala','boitumelo.p@gmail.com','11 Freedom Rd, Bloemfontein','0739990011','Android','African','2023-09-09',1700.00,'2026-03-27'),
(45,'Lindiwe Ngcobo','lindiwe.n@gmail.com','7 Beach Rd, Durban','0740001122','iOS','Seafood','2023-12-12',2200.00,'2026-03-29');

INSERT INTO Dim_Restaurant VALUES
(1, 'Burger Haven', 'contact@burgerhaven.co.za', '100 Main Road, Pretoria', '0123456789', 'Fast Food', 4.50, '00:20:00'),
(2, 'Pasta Palace', 'info@pastapalace.co.za', '55 Sandton Drive, Johannesburg', '0112233445', 'Italian', 4.70, '00:30:00'),
(3, 'Shisa Nyama Grill', 'hello@shisanyama.co.za', '78 Vilakazi Street, Soweto', '0109988776', 'African', 4.30, '00:25:00'),
(4, 'Spice Route', 'orders@spiceroute.co.za', '12 Long Street, Cape Town', '0215566778', 'Indian', 4.60, '00:35:00'),
(5, 'Ocean Basket Express', 'support@oceanbasket.co.za', '9 Beach Road, Durban', '0313344556', 'Seafood', 4.40, '00:28:00'),
(6,'Grill House','info@grillhouse.co.za','12 Sandton Rd, Johannesburg','0111111111','Steakhouse',4.80,'00:35:00'),
(7,'Pizza Zone','orders@pizzazone.co.za','45 Main Rd, Pretoria','0122222222','Italian',4.40,'00:25:00'),
(8,'Mama Africa Kitchen','contact@mamaafrica.co.za','78 Vilakazi St, Soweto','0103333333','African',4.60,'00:30:00'),
(9,'Curry Express','info@curryexpress.co.za','9 Durban Rd, Durban','0314444444','Indian',4.50,'00:28:00'),
(10,'Ocean Fresh','hello@oceanfresh.co.za','22 Beach Rd, Cape Town','0215555555','Seafood',4.70,'00:32:00'),

(11,'Healthy Bites','support@healthybites.co.za','5 Green St, Midrand','0106666666','Healthy',4.30,'00:20:00'),
(12,'Sweet Treats','info@sweettreats.co.za','33 Sugar Rd, Pretoria','0127777777','Desserts',4.60,'00:15:00'),
(13,'Burger King SA','contact@burgerking.co.za','88 Mall Rd, Johannesburg','0118888888','Fast Food',4.20,'00:18:00'),
(14,'Nandos','info@nandos.co.za','99 Flame Rd, Durban','0319999999','Fast Food',4.70,'00:22:00'),
(15,'KFC','support@kfc.co.za','101 Chicken Rd, Cape Town','0211212121','Fast Food',4.10,'00:20:00'),

(16,'Steers','hello@steers.co.za','67 Grill Ave, Pretoria','0122323232','Fast Food',4.30,'00:19:00'),
(17,'Debonairs Pizza','info@debonairs.co.za','23 Pizza St, Johannesburg','0113434343','Italian',4.50,'00:25:00'),
(18,'Fishaways','support@fishaways.co.za','56 Ocean Rd, Durban','0314545454','Seafood',4.40,'00:27:00'),
(19,'Spur','contact@spur.co.za','12 Ranch Rd, Cape Town','0215656565','Steakhouse',4.60,'00:30:00'),
(20,'Wimpy','info@wimpy.co.za','77 Breakfast Rd, Pretoria','0126767676','Fast Food',4.20,'00:18:00'),

(21,'Tashas','info@tashas.co.za','9 Luxury Ave, Sandton','0117878787','Fine Dining',4.80,'00:35:00'),
(22,'Mugg & Bean','hello@muggandbean.co.za','44 Coffee Rd, Johannesburg','0118989898','Cafe',4.50,'00:20:00'),
(23,'Kauai','support@kauai.co.za','15 Health Rd, Cape Town','0219090909','Healthy',4.60,'00:18:00'),
(24,'Romans Pizza','info@romans.co.za','88 Cheese Rd, Pretoria','0121010101','Italian',4.30,'00:22:00'),
(25,'Galitos','contact@galitos.co.za','66 Flame Rd, Johannesburg','0112020202','Fast Food',4.40,'00:21:00'),

(26,'Urban Grill','info@urbangrill.co.za','12 City Rd, Pretoria','0123030303','Steakhouse',4.70,'00:30:00'),
(27,'Pizza Hub','orders@pizzahub.co.za','55 Main Rd, Johannesburg','0113131313','Italian',4.40,'00:25:00'),
(28,'Township Eats','contact@townshipeats.co.za','78 Vilakazi St, Soweto','0103232323','African',4.60,'00:28:00'),
(29,'Spice Delight','info@spicedelight.co.za','9 Curry Rd, Durban','0313333333','Indian',4.50,'00:27:00'),
(30,'Ocean Delight','hello@oceandelight.co.za','22 Beach Rd, Cape Town','0213434343','Seafood',4.70,'00:32:00'),

(31,'Green Bowl','support@greenbowl.co.za','5 Healthy Rd, Midrand','0103535353','Healthy',4.30,'00:20:00'),
(32,'Sugar Rush','info@sugarrush.co.za','33 Dessert Rd, Pretoria','0123636363','Desserts',4.60,'00:15:00'),
(33,'Burger Express','contact@burgerexpress.co.za','88 Fast Rd, Johannesburg','0113737373','Fast Food',4.20,'00:18:00'),
(34,'Chicken Licken','info@chickenlicken.co.za','99 Flame Rd, Durban','0313838383','Fast Food',4.70,'00:22:00'),
(35,'Hungry Lion','support@hungrylion.co.za','101 Chicken Rd, Cape Town','0213939393','Fast Food',4.10,'00:20:00'),

(36,'Grill King','hello@grillking.co.za','67 Grill Ave, Pretoria','0124040404','Steakhouse',4.30,'00:19:00'),
(37,'Pizza Perfect','info@pizzaperfect.co.za','23 Pizza St, Johannesburg','0114141414','Italian',4.50,'00:25:00'),
(38,'Fish Market','support@fishmarket.co.za','56 Ocean Rd, Durban','0314242424','Seafood',4.40,'00:27:00'),
(39,'Ranch House','contact@ranchhouse.co.za','12 Ranch Rd, Cape Town','0214343434','Steakhouse',4.60,'00:30:00'),
(40,'Morning Cafe','info@morningcafe.co.za','77 Breakfast Rd, Pretoria','0124444444','Cafe',4.20,'00:18:00'),

(41,'Luxury Dine','info@luxurydine.co.za','9 Elite Ave, Sandton','0114545454','Fine Dining',4.80,'00:35:00'),
(42,'Coffee Corner','hello@coffeecorner.co.za','44 Coffee Rd, Johannesburg','0114646464','Cafe',4.50,'00:20:00'),
(43,'Fresh Stop','support@freshstop.co.za','15 Health Rd, Cape Town','0214747474','Healthy',4.60,'00:18:00'),
(44,'Cheese World','info@cheeseworld.co.za','88 Cheese Rd, Pretoria','0124848484','Italian',4.30,'00:22:00'),
(45,'Flame House','contact@flamehouse.co.za','66 Flame Rd, Johannesburg','0114949494','Fast Food',4.40,'00:21:00');

INSERT INTO Dim_Product VALUES
(1, 'Cheese Burger', 'Main Course', 75.00, 4.50, 'In Stock', 1),
(2, 'Chicken Alfredo Pasta', 'Main Course', 120.00, 4.70, 'In Stock', 2),
(3, 'Grilled Steak', 'Main Course', 150.00, 4.30, 'Low Stock', 3),
(4, 'Butter Chicken', 'Main Course', 130.00, 4.60, 'In Stock', 4),
(5, 'Grilled Prawns', 'Seafood', 180.00, 4.40, 'Out of Stock', 5),
(6,'BBQ Ribs','Main Course',180.00,4.80,'In Stock',6),
(7,'Pepperoni Pizza','Main Course',110.00,4.40,'In Stock',7),
(8,'Pap & Wors','Main Course',90.00,4.60,'In Stock',8),
(9,'Chicken Curry','Main Course',120.00,4.50,'Low Stock',9),
(10,'Grilled Fish','Seafood',150.00,4.70,'In Stock',10),

(11,'Salad Bowl','Healthy',85.00,4.30,'In Stock',11),
(12,'Chocolate Cake','Dessert',60.00,4.60,'In Stock',12),
(13,'Whopper Burger','Fast Food',95.00,4.20,'In Stock',13),
(14,'Peri Peri Chicken','Fast Food',130.00,4.70,'In Stock',14),
(15,'Zinger Burger','Fast Food',85.00,4.10,'In Stock',15),

(16,'Cheese Burger Deluxe','Fast Food',105.00,4.30,'In Stock',16),
(17,'Meat Lovers Pizza','Main Course',140.00,4.50,'In Stock',17),
(18,'Fish & Chips','Seafood',120.00,4.40,'In Stock',18),
(19,'T-Bone Steak','Main Course',200.00,4.60,'Low Stock',19),
(20,'Breakfast Combo','Breakfast',75.00,4.20,'In Stock',20),

(21,'Grilled Chicken Salad','Healthy',95.00,4.80,'In Stock',21),
(22,'Cappuccino','Beverage',35.00,4.50,'In Stock',22),
(23,'Smoothie','Beverage',45.00,4.60,'In Stock',23),
(24,'Margherita Pizza','Main Course',100.00,4.30,'In Stock',24),
(25,'Chicken Wrap','Fast Food',80.00,4.40,'In Stock',25),

(26,'Beef Ribs','Main Course',190.00,4.70,'In Stock',26),
(27,'Hawaiian Pizza','Main Course',120.00,4.40,'In Stock',27),
(28,'Grilled Chicken','Main Course',100.00,4.60,'In Stock',28),
(29,'Lamb Curry','Main Course',140.00,4.50,'Low Stock',29),
(30,'Seafood Platter','Seafood',220.00,4.80,'In Stock',30),

(31,'Vegan Bowl','Healthy',95.00,4.30,'In Stock',31),
(32,'Ice Cream Sundae','Dessert',55.00,4.60,'In Stock',32),
(33,'Double Burger','Fast Food',110.00,4.20,'In Stock',33),
(34,'Hot Wings','Fast Food',90.00,4.70,'In Stock',34),
(35,'Chicken Meal','Fast Food',85.00,4.10,'In Stock',35),

(36,'Steak Plate','Main Course',210.00,4.50,'Low Stock',36),
(37,'BBQ Pizza','Main Course',135.00,4.50,'In Stock',37),
(38,'Grilled Salmon','Seafood',180.00,4.40,'In Stock',38),
(39,'Ribeye Steak','Main Course',230.00,4.60,'In Stock',39),
(40,'Pancake Stack','Breakfast',70.00,4.20,'In Stock',40),

(41,'Protein Salad','Healthy',105.00,4.80,'In Stock',41),
(42,'Latte','Beverage',40.00,4.50,'In Stock',42),
(43,'Green Juice','Beverage',50.00,4.60,'In Stock',43),
(44,'Four Cheese Pizza','Main Course',125.00,4.30,'In Stock',44),
(45,'Chicken Burger','Fast Food',85.00,4.40,'In Stock',45);

INSERT INTO Dim_Location VALUES
(1, 'South Africa', 'Gauteng', 'Pretoria', 'Urban', 0002),
(2, 'South Africa', 'Gauteng', 'Johannesburg', 'Metro', 2000),
(3, 'South Africa', 'Western Cape', 'Cape Town', 'Metro', 8001),
(4, 'South Africa', 'KwaZulu-Natal', 'Durban', 'Coastal', 4001),
(5, 'South Africa', 'Free State', 'Bloemfontein', 'Urban', 9301),
(6,'South Africa','Gauteng','Midrand','Urban',1685),
(7,'South Africa','Gauteng','Centurion','Urban',0157),
(8,'South Africa','Western Cape','Stellenbosch','Town',7600),
(9,'South Africa','KwaZulu-Natal','Pietermaritzburg','Urban',3201),
(10,'South Africa','Eastern Cape','Port Elizabeth','Coastal',6001),
(11,'South Africa','Limpopo','Polokwane','Urban',0700),
(12,'South Africa','North West','Rustenburg','Urban',0300),
(13,'South Africa','Mpumalanga','Nelspruit','Urban',1200),
(14,'South Africa','Northern Cape','Kimberley','Urban',8300),
(15,'South Africa','Free State','Welkom','Town',9459),
(16,'South Africa','Gauteng','Soweto','Township',1804),
(17,'South Africa','KwaZulu-Natal','Richards Bay','Coastal',3900),
(18,'South Africa','Western Cape','George','Town',6530),
(19,'South Africa','Eastern Cape','East London','Coastal',5200),
(20,'South Africa','Mpumalanga','Secunda','Town',2302),
(21,'South Africa','North West','Mahikeng','Town',2745),
(22,'South Africa','Limpopo','Thohoyandou','Town',0950),
(23,'South Africa','Free State','Bethlehem','Town',9701),
(24,'South Africa','Northern Cape','Upington','Town',8800),
(25,'South Africa','Gauteng','Alberton','Urban',1449),

(26,'South Africa','Gauteng','Benoni','Urban',1501),
(27,'South Africa','Gauteng','Boksburg','Urban',1459),
(28,'South Africa','Western Cape','Paarl','Town',7646),
(29,'South Africa','KwaZulu-Natal','Ballito','Coastal',4420),
(30,'South Africa','Eastern Cape','Mthatha','Urban',5100),

(31,'South Africa','Limpopo','Giyani','Town',0826),
(32,'South Africa','North West','Klerksdorp','Urban',2570),
(33,'South Africa','Mpumalanga','Witbank','Urban',1035),
(34,'South Africa','Northern Cape','Springbok','Town',8240),
(35,'South Africa','Free State','Sasolburg','Town',1947),

(36,'South Africa','Gauteng','Kempton Park','Urban',1619),
(37,'South Africa','Gauteng','Roodepoort','Urban',1724),
(38,'South Africa','Western Cape','Hermanus','Coastal',7200),
(39,'South Africa','KwaZulu-Natal','Newcastle','Urban',2940),
(40,'South Africa','Eastern Cape','Grahamstown','Town',6139),

(41,'South Africa','Limpopo','Tzaneen','Town',0850),
(42,'South Africa','North West','Potchefstroom','Town',2520),
(43,'South Africa','Mpumalanga','Ermelo','Town',2350),
(44,'South Africa','Northern Cape','De Aar','Town',7000),
(45,'South Africa','Free State','Kroonstad','Town',9499);

INSERT INTO Dim_Date VALUES
(1, 2026, 1, 3, 28, 'Weekend', 'No'),
(2, 2026, 1, 3, 25, 'Weekday', 'No'),
(3, 2026, 1, 3, 30, 'Weekday', 'YES'),
(4, 2026, 1, 3, 27, 'Weekday', 'YES'),
(5, 2026, 1, 3, 22, 'Weekend', 'No'),
(6,2026,2,4,1,'Weekday','No'),
(7,2026,2,4,2,'Weekday','No'),
(8,2026,2,4,3,'Weekday','No'),
(9,2026,2,4,4,'Weekday','No'),
(10,2026,2,4,5,'Weekday','No'),
(11,2026,2,4,6,'Weekend','No'),
(12,2026,2,4,7,'Weekend','YES'),
(13,2026,2,4,8,'Weekday','No'),
(14,2026,2,4,9,'Weekday','No'),
(15,2026,2,4,10,'Weekday','No'),
(16,2026,2,4,11,'Weekday','No'),
(17,2026,2,4,12,'Weekday','YES'),
(18,2026,2,4,13,'Weekend','No'),
(19,2026,2,4,14,'Weekend','No'),
(20,2026,2,4,15,'Weekday','YES'),
(21,2026,2,4,16,'Weekday','YES'),
(22,2026,2,4,17,'Weekday','No'),
(23,2026,2,4,18,'Weekday','No'),
(24,2026,2,4,19,'Weekend','No'),
(25,2026,2,4,20,'Weekend','No'),
(26,2026,2,4,21,'Weekday','No'),
(27,2026,2,4,22,'Weekday','No'),
(28,2026,2,4,23,'Weekday','YES'),
(29,2026,2,4,24,'Weekday','No'),
(30,2026,2,4,25,'Weekend','No'),

(31,2026,2,4,26,'Weekend','No'),
(32,2026,2,4,27,'Weekday','YES'),
(33,2026,2,4,28,'Weekday','YES'),
(34,2026,2,4,29,'Weekday','YES'),
(35,2026,2,4,30,'Weekday','No'),

(36,2026,2,5,1,'Weekday','No'),
(37,2026,2,5,2,'Weekday','No'),
(38,2026,2,5,3,'Weekday','YES'),
(39,2026,2,5,4,'Weekday','No'),
(40,2026,2,5,5,'Weekend','YES'),

(41,2026,2,5,6,'Weekend','YES'),
(42,2026,2,5,7,'Weekday','No'),
(43,2026,2,5,8,'Weekday','No'),
(44,2026,2,5,9,'Weekday','No'),
(45,2026,2,5,10,'Weekday','No');

INSERT INTO Dim_Dlivery_Partner VALUES
(1, 'Thabo Nkosi', 'GP123456', '0723456789', 'Motorbike', '00:25:00', 520),
(2, 'Lerato Maseko', 'GP654321', '0812345678', 'Car', '00:30:00', 340),
(3, 'Sibusiso Dlamini', 'KZN98765', '0739876543', 'Bicycle', '00:40:00', 210),
(4, 'Ayesha Khan', 'WC456789', '0741122334', 'Motorbike', '00:22:00', 610),
(5, 'John Smith', 'FS112233', '0825566778', 'Car', '00:35:00', 290),
(6,'Kabelo Sithole','GP111222','0711111111','Motorbike','00:24:00',410),
(7,'Nomsa Zulu','KZN222333','0722222222','Car','00:32:00',380),
(8,'Peter Adams','WC333444','0733333333','Bicycle','00:45:00',150),
(9,'Thandi Molefe','GP444555','0744444444','Motorbike','00:23:00',520),
(10,'Brian Jacobs','WC555666','0755555555','Car','00:31:00',300),
(11,'Lungile Khumalo','KZN666777','0766666666','Motorbike','00:26:00',470),
(12,'Sarah Daniels','WC777888','0777777777','Car','00:34:00',290),
(13,'Mandla Ncube','GP888999','0788888888','Motorbike','00:22:00',610),
(14,'Kevin Naidoo','KZN999000','0799999999','Car','00:29:00',330),
(15,'Zodwa Cele','KZN121212','0712121212','Bicycle','00:42:00',200),
(16,'Andre Botha','FS343434','0723434343','Car','00:36:00',260),
(17,'Tshepo Mokoena','GP565656','0735656565','Motorbike','00:21:00',700),
(18,'Nandi Dube','KZN787878','0747878787','Motorbike','00:25:00',480),
(19,'Jason Williams','WC909090','0759090909','Car','00:30:00',350),
(20,'Faith Modise','GP232323','0762323232','Motorbike','00:24:00',520),
(21,'Oscar Phiri','MP454545','0774545454','Car','00:33:00',310),
(22,'Lebo Ramaphosa','GP676767','0786767676','Motorbike','00:23:00',580),
(23,'Emma Stone','WC898989','0798989898','Bicycle','00:44:00',190),
(24,'Chris Brown','FS101010','0710101010','Car','00:35:00',275),
(25,'Ayanda Ngcobo','KZN202020','0720202020','Motorbike','00:26:00',495),

(26,'Gift Mokoena','GP303030','0713030303','Motorbike','00:24:00',480),
(27,'Ntombi Dlamini','KZN313131','0723131313','Car','00:33:00',350),
(28,'Ethan Williams','WC323232','0733232323','Bicycle','00:45:00',180),
(29,'Luyanda Ndlovu','EC333333','0743333333','Motorbike','00:26:00',410),
(30,'Rashid Khan','GP343434','0753434343','Car','00:30:00',290),

(31,'Tshepiso Molefe','GP353535','0763535353','Motorbike','00:23:00',600),
(32,'Zinhle Cele','KZN363636','0773636363','Motorbike','00:25:00',520),
(33,'Daniel Smith','WC373737','0783737373','Car','00:34:00',310),
(34,'Brian Moleko','NW383838','0793838383','Motorbike','00:22:00',650),
(35,'Palesa Khumalo','FS393939','0713939393','Car','00:36:00',270),

(36,'Jonathan Adams','WC404040','0724040404','Bicycle','00:44:00',200),
(37,'Sibusiso Nkosi','KZN414141','0734141414','Motorbike','00:24:00',540),
(38,'Anele Zulu','KZN424242','0744242424','Motorbike','00:25:00',500),
(39,'Kyle Peters','WC434343','0754343434','Car','00:31:00',320),
(40,'Thulani Maseko','MP444444','0764444444','Motorbike','00:23:00',610),

(41,'Brenda Daniels','WC454545','0774545454','Car','00:33:00',300),
(42,'Musa Ngubane','KZN464646','0784646464','Motorbike','00:26:00',470),
(43,'George Naidoo','KZN474747','0794747474','Car','00:29:00',350),
(44,'Zola Dube','GP484848','0714848484','Motorbike','00:22:00',680),
(45,'Ashley Jacobs','WC494949','0724949494','Bicycle','00:43:00',210);

INSERT INTO Order_Facts VALUES
(1, 150.00, 2, 10.00, 75.00, 'Delivered', 'Standard', 'Mobile App', '18:30:00', '19:00:00', '18:55:00', 140.00, 'SAVE10', 1, 1, 1, 1, 1, 1),
(2, 240.00, 2, 20.00, 120.00, 'Delivered', 'Express', 'Web', '13:15:00', '13:45:00', '13:40:00', 220.00, 'DISC20', 2, 2, 2, 2, 2, 2),
(3, 300.00, 2, 0.00, 150.00, 'Cancelled', 'Standard', 'Mobile App', '20:10:00', '20:50:00', NULL, 300.00, NULL, 3, 3, 3, 3, 3, 3),
(4, 130.00, 1, 5.00, 130.00, 'Delivered', 'Standard', 'Mobile App', '19:45:00', '20:15:00', '20:05:00', 125.00, 'SAVE5', 4, 4, 4, 4, 4, 4),
(5, 180.00, 1, 15.00, 180.00, 'Delivered', 'Express', 'Web', '12:30:00', '13:00:00', '12:55:00', 165.00, 'FREED15', 5, 5, 5, 5, 5, 5),
(6,210.00,3,15.00,70.00,'Delivered','Standard','Mobile App','18:10:00','18:40:00','18:35:00',195.00,'SAVE15',1,1,6,1,6,6),
(7,95.00,1,0.00,95.00,'Delivered','Express','Web','12:20:00','12:50:00','12:45:00',95.00,NULL,2,2,7,2,7,7),
(8,260.00,2,20.00,130.00,'Delivered','Standard','Mobile App','19:00:00','19:40:00','19:50:00',240.00,'DISC20',3,3,8,3,8,8),
(9,140.00,2,10.00,70.00,'Cancelled','Standard','Web','20:30:00','21:00:00',NULL,140.00,NULL,4,4,9,4,9,9),
(10,300.00,3,30.00,100.00,'Delivered','Express','Mobile App','17:45:00','18:15:00','18:10:00',270.00,'SAVE30',5,5,10,5,10,10),

(11,180.00,2,10.00,90.00,'Delivered','Standard','Mobile App','13:10:00','13:40:00','13:35:00',170.00,'SAVE10',1,1,11,1,11,11),
(12,220.00,2,0.00,110.00,'Delivered','Standard','Web','14:20:00','14:50:00','14:55:00',220.00,NULL,2,2,12,2,12,12),
(13,160.00,2,5.00,80.00,'Delivered','Express','Mobile App','18:00:00','18:30:00','18:28:00',155.00,'SAVE5',3,3,13,3,13,13),
(14,280.00,2,20.00,140.00,'Delivered','Standard','Web','19:20:00','19:50:00','20:00:00',260.00,'DISC20',4,4,14,4,14,14),
(15,120.00,1,0.00,120.00,'Delivered','Standard','Mobile App','11:30:00','12:00:00','11:55:00',120.00,NULL,5,5,15,5,15,15),

(16,350.00,3,25.00,116.67,'Delivered','Express','Mobile App','18:50:00','19:20:00','19:15:00',325.00,'SAVE25',1,1,16,1,16,16),
(17,90.00,1,0.00,90.00,'Delivered','Standard','Web','10:15:00','10:45:00','10:40:00',90.00,NULL,2,2,17,2,17,17),
(18,275.00,2,15.00,137.50,'Delivered','Express','Mobile App','20:05:00','20:35:00','20:30:00',260.00,'SAVE15',3,3,18,3,18,18),
(19,200.00,2,0.00,100.00,'Cancelled','Standard','Web','21:00:00','21:30:00',NULL,200.00,NULL,4,4,19,4,19,19),
(20,145.00,1,5.00,145.00,'Delivered','Standard','Mobile App','15:25:00','15:55:00','15:50:00',140.00,'SAVE5',5,5,20,5,20,20),

(21,310.00,3,20.00,103.33,'Delivered','Express','Mobile App','18:40:00','19:10:00','19:05:00',290.00,'DISC20',1,1,21,1,21,21),
(22,125.00,1,0.00,125.00,'Delivered','Standard','Web','13:00:00','13:30:00','13:25:00',125.00,NULL,2,2,22,2,22,22),
(23,260.00,2,10.00,130.00,'Delivered','Standard','Mobile App','19:10:00','19:40:00','19:45:00',250.00,'SAVE10',3,3,23,3,23,23),
(24,180.00,2,15.00,90.00,'Delivered','Express','Web','17:30:00','18:00:00','17:55:00',165.00,'SAVE15',4,4,24,4,24,24),
(25,220.00,2,0.00,110.00,'Delivered','Standard','Mobile App','12:45:00','13:15:00','13:10:00',220.00,NULL,5,5,25,5,25,25),

(26,200.00,2,10.00,100.00,'Delivered','Standard','Mobile App','18:00:00','18:30:00','18:25:00',190.00,'SAVE10',26,26,6,26,26,6),
(27,120.00,1,0.00,120.00,'Delivered','Express','Web','13:00:00','13:30:00','13:25:00',120.00,NULL,27,27,7,27,27,7),
(28,300.00,3,20.00,100.00,'Delivered','Standard','Mobile App','19:30:00','20:00:00','20:05:00',280.00,'DISC20',28,28,8,28,28,8),
(29,150.00,1,5.00,150.00,'Cancelled','Standard','Web','20:00:00','20:30:00',NULL,150.00,NULL,29,29,9,29,29,9),
(30,220.00,2,10.00,110.00,'Delivered','Express','Mobile App','17:30:00','18:00:00','17:55:00',210.00,'SAVE10',30,30,10,30,30,10),

(31,180.00,2,0.00,90.00,'Delivered','Standard','Mobile App','12:30:00','13:00:00','12:55:00',180.00,NULL,31,31,11,31,31,11),
(32,95.00,1,0.00,95.00,'Delivered','Standard','Web','11:15:00','11:45:00','11:40:00',95.00,NULL,32,32,12,32,32,12),
(33,260.00,2,20.00,130.00,'Delivered','Express','Mobile App','18:45:00','19:15:00','19:10:00',240.00,'DISC20',33,33,13,33,33,13),
(34,140.00,2,10.00,70.00,'Delivered','Standard','Web','19:10:00','19:40:00','19:35:00',130.00,'SAVE10',34,34,14,34,34,14),
(35,310.00,3,30.00,103.33,'Delivered','Express','Mobile App','20:20:00','20:50:00','20:45:00',280.00,'SAVE30',35,35,15,35,35,15),

(36,125.00,1,0.00,125.00,'Delivered','Standard','Web','14:00:00','14:30:00','14:25:00',125.00,NULL,36,36,16,36,36,16),
(37,275.00,2,15.00,137.50,'Delivered','Express','Mobile App','18:10:00','18:40:00','18:35:00',260.00,'SAVE15',37,37,17,37,37,17),
(38,200.00,2,0.00,100.00,'Cancelled','Standard','Web','21:00:00','21:30:00',NULL,200.00,NULL,38,38,18,38,38,18),
(39,160.00,2,5.00,80.00,'Delivered','Standard','Mobile App','15:30:00','16:00:00','15:55:00',155.00,'SAVE5',39,39,19,39,39,19),
(40,145.00,1,0.00,145.00,'Delivered','Standard','Web','12:45:00','13:15:00','13:10:00',145.00,NULL,40,40,20,40,40,20),

(41,280.00,2,20.00,140.00,'Delivered','Express','Mobile App','18:30:00','19:00:00','18:55:00',260.00,'DISC20',41,41,21,41,41,21),
(42,130.00,1,5.00,130.00,'Delivered','Standard','Web','13:30:00','14:00:00','13:55:00',125.00,'SAVE5',42,42,22,42,42,22),
(43,240.00,2,10.00,120.00,'Delivered','Standard','Mobile App','19:00:00','19:30:00','19:35:00',230.00,'SAVE10',43,43,23,43,43,23),
(44,180.00,2,15.00,90.00,'Delivered','Express','Web','17:00:00','17:30:00','17:25:00',165.00,'SAVE15',44,44,24,44,44,24),
(45,210.00,2,0.00,105.00,'Delivered','Standard','Mobile App','12:00:00','12:30:00','12:25:00',210.00,NULL,45,45,25,45,45,25);

select *
from Dim_Customer;

select *
from Dim_Date;

Select*
From Dim_Dlivery_Partner;

select *
from Dim_Location;

select*
from Dim_Product;

Select *
From Dim_Restaurant;

select *
from Order_Facts;






--SQL Questions
--Retrieve all customers who signed up in the last 6 months.
----select Customer_Name
--from Dim_Customer
--where Sign_Up_Date;

--Find customers whose total spend is greater than 5000.
select Customer_Name
from Dim_Customer
where Total_Spend >=5000;

--List customers along with their preferred cuisine and device type.
select Customer_Name, Preffered_Cusine, Device_Type
from Dim_Customer;

--Show the top 10 customers by total spend.
select TOP 10(Total_Spend) AS'top 10 customers by total spend',Customer_Name
from Dim_Customer;

--Find customers who haven’t placed an order in the last 3 months.


--Retrieve all restaurants with an average rating above 4.5.
--List restaurants by cuisine type and average preparation time.
--Find restaurants located in a specific city.
--Show the top 5 restaurants generating the highest total sales.
--Retrieve restaurants with average preparation time less than 30 minutes.
--List all products with stock availability as “In Stock”.
--Retrieve products with an average rating greater than 4.0.
--Find products belonging to a specific category.
--List products along with their restaurant name.
--Find products priced above 100.
--Retrieve all locations in a specific province.
--List cities with city type “Urban”.
--Find locations with zip codes between 1000 and 2000.
--Show all provinces and the number of cities in each.
--Retrieve locations grouped by city type.
--List all delivery partners with total deliveries greater than 500.
--Find delivery partners with average delivery time less than 30 minutes.
--Show delivery partners along with their vehicle type.
--Retrieve delivery partners licensed in a specific province.
--Find the top 5 delivery partners with the most deliveries.
--List all holidays in the dataset.
--Retrieve all weekends.
--Show all orders in the first quarter of the year.
--Find orders on weekdays only.
--List all dates for a specific month and year.
--Retrieve all orders with status “Delivered”.
--List orders with discounts greater than 10.
--Show the total price of each order.
--Find orders delivered later than the estimated delivery time.
--Retrieve orders for a specific customer.
--Show orders placed via the mobile app.
--List orders with quantity greater than 3.
--Find orders grouped by delivery type.
--Retrieve the total revenue per restaurant.
--Show the number of orders per city.



--1.What is the total revenue generated by the campany over the available period?
--2.How does revenue vary across different cities or provinces? Which regions are the most profitable?
--3.Who are the top 5 customers by total spend, and what patterns can we observe in their ordering behavior?
--4.What is the average order value, and how does it differ across different restaurants or cuisine types?
--5.Which products are ordered most frequently, and which products generate the highest revenue?
--6.Which restaurants contribute the most to overall revenue and which ones underperform?
--How does the average product rating correlate with sales volume?
--Are there any patterns in cuisine preferences across different locations or customer segments?
--What is the average delivery time for all orders, and how does it differ by delivery partner or location?
--Which delivery partners consistently meet or exceed delivery time expectations?
--How many deliveries are late (actual delivery time > estimated delivery time), and what factors contribute to delays?
--Does delivery performance vary between standard vs express deliveries?
--How are customers interacting with the business across different order channels (mobile app, web, in-person)?
--What are the most common preferred cuisines among customers, and how do these preferences vary by city or region?
--Who are the repeat customers and what percentage of revenue do they contribute compared to new customers?
--Are there seasonal or day-of-week trends in customer orders that could inform marketing campaigns?
--What is the cancellation rate, and which factors (time, location, customer segment) are associated with cancelled orders?
--How do discounts and promo codes impact total revenue and customer behavior?
--Are there patterns indicating high-value vs low-value orders based on product types, restaurant, or customer demographics?
--How do orders vary between weekdays and weekends?
--What are the peak ordering hours, and how can this insight optimize staffing and delivery resources?
--Are there holiday periods or special dates where order volume spikes significantly?
--What is the Customer Lifetime Value (CLV) for each major customer segment, and which customers should be targeted for loyalty programs?
--Which delivery partners contribute the most to total revenue and customer satisfaction?
--How do location, cuisine type, and device type interact to influence customer behavior and sales trends?