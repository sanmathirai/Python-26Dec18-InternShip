/*
SQLyog Enterprise - MySQL GUI v8.12 
MySQL - 5.6.16 : Database - builders
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`builders` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `builders`;

/*Table structure for table `auth_group` */

DROP TABLE IF EXISTS `auth_group`;

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group` */

/*Table structure for table `auth_group_permissions` */

DROP TABLE IF EXISTS `auth_group_permissions`;

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_group_permissions` */

/*Table structure for table `auth_permission` */

DROP TABLE IF EXISTS `auth_permission`;

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=latin1;

/*Data for the table `auth_permission` */

insert  into `auth_permission`(`id`,`name`,`content_type_id`,`codename`) values (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add signup',7,'add_signup'),(26,'Can change signup',7,'change_signup'),(27,'Can delete signup',7,'delete_signup'),(28,'Can view signup',7,'view_signup'),(29,'Can add register',7,'add_register'),(30,'Can change register',7,'change_register'),(31,'Can delete register',7,'delete_register'),(32,'Can view register',7,'view_register'),(33,'Can add property_details',8,'add_property_details'),(34,'Can change property_details',8,'change_property_details'),(35,'Can delete property_details',8,'delete_property_details'),(36,'Can view property_details',8,'view_property_details'),(37,'Can add about_company',9,'add_about_company'),(38,'Can change about_company',9,'change_about_company'),(39,'Can delete about_company',9,'delete_about_company'),(40,'Can view about_company',9,'view_about_company'),(41,'Can add about_builders',9,'add_about_builders'),(42,'Can change about_builders',9,'change_about_builders'),(43,'Can delete about_builders',9,'delete_about_builders'),(44,'Can view about_builders',9,'view_about_builders');

/*Table structure for table `auth_user` */

DROP TABLE IF EXISTS `auth_user`;

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user` */

/*Table structure for table `auth_user_groups` */

DROP TABLE IF EXISTS `auth_user_groups`;

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_groups` */

/*Table structure for table `auth_user_user_permissions` */

DROP TABLE IF EXISTS `auth_user_user_permissions`;

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `auth_user_user_permissions` */

/*Table structure for table `django_admin_log` */

DROP TABLE IF EXISTS `django_admin_log`;

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_admin_log` */

/*Table structure for table `django_content_type` */

DROP TABLE IF EXISTS `django_content_type`;

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `django_content_type` */

insert  into `django_content_type`(`id`,`app_label`,`model`) values (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(9,'poll','about_builders'),(8,'poll','property_details'),(7,'poll','register'),(6,'sessions','session');

/*Table structure for table `django_migrations` */

DROP TABLE IF EXISTS `django_migrations`;

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

/*Data for the table `django_migrations` */

insert  into `django_migrations`(`id`,`app`,`name`,`applied`) values (1,'contenttypes','0001_initial','2019-01-24 09:03:33.614846'),(2,'auth','0001_initial','2019-01-24 09:03:52.345655'),(3,'admin','0001_initial','2019-01-24 09:03:56.582366'),(4,'admin','0002_logentry_remove_auto_add','2019-01-24 09:03:56.683305'),(5,'admin','0003_logentry_add_action_flag_choices','2019-01-24 09:03:56.770855'),(6,'contenttypes','0002_remove_content_type_name','2019-01-24 09:03:59.853040'),(7,'auth','0002_alter_permission_name_max_length','2019-01-24 09:04:01.099102'),(8,'auth','0003_alter_user_email_max_length','2019-01-24 09:04:02.217297'),(9,'auth','0004_alter_user_username_opts','2019-01-24 09:04:02.273583'),(10,'auth','0005_alter_user_last_login_null','2019-01-24 09:04:03.459782'),(11,'auth','0006_require_contenttypes_0002','2019-01-24 09:04:03.499893'),(12,'auth','0007_alter_validators_add_error_messages','2019-01-24 09:04:03.567077'),(13,'auth','0008_alter_user_username_max_length','2019-01-24 09:04:04.775725'),(14,'auth','0009_alter_user_last_name_max_length','2019-01-24 09:04:05.967832'),(15,'poll','0001_initial','2019-01-24 09:04:06.494309'),(16,'sessions','0001_initial','2019-01-24 09:04:09.051675'),(17,'poll','0002_auto_20190124_1501','2019-01-24 09:31:37.448240'),(18,'poll','0003_property_details','2019-01-25 06:52:33.406105'),(19,'poll','0004_property_details_propertyi','2019-01-25 08:26:46.633529'),(20,'poll','0005_auto_20190128_1157','2019-01-28 06:27:51.327851'),(21,'poll','0006_auto_20190128_1204','2019-01-28 06:34:17.649634'),(22,'poll','0007_about_company','2019-02-01 11:09:30.772365'),(23,'poll','0008_auto_20190201_1700','2019-02-01 11:30:06.406080'),(24,'poll','0009_auto_20190201_2037','2019-02-01 15:07:13.483695'),(25,'poll','0010_auto_20190201_2052','2019-02-01 15:23:00.885673');

/*Table structure for table `django_session` */

DROP TABLE IF EXISTS `django_session`;

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `django_session` */

/*Table structure for table `poll_about_builders` */

DROP TABLE IF EXISTS `poll_about_builders`;

CREATE TABLE `poll_about_builders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` varchar(25) NOT NULL,
  `website` varchar(25) NOT NULL,
  `timing` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `poll_about_builders` */

insert  into `poll_about_builders`(`id`,`email_id`,`website`,`timing`) values (1,'abhish@gmail.in','abishbuilders.com','Mon-Sat 9:00-7:00');

/*Table structure for table `poll_property_details` */

DROP TABLE IF EXISTS `poll_property_details`;

CREATE TABLE `poll_property_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `property_name` varchar(100) NOT NULL,
  `adress` varchar(30) NOT NULL,
  `property_details` varchar(1350) NOT NULL,
  `about_location` varchar(1350) NOT NULL,
  `facilities` varchar(1350) NOT NULL,
  `property_image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=latin1;

/*Data for the table `poll_property_details` */

insert  into `poll_property_details`(`id`,`property_name`,`adress`,`property_details`,`about_location`,`facilities`,`property_image`) values (13,'Karnad Avenue','Mulki, Karnad-458','Karnad Avenue is a huge project of residential and commercial proportions with ample space for parki','Mulki, Karnad is no match for the ordinary! It symbolizes a great heritage. Freedom fighters and art','Shopping complexSpacious Visitors LobbyVisitors Car ParkingGymnasiumChildren\\\'s Play area wi','property_image/homeimage.jpg'),(42,'Yash delight','KUPPEPADAV','Soars Residency, an extremely well maintained 5 storied residential apartment building hidden next t','Soars Residency, an extremely well maintained 5 storied residential apartment building hidden next t','Soars Residency, an extremely well maintained 5 storied residential apartment building hidden next t','property_image/mainsores_6p6b6Ke.jpg'),(48,'IN-LANd','There are many variations of p','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alter','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alter','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alter','property_image/mainsores_YLlJ1Rz.jpg'),(50,'IN-FIELd','KUPPEPADAV','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.','There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text.','property_image/homeimage_ldQua8R.jpg'),(51,'XYZ','jhkkj','kljlkjl','kjklj','jhjjjjjjjjjj','property_image/yash_elite_kjAAwI0.jpg'),(52,'sdf','sdf','sdf','sdf','sdf','property_image/mainsores_EeZvz8P.jpg'),(53,'MMM','KUPPEPADAV','kkkkkkkkk','llllllllllll','mmmmmmmm','property_image/kamala3122131_bjaQ6Ro.jpg'),(54,'n','hjfjydtumdtuj','kkkklllllll','eeeeeeeee','rrrrrrrrrrrrrrrrr','property_image/mainsores_O0E1vBu.jpg'),(55,'Yash delight','KUPPEPADAV','hggggggggggggggggggg','ggggggggggggggg','hhhhhhhhhhhhhhh','property_image/yash_elite_jL8yfli.jpg'),(56,'Yash delight','KUPPEPADAV','hggggggggggggggggggg','ggggggggggggggg','hhhhhhhhhhhhhhh','property_image/yash_elite_19xf2wc.jpg'),(57,'n','KUPPEPADAV','mmmmmmmmmm','ddddddddd','pppppppppp','property_image/lotus1bj_MorpEY8.jpg'),(58,'Yash delight','jjjjjjjjj','jjj','j','j','property_image/prop_thumb_main2_tGYXTFa.jpg'),(59,'Yash delight','jjjjjjjjj','jjj','j','j','property_image/prop_thumb_main2_mY9ssKa.jpg'),(60,'Yash delight','KUPPEPADAV','m','h','h','property_image/homeimage_RCu1j1u.jpg'),(61,'Yash delight','KUPPEPADAV','m','h','h','property_image/homeimage_3IB9Fcb.jpg'),(62,'Yash delight','KUPPEPADAV','m','h','h','property_image/homeimage_dhmRSN7.jpg'),(63,'Yash delight','KUPPEPADAV','m','h','h','property_image/homeimage_bEPg9ER.jpg'),(64,'Yash delight','h','j','j','j','property_image/lotus1bj_Jc4Oext.jpg'),(65,'Yash delight','h','j','j','j','property_image/lotus1bj_164sZy9.jpg'),(66,'n','KUPPEPADAV','aJ','j','j','property_image/kamala3122131_RDlyD7R.jpg'),(67,'n','KUPPEPADAV','aJ','j','j','property_image/kamala3122131_TaOxF84.jpg'),(68,'n','hjfjydtumdtuj','j','j','j','property_image/kamala3122131_B7rFK9R.jpg'),(69,'n','hjfjydtumdtuj','j','j','j','property_image/kamala3122131_FW1Rv3u.jpg'),(70,'Yash delight','dddd','ddddd','dd','dd','property_image/yash_elite_x0gSudh.jpg'),(71,'s','KUPPEPADAV','s','s','s','property_image/prop_thumb_main2_9DztP39.jpg'),(72,'s','KUPPEPADAV','s','s','s','property_image/prop_thumb_main2_qFtkjTn.jpg'),(73,'s','KUPPEPADAV','s','s','s','property_image/prop_thumb_main2_JqCPcfF.jpg'),(74,'n','KUPPEPADAV','g','g','g','property_image/kamala3122131_hRP0dgu.jpg');

/*Table structure for table `poll_register` */

DROP TABLE IF EXISTS `poll_register`;

CREATE TABLE `poll_register` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `emailid` varchar(25) NOT NULL,
  `password` longtext NOT NULL,
  `contact` varchar(25) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;

/*Data for the table `poll_register` */

insert  into `poll_register`(`id`,`name`,`emailid`,`password`,`contact`) values (3,'shyamala','shyamal@gmail.com','1234','1'),(4,'megha','Megha@gmail.com','123','1'),(5,'admin','admin@gmail.com','admin','124'),(6,'Sanmathi','sanmathirai2720@gmail.com','1234567891','1234567891'),(34,'1236547896','sanmathirai2720@gmail.com','sanmathirai2720@gmail.com','4'),(35,'1236547896','sanmathirai2720@gmail.com','sd111111111111111','4444444'),(36,'1236547896','sanmathirai2720@gmail.com','sd111111111111111','4444444'),(37,'','sanmathirai2720@gmail.com','sdfffffffffffffff','45678'),(38,'','sanmathirai2720@gmail.com','sdfffffffffffffff','45678'),(39,'','sanmathirai2720@gmail.com','ssssssssssssssss','44'),(40,'1236547896','sanmathirai2720@gmail.com','zzzzzzzzzzzzzz','1'),(41,'','asd@gmail.com','1234444444','4'),(42,'','asd@gmail.com','1234444444','4'),(43,'','sdf@gmail','sdfddddddddddddd','7'),(44,'','sdf@gmail','sdfddddddddddddd','7'),(45,'sanmathi','sanmathirai2720@gmail.com','1231111111111111','789'),(46,'sanmathi','sanmathirai2720@gmail.com','1231111111111111','789'),(47,'1236547896','shyamal@gmail.com','0234444444444444','1'),(48,'7787654344','sanmathirai2720@gmail.com','45655555555555','546'),(49,'klo O','sanmathirai2720@gmail.com','1aaaaaaaaaaaaaaaaaaaaaaa','1234'),(50,'klo O','sanmathirai2720@gmail.com','1aaaaaaaaaaaaaaaaaaaaaaa','1234'),(51,'sanm','sunidhi@gmail.com','1s4444444444444','1'),(52,'sanm','sunidhi@gmail.com','1s4444444444444','1'),(53,'Sanmathi','Megha@gmail.com','1Aaaaaaaaaaaaaaaaaa','45');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
