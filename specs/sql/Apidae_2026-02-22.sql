CREATE TABLE `Users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `email` varchar(255) UNIQUE NOT NULL,
  `password` varchar(255),
  `firstName` varchar(255) NOT NULL,
  `lastName` varchar(255) NOT NULL,
  `roleId` int,
  `addressId` int,
  `created` timestamp DEFAULT (now()),
  `lastUpdate` timestamp DEFAULT (now()),
  `lastLogin` timestamp
);

CREATE TABLE `Addresses` (
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

CREATE TABLE `Countries` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `code` varchat(3) NOT NULL,
  `created` timestamp DEFAULT (now()),
  `lastUpdate` timestamp DEFAULT (now())
);

CREATE TABLE `Roles` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(20) UNIQUE NOT NULL,
  `level` int NOT NULL,
  `created` timestamp DEFAULT (now()),
  `lastUpdate` timestamp DEFAULT (now())
);

CREATE TABLE `Devices` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `serial` varchar[12] UNIQUE NOT NULL,
  `userId` int,
  `addressId` int
);

CREATE TABLE `SensorTypes` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar[20] UNIQUE,
  `description` varchar[255] DEFAULT null,
  `created` timestamp DEFAULT (now()),
  `lastUpdate` timestamp DEFAULT (now())
);

CREATE TABLE `Pakets` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `serial` varchar(20) NOT NULL,
  `deviceId` int DEFAULT null,
  `userId` int DEFAULT null,
  `created` timestamp DEFAULT (now())
);

CREATE TABLE `PaketEntries` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `paketId` int,
  `sensorType` varchar(20) DEFAULT null,
  `sensorTypeId` int,
  `value` decimal(10,4),
  `created` timestamp DEFAULT (now())
);

ALTER TABLE `Users` ADD FOREIGN KEY (`roleId`) REFERENCES `Roles` (`id`);

ALTER TABLE `Users` ADD FOREIGN KEY (`addressId`) REFERENCES `Addresses` (`id`);

ALTER TABLE `Countries` ADD FOREIGN KEY (`id`) REFERENCES `Addresses` (`countryId`);

ALTER TABLE `Users` ADD FOREIGN KEY (`id`) REFERENCES `Devices` (`userId`);

ALTER TABLE `Devices` ADD FOREIGN KEY (`addressId`) REFERENCES `Addresses` (`id`);

ALTER TABLE `Devices` ADD FOREIGN KEY (`id`) REFERENCES `Pakets` (`deviceId`);

ALTER TABLE `Pakets` ADD FOREIGN KEY (`userId`) REFERENCES `Users` (`id`);

ALTER TABLE `Pakets` ADD FOREIGN KEY (`id`) REFERENCES `PaketEntries` (`paketId`);

ALTER TABLE `PaketEntries` ADD FOREIGN KEY (`sensorTypeId`) REFERENCES `SensorTypes` (`id`);
