

create database event_db_final;

use event_db_final;

CREATE TABLE user (
    userid INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(50) UNIQUE KEY,
    password VARCHAR(20),
    role VARCHAR(50) DEFAULT 'user'
   );

INSERT INTO `event_db_final`.`user` (`userid`, `name`, `email`, `password`, `role`) VALUES ('1', 'asd', 'adda@gmail.com', '123', 'user');
INSERT INTO `event_db_final`.`user` (`userid`, `name`, `email`, `password`, `role`) VALUES ('2', 'must', 'must@gmail.com', '4321', 'admin');
INSERT INTO `event_db_final`.`user` (`userid`, `name`, `email`, `password`, `role`) VALUES ('3', 'ramesh', 'ramu@gmail.com', '1234', 'user');
INSERT INTO `event_db_final`.`user` (`userid`, `name`, `email`, `password`, `role`) VALUES ('4', 'suresh', 'sur@gmail.com', '2341', 'admin');

CREATE TABLE users_ratings(
     ratingid INT PRIMARY KEY AUTO_INCREMENT,
     userid INT,
     ratings FLOAT NOT NULL,
     feedback VARCHAR(100) NOT NULL,
     FOREIGN KEY(userid) REFERENCES user(userid)
);

INSERT INTO `event_db_final`.`users_ratings` (`ratingid`, `userid`, `ratings`, `feedback`) VALUES ('1', '1', '4.2', 'good food but improve dj');
INSERT INTO `event_db_final`.`users_ratings` (`ratingid`, `userid`, `ratings`, `feedback`) VALUES ('2', '2', '4.5', 'improve food include more snacks');
INSERT INTO `event_db_final`.`users_ratings` (`ratingid`, `userid`, `ratings`, `feedback`) VALUES ('3', '3', '3.8', 'decoration material quanlity is cheap');
INSERT INTO `event_db_final`.`users_ratings` (`ratingid`, `userid`, `ratings`, `feedback`) VALUES ('4', '4', '4.0', 'music systems were average');

CREATE TABLE vendor(
     vendorid INT PRIMARY KEY AUTO_INCREMENT,
     eventid INT,
     name VARCHAR(50),
     description VARCHAR(500),
     rates INT,
     vaccination varchar(50),
     experience VARCHAR(500),
     category VARCHAR(500),
     city  VARCHAR(100),
     mobile_no varchar(50) UNIQUE KEY,
     question VARCHAR(500),
     answer VARCHAR(500),
     flag INT  
);

ALTER TABLE `event_db_final`.`vendor` 
CHANGE COLUMN `flag` `flag` INT NULL DEFAULT 1 ;
ALTER TABLE `event_db_final`.`vendor` 
DROP COLUMN `eventid`;

INSERT INTO vendor (vendorid, name, experience, mobile_no, description, vaccination, rates, category, city, flag) VALUES (1, 'Suresh Photography', '10 Years', '9089123765', 'Always ready to Capture', 'Done', 755, 'Photo', 'Pune', 0);
INSERT INTO vendor (vendorid, name, experience, mobile_no, description, vaccination, rates, category, city, flag) VALUES (4, 'Rock&Roll', '9 Years', '9089457654', 'Best Music For Events', 'Done', 1000, 'Music', 'Delhi', 0);
INSERT INTO vendor (vendorid, name, experience, mobile_no, description, vaccination, rates, category, city, flag) VALUES (3, 'Punjabi Dhaba', '4 Years', '9089451234', 'Get good quality of food','Done', 555, 'Food', 'Mumbai', 0);
INSERT INTO vendor (vendorid, name, experience, mobile_no, description, vaccination, rates, category, city, flag) VALUES (2, 'Ramesh Meals', '12 Years', '9089456765', 'Always ready to Serve','Done', 855, 'Food', 'pune', 0);
INSERT INTO vendor (vendorid, name, experience, mobile_no, description, vaccination, rates, category, city, flag) VALUES (5, 'Aditi Parlor', '6 Years', '8888456765', 'Get Set Ready','Done', 1855, 'Makeup', 'Delhi', 0);
INSERT INTO vendor (vendorid, name, experience, mobile_no, description, vaccination, rates, category, city, flag) VALUES (6, 'Baburao Decorators', '3 Years', '7623456765', 'Best Decoration For Any Event','Done', 2555, 'Decoration', 'Kolkata', 0);
UPDATE event_db_final.vendor SET question = 'what is your pet name', answer = 'surya' WHERE (vendorid = '1');
UPDATE event_db_final.vendor SET question = 'what is your mother name', answer = 'rami' WHERE (vendorid = '2');
UPDATE event_db_final.vendor SET question = 'what is your city name', answer = 'pune' WHERE (vendorid = '3');
UPDATE event_db_final.vendor SET question = 'what is your father name', answer = 'rakesh' WHERE (vendorid = '4');
UPDATE event_db_final.vendor SET question = 'what is your mother name', answer = 'sheela' WHERE (vendorid = '5');
UPDATE event_db_final.vendor SET question = 'what is your mother name', answer = 'geeta' WHERE (vendorid = '6');
DELETE FROM event_db_final.vendor WHERE (vendorid = '7');
UPDATE `event_db_final`.`vendor` SET `flag` = '1' WHERE (`vendorid` = '1');
UPDATE `event_db_final`.`vendor` SET `flag` = '1' WHERE (`vendorid` = '3');
UPDATE `event_db_final`.`vendor` SET `flag` = '1' WHERE (`vendorid` = '5');


CREATE TABLE vendor_attachment(
id integer  primary key auto_increment,
photo blob,
vendorid integer
);



CREATE TABLE venue (
    venueid  INT PRIMARY KEY AUTO_INCREMENT,
    venue_name VARCHAR(15) NOT NULL,
    
    email varchar(50) NOT NULL,
    venueCapacity INT,
    mobile_no varchar(50) NOT NULL,
    price INT NOT NULL,
    description VARCHAR(200) NOT NULL
    
);

ALTER TABLE `event_db_final`.`venue` 
ADD COLUMN `events` VARCHAR(45) NULL AFTER `description`;
ALTER TABLE `event_db_final`.`venue` 
CHANGE COLUMN `events` `event` VARCHAR(45) NULL DEFAULT NULL ;
ALTER TABLE `event_db_final`.`venue` 
ADD COLUMN `city` VARCHAR(45) NULL AFTER `event`;

INSERT INTO `event_db_final`.`venue` (`venueid`, `venue_name`, `email`, `venueCapacity`, `mobile_no`, `price`, `description`) VALUES ('1', 'Pride', 'info@pride.com', '500', '9464317892', '12300', 'Pride Group of Hotels is an eminent Indian hospitality brand with a presence in major cities ');
INSERT INTO `event_db_final`.`venue` (`venueid`, `venue_name`, `email`, `venueCapacity`, `mobile_no`, `price`, `description`) VALUES ('2', 'Radison', 'info@radisonnagpur.com', '200', '6585874246', '7000', 'From Sleep and Food to Service, Feel the Radisson Blu Difference. We Make Your Every Moment Matter. Best Online Rate Guaranteed.');
INSERT INTO `event_db_final`.`venue` (`venueid`, `venue_name`, `email`, `venueCapacity`, `mobile_no`, `price`, `description`) VALUES ('3', 'Tuli', 'info123Tuli@gmail.com', '800', '4232356737', '20000', 'Lock in today’s lowest rates and pay nothing upfront, or cancel free for max flexibility! Find the perfect room with easy filters, read real reviews, and get live help any time. Secure Payments. ');
INSERT INTO `event_db_final`.`venue` (`venueid`, `venue_name`, `email`, `venueCapacity`, `mobile_no`, `price`, `description`) VALUES ('4', 'Empire', 'info12@Empire.com', '550', '4567891230', '12345', 'Empire Hotel is an excellent choice for travellers visiting Nagpur.Empire Hotel is a budget friendly small hotel offering air conditioning, a desk, and a seating area in the rooms');
INSERT INTO `event_db_final`.`venue` (`venueid`, `venue_name`, `email`, `venueCapacity`, `mobile_no`, `price`, `description`) VALUES ('5', 'Pride Mumbai', 'info@pridem.com', '100', '9464315892', '12300', 'Pride Group of Hotels is an eminent Indian hospitality brand with a presence in major cities ');
INSERT INTO `event_db_final`.`venue` (`venueid`, `venue_name`, `email`, `venueCapacity`, `mobile_no`, `price`, `description`) VALUES ('6', 'Radison Pune', 'info@radisonpune.com', '200', '9585873246', '5000', 'From Sleep and Food to Service, Feel the Radisson Blu Difference. We Make Your Every Moment Matter. Best Online Rate Guaranteed.');
INSERT INTO `event_db_final`.`venue` (`venueid`, `venue_name`, `email`, `venueCapacity`, `mobile_no`, `price`, `description`) VALUES ('7', 'Tuli Jaipur', 'info.Tuli@gmail.com', '600', '9232356738', '20000', 'Lock in today’s lowest rates and pay nothing upfront, or cancel free for max flexibility! Find the perfect room with easy filters, read real reviews, and get live help any time. Secure Payments. ');
INSERT INTO `event_db_final`.`venue` (`venueid`, `venue_name`, `email`, `venueCapacity`, `mobile_no`, `price`, `description`) VALUES ('8', 'Empire Mumbai', 'info12Mumbai@Empire.com', '500', '9567891235', '14445', 'Empire Hotel is an excellent choice for travellers visiting Nagpur.Empire Hotel is a budget friendly small hotel offering air conditioning, a desk, and a seating area in the rooms');
INSERT INTO `event_db_final`.`venue` (`venueid`, `venue_name`, `email`, `venueCapacity`, `mobile_no`, `price`, `description`) VALUES ('9', 'Empire Goa', 'info12Goa@Empire.com', '400', '9565691235', '19000', 'Empire Hotel is an excellent choice for travellers visiting Nagpur.Empire Hotel is a budget friendly small hotel offering air conditioning, a desk, and a seating area in the rooms');


UPDATE `event_db_final`.`venue` SET `event` = 'BirthDay' WHERE (`venueid` = '1');
UPDATE `event_db_final`.`venue` SET `event` = 'Fest' WHERE (`venueid` = '2');
UPDATE `event_db_final`.`venue` SET `event` = 'Wedding' WHERE (`venueid` = '3');
UPDATE `event_db_final`.`venue` SET `event` = 'Wedding' WHERE (`venueid` = '4');
UPDATE `event_db_final`.`venue` SET `event` = 'Corporate' WHERE (`venueid` = '5');
UPDATE `event_db_final`.`venue` SET `event` = 'BirthDay' WHERE (`venueid` = '6');
UPDATE `event_db_final`.`venue` SET `event` = 'Fest' WHERE (`venueid` = '7');
UPDATE `event_db_final`.`venue` SET `event` = 'Fest' WHERE (`venueid` = '8');
UPDATE `event_db_final`.`venue` SET `event` = 'Wedding' WHERE (`venueid` = '9');

UPDATE `event_db_final`.`venue` SET `city` = 'pune' WHERE (`venueid` = '1');
UPDATE `event_db_final`.`venue` SET `city` = 'mumbai' WHERE (`venueid` = '2');
UPDATE `event_db_final`.`venue` SET `city` = 'delhi' WHERE (`venueid` = '3');
UPDATE `event_db_final`.`venue` SET `city` = 'banglore' WHERE (`venueid` = '4');
UPDATE `event_db_final`.`venue` SET `city` = 'mumbai' WHERE (`venueid` = '5');
UPDATE `event_db_final`.`venue` SET `city` = 'pune' WHERE (`venueid` = '6');
UPDATE `event_db_final`.`venue` SET `city` = 'jaipur' WHERE (`venueid` = '7');
UPDATE `event_db_final`.`venue` SET `city` = 'mumbai' WHERE (`venueid` = '8');
UPDATE `event_db_final`.`venue` SET `city` = 'panji' WHERE (`venueid` = '9');

UPDATE `event_db_final`.`venue` SET `venue_name` = 'Empire' WHERE (`venueid` = '8');

UPDATE `event_db_final`.`venue` SET `description` = 'Pride Group of Hotels is an eminent Indian hospitality brand with a presence in major cities like pune.' WHERE (`venueid` = '1');
UPDATE `event_db_final`.`venue` SET `description` = 'Lock in today\'s lowest rates and pay nothing upfront, or cancel free for max flexibility! Find the perfect room with easy filters, read real reviews, and get live help any time. ' WHERE (`venueid` = '3');
UPDATE `event_db_final`.`venue` SET `description` = 'From Sleep and Food to Service, Feel the Radisson Blu Difference. We Make Your Every Moment Matter. ' WHERE (`venueid` = '2');
UPDATE `event_db_final`.`venue` SET `description` = 'Lock in today?s lowest rates and pay nothing upfront, or cancel free for max flexibility! Find the perfect room with easy filters, read real reviews, and get live help any time.  ' WHERE (`venueid` = '7');
UPDATE `event_db_final`.`venue` SET `description` = 'Empire Hotel is an excellent choice for travellers visiting Mumbai.Empire Hotel is a budget friendly small hotel offering air conditioning, a desk, and a seating area in the rooms.' WHERE (`venueid` = '8');
UPDATE `event_db_final`.`venue` SET `description` = 'Empire Hotel is an excellent choice for travellers visiting Panjimr.Empire Hotel is a budget friendly small hotel offering air conditioning, a desk, and a seating area in the rooms.' WHERE (`venueid` = '9');
UPDATE `event_db_final`.`venue` SET `description` = 'Pride Group of Hotels is an eminent Indian hospitality brand with a presence in major cities like mumbai.' WHERE (`venueid` = '5');
UPDATE `event_db_final`.`venue` SET `description` = 'Empire Hotel is an excellent choice for travellers visiting Nagpur.Empire Hotel is a budget friendly small hotel offering air conditioning, a desk, and a seating area in the rooms.' WHERE (`venueid` = '4');

UPDATE `event_db_final`.`venue` SET `description` = 'From Sleep and Food to Service, Feel the Radisson Blu Difference. We Make Your Every Moment Matter. Best Online Rate Guaranteed.' WHERE (`venueid` = '2');
UPDATE `event_db_final`.`venue` SET `description` = 'Pride Group of Hotels is an eminent Indian hospitality brand with a presence in major cities like mumbai.Best Online Rate Guaranteed.' WHERE (`venueid` = '5');
UPDATE `event_db_final`.`venue` SET `description` = 'Pride Group of Hotels is an eminent Indian hospitality brand with a presence in major cities like pune.Best Online Rate Guaranteed.' WHERE (`venueid` = '1');

UPDATE `event_db_final`.`venue` SET `description` = 'From Sleep and Food to Service, Feel the Radisson Blu Difference. We Make Your Every Moment Matter. Best Online Rate Guaranteed. Please visit us again.', `event` = 'Wedding' WHERE (`venueid` = '6');
UPDATE `event_db_final`.`venue` SET `description` = 'Pride Group of Hotels is an eminent Indian hospitality brand with a presence in major cities like pune.Best Online Rate Guaranteed.We provide best food , services.' WHERE (`venueid` = '1');
UPDATE `event_db_final`.`venue` SET `description` = 'From Sleep and Food to Service, Feel the Radisson Blu Difference. We Make Your Every Moment Matter. Best Online Rate Guaranteed. Please visit us again.' WHERE (`venueid` = '2');
UPDATE `event_db_final`.`venue` SET `description` = 'Pride Group of Hotels is an eminent Indian hospitality brand with a presence in major cities like mumbai.Best Online Rate Guaranteed.We provide best food , services.' WHERE (`venueid` = '5');


CREATE TABLE venue_images(
image_id integer  primary key auto_increment,
venueimg varchar(300),
venueid integer
);

ALTER TABLE `event_db_final`.`venue_images` 
CHANGE COLUMN `venueimg` `venueimg` TEXT NULL DEFAULT NULL ;


insert into venue_images values(1, "https://www.google.com/search?q=pride+hotel+images&rlz=1C1YTUH_enIN993IN993&sxsrf=APq-WBvTtfyFPxYrO7P9yabeiDYR60Dwww:1649062406383&tbm=isch&source=iu&ictx=1&vet=1&fir=FuQznUCa1W-xjM%252Cq4pkir68rufeWM%252C_%253BebQao0cfGOg94M%252C-6HkgOfhoItZSM%252C_%253BSe7ssUQVUFOwGM%252CREeJKDeERYG-aM%252C_%253BkAyEpe1NwFw4uM%252CNxB2PHWK9erATM%252C_%253BmWsxM-QI7CKhcM%252C-6HkgOfhoItZSM%252C_%253BJff_nwafBPbZAM%252CMjgMZ7Hj9kV4-M%252C_%253B1Jn_O07_t7bT6M%252C-6HkgOfhoItZSM%252C_%253B2c0tL_EG3TTZ0M%252CN-G4ooCvCEYGqM%252C_%253BXMFM-RniGnASqM%252CTDQH-GRGsQefjM%252C_%253Bpsp7RTLq6XEHFM%252C_Cn3BABo39TVkM%252C_%253BlM8zD9pPKdtVVM%252COCG_lYvxqaOk5M%252C_%253B1_F_-U3xbWiJkM%252C2-ekXzFaQ-IMAM%252C_&usg=AI4_-kSTApPjhrK_qHMLrzPQCGpKiO5HGQ&sa=X&ved=2ahUKEwi3iceXhPr2AhXVR2wGHVasCJoQ9QF6BAgEEAE#imgrc=FuQznUCa1W-xjM",1);
insert into venue_images values(2, "C:/Users/admin/Downloads/radisonnagpur.jpg",2);
insert into venue_images values(3, "C:/Users/admin/Downloads/tuli.jpg",3);
insert into venue_images values(4, "C:/Users/admin/Downloads/empire.jpg",4);
insert into venue_images values(5, "C:/Users/admin/Downloads/pridenagpur.jpg",5);
insert into venue_images values(6, "C:/Users/admin/Downloads/radisonnagpur.jpg",6);
insert into venue_images values(7, "C:/Users/admin/Downloads/tuli.jpg",7);
insert into venue_images values(8, "C:/Users/admin/Downloads/testimg.jpg",8);
insert into venue_images values(9, "C:/Users/admin/Downloads/testimg.jpg",9);





UPDATE `event_db_final`.`venue_images` SET `venueimg` = './images/tuli.jpg' WHERE (`image_id` = '3');
UPDATE `event_db_final`.`venue_images` SET `venueimg` = './images/empire.jpg' WHERE (`image_id` = '8');
UPDATE `event_db_final`.`venue_images` SET `venueimg` = './images/pridenagpur.jpg' WHERE (`image_id` = '5');
UPDATE `event_db_final`.`venue_images` SET `venueimg` = './images/empirebanglore.jpg' WHERE (`image_id` = '4');
UPDATE `event_db_final`.`venue_images` SET `venueimg` = './images/pridePune.jpg' WHERE (`image_id` = '1');
UPDATE `event_db_final`.`venue_images` SET `venueimg` = './images/radisonPune.jpg' WHERE (`image_id` = '6');
UPDATE `event_db_final`.`venue_images` SET `venueimg` = './images/tuliJaipurr.jpg' WHERE (`image_id` = '7');
UPDATE `event_db_final`.`venue_images` SET `venueimg` = './images/empireGoa.jpg' WHERE (`image_id` = '9');
UPDATE `event_db_final`.`venue_images` SET `venueimg` = './images/radisonnagpur.jpg' WHERE (`image_id` = '2');

ALTER TABLE `event_db_final`.`venue_images` 
CHANGE COLUMN `venueimg` `venueimg` VARCHAR(150) NULL DEFAULT NULL ;

CREATE TABLE events(
eventid INT PRIMARY KEY AUTO_INCREMENT,
eventName VARCHAR(50),
start_date DATE,
end_date DATE,
vendorid INT DEFAULT 1,
FOREIGN KEY(vendorid) REFERENCES vendor(vendorid),
venueid  INT,
FOREIGN KEY(venueid) REFERENCES venue(venueid),
userid INT,
FOREIGN KEY(userid) REFERENCES user(userid),
payment_status VARCHAR(50),
amount INT,
rating_status VARCHAR(10)
);

ALTER TABLE `event_db_final`.`events` 
DROP COLUMN `end_date`,
DROP COLUMN `start_date`,
DROP COLUMN `eventName`;



ALTER TABLE events ADD FOREIGN KEY(vendorid) REFERENCES vendor (vendorid) ON UPDATE CASCADE;
ALTER TABLE events ADD FOREIGN KEY(venueid) REFERENCES venue (venueid) ON UPDATE CASCADE;
ALTER TABLE events ADD FOREIGN KEY(userid) REFERENCES user (userid) ON UPDATE CASCADE;



INSERT INTO `event_db_final`.`events` (`eventid`,`venueid`, `userid`, `payment_status`, `amount`, `rating_status`) VALUES ('1',  '2', '1', 'done', '120000', 'done');
INSERT INTO `event_db_final`.`events` (`eventid`, `venueid`, `userid`, `payment_status`, `amount`, `rating_status`) VALUES ('2',   '1', '4', 'done', '150000', 'done');
INSERT INTO `event_db_final`.`events` (`eventid`,`venueid`, `userid`, `payment_status`, `amount`, `rating_status`) VALUES ('3','3', '3', 'done', '45000', 'done');
INSERT INTO `event_db_final`.`events` (`eventid`, `venueid`, `userid`, `payment_status`, `amount`, `rating_status`) VALUES ('4','4', '2', 'done', '456000', 'done');
INSERT INTO `event_db_final`.`events` (`eventid`, `venueid`, `userid`, `payment_status`, `amount`, `rating_status`) VALUES ('5','2', '4', 'done', '120000', 'done');