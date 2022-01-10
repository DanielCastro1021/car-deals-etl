CREATE TABLE `Car` (
  `sk_car` int PRIMARY KEY AUTO_INCREMENT,
  `id` int,
  `price` double,
  `mileage` int,
  `plate` char(8),
  `variant` varchar(150),
  `model` varchar(150),
  `brand` varchar(100),
  `torque` int,
  `power` int(8),
  `type` varchar(150),
  `fuel` varchar(80),
  `seats` int,
  `doors` int,
  `transmission` varchar(80),
  `color` varchar(80),
  `origin` varchar(80),
  `supplier` varchar(80),
  `warranty` char(3),
  `registration_date` varchar(10),
  `vin` varchar(17),
  `description` varchar(500)
);

CREATE TABLE `Deal` (
  `id` int PRIMARY KEY,
  `price` double,
  `mileage` int,
  `stand` varchar(80),
  `date_full` date
);

CREATE TABLE `Stand` (
  `sk_stand` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(80),
  `phone` char(9),
  `address` varchar(200),
  `postal_code` char(8),
  `city` varchar(80),
  `commercial_director_name` varchar(80),
  `commercial_director_phone_1` char(9),
  `commercial_director_phone_2` char(9)
);

CREATE TABLE `Calendar` (
  `sk_calendar` int UNIQUE PRIMARY KEY,
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
