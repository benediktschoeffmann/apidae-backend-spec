CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `email` varchar(255) UNIQUE NOT NULL,
  `password` varchar(255),
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `roleId` int default NULL,
  `addressId` int default NULL,
  `created` timestamp DEFAULT (now()),
  `lastUpdate` timestamp,
  `lastLogin` timestamp
);

CREATE TABLE `addresses` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `street` varchar(50) NOT NULL,
  `additional` varchar(50) NOT NULL,
  `number` varchar(20) NOT NULL,
  `postCode` varchar(20) NOT NULL,
  `city` varchar[50] NOT NULL,
  `countryId` int,
  `created` timestamp DEFAULT (now()),
  `lastUpdate` timestamp DEFAULT (now())
);

CREATE TABLE `countries` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchat(3) NOT NULL,
  `created` timestamp DEFAULT (now()),
  `lastUpdate` timestamp DEFAULT (now())
);

CREATE TABLE `roles` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(20) UNIQUE NOT NULL,
  `level` int NOT NULL,
  `created` timestamp DEFAULT (now()),
  `lastUpdate` timestamp DEFAULT (now())
);

CREATE TABLE `devices` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `serial` varchar[12] UNIQUE NOT NULL,
  `userId` int,
  `addressId` int
);

CREATE TABLE `sensorType` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar[20] UNIQUE,
  `created` timestamp DEFAULT (now()),
  `lastUpdate` timestamp DEFAULT (now())
);

CREATE TABLE `packet` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `serial` varchar(20) NOT NULL,
  `sensorTypeId` int,
  `value` decimal(10,4),
  `created` timestamp DEFAULT (now())
);

ALTER TABLE `users` ADD FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`addressId`) REFERENCES `addresses` (`id`);

ALTER TABLE `countries` ADD FOREIGN KEY (`id`) REFERENCES `addresses` (`countryId`);

ALTER TABLE `users` ADD FOREIGN KEY (`id`) REFERENCES `devices` (`userId`);

ALTER TABLE `devices` ADD FOREIGN KEY (`addressId`) REFERENCES `addresses` (`id`);

ALTER TABLE `packet` ADD FOREIGN KEY (`sensorTypeId`) REFERENCES `sensorType` (`id`);
