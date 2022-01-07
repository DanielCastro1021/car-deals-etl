CREATE TABLE `DIM_Car` (
  `sk_car` int PRIMARY KEY AUTO_INCREMENT COMMENT 'Surrogate key DIM_Car.',
  `variant` varchar(150) NOT NULL COMMENT 'Car variant.',
  `model` varchar(150) NOT NULL COMMENT 'Car model.',
  `brand` varchar(100) NOT NULL COMMENT 'Car make.',
  `torque` varchar(8) NOT NULL COMMENT 'Car torque in cc.',
  `power` varchar(8) NOT NULL COMMENT 'Car power in cv.',
  `type` varchar(150) NOT NULL COMMENT 'Car type.',
  `fuel` varchar(80) NOT NULL COMMENT 'Car fuel.',
  `seats` int NOT NULL COMMENT 'Car seat number.',
  `doors` int NOT NULL COMMENT 'Car door number.',
  `transmission` varchar(80) NOT NULL COMMENT 'Car transmission.',
  `color` varchar(80) NOT NULL COMMENT 'Car color.',
  `origin` varchar(80) NOT NULL COMMENT 'Car origin.',
  `supplier` varchar(80) NOT NULL COMMENT 'Car supplier.',
  `warranty` char(3) NOT NULL COMMENT 'Car warranty is "Sim" ou "Não".',
  `plate` char(8) NOT NULL COMMENT 'Car plate number.',
  `vin` varchar(17) COMMENT 'Car vin number, it can be null.',
  `description` varchar(500) COMMENT 'Car descripton or extra information.'
);

CREATE TABLE `DIM_Stand` (
  `sk_stand` int PRIMARY KEY AUTO_INCREMENT COMMENT 'Surrogate key DIM_Stand.',
  `phone` char(9) NOT NULL COMMENT 'Stand Phone Number.',
  `address` varchar(200) NOT NULL COMMENT 'Stand Address.',
  `postal_code` varchar(10) NOT NULL COMMENT 'Stand Postal Code.',
  `city` varchar(80) NOT NULL COMMENT 'Stand City.',
  `country` varchar(80) NOT NULL COMMENT 'Stand Country.',
  `country_abb` char(2) NOT NULL COMMENT 'Country Abbreviation.',
  `commercial_director_name` varchar(255) NOT NULL COMMENT 'Commercial Director Name.',
  `commercial_director_phone_1` char(9) NOT NULL COMMENT 'Commercial Director Phone Number 1.',
  `commercial_director_phone_2` char(9) COMMENT 'Commercial Director Phone Number 2. Can be null.'
);

CREATE TABLE `DIM_Page` (
  `sk_page` int PRIMARY KEY AUTO_INCREMENT COMMENT 'Surrogate key DIM_Page.',
  `title` varchar(150) COMMENT 'Car deal page title.',
  `url` varchar(150) COMMENT 'Car deal page url link.'
);

CREATE TABLE `DIM_Calendar` (
  `sk_calendar` int PRIMARY KEY AUTO_INCREMENT COMMENT 'Surrogate key DIM_Page.',
  `date_text` date,
  `datekey` long,
  `day_number` int,
  `day` int,
  `day_of_year` int,
  `day_of_year_number` int,
  `day_of_week_english` varchar(9),
  `day_of_week_portuguese` varchar(13),
  `day_of_week_number` int,
  `week_of_year` int,
  `month_english` varchar(9),
  `month_portuguese` varchar(9),
  `short_month` char(3),
  `quarter` char(2),
  `half_of_year` char(2),
  `beginning_of_month` date,
  `beginning_of_quarter` date,
  `beginning_of_half_year` date,
  `beginning_of_year` date,
  `beginning_of_month_label` varchar(50),
  `beginning_of_month_label_short` varchar(50),
  `beginning_of_quarter_label` varchar(50),
  `beginning_of_quarter_label_short` varchar(50),
  `beginning_of_half_year_label` varchar(50),
  `beginning_of_half_year_label_short` varchar(50),
  `beginning_of_year_label` varchar(50),
  `beginning_of_year_label_short` varchar(50),
  `calendar_day_label` varchar(50),
  `calendar_day_label_short` varchar(50),
  `calendar_week_number` int,
  `calendar_week_label` varchar(50),
  `calendar_month_number` int,
  `calendar_month_label` varchar(50),
  `calendar_month_year_label` varchar(50),
  `calendar_quarter_number` int,
  `calendar_quarter_label` varchar(12),
  `calendar_quarter_year_label` varchar(12),
  `calendar_half_of_year_number` int,
  `calendar_half_of_year_label` char(9),
  `calendar_year_half_of_year_label` char(7),
  `calendar_year` int,
  `calendar_year_label` char(6),
  `fiscal_month_number` int,
  `fiscal_month_label` char(9),
  `fiscal_quarter_number` int,
  `fiscal_quarter_label` char(9),
  `fiscal_half_of_year_number` int,
  `fiscal_half_of_year_label` char(9),
  `fiscal_year` int,
  `fiscal_year_label` char(6),
  `date_key` long,
  `year_week_key` int,
  `year_month_key` int,
  `year_quarter_key` int,
  `year_half_of_year_key` int,
  `year_key` int,
  `beginning_of_month_key` long,
  `beginning_of_quarter_key` long,
  `beginning_of_half_year_key` long,
  `beginning_of_year_key` long,
  `fiscal_year_month_key` int,
  `fiscal_year_quarter_key` int,
  `fiscal_year_half_of_year_key` int,
  `iso_week_number` iny,
  `portuguese_holiday_flag` int,
  `portuguese_holiday_name` varchar(20),
  `portuguese_holiday_type` varchar(20)
);

CREATE TABLE `FACT_CarDeals` (
  `sk_car` int,
  `sk_stand` int,
  `sk_page` int,
  `sk_publication_day` int,
  `id` int PRIMARY KEY COMMENT 'Degenerate Dimension',
  `price` int,
  `mileage` int,
  `registry_year` int
);

ALTER TABLE `FACT_CarDeals` ADD FOREIGN KEY (`sk_car`) REFERENCES `DIM_Car` (`sk_car`);

ALTER TABLE `FACT_CarDeals` ADD FOREIGN KEY (`sk_stand`) REFERENCES `DIM_Stand` (`sk_stand`);

ALTER TABLE `FACT_CarDeals` ADD FOREIGN KEY (`sk_page`) REFERENCES `DIM_Page` (`sk_page`);

ALTER TABLE `FACT_CarDeals` ADD FOREIGN KEY (`sk_publication_day`) REFERENCES `DIM_Calendar` (`sk_calendar`);
