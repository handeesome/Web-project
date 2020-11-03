--
-- Table structure for table `inst_user`
--

CREATE TABLE `inst_user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(25) NOT NULL,
  `user_password` varchar(250) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_phone` varchar(20) NOT NULL,
  `user_DOB` DATE NOT NULL
);

--
-- Insert in table `inst_user`
--
INSERT INTO `inst_user` (`user_id`, `user_name`, `user_password`, `user_email`, `user_phone`, `user_DOB`)VALUES
(1, 'Anna Bolena', '$nWtW*x}d~!9/}JN', 'abolena9@gmail.com', '(711) 265-9193', '1970-11-05'),
(2, 'Anna Kareninsta', '#*WQMC8N5_=(a[^u', 'akareninsta@yahoo.com', '(675) 844-7400', '1976-11-08'),
(4, 'Eugene Oneginst', 'pqa*U!\4YXS84RF9','eoneginst@gmail.com', '(266) 855-0710', '1980-01-18'),
(5, 'Iolanta Goriot', '&(~3"7?faY"JUgw[', 'igoriot@gmail.com', '(514) 531-8471', '1989-06-08'),
(6, 'Dmitri Karamazov', 'pqa*U!\2(hw4Psa5_&zswfc', 'dkaramazov@hotmail.com', '(966) 291-5045', '1999-11-08'),
(7, 'Victor Gwynplainste', 'A~$n+5sd9GM:g', 'vgwynplainste@gmail.com', '(519) 978-4733', '2004-09-16'),
(8, 'Sophie Trébuchet', '*UY=+8XT+79qX@\,', 'strébuchet@gmail.com', '(995) 565-4039', '2000-02-22');

-- --------------------------------------------------------


-- Index table table `inst_user`
--
ALTER TABLE `inst_user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_email` (`user_email`);
--

--
-- unique number to be generated automatically 
--
ALTER TABLE `inst_user`
  MODIFY `user_id` int(11) NOT NULL auto_increment;

-- --------------------------------------------------------

--
-- Table structure for table `inst_size`
--

CREATE TABLE `inst_size` (
  `size_id` int(255) NOT NULL,
  `size_detail` varchar(255) NOT NULL
);

--
-- Insert in table `inst_size`
--

Insert INTO `inst_size` (`size_id`, `size_detail`) VALUES
(1, '6 String'),
(2, 'S Body'),
(3, 'Baritone');


--
-- Index table `inst_size`
--
ALTER TABLE `inst_size`
  ADD PRIMARY KEY (`size_id`);
  
ALTER TABLE `inst_size`
  MODIFY `size_id` int(11) NOT NULL auto_increment;
----------------------------------------------------------------------------------
-- --------------------------------------------------------
--
-- Table structure for table `inst_m`
--

CREATE TABLE `inst_manuf` (
  `manuf_id` int(255) NOT NULL,
  `manuf_brand` text NOT NULL,
  `manuf_model` varchar(255) NOT NULL,
  `manuf_rate` int(255) NOT NULL,
  `size_id` int(255) NOT NULL
);

--
-- Insert in table `inst_manuf`
--

Insert INTO `inst_manuf` (`manuf_id`, `manuf_brand`, `manuf_model`, `manuf_rate`, `size_id`) VALUES
(1, 'Gibson', 'SG Junior', 15, 2),
(2, 'Fender', 'Sixty-Six', 16, 2),
(3, 'PRS', 'S2 Mira', 8, 1),
(4, 'G&L', 'Tribute', 8, 1),
(5, 'Rickenbacker', 'ACE B6', 15, 2);

--
-- Index table `inst_manuf`
--
ALTER TABLE `inst_manuf`
  ADD PRIMARY KEY (`manuf_id`),
  ADD KEY `manuf_size_fk` (`size_id`);
  

--
-- Alter table `inst_manuf` every time a user is deleted or updated
--
ALTER TABLE `inst_manuf`
  ADD CONSTRAINT `manuf_size_fk` FOREIGN KEY (`size_id`) REFERENCES `inst_size` (`size_id`);
  
ALTER TABLE `inst_manuf`
  MODIFY `manuf_id` int(11) NOT NULL auto_increment;

-- --------------------------------------------------------
--
-- Table structure for table `inst_color`
--

CREATE TABLE `inst_color` (
  `color_id` int(255) NOT NULL,
  `color_name` text NOT NULL
);

--
-- Insert in table `inst_color`
--

Insert INTO `inst_color` (`color_id`, `color_name`) VALUES
(1, 'Basswood'),
(2, 'Cedar'),
(3, 'Cherry'),
(4, 'Walnut');


--
-- Index table `inst_color`
--
ALTER TABLE `inst_color`
  ADD PRIMARY KEY (`color_id`);

ALTER TABLE `inst_color`
  MODIFY `color_id` int(11) NOT NULL auto_increment;

-- --------------------------------------------------------

--
-- Table structure for table `inst_instrument`
--

CREATE TABLE `inst_instrument` (
  `inst_no` INT(11) NOT NULL,
  `manuf_id` int(255) NOT NULL,
  `color_id` int(100) NOT NULL,
  `year` int(4) NOT NULL,
  `inst_availableFl` varchar(1) NOT NULL DEFAULT 'Y'
);

--
-- Insert in table `inst_instrument`
--

Insert INTO `inst_instrument` (`inst_no`, `manuf_id`, `color_id`, `year`, `inst_availableFl`) VALUES
('7081434', 1, 1, 2011, 'N'),
('2646890', 1, 1, 2016, 'Y'),
('0218792', 3, 2, 2015, 'Y'),
('8903899', 2, 1, 2013, 'Y'),
('7081454', 2, 3, 2016, 'Y'),
('0210139', 2, 2, 2013, 'N'),
('8903878', 5, 2, 2015, 'Y'),
('5898035', 5, 4, 2012, 'N'),
('3702467', 2, 1, 2016, 'Y'),
('0271510', 2, 1, 2016, 'Y');

--
-- Index table `inst_instrument`
--
ALTER TABLE `inst_instrument`
  ADD PRIMARY KEY (`inst_no`),
  ADD KEY `inst_color_fk` (`color_id`),
  ADD KEY `inst_manuf_fk` (`manuf_id`);


--
-- Alter table `inst_instrument` every time a user is deleted or updated
--
ALTER TABLE `inst_instrument`
  ADD CONSTRAINT `inst_color_fk`FOREIGN KEY (`color_id`) REFERENCES `inst_color` (`color_id`),
  ADD CONSTRAINT `inst_manuf_fk`FOREIGN KEY (`manuf_id`) REFERENCES `inst_manuf` (`manuf_id`);
  
ALTER TABLE `inst_instrument`
  MODIFY `inst_no` int(11) NOT NULL auto_increment;

-- --------------------------------------------------------

--
-- Table structure for table `inst_instrument_location`
--

CREATE TABLE `inst_instrument_location` (
  `location_id` int(10) NOT NULL,
  `location_zip` int(10) NOT NULL,
  `inst_no` INT(11) NOT NULL
  
);

--
-- Insert in table `inst_instrument_location`, where instrument is located
--

Insert INTO `inst_instrument_location` (`location_id`,`location_zip`, `inst_no`) VALUES
('2',75248, '7081434'),
('3',75248, '2646890'),
('9',75248, '8903899'),
('6',77032, '0271510'),
('8',75248, '8903899');

--
-- Index table `inst_car_location`
--
ALTER TABLE `inst_instrument_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `inst_no_fk` (`inst_no`);


--
-- Alter table `inst_intrument_location` every time a user is deleted or updated
ALTER TABLE `inst_instrument_location`
  ADD CONSTRAINT `inst_no_fk` FOREIGN KEY (`inst_no`) REFERENCES `inst_instrument`(`inst_no`);

ALTER TABLE `inst_instrument_location`
  MODIFY `location_id` int(11) NOT NULL auto_increment;
--
-- Table structure for table `inst_locations`, where to pick up or is sent
--

CREATE TABLE `inst_locations` (
  `location_id` int(10) NOT NULL,
  `location_zip` int(10) NOT NULL,
  `location_city` text NOT NULL,
  `location_address` longtext NOT NULL
);

--
-- Insert in table `inst_locations`
--

Insert INTO `inst_locations` (`location_id`,`location_zip`, `location_city`, `location_address`) VALUES
('4',75038, 'Bremen', 'Seefahrstrasse, Irvinstg, 28195'),
('3',75248, 'Hamburg', 'Am Wall, 20095'),
('2',75251, 'Dortmund', 'weissenburger strasse, 44135'),
('7',75252, 'Munich', 'sendlinstger strasse, 80331'),
('8',77032, 'Berlinst', 'strasse des 17 juni, 10115');

--
-- Index table `inst_locations`
--
ALTER TABLE `inst_locations`
  ADD PRIMARY KEY (`location_id`);

ALTER TABLE `inst_locations`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- table `inst_rent`
--

CREATE TABLE `inst_rent` (
  `rent_id` int(11) NOT NULL,
  `rent_location_id` int(11) NOT NULL,
  `rent_from_date` datetime NOT NULL,
  `rent_to_date` datetime NOT NULL,
  `rent_inst_no` INT(11) NOT NULL,
  `rent_user_id` int(11) NOT NULL,
  `rent_status` text NOT NULL
);


--
-- Insert in table `inst_rent`
--

INSERT INTO `inst_rent` (`rent_id`, `rent_location_id`, `rent_from_date`, `rent_to_date`, `rent_inst_no`, `rent_user_id`, `rent_status`) VALUES
(1, '4', '2020-11-06 00:00:00', '2020-11-08 12:30:00', '7081434', 7, 'Successful'),
(2, '3', '2020-11-07 00:00:00', '2020-11-14 12:30:00', '2646890', 2, 'Successful'),
(3, '2', '2020-11-04 00:00:00', '2020-11-30 12:30:00', '8903899', 2, 'Inprogress'),
(4, '7','2020-11-28 00:00:00', '2021-01-08 12:30:00', '0271510', 8, 'Successful');

--
-- Index table `inst_rent`
--
ALTER TABLE `inst_rent`
  ADD PRIMARY KEY (`rent_id`),
  ADD KEY `rent_user_fk` (`rent_user_id`),
  ADD KEY `rent_location_id_fk` (`rent_location_id`),
  ADD KEY `rent_inst_no_fk` (`rent_inst_no`);
  

-- unique number to be generated automatically 
--
ALTER TABLE `inst_rent`
  MODIFY `rent_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Alter table `inst_rent` every time a user is deleted or updated
--

ALTER TABLE `inst_rent`
  ADD CONSTRAINT `rent_user_fk` FOREIGN KEY (`rent_user_id`) REFERENCES `inst_user` (`user_id`),
  ADD CONSTRAINT `rent_location_id_fk` FOREIGN KEY (`rent_location_id`) REFERENCES `inst_locations` (`location_id`),
  ADD CONSTRAINT `rent_inst_no_fk` FOREIGN KEY (`rent_inst_no`) REFERENCES `inst_instrument` (`inst_no`);



--
-- Table structure for table `inst_payment`
--

CREATE TABLE `inst_payment` (
  `payment_id` INT(11) NOT NULL,
  `rent_id` INT(11) NOT NULL,
  `payment_start_time` DATETIME NOT NULL,
  `payment_end_time` DATETIME NOT NULL,
  `price` DOUBLE NOT NULL,
  `payment_status` text NOT NULL
);

--
-- Insert in table `inst_payment`
--
INSERT INTO `inst_payment` (`payment_id`, `rent_id`, `payment_start_time`, `payment_end_time`, `price`, `payment_status`) VALUES
(16, 1, '2020-10-05 08:11:03', '2020-10-05 08:11:03', 600, 'Successful'),
(17, 2, '2020-10-05 08:30:27', '2020-10-05 08:30:27', 200, 'Successful'),
(18, 4, '2020-10-05 09:14:55', '2020-10-05 09:14:55', 380, 'Successful');

--
-- Index table `manuf_payment`
--
ALTER TABLE `inst_payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payment_rent_fk` (`rent_id`);

--
-- unique number to be generated automatically 
--
ALTER TABLE `inst_payment`
  MODIFY `payment_id` INT(11) NOT NULL auto_increment;

  

--
-- Alter table `inst_payment` every time a user is deleted or updated
--
ALTER TABLE `inst_payment`
  ADD CONSTRAINT `payment_rent_fk` FOREIGN KEY (`rent_id`) REFERENCES `inst_rent` (`rent_id`) ON DELETE CASCADE ON UPDATE CASCADE;





-- --------------------------------------------------------



