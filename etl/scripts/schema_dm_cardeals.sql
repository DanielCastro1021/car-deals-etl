CREATE TABLE `DIM_Car` (
  `sk_car` int PRIMARY KEY AUTO_INCREMENT COMMENT 'Surrogate key DIM_Car.',
  `plate` char(8) UNIQUE NOT NULL COMMENT 'Car plate number.',
  `variant` varchar(150) NOT NULL COMMENT 'Car variant.',
  `model` varchar(150) NOT NULL COMMENT 'Car model.',
  `brand` varchar(100) NOT NULL COMMENT 'Car make.',
  `torque` int NOT NULL COMMENT 'Car torque in cc.',
  `power` int(8) NOT NULL COMMENT 'Car power in cv.',
  `type` varchar(150) NOT NULL COMMENT 'Car type.',
  `fuel` varchar(80) NOT NULL COMMENT 'Car fuel.',
  `seats` int NOT NULL COMMENT 'Car seat number.',
  `doors` int NOT NULL COMMENT 'Car door number.',
  `transmission` varchar(80) NOT NULL COMMENT 'Car transmission.',
  `color` varchar(80) NOT NULL COMMENT 'Car color.',
  `origin` varchar(80) NOT NULL COMMENT 'Car origin.',
  `supplier` varchar(80) NOT NULL COMMENT 'Car supplier.',
  `warranty` char(3) NOT NULL COMMENT 'Car warranty is "Sim" ou "Não".',
  `registration_date` varchar(10) NOT NULL COMMENT 'Car Date, in month/year',
  `vin` varchar(17) COMMENT 'Car vin number, it can be null.',
  `description` varchar(500) COMMENT 'Car descripton or extra information.'
);

CREATE TABLE `DIM_Stand` (
  `sk_stand` int PRIMARY KEY AUTO_INCREMENT COMMENT 'Surrogate key DIM_Stand.',
  `name` varchar(80) NOT NULL COMMENT 'Stand Name.',
  `phone` char(9) NOT NULL COMMENT 'Stand Phone Number.',
  `address` varchar(200) NOT NULL COMMENT 'Stand Address.',
  `postal_code` char(8) NOT NULL COMMENT 'Stand Postal Code.',
  `city` varchar(80) NOT NULL COMMENT 'Stand City.',
  `commercial_director_name` varchar(80) NOT NULL COMMENT 'Commercial Director Name.',
  `commercial_director_phone_1` char(9) NOT NULL COMMENT 'Commercial Director Phone Number 1.',
  `commercial_director_phone_2` char(9) COMMENT 'Commercial Director Phone Number 2. Can be null.'
);

CREATE TABLE `DIM_Calendar` (
  `sk_calendar` int PRIMARY KEY AUTO_INCREMENT COMMENT 'Surrogate key DIM_Calendar.',
  `date_full` date,
  `day_number` int,
  `day` int,
  `day_of_week_english` varchar(9),
  `day_of_week_portuguese` varchar(13),
  `day_of_week_number` int,
  `week_of_year` int,
  `month_english` varchar(9),
  `month_portuguese` varchar(9),
  `short_month` char(3),
  `calendar_day_label` varchar(50),
  `calendar_day_label_short` varchar(50),
  `calendar_week_number` int,
  `calendar_week_label` varchar(50),
  `calendar_month_number` int,
  `calendar_month_label` varchar(50),
  `calendar_month_year_label` varchar(50),
  `calendar_year` int,
  `calendar_year_label` char(6)
);

CREATE TABLE `FACT_Deals` (
  `sk_car` int,
  `sk_stand` int,
  `sk_publication_day` int,
  `id` int PRIMARY KEY COMMENT 'Degenerate Dimension',
  `price` double,
  `mileage` int
);

ALTER TABLE `FACT_Deals` ADD FOREIGN KEY (`sk_car`) REFERENCES `DIM_Car` (`sk_car`);

ALTER TABLE `FACT_Deals` ADD FOREIGN KEY (`sk_stand`) REFERENCES `DIM_Stand` (`sk_stand`);

ALTER TABLE `FACT_Deals` ADD FOREIGN KEY (`sk_publication_day`) REFERENCES `DIM_Calendar` (`sk_calendar`);
