-- table `inst_rent`
--

CREATE TABLE `inst_rent` (
  `rent_id` int(11) NOT NULL,
  `rent_pickup_location` varchar(11) NOT NULL,
  `rent_date` datetime NOT NULL,
  `rent_from_date` datetime NOT NULL,
  `rent_to_date` datetime NOT NULL,
  `inst_no` varchar(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `rent_status` text NOT NULL
);

--
-- Insert in table `inst_rent`
--

INSERT INTO `inst_rent` (`rent_id`, `rent_pickup_location`, `rent_date`, `rent_from_date`, `rent_to_date`, `inst_no`, `user_id`, `rent_status`) VALUES
(1, 'Bremen', '2020-10-02 08:10:18', '2020-11-06 00:00:00', '2020-11-08 12:30:00', 'MZ7081434', 7, 'Successful'),
(2, 'Hamburg', '2020-10-02 08:25:49', '2020-11-07 00:00:00', '2020-11-14 12:30:00', '2 MAY 64 B', 2, 'Successful'),
(3, 'Hannover', '2020-10-02 08:28:49', '2020-11-04 00:00:00', '2020-11-30 12:30:00', '02-18-12A', 2, 'Inprogress'),
(4, 'Dortmund', '2020-10-02 09:13:52', '2020-11-28 00:00:00', '2021-01-08 12:30:00', 'M03899', 8, 'Successful');

--
-- Index table `inst_rent`
--
ALTER TABLE `inst_rent`
  ADD PRIMARY KEY (`rent_id`),
  ADD KEY `rent_user_fk` (`user_id`);

  

--unique number to be generated automatically 
--
ALTER TABLE `inst_rent`
  MODIFY `rent_id` int(11) NOT NULL auto_increment, auto_increment=5;

--
-- Alter table `inst_rent` every time a user is deleted or updated
--

ALTER TABLE `inst_rent`
  ADD CONSTRAINT `rent_user_fk` FOREIGN KEY (`user_id`) REFERENCES `inst_user` (`user_id`);


-- --------------------------------------------------------

--
-- Table structure for table `inst_instrument`
--

CREATE TABLE `inst_instrument` (
  `inst_no` varchar(255) NOT NULL,
  `manuf_id` int(255) NOT NULL,
  `color_id` int(100) NOT NULL,
  `year` int(4) NOT NULL,
  `inst_availableFl` varchar(1) NOT NULL DEFAULT 'Y'
);

--
-- Insert in table `inst_instrument`
--

Insert INTO `inst_instrument` (`inst_no`, `manuf_id`, `color_id`, `year`, `inst_availableFl`) VALUES
('MZ7081434', 1, 1, 2011, 'N'),
('2 MAY 64 B', 1, 1, 2016, 'Y'),
('02-18-12A', 3, 2, 2015, 'Y'),
('M03899', 2, 1, 2013, 'Y'),
('MZ7081454', 2, 3, 2016, 'Y'),
('02-10-13B', 2, 2, 2013, 'N'),
 ('M03878', 5, 2, 2015, 'Y'),
('5 JUNE 70 A', 5, 4, 2012, 'N'),
('M02467', 2, 1, 2016, 'Y'),
('02-15-10C', 2, 1, 2016, 'Y');

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
  ADD CONSTRAINT `inst_color_fk` FOREIGN KEY (`color_id`) REFERENCES `inst_color` (`color_id`),
  ADD CONSTRAINT `inst_manuf_fk` FOREIGN KEY (`manuf_id`) REFERENCES `inst_manuf` (`manuf_id`);



-- --------------------------------------------------------

--
-- Table structure for table `inst_instrument_location`
--

CREATE TABLE `inst_instrument_location` (
  `location_zip` int(10) NOT NULL,
  `inst_no` varchar(255) NOT NULL
);

--
-- Insert in table `inst_instrument_location`
--

Insert INTO `inst_instrument_location` (`location_zip`, `inst_no`) VALUES
(75248, 'MZ7081434'),
(75248, '2 MAY 64 B'),
(75248, '02-18-12A'),
 (77032, 'M03899'),
(75248, '5 JUNE 70 A');

--
-- Index table `inst_car_location`
--
ALTER TABLE `inst_instrument_location`
  ADD PRIMARY KEY (`location_zip`,`inst_no`),
  ADD KEY `inst_location_fk` (`inst_no`);


--
-- Alter table `inst_intrument_location` every time a user is deleted or updated
--
ALTER TABLE `inst_instrument_location`
  ADD CONSTRAINT `inst_location_fk` FOREIGN KEY (`inst_no`) REFERENCES `inst_instrument` (`inst_no`),
  ADD CONSTRAINT `zip_location_fk` FOREIGN KEY (`location_zip`) REFERENCES `inst_locations` (`location_zip`);
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


-- --------------------------------------------------------

--
-- Table structure for table `inst_locations`
--

CREATE TABLE `inst_locations` (
  `location_zip` int(10) NOT NULL,
  `location_city` text NOT NULL,
  `location_address` longtext NOT NULL
);

--
-- Insert in table `inst_locations`
--

Insert INTO `inst_locations` (`location_zip`, `location_city`, `location_address`) VALUES
(75038, 'Bremen', 'Seefahrstrasse, Irvinstg, 28195'),
(75248, 'Hamburg', 'Am Wall, 20095'),
(75251, 'Dortmund', 'weissenburger strasse, 44135'),
(75252, 'Munich', 'sendlinstger strasse, 80331'),
(77032, 'Berlinst', 'strasse des 17 juni, 10115');

--
-- Index table `inst_locations`
--
ALTER TABLE `inst_locations`
  ADD PRIMARY KEY (`location_zip`);



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

-- --------------------------------------------------------
--
-- Table structure for table `inst_payment`
--

CREATE TABLE `inst_payment` (
  `payment_id` int(200) NOT NULL,
  `renting_id` int(200) NOT NULL,
  `payment_start_time` datetime NOT NULL,
  `payment_end_time` datetime NOT NULL,
  `price` double NOT NULL,
  `payment_status` text NOT NULL
);

--
-- Insert in table `inst_payment`
--

Insert INTO `inst_payment` (`payment_id`, `renting_id`, `payment_start_time`, `payment_end_time`, `price`, `payment_status`) VALUES
(16, 1, '2020-10-05 08:11:03', '2020-10-05 08:11:03', 16, 'Successful'),
(17, 2, '2020-10-05 08:30:27', '2020-10-05 08:30:27', 0, 'Successful'),
(18, 4, '2020-10-05 09:14:55', '2020-10-05 09:14:55', 30, 'Successful');

--
-- Index table `manuf_payment`
--
ALTER TABLE `inst_payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `payment_rent_fk` (`renting_id`);

--
-- unique number to be generated automatically 
--
ALTER TABLE `inst_payment`
  MODIFY `payment_id` int(200) NOT NULL auto_increment, auto_increment=19;

  

--
-- Alter table `inst_payment` every time a user is deleted or updated
--
ALTER TABLE `inst_payment`
  ADD CONSTRAINT `payment_rent_fk` FOREIGN KEY (`renting_id`) REFERENCES `inst_rent` (`rent_id`) ON DELETE CASCADE ON UPDATE CASCADE;





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
(1, '6 Strinstg'),
(2, 'S Body'),
(3, 'Baritone');


--
-- Index table `inst_size`
--
ALTER TABLE `inst_size`
  ADD PRIMARY KEY (`size_id`);


-- --------------------------------------------------------

--
-- Table structure for table `inst_user`
--

CREATE TABLE `inst_user` (
  `user_id` int(11) NOT NULL,
  `user_firstname` varchar(25) NOT NULL,
  `user_lastname` varchar(25) NOT NULL,
  `user_password` varchar(250) NOT NULL,
  `user_email` varchar(200) NOT NULL,
  `user_phone` varchar(20) NOT NULL
);

--
-- Insert in table `inst_user`
--

Insert INTO `inst_user` (`user_id`, `user_firstname`, `user_lastname`, `user_password`, `user_email`, `user_phone`, `user_type`, `user_available_fl`) VALUES
(1, 'Anna', 'Bolena', '$nWtW*x}d~!9/}JN', 'abolena9@gmail.com', '(711) 265-9193', 'customer',0),
(2, 'Anna', 'Kareninsta', '#*WQMC8N5_=(a[^u', 'akareninsta@yahoo.com', '(675) 844-7400', 'adminst', 0),
(4, 'Eugene ', 'Oneginst', 'pqa*U!\4YXS84RF9','eoneginst@gmail.com', '(266) 855-0710', 'adminst', 0),
(5, 'Iolanta', 'Goriot', '&(~3"7?faY"JUgw[', 'igoriot@gmail.com', '(514) 531-8471', 'customer', 0),
(6, 'Dmitri', 'Karamazov', 'pqa*U!\2(hw4Psa5_&zswfc', 'dkaramazov@hotmail.com', '(966) 291-5045', 'customer', 0),
(7, 'Victor', 'Gwynplainste', 'A~$n+5sd9GM:g', 'vgwynplainste@gmail.com', '(519) 978-4733', 'customer', 0),
(8, 'Sophie', 'Trébuchet', '*UY=+8XT+79qX@\,', 'strébuchet@gmail.com', '(995) 565-4039', 'customer', 0);


--
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
  MODIFY `user_id` int(11) NOT NULL auto_increment, auto_increment=9;







