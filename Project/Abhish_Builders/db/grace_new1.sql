/*
SQLyog Enterprise - MySQL GUI v8.12 
MySQL - 5.6.16 : Database - grace_new
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`grace_new` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `grace_new`;

/*Table structure for table `article_categories` */

DROP TABLE IF EXISTS `article_categories`;

CREATE TABLE `article_categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int(10) unsigned NOT NULL,
  `position` int(11) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `user_id_edited` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `article_categories_language_id_foreign` (`language_id`),
  KEY `article_categories_user_id_foreign` (`user_id`),
  KEY `article_categories_user_id_edited_foreign` (`user_id_edited`),
  CONSTRAINT `article_categories_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  CONSTRAINT `article_categories_user_id_edited_foreign` FOREIGN KEY (`user_id_edited`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `article_categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `article_categories` */

insert  into `article_categories`(`id`,`language_id`,`position`,`user_id`,`user_id_edited`,`title`,`slug`,`created_at`,`updated_at`,`deleted_at`) values (1,2,NULL,1,NULL,'Autem molestiae deserunt magnam pariatur nulla nesciunt.','ut-et-cum-voluptatem-consectetur-enim-fugiat','2016-02-19 12:24:01','2016-02-19 12:24:01',NULL),(2,3,NULL,1,NULL,'Recusandae alias dolor culpa in nostrum non distinctio quidem.','nemo-et-ipsa-voluptatem-sapiente-ut','2016-02-19 12:24:01','2016-02-19 12:24:01',NULL);

/*Table structure for table `articles` */

DROP TABLE IF EXISTS `articles`;

CREATE TABLE `articles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int(10) unsigned NOT NULL,
  `position` int(11) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `user_id_edited` int(10) unsigned DEFAULT NULL,
  `article_category_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `introduction` text COLLATE utf8_unicode_ci NOT NULL,
  `content` text COLLATE utf8_unicode_ci NOT NULL,
  `source` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `picture` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `articles_language_id_foreign` (`language_id`),
  KEY `articles_user_id_foreign` (`user_id`),
  KEY `articles_user_id_edited_foreign` (`user_id_edited`),
  KEY `articles_article_category_id_foreign` (`article_category_id`),
  CONSTRAINT `articles_article_category_id_foreign` FOREIGN KEY (`article_category_id`) REFERENCES `article_categories` (`id`) ON DELETE SET NULL,
  CONSTRAINT `articles_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  CONSTRAINT `articles_user_id_edited_foreign` FOREIGN KEY (`user_id_edited`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `articles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `articles` */

insert  into `articles`(`id`,`language_id`,`position`,`user_id`,`user_id_edited`,`article_category_id`,`title`,`slug`,`introduction`,`content`,`source`,`picture`,`created_at`,`updated_at`,`deleted_at`) values (1,3,NULL,1,NULL,2,'Aperiam sint mollitia autem enim.','ea-eos-neque-quam-voluptas-et','Veniam nulla quia quia voluptas fugiat officiis cupiditate. Est et vel recusandae a.','Voluptatem et omnis magnam saepe reprehenderit vel rerum inventore. Temporibus dicta quis molestias sed animi molestiae nam. Ullam illo ad et.','http://www.Crist.com/',NULL,'2016-02-19 12:24:01','2016-02-19 12:24:01',NULL),(2,1,NULL,1,NULL,1,'Non adipisci et iusto quae deleniti.','rerum-iusto-soluta-unde-veritatis-non','Sed est maiores veritatis et. Sunt non maiores aut ad. Consequuntur excepturi dolorem ducimus molestias distinctio quis et. Praesentium asperiores rerum esse velit et commodi molestiae.','Quidem qui ratione dolorum nesciunt maxime impedit et quaerat. Qui ipsa autem reiciendis et incidunt amet ullam. Inventore ea quidem voluptas aperiam rerum. Repellat voluptatem alias odit.','http://www.Gerhold.info/autem-iusto-sed-culpa-odit',NULL,'2016-02-19 12:24:01','2016-02-19 12:24:01',NULL);

/*Table structure for table `content_pages` */

DROP TABLE IF EXISTS `content_pages`;

CREATE TABLE `content_pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(1000) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'Linked to users table',
  `menu_id` int(11) NOT NULL COMMENT 'Linked to Menus table',
  `heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Heading',
  `sub_heading` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'SubHeading',
  `thumbnail` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Thumbnail',
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Author',
  `datetime` datetime DEFAULT NULL COMMENT 'Date',
  `short_description` varchar(1000) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Content shorrt description',
  `content` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Page content',
  `keywords` text COLLATE utf8_unicode_ci,
  `category` enum('Home','About Us','Our Services','Prayer Center','Daily Devotion','News','Testimonials','Donation','Photo Gallery','Media/Videos','Shop Cart','Contact Us','Saint of the day') COLLATE utf8_unicode_ci NOT NULL COMMENT 'Category',
  `photo_album_id` int(11) NOT NULL COMMENT 'Linked to photo album',
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Slug',
  `slug_heading` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `display` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `content_pages` */

insert  into `content_pages`(`id`,`name`,`location`,`user_id`,`menu_id`,`heading`,`sub_heading`,`thumbnail`,`author`,`datetime`,`short_description`,`content`,`keywords`,`category`,`photo_album_id`,`url`,`target`,`slug`,`slug_heading`,`display`,`created_at`,`updated_at`,`deleted_at`) values (1,'','',1,1,'Welcome','Grace Ministries is called to share the Gospel and extend the love of Christ.','d800fffa543c8867f75cc7c017fa22939f520235.png',NULL,'2016-03-02 11:18:52','<p>Our prayer for you is that the God of all grace anoints you with fresh oil and His precious Spirit illuminates the Word as you read. May He empower you to effectively communicate to others the vibrant hope that He has given you to persevere the struggles that you have overcome and continue to overcome.</p>','<p>Our prayer for you is that the God of all grace anoints you with fresh oil and His precious Spirit illuminates the Word as you read. May He empower you to effectively communicate to others the vibrant hope that He has given you to persevere the struggles that you have overcome and continue to overcome.<br />Furthermore, I pray that your home be a reflection of the joy and peace that God has promised to all of His children who follow Him. We bless your children, the fruit of your body. We speak life into your family, your work and your mission.</p>\r\n<p>Your prayers, your support and your love are important to us. So we pray you will take care of yourself.</p>\r\n<p>&ldquo;<strong>Reaching the unreached</strong>&rdquo; this is the sole aim and objective of <strong>GRACE MINISTRY</strong>. We always work towards our goal. The road might seem long and difficult but with the mercy of the God it is sure to achieve success. A different kind of success, the priceless smile on the faces of the people that we intend to bring.</p>',NULL,'Home',1,'#','parent','welcome','welcome','Y','2016-02-19 12:24:04','2016-03-09 11:18:52',NULL),(2,'','',1,2,'About Bro.Andrew Richard','Charismatic Preacher, Visionary, Provocative Thinker','bc11f2f38c7ccf57c48050ce1c8f576397feb2b2.JPG',NULL,'2016-03-02 09:57:41','<p>Bro.Andrew Richard is a charismatic preacher, Visionary, Provocative thinker and &nbsp;also &nbsp;known for extending a <strong>hand of help to the needy, heart of compassion to the hurting, and message of inspiration</strong> to the disenfranchised, he operates the Grace Ministry, a global humanitarian organization in India with the aim of reaching the unreached.</p>\r\n<p>He has been serving the people of all ages, faiths and nationalities bringing comfort and hope to the broken - hearted and healing to the souls, minds, bodies and families turning their sorrows into a great joy.</p>','<p>Bro.Andrew Richard is a charismatic preacher, Visionary, Provocative thinker and &nbsp;also &nbsp;known for extending a <strong>hand of help to the needy, heart of compassion to the hurting, and message of inspiration</strong> to the disenfranchised, he operates the Grace Ministry, a global humanitarian organization in India with the aim of reaching the unreached.</p>\r\n<p>He has been serving the people of all ages, faiths and nationalities bringing comfort and hope to the broken - hearted and healing to the souls, minds, bodies and families turning their sorrows into a great joy.</p>\r\n<p>Bro.Andrew&rsquo;s journey is a humbling story of how God raised a young man from poverty - stricken home to lead an international ministry that would attract thousands worldwide to witness the reality of God&rsquo;s power today.</p>\r\n<p>Since his transformation at the age of 25 he went on to acquire his bachelor of Theology (B.th) and Masters of Theology (M.th) alongside he also got his doctorate of Philosophy from the united Open University. He also attended the international conference at the renowned HAGGAI University at Hawaii, U.S.A., He teaches on a number of topics with a particular focus on the mind, mouth, moods and attitudes. His candid communication style allows him to share openly and practically about his experiences so others can apply what he has learned to their lives.</p>\r\n<p>Bro.Andrew hosts a TV show, Blessing Time &reg;, which broadcasts on the costal wing to a potential audience of half a million people. He has authored 15 books, which have been translated into more than 6 languages. Some of his sermons &ldquo;Don&rsquo;t die in your nest&rdquo;, &ldquo;The Awakening&rdquo;, Giants at the gate&rdquo;, &ldquo;Oppositions are your opportunities&rdquo;; &ldquo;Life of Mother Mary&rdquo; are of one of the prophetic and powerful sermons which has created a greater impact and transformation in the lives of the people.</p>\r\n<p>Today, the Holy Spirit is demonstrating His power through Bro.Andrew Richard and is using him as a vessel in proclaiming God&rsquo;s Word, He has travelled all across the globe and people come to listen to him in different cities. His and his wife Hanna is parents of 2 children Isaac and Moses who continue their mission in serving humanity. His motto in life is &ldquo;<strong>Reaching the unreached</strong>&rdquo;.</p>',NULL,'About Us',2,'#','parent','andrewrichard','','Y','2016-02-19 12:24:04','2016-03-03 09:57:41',NULL),(9,'','',1,3,'Slum Ministry','Slum Ministry Programmes','85a11cedb9ca74dca49e20e2bde1486cb91e29fd.jpg',NULL,'2016-02-22 10:41:12','<p>GRACE MINISTRY organizes campaigns called ministry on SLUM to help the people of the slum to overcome their basic necessities like food, clothing .and shelter. We target the slum areas and do our bit for helping THEM for their upliftment.&nbsp;</p>','<p>GRACE MINISTRY organizes campaigns called ministry on SLUM to help the people of the slum to overcome their basic necessities like food, clothing and shelter. We target the slum areas and do our bit for helping THEM for their upliftment. We have provided the hungry slum dwellers provisional items, also distributed books and toys to the needy kids. We also conduct various camps, with the aim of the upliftment of all the children. Any sort of basic amenity that a normal person would require is hoped to be given to every person under our reach.</p>\r\n<p>Slums are characterized by Substandard housing, squalor and lacking in tenure security.The rising phenomenon of slum tourism has western tourist paying to take guided tours of slums.This tourism niche is operating in almost all major slums around the .It is very sad to know that one person&rsquo;s pain has become other person&rsquo;s source of entertainment. Instead of helping these people to come out of this pathetic condition people have made it business. We fail to realize that they too are human beings and have equal rights to live like we do. Grace ministry upholds this principle.</p>\r\n<p>Our aim is to get them out of their habitat and help in their upliftment. It is sad that we don&rsquo;t realize that we are gifted with so many luxuries in our lives that many only can dream of. We always grumble and accuse God telling, he never gave us anything. but I strongly request that such people should join hands with Grace Ministry and visit these areas with them. Am sure you will realize how lucky you are and how even more lucky you can get by helping these people.</p>\r\n<p>Simplicity is the key. Sacrificing our little joy to bring an epic change into the lives of other people seems unreal, but it is true. We are always ready to lend a helping hand to the needy at any point of time. He healed many, so do we intend to do. We also have provided medical care and attention to all who were in the need of it, under our reach. With the mercy of the lord we intend to continue it with a hope that one day this world will be free of suffering, pain and anxiety and only joy will be seen all over.</p>\r\n<p>Our mission is to encourage, inspire and bring about practical change through community development, awareness and humanitarian efforts using carefully planned activities to promote communal unity, build the nation, uplift the poor and restore the dignity of the downtrodden and oppressed.</p>\r\n<p>Our future plans for the slums are:</p>\r\n<p>&bull; Alleviate poverty<br />&bull; Adult literacy<br />&bull; To improve water and sanitation<br />&bull; Relief in times of disaster<br />&bull; Health awareness and provide basic medical care<br />&bull; Dignity to the oppressed</p>\r\n<p><strong>Join us today in supporting this cause!</strong></p>',NULL,'Our Services',3,'','parent','slumministry','','Y','2016-02-22 13:11:34','2016-03-08 10:41:12',NULL),(11,'','',1,2,'About Grace Ministry','Reaching the reached','5b391058abaf1a415d7b7388cd502426205e22e4.jpg',NULL,'2016-02-23 04:09:05','','<p>Grace Ministry is an International Charismatic ministry of repute which is founded by Bro. Andrew Richard with a divine vision to heal the brokenhearted. According to the will of God he opened a organization in India and thus was born the Grace Ministry. With Divine intervention which he received through prayer and fasting he commenced his ministry with the vision of proclaiming God&rsquo;s word all throughout the world. Through the grace of the God he was able to radiate God&rsquo;s Love to mankind and most importantly bring many a soul closer to God.</p>\r\n<p><img src=\"../../../fileman/Uploads/download.jpg\" alt=\"\" width=\"196\" height=\"140\" />Through Grace Ministry many a lives have been blessed and transformed.The Ministry is involved in conducting daily counselings for people of all walks of life ,Weekly Retreats Prayers and Prophetic teachings have been a source of inspiration for many and it is here that the Word of God is read, meditated and most importantly reflected upon. Many people from all over throng to seek God&rsquo;s Blessings through Bro.Andrew Richard. True transformations, salvation and healings are experiences of many people who are a part of the Grace Ministry.</p>\r\n<p>It is through Bro.Andrew Richard that God performs miracles and wonders and many a lives have been touched, renewed and transformed, thus bringing them closer to God&rsquo;s Kingdom forming a Covenant with Jesus Christ, our Savior.</p>',NULL,'About Us',3,'','parent','graceministry','about-grace-ministry','Y','2016-02-23 08:18:47','2016-03-24 04:09:05',NULL),(13,'','',1,2,'About Hanna Ministry','Hanna Ministry','06db7efd4dd0e4352f8b5d4e667e507a234e27c7.png',NULL,'2016-02-23 10:30:48','<p>A soft nature girl (<strong>Hanna</strong>) became a part of the Grace Ministry through her marriage to <strong>Bro.Andrew Richard</strong> on 6th of May 1993. Born on August 9th, 1968, <strong>Sis. Hanna</strong> was a perfect gift and..</p>','<p>A soft nature girl (<strong>Hanna</strong>) became a part of the Grace Ministry through her marriage to <strong>Bro.Andrew Richard</strong> on 6th of May 1993. Born on August 9th, 1968, <strong>Sis. Hanna</strong> was a perfect gift and treasure according to God&rsquo;s plan in the life of<strong> Bro.Andrew Richard</strong>.</p>\r\n<p>Today, she stands as a prophetic servant of God before thousands of people bringing God&rsquo;s mighty presence and power through prayer. Whenever she prays, the Spirit of God talks into her the mysteries and revelation in a mightier way though her.</p>\r\n<p>She ministers in all the key Grace Ministry retreats meetings and especially to the families and women through the Women Retreats.</p>\r\n<p>By the grace of God, many are witnessing mighty miracles and deliverance from bondage and sickness in her ministry. Many who have been oppressed from the evil spirit are delivered during her prayer time. Young men and women open their hearts to Jesus in their lives. Broken families are united. People; open their hearts to Jesus in their lives hearing her messages.<br /> <br />Sis.Hanna operates the &ldquo;<strong>Special Individual prayer</strong>&rdquo; on every Tuesdays and people throng to her prayers in large numbers, it&rsquo;s an individual prayer where the Lord reveals and keeps updating her about each person regarding their lives, and truly countless number of people has experienced the power and the touch of God and the testimonies regarding her prayers are just astonishing .</p>\r\n<p>God has blessed her and <strong>Bro.Andrew Richard</strong> with two lovely children Isaac and Moses who in the footsteps of their parents stand in front of thousands and bring glory to God through their singing and worship even from their childhood days. Now, Isaac reaches the youngsters with his clarity message and songs. Moses with his songs and stories has captured hearts of many children and elders as well.</p>',NULL,'About Us',3,'','parent','hannaministry','','Y','2016-02-23 08:18:47','2016-03-08 10:30:48',NULL),(14,'','',1,2,'About Issac Ministry','ISAAC MINISTRY','c0ecf34412823d42ccc2ac7a3b306778f8c5f726.png',NULL,'2016-02-23 08:56:22','<p>Isaac Richard is the eldest son of Dr.Bro.Andrew Richard and Sis.Hanna Richard. He has dedicated his life to evangelization thus leading the <strong>&ldquo;Isaac Ministry&rdquo;</strong> with its forte being <strong>&ldquo;Changing Lives&ldquo;</strong></p>','<p>Isaac Richard is the eldest son of Dr.Bro.Andrew Richard and Sis.Hanna Richard. He has dedicated his life to evangelization thus leading the &ldquo;<strong>Isaac Ministry</strong>&rdquo; with its forte being <strong>&ldquo;Changing Lives&ldquo;</strong> which caters its resources towards the youth.</p>\r\n<p>Isaac was brought up under the watchful eyes of his parents so as to follow the path laid down by them. Isaac was a constant companion for his parents on their weekly prayer services, Outdoor prayer retreats and crusades, thus paving him the way to follow the footsteps of his parents. June 1994, saw the birth of the first male child to Dr.Bro. Andrew Richard and Sis. Hanna Richard, who was christened as Isaac Richard.</p>\r\n<p>At the tender age of 6 at one such prayer meeting in the year 2000 Isaac was made to taste the waters of Evangelizeation &hellip; Praise The Lord!! He was seated back stage and on that day once Dr. Bro Andrew Richard had completed his preaching, he announced that Isaac would preach the Word of God. This announcement jolted Isaac from his back stage seat and brought him onto the stage where he was stating how he could preach without any preparation and that too in front of a huge gathering. Bro.Andrew Richard told him to Trust in the Lord and invoke the blessing of the Holy Spirit and begin to pray. As the Bible in Mathew 10: 20 quotes &ldquo;For it will not be you who speak but the Spirit of your Father speaking through you&rdquo;. Isaac himself could not believe how the Word of God was flowing freely from his mouth and that he had spoken for a stretch of 25 minutes. After he had completed his preaching there were many a people who walked up to him and said that they were touched by his preaching and have been blessed.</p>\r\n<p>Thus kindled the fire and there came a transformation in the life of Isaac so as to understand how God can take control of the situation (no matter what it is) if you Trust and surrender yourself to the Almighty. There was no looking back for Isaac and from thereon he became a regular participant in the activities of Grace Ministries.</p>\r\n<p>September 2011 with the Blessings of the Almighty, his parents,Dr. Bro Andrew Richard and Sis. Hanna Richard and his younger brother Moses surrendered and dedicated Isaac to the service of God. This ceremony was conducted with a lot of sanctity in the presence of priests, reputed Evangelists, well &ndash;wishers and most importantly with the Blessings of the gathering.It was a day to remember in the life of Isaac. Isaac started to participate in spiritual conventions in schools, colleges and at prayer meetings / retreats and Television broadcasts. He also moved on to become a worship leader accompanying his parents both in India and abroad and thus was born a musician who became an integral part of the Grace Ministry leading the weekly prayer service gathering with his songs and praises week after week.</p>\r\n<p><strong>Join us today !</strong></p>\r\n<p>A quote to state is that one, who sings praises to God, prays twice. Isaac further moved on to actively participate in Counseling Ministry. He caters to people of all walks of life, listens to them attentively, be it in person or on telephone and then delivers the Word of God which soothes the soul. There are many a people who testify that they have been touched by his word and have been blessed.</p>\r\n<p><strong>Read inspiring article about PROBLEMS OF THE YOUTH AND ITS CHALLENGES by Isaac , a new edition !</strong></p>\r\n<p>The Youth Ministry led by Bro. Isaac Richard welcomes you all to send in your prayer request&rsquo;s and one can be rest assured that the contents will be kept highly confidential and most importantly we will pray sincerely along with our prayer warriors for your intention.<br /><strong>Send your prayer request at&nbsp;info@graceministryindia.org</strong></p>\r\n<p><br /><strong>YOU ARE BLESSED.</strong></p>',NULL,'About Us',3,'','parent','isaacrichard','','Y','2016-02-23 08:18:48','2016-03-09 08:56:22',NULL),(15,'','',1,4,'Prayer Center','Prayer Center','cea435aa725fa060728a4705a8989b2b42d83a31.jpg',NULL,'2016-02-23 10:05:06','<p><strong>Outreach Programmes</strong> Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.</p>','<p>Grace prayer centre is an international charismatic prayer house located in Mangalore the chief port city of the Indian state of Karnataka, it is a place where we never cease worshiping the Lord and interceding for the world.<br />The Lord appeared in a vision to both Bro.Andrew and Sis.Hanna and commissioned them to raise the Grace Prayer Centre, he also thus explained the reason for it:<br />Numerous number of people are suffering with various infirmities having no deliverance, peace ,comfort and love therefore I will make this sanctuary as an effective tool to heal the broken-hearted and comfort the needy and people shall throng into this place and I shall lit their faces with glory and joy and bring them comfort ,healing ,deliverance ,and restore all that they have lost .<br />True to his promise, the Lord has been blessing countless people, who throng to the grace prayer centre. The miracles that people experience here are truly astonishing. Today grace prayer centre stands as a light house to the faithful who are in distress.<br />Grace prayer centre is set admist the scenic splendour of the Adyar falls ,<br />12kms away from the Mangalore city .The landscape surrounding the Prayer Centre is beautiful with hills ,waterfalls ,green pastures and rivulets ,providing the most peaceful atmosphere for prayer and meditation. <br />You\'re warmly welcomed to our prayer house,<br />We will love to see you there<br />We want you to know the love of God<br />And feel His presence near<br />For you are so special to the Lord<br />And special to us, too,<br />For your life has significance,<br />And there\'s purpose in what you do.</p>\r\n<p>VISIT GRACE PRAYER CENTRE! THE COMPLETE PLACE OF WORSHIP!<br />For more details contact:<br />The Administrator<br />Grace Prayer Centre, International <br />Near srinivas college / Expert ,<br />Valchil, Merlapaduv, <br />Mangaluru - 574143</p>\r\n<p><br />Partner with us <br />I am so thankful for your consideration of partnering with Grace Ministry. We do not take such a covenant relationship lightly. It\'s our partners\' commitment and donations that ensure we\'re able to take the Gospel of Jesus Christ to the utmost parts of the world. We are most grateful for our relationship with these pillars, supporters, and friends of the ministry.<br />Partnership isn\'t a one-time event. It\'s a growing, thriving commitment where we both share in the benefits promised to us when we come together and spread the cause of Christ and further God\'s Kingdom. In partnering with us, you\'ll be distinguishing yourself as someone committed to Grace Ministry and one who shares its vision to save the lost, help the hurting, and spread the Gospel.<br />Upon partnering with Grace Ministry, we\'ll send you a Partner Welcome Kit, which includes a few resources to help further explain our relationship with one another, and give the history of Brother.Andrew Richard. As we grow together spiritually, I want you to see where we\'ve come from, and where God is taking us. <br />Together, I\'m sure we can impact the world and accomplish marvelous things to the glory of God. Remember, there is strength and power in partnership, and as this ministry grows, so will you. Again, thank you for considering partnering and sowing into this ministry. Prayerfully, you\'ll be able to declare with us&hellip;<br />\"It\'s not just what we SAY&hellip;it\'s what we DO.\"<br />In His Service,<br />Brother.Andrew Richard</p>',NULL,'Prayer Center',3,'','parent','prayercenter','','Y','2016-02-23 08:18:48','2016-03-03 04:16:32','2016-03-03 04:16:32'),(18,'','',1,8,'Donation','Donation','',NULL,'2016-02-23 08:57:52','','<p>Donation</p>',NULL,'Donation',3,'','parent','donation','','Y','2016-02-23 08:18:48','2016-03-09 08:57:52',NULL),(21,'','',1,11,'Shop Cart','Shop Cart','','','2016-02-23 08:18:48',' Outreach Programmes Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.','Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.',NULL,'Shop Cart',3,'','parent','shopcart','','Y','2016-02-23 08:18:48','2016-02-23 08:18:48',NULL),(22,'','',1,12,'Contact us','Contact us','',NULL,'2016-02-23 11:22:10','','<p><strong>Grace Ministry</strong> <br />Serrao complex , 1st floor , next to cochin bakery ,<br />Kankandy , Mangalore - 575002</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><a href=\"../../../article/prayercenter\"><strong>Grace Prayer Centre, International</strong> </a><br />Near srinivas college / Expert ,<br />Valchil, Merlapaduv, <br />Mangaluru - 574143</p>\r\n<p><strong>Email - info@graceministryindia.org</strong></p>\r\n<p>&nbsp;</p>',NULL,'Contact Us',3,'','parent','contact-us','contact-us','Y','2016-02-23 08:18:48','2016-03-12 11:22:10',NULL),(24,'','',1,2,'About Counselling Ministry','Counselling Ministry','018300a4224771be62ae8ebd49d9cfffef241101.png',NULL,'2016-03-02 10:07:39','<p>Depressed? Grace Ministry is also a part of giving counseling to the people who are in unwanted conditions,and people have received transformation through Bro.Andrew Richard and Sis.Hanna &lsquo;s heart touching words.</p>','<p>Counseling is different from regular counseling. Regular counseling gives you a solution (the act, method, or process of solving a problem or the answer to a problem) , But spiritual counseling gives you the antidote (anything that works against an evil or unwanted condition) to the problem. It fixes the problem once and for all.</p>\r\n<p>The scripture says,That If my people, which are called by my name, shall humble themselves, and pray, and seek my face, and turn from their wicked ways; then will I hear from heaven, and will forgive their sin, and will heal their land. (I Chronicles 7:14)</p>\r\n<p>Depressed? Grace Ministry is also a part of giving counseling to the people who are in unwanted conditions,and people have received transformation through Bro.Andrew Richard and Sis.Hanna &lsquo;s heart touching words spoken through the almighty Lord, as the scripture says, &ldquo;It is not you who speak but the spirit of your father who speaks in you (Mathew-10:20 )</p>\r\n<p>Bro.Andrew says, You are wise if you are a good listener and eager to learn your knowledge will increase for your good. Someone with good understanding will seek out wise counsel.<br />Who is a wise counsellor ? A wise Counsellor is someone who the Lord&rsquo;s spirit shall rest upon, the spirit of wisdom and understanding, the spirit of counsel and might, the spirit of knowledge and of the fear of the LORD; Christian Counsellors should attain these attributes in order to give effective counseling</p>\r\n<p>Dr.Bro.Andrew &lsquo;s Own Experience: The scripture says &ldquo;Where no counsel is, the people fall: but in the multitude of Counsellors there is safety. When people don&rsquo;t seek right counsel there is great confusion amongst them; but with wise counseling your life will be secure. (Proverbs 11:14).</p>\r\n<p>Spiritual counseling offered by godly men and women and professional Christian Counselors addresses the entire being of a person: the emotional, the spiritual, and the physical. Before there was ever such a thing as a Licensed Professional Counselor, the Bible was bringing truth and comfort to thousands who experienced the same traumatic circumstances that the people of today face.</p>\r\n<p>Grace Ministry is also comforting people who are in distress and also bringing consolation or hope in their lives . The Bible claims that our God is the God of all comfort, not just our counsel or guide. Through his tender methods of guiding us through life, He also provides healing and hope. Comfort is found not in the absence of pain but in the midst of it. &ldquo;Blessed be God, even the Father of our Lord Jesus Christ, the Father of mercies, and the God of all comfort&rdquo; (2 Corinthians 1:3). Biblical counseling can not only open our eyes to the truth of any given matter, but can also serve to usher in the presence of the Almighty God who extends a soothing touch. &ldquo;As one whom his mother comforteth, so will I comfort you: and ye shall be comforted in Jerusalem.&rdquo; (Isaiah 66:13) Through this passage we come to understand that God actually desires to extend comfort, just as a parent longs to comfort a crying child. Experiencing times of troubles and tribulations are opportunities to experience the God of all comfort .</p>\r\n<p>You too my people of God no matter what kind of difficulties you are facing today ,you may have been depressed due to many issues&rsquo;s surrounding in our life too, but do not worry we have a very great counsellor who can carry on your difficulties and give you total peace and comfort and that councellor is the Lord almighty who is seated in the heaven .</p>\r\n<p>Bro.Andrew and wife Hanna too are carrying the Lord&rsquo;s work by counseling the people by sharing their love with prophetic word&rsquo;s and lakhs of peole have received transformation and an experience of hope and faith in their life&rsquo;s .</p>\r\n<p><strong>For online counseling mail us your details to : info@graceministryindia.org&nbsp;, you will receive allotted time for online counseling with Bro.Andrew Richard.</strong></p>',NULL,'About Us',3,'','parent','counsellingministry','','Y','2016-03-02 00:00:00','2016-03-09 10:07:39',NULL),(25,'','',1,2,'About Esther ministry','Esther ministry','ebf545798e0e0f1e326085f14e145347e369e101.png',NULL,'2016-03-02 08:21:09','<p>It was a dry Desert. There was nothing else but only sand. There was not even sign of water around. The blaring sunlight was unbearable .Somebody was crying loudly with pain from a corner.&nbsp;</p>','<p>It was a dry Desert. There was nothing else but only sand. There was not even sign of water around. The blaring sunlight was unbearable .Somebody was crying loudly with pain from a corner. A woman with nothing but only tears, with torn dress was crying and weeping. She was crawling, rolling and completely wounded She was longing for a drop of water and was at the verge of death. Suddenly, a man appeared before her. He touched her and patted her back. The touch was so affectionate that the woman felt the love and the caring in that touch. The man fed her with handful of water and her thirst was quenched. She looked upon. She was astonished to see the bright face of the man with piercing eyes. She saw the man looking at her in a very kind and understanding way. His eyes assured her that she was going to be fine. The very moment, her pain went off and a peace came over her. She felt as if she got the new life. She knelt down and bowed her head onto the feet of the man and said &ldquo;My Lord&rdquo;. Yes. That was Jesus Christ. Jesus saved the woman. Jesus told her &lsquo;Go and do this to all those who suffer and are in need&rsquo;.</p>\r\n<p>This was the Vision seen by Sis. Hanna Richard. She did not go to interpret the Vision to understand the gist of it. She felt that God has chosen her for his service. Without any second thought, Sis. Hanna immediately decided to give the service to humanity.</p>\r\n<p>The God had planned something for Sis. Hanna and it was shown in the Vision. It was helping the Old Aged Women. Her vision turned into reality when Sister came across Esther Old Aged Women Home. She saw Jesus Christ in every woman at Esther Old Aged Women Home. Sis felt so excited to Jesus Christ. This made her dedicate herself in serving them. Sister knew that Jesus was telling her to visit these wonderful people, because it was like visiting the Lord.</p>\r\n<p>Sis. Hanna&rsquo;s faith in God made God&rsquo;s wish come true. Sis started the Esther Women&rsquo;s Ministry. She closely attended each woman with love and affection, understood individual&rsquo;s problem, consoled them, and realized their needs. She placed and surrendered all the problems and needs of these women before Jesus Christ and prayed to God. She sought God&rsquo;s help to bless the Esther Women&rsquo;s Ministry with the needs. God heard the prayer and has blessed the Home with the needs. The Esther Women&rsquo;s Ministry Home extends the helping and supporting hand in uplifting and the empowerment of the downtrodden, handicapped, poor, dumb, deaf, abandoned woman. As an initiative, the Home provides food, clothing and possible monetary to all woman at Esther Home. More importantly the kind touch, the love and the affection has made these women live a simple, peaceful and happy life. The contribution of Sis .Hanna and Grace Ministries towards humanity has really made their vision of &lsquo;Serving God&rsquo; come true. Sis. Hanna expresses sadness over how some woman are being abandoned once they show the signs of disease or old age. These abandoned women undergo tremendous stress. Sis. Hanna with the help of Grace Ministries rescue such woman and provide them due care.</p>\r\n<p>The days when the children used to adore their parents and care them with love and affection can rarely be seen now. Many instances show when old age people have no earning or fall sick they are neglected and sometimes thrown out of their houses by other members of the family. The children feel that their parents are burden and forget about all the good things and sacrifices of their parents towards their up-bringing. Hardly there is any family member who is bothered to understand what their parents are actually longing for in their old age despite their basic needs. It is only love, affection and caring words. This is lacking in most of the families irrespective of the status.</p>\r\n<p>Sis. Hanna and Grace Ministries welcome people to understand this truth and the simplicity and importance of life behind the modern life with intricacy. The Esther Women&rsquo;s Ministry Home has not been quiescent even-though it is now operating with limited resources. However, God&rsquo;s blessings have made Sis. Hanna and Grace Ministries determined to move on and keep the candle burning.</p>\r\n<p>Sis .Hanna is delighted to thank all the Devotees, Individuals, Groups, Organizations who are contributing towards this modest cause and service.</p>\r\n<p>She is inviting interested individual to visit the Home, spend sweetest moments with the Esther Old Aged Women Home Members and help in God&rsquo;s work.</p>\r\n<p>Dear friends your seed gift can bring their homes light and smile . Join hands with Esther Women&rsquo;s Ministry</p>\r\n<p>Acknowledgement and official receipt will follow along with tax exemption certificate U/s 80G.</p>',NULL,'About Us',3,'#','parent','estherministry','','Y','2016-03-02 00:00:00','2016-03-09 08:21:09',NULL),(26,'','',1,2,'Eunuch Ministry','Eunuch Ministry','85a11cedb9ca74dca49e20e2bde1486cb91e29fd.jpg',NULL,'2016-03-02 08:50:42','<p>Eunuch Ministry</p>','<p>Eunuch Ministry</p>',NULL,'About Us',3,'#','parent','eunuchministry','','Y','2016-03-02 00:00:00','2016-03-09 08:50:42',NULL),(27,'','',1,1,'Prayer Request','Prayer Request','',NULL,'2016-03-02 09:54:01','<p>Prayer Request</p>','<p>The Bible says the prayer of a righteous person is powerful and effective, yet something extraordinary happens when two or more agree together in prayer. In Matt. 18:19, Jesus said, &ldquo;If any two of you agree touching any matter on this earth, it shall be done.&rdquo; <br />You&rsquo;re important to God, and you&rsquo;re important to us at Grace Ministries. When it comes to prayer, we believe that God wants to meet your needs and reveal His promises to you.<br />So whatever you&rsquo;re concerned about and need prayer for &mdash; we want to be here for you!<br />Our prayer team is here to pray for you. Whatever may be on your heart, no matter how big or small the burden, someone is waiting to stand with you in prayer.</p>\r\n<p>Please complete the prayer request form below and your prayer request will be delivered to our prayer team. We are here to share your burden and intercede on your behalf.</p>\r\n<p>DEAR FRIEND, YOU MAY WRITE TO GRACE MINISTRY ON ANY MATTER AND WE WOULD PRAY FOR YOU. GOD SHALL SURELY ANSWER EVERY PRAYER OFFERED BY HIM ACCORDING TO HIS PROMISE.<br />When you provide us with your mailing address, we will send you Grace Letter to friends and partners as well as info on special offers and updates from the ministry.</p>\r\n<p>SEND YOUR PRAYER REQUEST</p>',NULL,'Home',3,'','parent','prayer-request','','Y','2016-03-02 00:00:00','2016-03-03 09:54:01',NULL),(28,'','',1,6,'Friday Retreat Prayer','Friday Retreat Prayer ','059d8b82abff6c095c7324c5bf6d64c74318a85c.png',NULL,'2016-03-03 08:21:12','<p><strong>Time:-</strong> 10:30am to 2:30pm</p>\r\n<p><strong>Venue:-</strong> Grace Prayer centre<br /><br /></p>','<p><strong>Time:-</strong>&nbsp;10:30am to 2:30pm</p>\r\n<p><br /><strong>Venue:-</strong>&nbsp;Grace Ministry</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Serrao complex , 1st floor , next to cochin bakery ,</p>\r\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Kankandy , Mangalore &ndash; 575002<br /><br /><br /></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>\r\n<p><br /><br /></p>',NULL,'News',0,'','','news-events','friday-retreat-prayer','Y','2016-03-03 08:49:12','2016-03-12 08:21:12',NULL),(29,'','',1,6,'Tuesday Thanks giving prayer','Tuesday Thanks giving prayer','8dcbd067d24bbf5869387c2fc1ea6230b74dfe3f.png',NULL,'2016-03-03 08:21:23','<p><strong>Time:- </strong>10:30am to 2:30pm</p>\r\n<p><strong>Venue</strong>:-&nbsp;Grace Ministry,Kankandy&nbsp;</p>\r\n<p>&nbsp;</p>','<p><strong>Time:-&nbsp;</strong>10:30am to 2:30pm</p>\r\n<p><strong>Venue:-</strong>&nbsp; &nbsp;Serrao complex , 1st floor , next to cochin bakery , &nbsp;<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Kankandy , Mangalore &ndash; 575002</p>\r\n<p>Come and experience the prophetic and prolific prayers of Hanna Richard and experience live prophecies and miracles. Don&rsquo;t miss your blessings.!!</p>',NULL,'News',0,'','','news-events','tuesday-thanks-giving-prayer','Y','2016-03-03 09:00:15','2016-03-12 08:21:23',NULL),(31,'','',1,5,'GOD IS MY SHEILD','but-thou-o-lord-art-a-shield-for-me-my-glory-and-the-lifter-up-of-mine-head-psalm-33','6ee8c6b42b89fab4566bac14be81225f9cc6b678.png',NULL,'2016-03-03 10:57:52','<p>The psalmist acknowledges God as his shield or in other words God is his defence.&nbsp;</p>','<p>The psalmist acknowledges God as his shield or in other words God is his defence. God is also his glory as well as the lifter up of his head. These are the three things that the psalmist has found here of God.</p>\r\n<p>A shield is a defensive weapon that a soldier uses in the battlefield to protect himself from the fiery darts or arrows or sword of the enemy soldier. When we are attacked by the enemy of our soul, do we have God with us as our shield and as our only present help in times of trouble? Do we run here and there in shame and defeat or do we ask God to protect us and to lift our heads up? What do we do during adversities? The psalmist had nowhere to go except God and he had no other defence other than God. He asks God to lift his head up from shame and defeat. He acknowledges God as his glory. When his enemies taunted him saying that he has no help from God, he confessed his confidence and courage in the Lord whom he served.</p>\r\n<p>Do not get bogged down when things go haywire. Just arise from your shame and shake off the dust from your feet and shout aloud that God is your shield and the lifter up of your head. In the very place that you experienced defeat and shame, you will be led to victory and praise. May God bless you?</p>','<p>name1, name2</p>','Daily Devotion',0,'','','daily-devotion','god-is-my-sheild','Y','2016-03-03 09:07:26','2016-10-05 10:57:52',NULL),(36,'','',1,13,'SAINT OF THE DAY','Saint of the day','1f9b31a74054c74725d8aae024e8864c1bfac17d.gif',NULL,'2016-03-03 08:00:09','<p>David is the patron saint of Wales and perhaps the most famous of British saints.</p>','<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../fileman/Uploads/saint_of_the_day.jpg\" alt=\"\" width=\"546\" height=\"663\" /></p>\r\n<p>David is the patron saint of Wales and perhaps the most famous of British saints. Ironically, we have little reliable information about him.</p>\r\n<p>It is known that he became a priest, engaged in missionary work and founded many monasteries, including his principal abbey in southwestern Wales. Many stories and legends sprang up about David and his Welsh monks. Their austerity was extreme. They worked in silence without the help of animals to till the soil. Their food was limited to bread, vegetables and water.</p>\r\n<p>In about the year 550, David attended a synod where his eloquence impressed his fellow monks to such a degree that he was elected primate of the region. The episcopal see was moved to Mynyw, where he had his monastery (now called St. David\'s). He ruled his diocese until he had reached a very old age. His last words to his monks and subjects were: \"Be joyful, brothers and sisters. Keep your faith, and do the little things that you have seen and heard with me.\"</p>\r\n<p>St. David is pictured standing on a mound with a dove on his shoulder. The legend is that once while he was preaching a dove descended to his shoulder and the earth rose to lift him high above the people so that he could be heard. Over 50 churches in South Wales were dedicated to him in pre-Reformation days.</p>',NULL,'Saint of the day',0,'','','saint-of-the-day','saint-of-the-day','Y','2016-03-03 09:15:55','2016-03-12 08:00:09',NULL),(37,'','',1,5,'Rejoice in hope','rejoice-in-hope','0961ffcf352fd8107f4371ea1b01f3e4b3120f4d.png',NULL,'2016-03-03 08:11:15','<p>&ldquo;Therefore, since we have been justified by faith, we have peace with God through our Lord Jesus Christ. Through him we have also obtained access by faith into this grace in which we stand, and we rejoice in hope of the glory of God.&rdquo;‭‭ Romans‬ ‭5:1-2‬</p>','<p><br /><strong>&ldquo;Therefore, since we have been justified by faith, we have peace with God through our Lord Jesus Christ. Through him we have also obtained access by faith into this grace in which we stand, and we rejoice in hope of the glory of God.&rdquo;‭‭ Romans‬ ‭5:1-2‬</strong></p>\r\n<p>Hopelessness is one of the worst possible feelings for a child of God. It&rsquo;s relatively easier to cope with anger, sadness or loneliness. But when we feel hopeless, there isn&rsquo;t anything worth looking forward to. We feel hopeless when things don&rsquo;t turn out the way we expect them to. We think our situation may never change, and life&rsquo;s not going to get any better.<br />But hopelessness must not be entertained by a believer of Jesus, because it reflects poorly on our faith. As the verses above state, because we have Jesus, we have hope. He died for a world that seemed hopeless, and rose again to grant us hope. We can rejoice because the God we serve is greater than our hopeless situation.</p>\r\n<p>As long as we have Christ, we have hope. He&rsquo;s the same yesterday, today and forever. God existed long before our problems made an appearance in our lives. He&rsquo;ll be our steadfast companion in the midst of our trial &ndash; a solid rock we can cling on to. He will remain by our side as we walk out of a difficult season, wiser and more mature than before. No matter what troubles you this week, don&rsquo;t give up hope.</p>',NULL,'Daily Devotion',0,'','','daily-devotion','rejoice-in-hope','Y','2016-03-03 09:25:18','2016-03-12 08:11:15',NULL),(38,'Dawal','Mangalore',1,7,'Liver Enlarged by 17cm is now healed!','Liver Enlarged by 17cm is now healed!','65076f27cd088f7073760f48bcfa97d6cad7a082.png',NULL,'2016-03-03 08:24:43','<p>Praise the Lord my name is Dawal, am 50 years old, I was suffering from liver problem since 7 years. I used to feel my stomach as a rock it was that hard and completely swollen.</p>','<p>Praise the Lord my name is Dawal, am 50 years old, I was suffering from liver problem since 7 years. I used to feel my stomach as a rock it was that hard and completely swollen. I went to all possible hospitals but nothing could be done .My liver was enlarged by 17cm with coarse echogenecity. I had no hopes of living life, doctors said your stomach might blast at anytime, by this I was completely in darkness lost all hopes of getting healed and my family was in complete pain and sorrow.</p>\r\n<p>Finally through one of my colleague I came to know about Sis. Hanna Richard&rsquo;s Tuesday prayers. With great pain and difficulty God gave me a way to attend the prayers. At last Sis. Hanna layed her hands and prayed on me saying today is the last day for all your infirmities, she said she could see my liver turning to be normal and she prophesized saying , the next coming Tuesday you will surely come and testify what the Lord God has done to you. Later when I consulted the doctor, he was shocked to tell me that my liver enlargement is turned to be normal; my own eyes couldn&rsquo;t believe what Jesus did to me.</p>\r\n<p>Now am so happy and blessed. All glory to God alone.</p>',NULL,'Testimonials',0,'','','testimonials','liver-enlarged-by-17cm-is-now-healed','Y','2016-03-03 09:44:59','2016-03-12 08:24:43',NULL),(39,'','',1,4,'Grace Prayer Centre','Grace prayer centre','',NULL,'2016-03-03 09:56:10','<p>Grace prayer centre is an international charismatic prayer house located in Mangalore the chief port city of the Indian state of Karnataka, it is a place where we never cease worshiping the Lord and interceding for the world.</p>','<p>Grace prayer centre is an international charismatic prayer house located in Mangalore the chief port city of the Indian state of Karnataka, it is a place where we never cease worshiping the Lord and interceding for the world.</p>\r\n<p>The Lord appeared in a vision to both Bro.Andrew and Sis.Hanna and commissioned them to raise the Grace Prayer Centre, he also thus explained the reason for it:</p>\r\n<p>Numerous number of people are suffering with various infirmities having no deliverance, peace ,comfort and love therefore I will make this sanctuary as an effective tool to heal the broken-hearted and comfort the needy and people shall throng into this place and I shall lit their faces with glory and joy and bring them comfort ,healing ,deliverance ,and restore all that they have lost.</p>\r\n<p>True to his promise, the Lord has been blessing countless people, who throng to the grace prayer centre. The miracles that people experience here are truly astonishing. Today grace prayer centre stands as a light house to the faithful who are in distress.</p>\r\n<p>Grace prayer centre is set admist the scenic splendour of the Adyar falls ,<br />12kms away from the Mangalore city .The landscape surrounding the Prayer Centre is beautiful with hills ,waterfalls ,green pastures and rivulets ,providing the most peaceful atmosphere for prayer and meditation.</p>\r\n<p>You\'re warmly welcomed to our prayer house,<br />We will love to see you there<br />We want you to know the love of God<br />And feel His presence near<br />For you are so special to the Lord<br />And special to us, too,<br />For your life has significance,<br />And there\'s purpose in what you do.</p>\r\n<p>VISIT GRACE PRAYER CENTRE! THE COMPLETE PLACE OF WORSHIP!</p>\r\n<p><strong>For more details contact:</strong><br /><strong>The Administrator</strong><br /><strong>Grace Prayer Centre, International </strong><br /><strong>Near srinivas college / Expert ,</strong><br /><strong>Valchil, Merlapaduv, </strong><br /><strong>Mangaluru - 574143</strong></p>',NULL,'Prayer Center',0,'','','prayercenter','','Y','2016-03-03 09:56:10','2016-03-03 09:56:10',NULL),(40,'','',1,6,'news And Event','news And Event','9022e91ead6cf97450ca6701d30173da5797a58e.jpg',NULL,'2016-03-03 11:45:50','<p>news news</p>','<p>news news</p>',NULL,'',0,'','','newsevents','','Y','2016-03-03 11:45:50','2016-03-03 11:46:24','2016-03-03 11:46:24'),(41,'','',1,6,'news And Event','Prayer Request sub','bb9190a958a917a26c272193fc98d9e6d81fb611.jpg',NULL,'2016-03-03 11:47:09','<p>news</p>','<p>news</p>',NULL,'',0,'','','newsevents','','Y','2016-03-03 11:47:09','2016-03-03 11:47:23','2016-03-03 11:47:23'),(42,'','',1,6,'news And Event','newsEventTestingS','f53417d145de7d18707e8d68b919548c8b342875.jpg',NULL,'2016-03-03 11:47:55','<p>news</p>','<p>news</p>',NULL,'',0,'','','newsevents','','Y','2016-03-03 11:47:55','2016-03-03 11:54:33','2016-03-03 11:54:33'),(43,'','',1,10,'ISAAC RICHARD : THE TOUCHED','ISAAC RICHARD : THE TOUCHED','',NULL,'2016-03-03 12:38:04','','<p><iframe src=\"https://www.youtube.com/embed/LnuOE5sNd70\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe></p>',NULL,'Media/Videos',0,'','','media','','Y','2016-03-03 12:38:04','2016-03-03 12:38:04',NULL),(44,'','',1,4,'Healed of Leprosy - Part 2 - Bro.Andrew Richard','Healed of Leprosy - Part 2 - Bro.Andrew Richard','',NULL,'2016-03-03 12:39:33','','<p><iframe src=\"https://www.youtube.com/embed/XNZpbKCxVzM\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe></p>',NULL,'Prayer Center',0,'','','prayercenter','','Y','2016-03-03 12:39:33','2016-03-03 12:41:43','2016-03-03 12:41:43'),(45,'','',1,4,'Stuthisona Yesuvina Nama - kannada christian song','Stuthisona Yesuvina Nama - kannada christian song','',NULL,'2016-03-03 12:40:17','','<p><iframe src=\"https://www.youtube.com/embed/BIztS9h5_E4\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe></p>',NULL,'Prayer Center',0,'','','prayercenter','','Y','2016-03-03 12:40:17','2016-03-03 12:41:34','2016-03-03 12:41:34'),(46,'','',1,10,'Vedio','Vedio','',NULL,'2016-03-03 12:41:23','','<p><iframe src=\"https://www.youtube.com/embed/BIztS9h5_E4\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe></p>',NULL,'Media/Videos',0,'','','media','','Y','2016-03-03 12:41:23','2016-03-03 12:41:23',NULL),(47,'','',1,10,'Vedio','Vedio','',NULL,'2016-03-03 12:42:41','','<p><iframe src=\"https://www.youtube.com/embed/XNZpbKCxVzM\" width=\"560\" height=\"315\" frameborder=\"0\" allowfullscreen=\"allowfullscreen\"></iframe></p>',NULL,'Media/Videos',0,'','','media','','Y','2016-03-03 12:42:41','2016-03-03 12:42:41',NULL),(48,'','',1,6,'Testing','Testing','bc4b927dd0dda5dec66f40ad592e0a15cebede0e.jpg',NULL,'2016-03-04 06:29:04','<p>testing</p>','<p>testing</p>',NULL,'',0,'','','newsevents','','Y','2016-03-04 06:29:04','2016-03-04 06:57:21','2016-03-04 06:57:21'),(49,'','',1,6,'gdt','dgd','55d280731dccc0bb1eba1a746becf1cbc1620bc3.png',NULL,'2016-03-04 06:58:12','<p>&nbsp;vncncvnfhnb</p>','<p>cgncnfh</p>',NULL,'',0,'','','newsevents','','Y','2016-03-04 06:58:12','2016-03-04 06:58:27','2016-03-04 06:58:27'),(50,'','',1,1,'Voluntary Register','Voluntary Register','',NULL,'2016-03-16 09:52:31','','<p><strong>Please fill the below form!</strong></p>',NULL,'Home',0,'','','voluntary-register','voluntary-register','Y','2016-03-05 00:00:00','2016-03-21 09:52:31',NULL),(51,'','',1,1,'Donate','Donate','donatedonatedonate',NULL,'2016-03-08 09:46:18','<p>donate</p>','<p><strong>Please fill in the donation form! testing</strong></p>',NULL,'Home',0,'','','donate','donate','Y','2016-03-08 03:00:00','2016-03-28 09:46:18',NULL),(52,'','',1,4,'Jecintha ','India','',NULL,'2016-03-09 09:00:33','<p>My name is Jecintha , since 5 years I had no children ,and because of this my husband was suffering a lot with pain , I couldn&rsquo;t see my family suffering with pain.</p>','<p>My name is Jecintha , since 5 years I had no children ,and because of this my husband was suffering a lot with pain , I couldn&rsquo;t see my family suffering with pain .I went to all possible doctors and hospitals but everything was in vain, Finally I came to attend one of the retreats of Grace Ministry. During the prayer time, Sis.Hanna Richard said &ldquo;Friends, if you are barren, place your hands on the stomach. Jesus was moved with compassion on seeing your afflictions. Now he will heal you. When you pray, uttering the name of Jesus. He will deliver you. He who said, &ldquo;Whatever you ask in my name I will give you &ldquo;will do the same for you too. &ldquo;After 1 weak from attending the retreat I was conceived, my entire family was in a shock to know what the Lord has done in my life. I give glory to the Lord who did this miracle.&rdquo;&nbsp;</p>',NULL,'Prayer Center',0,'','','prayercenter','','Y','2016-03-09 09:00:33','2016-03-09 09:01:31','2016-03-09 09:01:31'),(53,'Jecintha ','India',1,7,'Testimonial','Testimonial','8781abd3c13f5e0f33a891a8020dfff4d58bcb89.png',NULL,'2016-03-09 12:10:04','<p>My name is Jecintha , since 5 years I had no children ,and because of this my husband was suffering a lot with pain , I couldn&rsquo;t see my family suffering with pain.&nbsp;</p>','<p>My name is Jecintha , since 5 years I had no children ,and because of this my husband was suffering a lot with pain , I couldn&rsquo;t see my family suffering with pain. I went to all possible doctors and hospitals but everything was in vain, Finally I came to attend one of the retreats of Grace Ministry. During the prayer time, Sis.Hanna Richard said &ldquo;Friends, if you are barren, place your hands on the stomach. Jesus was moved with compassion on seeing your afflictions. Now he will heal you. When you pray, uttering the name of Jesus. He will deliver you. He who said, &ldquo;Whatever you ask in my name I will give you &ldquo;will do the same for you too. &ldquo;After 1 week from attending the retreat I was conceived, my entire family was in a shock to know what the Lord has done in my life. I give glory to the Lord who did this miracle.&rdquo;&nbsp;</p>',NULL,'Testimonials',0,'','','testimonials','testimonial','Y','2016-03-09 09:03:08','2016-03-09 12:10:04',NULL),(54,'','',1,1,'News Letter subscribe','News Letter subscribe','',NULL,NULL,'','',NULL,'Home',0,'','','news-letter-subscribe','news-letter-subscribe','Y','2016-03-22 00:00:00','2016-03-22 00:00:00',NULL),(55,'','',1,6,'testing news','sub testing','26ad996bab37e05e3cec6c9ec6d993f060674643.jpg',NULL,'2016-03-26 03:54:27','<p>testing short</p>','<p>testing content</p>',NULL,'News',0,'','','news-events','testing-news','Y','2016-03-26 03:54:27','2016-03-26 03:54:27',NULL),(56,'','',1,5,'testing daily','testing daily d','aa156e60e936a9d0dcca0b1e9a5ac41b7c2d51bd.jpg',NULL,'2016-03-26 06:29:56','<p>testing daily d</p>','<p>content&nbsp;tt</p>','','Daily Devotion',0,'','','daily-devotion','testing-daily','N','2016-03-26 03:56:28','2016-11-24 06:29:56',NULL),(57,'','',1,6,'testing news2','sub testing','a0c3c86b6f6be40e174329cc176ba2d478fd092c.png',NULL,'2016-03-26 05:51:33','<p>test5ing</p>','<p>test</p>','','News',0,'','','news-events','testing-news2','N','2016-03-26 04:20:32','2016-11-24 05:51:33',NULL),(58,'','',1,13,'testing saint','sub saint','1722dd0ece69f72e1cb5568af46f0f4ab0a901c9.jpg',NULL,'2016-03-30 10:26:33','<p>testingtestingtestingtestingtestingtesting67</p>','<p>testingtestingtestingtestingtesting57</p>',NULL,'Saint of the day',0,'','','saint-of-the-day','testing-saint','N','2016-03-30 10:21:52','2016-03-30 10:26:33',NULL);

/*Table structure for table `donates` */

DROP TABLE IF EXISTS `donates`;

CREATE TABLE `donates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phoneno` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `service_types` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `serviceType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_mode` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `cheque_no` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `bank` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `donates` */

insert  into `donates`(`id`,`name`,`phoneno`,`email`,`amount`,`service_types`,`serviceType`,`payment_mode`,`cheque_no`,`bank`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values (9,'Aniketh','72132322765','admin@admin.com',123.00,'','','','','',NULL,'2016-03-12 12:44:33','2016-03-12 12:44:33',NULL),(10,'Aniketh','72132322544','admin@admin.com',123.00,'','','','','',NULL,'2016-03-12 12:49:03','2016-03-12 12:49:03',NULL),(11,'Aniketh','72132322431','admin@admin.com',123.00,'','','','','',NULL,'2016-03-12 12:51:27','2016-03-12 12:51:27',NULL),(12,'Aniketh','72132322320','developer.aniketh@pacesoft.in',123.00,'','','','','',NULL,'2016-03-12 12:52:47','2016-03-12 12:52:47',NULL),(13,'Aniketh','721323226554','admin@admin.com',123.00,'','','','','',NULL,'2016-03-12 12:59:17','2016-03-12 12:59:17',NULL),(14,'Aniketh','72132322544','admin@admin.com',123.00,'Slum Ministry','','','','',NULL,'2016-03-12 13:02:56','2016-03-12 13:02:56',NULL);

/*Table structure for table `languages` */

DROP TABLE IF EXISTS `languages`;

CREATE TABLE `languages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  `name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `lang_code` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `user_id_edited` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `languages_name_unique` (`name`),
  UNIQUE KEY `languages_lang_code_unique` (`lang_code`),
  KEY `languages_user_id_foreign` (`user_id`),
  KEY `languages_user_id_edited_foreign` (`user_id_edited`),
  CONSTRAINT `languages_user_id_edited_foreign` FOREIGN KEY (`user_id_edited`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `languages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `languages` */

insert  into `languages`(`id`,`position`,`name`,`lang_code`,`user_id`,`user_id_edited`,`created_at`,`updated_at`,`deleted_at`) values (1,NULL,'English','gb',NULL,NULL,'2016-02-19 12:24:00','2016-02-19 12:24:00',NULL),(2,NULL,'Српски','rs',NULL,NULL,'2016-02-19 12:24:00','2016-02-19 12:24:00',NULL),(3,NULL,'Bosanski','ba',NULL,NULL,'2016-02-19 12:24:01','2016-02-19 12:24:01',NULL);

/*Table structure for table `marketing_images` */

DROP TABLE IF EXISTS `marketing_images`;

CREATE TABLE `marketing_images` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `image_extension` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `mobile_image_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile_image_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mobile_extension` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE KEY `marketing_images_image_name_unique` (`image_name`),
  UNIQUE KEY `marketing_images_mobile_image_name_unique` (`mobile_image_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `marketing_images` */

/*Table structure for table `menus` */

DROP TABLE IF EXISTS `menus`;

CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `submenu` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Y',
  `submenu_show` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL DEFAULT 'N',
  `listindex` int(11) NOT NULL,
  `show` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `menus` */

insert  into `menus`(`id`,`title`,`slug`,`category`,`url`,`target`,`submenu`,`submenu_show`,`listindex`,`show`,`status`,`created_at`,`updated_at`,`deleted_at`) values (1,'Home','home','Home','#','parent','N','N',1,'Y','0','2016-02-19 12:24:01','2016-02-19 12:24:01',NULL),(2,'About Us','about-us','','#','parent','Y','Y',2,'Y','1','2016-02-19 12:24:01','2016-02-19 12:24:01',NULL),(3,'Our Services','our-services','','#','parent','Y','Y',3,'Y','1','2016-02-19 12:24:01','2016-02-19 12:24:01',NULL),(4,'Prayer Center','prayer-center','','#','parent','N','N',4,'Y','1','2016-02-19 12:24:02','2016-02-19 12:24:02',NULL),(5,'Daily Devotion','daily-devotion','','#','parent','N','N',5,'Y','1','2016-02-19 12:24:02','2016-02-19 12:24:02',NULL),(6,'News','news-events','','#','parent','N','N',6,'Y','1','2016-02-19 12:24:03','2016-02-19 12:24:03',NULL),(7,'Testimonials','testimonials','','#','parent','N','N',7,'Y','1','2016-02-19 12:24:03','2016-02-19 12:24:03',NULL),(8,'Donation','donation','','#','parent','N','N',8,'Y','1','2016-02-19 12:24:03','2016-02-19 12:24:03',NULL),(9,'Photo Gallery','photo-gallery','','#','parent','N','N',9,'N','1','2016-02-19 12:24:03','2016-02-19 12:24:03',NULL),(10,'Media/Videos','media','','#','parent','N','N',10,'N','1','2016-02-19 12:24:03','2016-02-19 12:24:03',NULL),(11,'Shop Cart','shopcart','','#','parent','N','N',11,'N','1','2016-02-19 12:24:03','2016-02-19 12:24:03',NULL),(12,'Contact Us','contact-us','','#','parent','N','N',11,'Y','1','2016-02-19 12:24:03','2016-02-19 12:24:03',NULL),(13,'Saint of the day','saint-of-the-day','','#','parent','N','N',13,'N','1','2016-02-24 00:00:00','2016-02-24 00:00:00',NULL),(14,'Gallery','gallery','','#','parent','Y','N',8,'Y','1','2016-03-17 00:00:00','2016-03-16 00:00:00',NULL);

/*Table structure for table `migrations` */

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `migrations` */

insert  into `migrations`(`migration`,`batch`) values ('2014_10_12_000000_create_users_table',1),('2014_10_12_100000_create_password_resets_table',1),('2014_10_18_195027_create_languages_table',1),('2014_10_18_225005_create_article_categories_table',1),('2014_10_18_225505_create_articles_table',1),('2014_10_18_225928_create_photo_albums_table',1),('2014_10_18_231619_create_photos_table',1),('2016_02_11_083159_create_menus_table',1),('2016_02_11_084054_create_photo_galleries_table',1),('2016_02_11_084122_create_donates_table',1),('2016_02_11_084135_create_subscribes_table',1),('2016_02_11_085848_create_services_table',1),('2016_02_11_130724_create_content_pages_table',1),('2016_02_12_062550_create_video_galleries_table',1),('2016_02_12_062649_create_sub_menus_table',1),('2016_02_13_052651_create_video_albums_table',1),('2016_02_15_071817_create_marketingimages_table',1),('2016_02_16_063850_create_tab_types_table',1),('2016_02_16_102003_create_testimonials_table',1);

/*Table structure for table `newsletters` */

DROP TABLE IF EXISTS `newsletters`;

CREATE TABLE `newsletters` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `phone_no` varchar(20) NOT NULL,
  `address` text NOT NULL,
  `pincode` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=latin1;

/*Data for the table `newsletters` */

insert  into `newsletters`(`id`,`name`,`email`,`phone_no`,`address`,`pincode`,`created_at`,`updated_at`) values (30,'Testing','developer.aniketh4@pacesoft.in','','',0,'2016-03-21 10:26:40','2016-03-21 10:26:40'),(31,'Testing','developer.aniketh8@pacesoft.in','','',0,'2016-03-21 10:52:16','2016-03-21 10:52:16'),(34,'Testing','developer.aniketh@pacesoft.in','1234567889','dfgggff',123453,'2016-03-28 10:37:25','2016-03-28 10:37:25');

/*Table structure for table `password_resets` */

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `password_resets` */

/*Table structure for table `photo_albums` */

DROP TABLE IF EXISTS `photo_albums`;

CREATE TABLE `photo_albums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int(10) unsigned NOT NULL,
  `position` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `folder_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `photo_albums` */

insert  into `photo_albums`(`id`,`language_id`,`position`,`name`,`slug`,`description`,`folder_id`,`menu_id`,`user_id`,`created_at`,`updated_at`,`deleted_at`) values (4,0,NULL,'News And Events','','News','c8e49462bcfc5356942de212bfcbbcc462ea44b1',NULL,1,'2016-03-03 07:37:51','2016-03-03 07:40:55','2016-03-03 07:40:55'),(5,0,NULL,'grace','','grace','fe2de1988e2fde10f1f6d912f06edf8da72ac44a',NULL,1,'2016-03-03 12:10:00','2016-03-04 10:21:43','2016-03-04 10:21:43'),(6,0,NULL,'testing','','testing','ca48a688204a45dcf4bf0f60e07e96473ed553c1',NULL,1,'2016-03-04 03:40:23','2016-03-04 03:45:02','2016-03-04 03:45:02'),(7,0,NULL,'testing','','testing','1fc27f1c4e20e73657024619857cd64184acbe91',NULL,1,'2016-03-04 07:09:05','2016-03-04 07:09:45','2016-03-04 07:09:45'),(8,0,NULL,'Grace Ministry','','','d54477b0693b3feafbcda029a5abcfd1b339d9c4',NULL,1,'2016-03-04 10:21:09','2016-03-04 10:21:09',NULL),(9,0,NULL,'Testing','',NULL,'6e79a8c91f9628473ab6e1022e15372480928b71',NULL,1,'2016-03-04 10:38:59','2016-03-09 06:58:43','2016-03-09 06:58:43'),(10,0,NULL,'testing','',NULL,'a508cbae4fcd9f8c87d6629f4da939664de90c6f',NULL,1,'2016-03-11 10:57:07','2016-03-11 11:15:23','2016-03-11 11:15:23'),(11,0,NULL,'testing2','',NULL,'0c6ed6da81f8486d9143fcab8f65a7cef157860e',NULL,1,'2016-03-11 11:15:34','2016-03-11 11:33:06','2016-03-11 11:33:06'),(12,0,NULL,'testing3','',NULL,'d585c1441f24842f73dcba3072dba5201ea2f969',NULL,1,'2016-03-11 11:33:21','2016-03-12 10:44:49','2016-03-12 10:44:49');

/*Table structure for table `photo_galleries` */

DROP TABLE IF EXISTS `photo_galleries`;

CREATE TABLE `photo_galleries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `photoalbum_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `slider` tinyint(1) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `photo_album_id` int(10) unsigned DEFAULT NULL,
  `album_cover` tinyint(1) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `photo_galleries` */

insert  into `photo_galleries`(`id`,`photoalbum_id`,`title`,`slug`,`url`,`thumbnail`,`position`,`slider`,`filename`,`description`,`photo_album_id`,`album_cover`,`user_id`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values (9,4,'News And Events','','','',NULL,NULL,'dbb531e06e9d99a06fd0f1eb31e906475b33f8bd.jpg','<p><img src=\"../../../fileman/Uploads/Documents/facebook.jpg\" alt=\"\" width=\"448\" height=\"445\" /></p>',4,NULL,1,'3WJDn1bfKQYbHAMgURpPInMf95eXC92IS8mQcbUy','2016-03-03 07:38:18','2016-03-03 07:40:55','2016-03-03 07:40:55'),(10,5,'prayer','','','',NULL,NULL,'a39d67e5d416ec8e2696288c9f8e6f6086aa2dc8.jpg','<p>&nbsp;</p>\r\n<p><img style=\"display: block; margin-left: auto; margin-right: auto;\" src=\"../../../fileman/Uploads/download.jpg\" alt=\"\" width=\"392\" height=\"280\" /></p>',5,NULL,1,'J7jrVBZu6B1MXKs44SsyZ3cIWrT6prXrgI2SU8g0','2016-03-03 12:10:34','2016-03-04 10:21:43','2016-03-04 10:21:43'),(11,9,'testing','','','',NULL,NULL,'44513e8accfcc0d651cb5b1b74c7b4b362a30db8.jpg','<p><img src=\"../../../fileman/Uploads/download.jpg\" alt=\"\" width=\"196\" height=\"140\" /><img src=\"../../../fileman/Uploads/saint_of_the_day.jpg\" alt=\"\" width=\"546\" height=\"663\" /></p>',9,NULL,1,'flGafQX9gUefcgKo8tCnomuB9BKF51qrhdNkWRtI','2016-03-04 10:53:39','2016-03-09 06:58:43','2016-03-09 06:58:43'),(12,8,'Grace','grace-ministry','','',NULL,NULL,'e027363c4f58ae8df4ee449633f312b160c1341d.png','<p><img src=\"../../../fileman/Uploads/2016/gallery_image_800_550.png\" alt=\"\" width=\"800\" height=\"550\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"../../../fileman/Uploads/2016/gallery_image2_800_550.png\" alt=\"\" width=\"800\" height=\"550\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"../../../fileman/Uploads/2016/gallery_image3_800_550.png\" alt=\"\" width=\"800\" height=\"550\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"../../../fileman/Uploads/2016/gallery_image4_800_550.png\" alt=\"\" width=\"800\" height=\"550\" /></p>\r\n<p>&nbsp;</p>\r\n<p><img src=\"../../../fileman/Uploads/2016/gallery_image5_800_550.png\" alt=\"\" width=\"800\" height=\"550\" /></p>\r\n<p>&nbsp;</p>\r\n<p>&nbsp;</p>',8,NULL,1,'RXxUnmYAK7i0ER5PviPc4ooBwuOlF6CefUnj4Jiy','2016-03-05 09:11:53','2016-03-12 10:31:07',NULL),(13,10,'Testing','','','',NULL,NULL,'2860c0a04f9654b9e0d1b471a7279fa77be4b97c.jpg','<p><img src=\"../../../../fileman/Uploads/download.jpg\" alt=\"\" width=\"196\" height=\"140\" /></p>',10,NULL,1,'KoNNbCgIGKiO2hF2ja0H1m8YD9rAQQWOXXhN5NVx','2016-03-11 11:13:08','2016-03-11 11:15:23','2016-03-11 11:15:23'),(14,11,'Testing','','','',NULL,NULL,'c69e30d6a46982a0fe4ea82bdd20539b8f218476.jpg','<p><img src=\"../../../../fileman/Uploads/download.jpg\" alt=\"\" width=\"196\" height=\"140\" /></p>',11,NULL,1,'KoNNbCgIGKiO2hF2ja0H1m8YD9rAQQWOXXhN5NVx','2016-03-11 11:19:03','2016-03-11 11:33:06','2016-03-11 11:33:06'),(15,12,'testing images','testing3','','',NULL,NULL,'8beeae2c5d230aa0ed3152e09a45f74c003391d6.jpg','<p><img src=\"../../../../fileman/Uploads/download.jpg\" alt=\"\" width=\"196\" height=\"140\" /></p>',12,NULL,1,'jDh2HOSt6Fjly1KS2g46Hxc3JLu4DA6Kxn7JlJou','2016-03-12 10:43:59','2016-03-12 10:44:49','2016-03-12 10:44:49');

/*Table structure for table `photos` */

DROP TABLE IF EXISTS `photos`;

CREATE TABLE `photos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `language_id` int(10) unsigned NOT NULL,
  `position` int(11) DEFAULT NULL,
  `slider` tinyint(1) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `photo_album_id` int(10) unsigned DEFAULT NULL,
  `album_cover` tinyint(1) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `user_id_edited` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `photos_language_id_foreign` (`language_id`),
  KEY `photos_photo_album_id_foreign` (`photo_album_id`),
  KEY `photos_user_id_foreign` (`user_id`),
  KEY `photos_user_id_edited_foreign` (`user_id_edited`),
  CONSTRAINT `photos_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  CONSTRAINT `photos_photo_album_id_foreign` FOREIGN KEY (`photo_album_id`) REFERENCES `photo_albums` (`id`) ON DELETE SET NULL,
  CONSTRAINT `photos_user_id_edited_foreign` FOREIGN KEY (`user_id_edited`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `photos_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `photos` */

/*Table structure for table `prayer_requests` */

DROP TABLE IF EXISTS `prayer_requests`;

CREATE TABLE `prayer_requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `message` blob NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `prayer_requests` */

insert  into `prayer_requests`(`id`,`name`,`email`,`phoneNumber`,`message`,`created_at`,`updated_at`) values (4,'Aniketh','admin@admin.com','72132322','hi','2016-03-10 13:37:50','2016-03-10 13:37:50'),(5,'Aniketh','admin@admin.com','72132322','hi','2016-03-10 13:39:25','2016-03-10 13:39:25'),(6,'Aniketh','admin@admin.com','562342111','hh','2016-03-11 12:12:29','2016-03-11 12:12:29');

/*Table structure for table `services` */

DROP TABLE IF EXISTS `services`;

CREATE TABLE `services` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` text COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `photo_album_id` int(11) NOT NULL COMMENT 'Linked to photo album',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `services` */

insert  into `services`(`id`,`name`,`title`,`description`,`photo_album_id`,`created_at`,`updated_at`,`deleted_at`) values (1,'Outreach Programmes','','',0,'2016-02-19 12:24:04','2016-02-19 12:24:04',NULL),(2,'Medical Camp','','',0,'2016-02-19 12:24:04','2016-02-19 12:24:04',NULL),(3,'Helping Hands for Eunuchs','','',0,'2016-02-19 12:24:04','2016-02-19 12:24:04',NULL),(4,'Slum Ministry','','',0,'2016-02-19 12:24:04','2016-02-19 12:24:04',NULL);

/*Table structure for table `sub_menus` */

DROP TABLE IF EXISTS `sub_menus`;

CREATE TABLE `sub_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menuid` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `category_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `listindex` int(11) NOT NULL,
  `show` enum('Y','N') COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('0','1') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `sub_menus` */

insert  into `sub_menus`(`id`,`menuid`,`title`,`slug`,`url`,`target`,`category_code`,`listindex`,`show`,`status`,`created_at`,`updated_at`,`deleted_at`) values (1,2,'About Grace Ministry','graceministry','#','parent','CATEGORY_ABOUT_GRACE',1,'Y','1','2016-02-19 12:24:03','2016-02-19 12:24:03',NULL),(2,2,'About Bro. Andrew Richard','andrewrichard','#','parent','CATEGORY_BRO_ANDREW',2,'Y','1','2016-02-19 12:24:03','2016-02-19 12:24:03',NULL),(3,2,'About Hanna Ministry','hannaministry','#','parent','CATEGORY_ABOUT_HANNA',3,'Y','1','2016-02-19 12:24:03','2016-02-19 12:24:03',NULL),(4,2,'About Bro. Isaac Richard','isaacrichard','#','parent','CATEGORY_BRO_ISAAC',4,'Y','1','2016-02-19 12:24:03','2016-02-19 12:24:03',NULL),(8,3,'Slum Ministry','slumministry','#','parent','CATEGORY_SLUM_MINISTRY',8,'Y','1','2016-02-19 12:24:03','2016-02-19 12:24:03',NULL),(9,4,'Prayer center','prayercenter','#','parent','CATEGORY_PRAYER_CENTER',9,'N','1','2016-02-19 12:24:03','2016-02-19 12:24:03',NULL),(10,6,'News and Events','newsevents','#','parent','CATEGORY_NEWS_EVENTS',10,'N','1','2016-02-19 12:24:04','2016-02-19 12:24:04',NULL),(11,5,'Daily Devotion','dailydevotion','#','parent','CATEGORY_DAILY_DEVOTION',11,'N','1','2016-02-19 12:24:04','2016-02-19 12:24:04',NULL),(12,7,'Testimonial','testimonial','#','parent','CATEGORY_TESTIMONIAL',12,'N','1','2016-02-19 12:24:04','2016-02-19 12:24:04',NULL),(13,8,'Donation','donation','#','parent','CATEGORY_DONATION',13,'N','1','2016-02-19 12:24:04','2016-02-19 12:24:04',NULL),(14,9,'Photo gallery','photogallery','#','parent','CATEGORY_PHOTO_GALLERY',14,'N','1','2016-02-19 12:24:04','2016-02-19 12:24:04',NULL),(15,10,'Media / Videos','mediavideos','#','parent','CATEGORY_MEDIA_VIDEOS',15,'N','1','2016-02-19 12:24:04','2016-02-19 12:24:04',NULL),(16,11,'Shop cart','shopcart','#','parent','CATEGORY_SHOP_CART',16,'N','1','2016-02-19 12:24:04','2016-02-19 12:24:04',NULL),(17,12,'Contact Us','contactus','#','parent','CATEGORY_CONTACT_US',17,'N','1','2016-02-19 12:24:04','2016-02-19 12:24:04',NULL),(18,1,'HomePage','homepage','#','parent','CATEGORY_HOME',18,'N','1','2016-02-19 12:24:04','2016-02-19 12:24:04',NULL),(19,13,'Saint of the day','dailydevotion','#','parent','CATEGORY_DAILY_DEVOTION',19,'N','1','2016-02-23 00:00:00','2016-02-17 00:00:00',NULL),(20,2,'About Counselling ministry','counsellingministry','#','	\r\nparent','',20,'Y','1','2016-03-02 00:00:00','2016-03-02 00:00:00',NULL),(21,2,'About Esther ministry','estherministry','#','parent','',21,'Y','1','2016-03-02 00:00:00','2016-03-02 00:00:00',NULL),(22,3,'Eunuch Ministry','eunuchministry','#','parent','',22,'Y','1','2016-03-02 00:00:00','2016-03-02 00:00:00',NULL),(23,14,'Photo Gallery','photo-gallery','#','','',23,'Y','1','2016-03-17 00:00:00','2016-03-17 00:00:00',NULL),(24,14,'Media/Videos','	\r\nmedia','#','','',24,'Y','1','2016-03-17 00:00:00','2016-03-18 00:00:00',NULL);

/*Table structure for table `subscribes` */

DROP TABLE IF EXISTS `subscribes`;

CREATE TABLE `subscribes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `subscribes_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `subscribes` */

/*Table structure for table `tab_types` */

DROP TABLE IF EXISTS `tab_types`;

CREATE TABLE `tab_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phoneno` int(11) NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` double(8,2) NOT NULL,
  `bankname` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `chequeno` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `tab_types` */

/*Table structure for table `testimonials` */

DROP TABLE IF EXISTS `testimonials`;

CREATE TABLE `testimonials` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `submenu_id` int(11) NOT NULL COMMENT 'Linked to submenus',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `testimonials` */

insert  into `testimonials`(`id`,`name`,`message`,`location`,`thumbnail`,`submenu_id`,`created_at`,`updated_at`,`deleted_at`) values (1,'Sam','Grace Ministry is known for extending a hand of help to the needy, heart of compassion to the hurting, and message of inspiration to the disenfranchised, Grace Ministry is a global humanitarian organization in India with the aim of reaching the unreached.','Mangalore','Desert.jpeg',7,'2016-02-19 12:24:04','2016-02-19 12:24:04',NULL);

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `confirmation_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`name`,`username`,`email`,`password`,`confirmation_code`,`confirmed`,`admin`,`remember_token`,`created_at`,`updated_at`,`deleted_at`) values (1,'Admin User','admin_user','grace@247','$2y$10$.8dry5DQDCczB/LZwodW2OJn/ZfNFZ88Mv71BwssN6FLw6u4l3h.i','5e2b87ca2f40af651f24e1112a84413b',1,1,'aswGJmKHzyrUlaKTusQrmFCJgOU3cOkS14HiJ5BoARFfo6kUCdrk3In9ZdWf','2016-02-19 12:24:00','2016-03-21 04:36:54',NULL),(2,'Test User','test_user','user@user.com','$2y$10$.8dry5DQDCczB/LZwodW2OJn/ZfNFZ88Mv71BwssN6FLw6u4l3h.i','5aa8d3447f92b046fdc194ff21877425',1,0,NULL,'2016-02-19 12:24:00','2016-03-03 12:27:33',NULL);

/*Table structure for table `video_albums` */

DROP TABLE IF EXISTS `video_albums`;

CREATE TABLE `video_albums` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `position` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `folder_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `submenu_id` int(10) unsigned DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `video_albums` */

/*Table structure for table `video_galleries` */

DROP TABLE IF EXISTS `video_galleries`;

CREATE TABLE `video_galleries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `thumbnail` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position` int(11) DEFAULT NULL,
  `slider` tinyint(1) DEFAULT NULL,
  `filename` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `video_album_id` int(10) unsigned DEFAULT NULL,
  `album_cover` tinyint(1) DEFAULT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*Data for the table `video_galleries` */

/*Table structure for table `voluntary_registrations` */

DROP TABLE IF EXISTS `voluntary_registrations`;

CREATE TABLE `voluntary_registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(500) NOT NULL,
  `email` varchar(500) NOT NULL,
  `phoneNumber` varchar(15) NOT NULL,
  `message` blob NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `voluntary_registrations` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
