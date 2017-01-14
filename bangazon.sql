DELETE FROM EquipmentType;
DELETE FROM Department;
DELETE FROM Supervisor;
DELETE FROM Employee;
DELETE FROM Equipment;
DELETE FROM ProDevelopment;
DELETE FROM ProDevEmployee;

DROP TABLE IF EXISTS EquipmentType;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Supervisor;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Equipment;
DROP TABLE IF EXISTS ProDevelopment;
DROP TABLE IF EXISTS ProDevEmployee;

CREATE TABLE `EquipmentType` (
  `EquipmentTypeId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Name`  TEXT NOT NULL
);


CREATE TABLE `Department` (
  `DepartmentId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Name`  TEXT NOT NULL,
  `Budget` INTEGER NOT NULL
);


CREATE TABLE `Supervisor` (
  `SupervisorId` INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `DepartmentId` INTEGER NOT NULL,
  FOREIGN KEY(`DepartmentId`) REFERENCES `Department`(`DepartmentId`)
);


CREATE TABLE `Employee` (
  `EmployeeId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `FirstName`  TEXT NOT NULL,
  `LastName`  TEXT NOT NULL,
  `HireDate`  DATE NOT NULL,
  `DecommissionDate`  DATE NOT NULL,
  `DepartmentId` INTEGER NOT NULL,
  `SupervisorId` INTEGER,
  FOREIGN KEY(`DepartmentId`) REFERENCES `Department`(`DepartmentId`),
  FOREIGN KEY(`SupervisorId`) REFERENCES `Supervisor`(`SupervisorId`)
);


CREATE TABLE `Equipment` (
  `EquipmentId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Name`  TEXT NOT NULL,
  `PurchaseDate`  DATE NOT NULL,
  `DecommissionDate`  DATE NOT NULL,
  `EquipmentTypeId` INTEGER NOT NULL,
  `EmployeeId` INTEGER NOT NULL,
  FOREIGN KEY(`EquipmentTypeId`) REFERENCES `EquipmentType`(`EquipmentTypeId`),
  FOREIGN KEY(`EmployeeId`) REFERENCES `Employee`(`EmployeeId`)
);


CREATE TABLE `ProDevelopment` (
  `ProDevId`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `Name`  TEXT NOT NULL,
  `StartDate`  DATE NOT NULL,
  `EndDate`  DATE NOT NULL,
  `MaxAttendance` INTEGER NOT NULL
);


CREATE TABLE `ProDevEmployee` (
  `ProDevEmployeeID`  INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
  `EmployeeId` INTEGER NOT NULL,
  FOREIGN KEY(`EmployeeId`) REFERENCES `Employee`(`EmployeeId`)
);


