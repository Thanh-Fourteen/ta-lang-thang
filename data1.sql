CREATE DATABASE Traveling

USE Traveling

CREATE TABLE Province
(
	ProvinceID char(4) NOT NULL PRIMARY KEY,
	ProvinceName nvarchar(40) NOT NULL
)

-- DROP TABLE Province

CREATE TABLE District
(
	ProvinceID char(4) NOT NULL REFERENCES Province(ProvinceID),
	DistrictID char(5) NOT NULL PRIMARY KEY,
	DistrictName nvarchar(40) NOT NULL
)

-- DROP TABLE District

CREATE TABLE Ward
(
	DistrictID char(5) NOT NULL REFERENCES District(DistrictID),
	WardID char(6) NOT NULL PRIMARY KEY,
	WardName nvarchar(40) NOT NULL
)

-- DROP TABLE Ward

CREATE TABLE PlaceType
(
	TypeID char(2) NOT NULL PRIMARY KEY,
	TypeName nvarchar(30)
)

CREATE TABLE Destination
(
	WardID char(6) NOT NULL REFERENCES Ward(WardID),
	DestinationID char(8) NOT NULL PRIMARY KEY,
	DestinationName nvarchar(40) NULL,
	DestinationInfo text NULL,
	TypeID char(2) NOT NULL REFERENCES PlaceType(TypeID)
)

-- DROP TABLE Destination

CREATE TABLE Picture
(
	DestinationID char(8) NOT NULL REFERENCES Destination(DestinationID),
	Img binary
)

CREATE TABLE Users
(
	UserID char(12) NOT NULL PRIMARY KEY,
	UserName varchar(30) NOT NULL,
	UserPassword varchar(30) NOT NULL
)

CREATE TABLE UserInfo
(
	UserID char(12) NOT NULL PRIMARY KEY REFERENCES Users(UserID),
	LastName nvarchar(7) NULL,
	MiddleName nvarchar(7) NULL,
	FirstName nvarChar(7) NULL,
	PhoneNumber char(12) NULL,
	Email varchar(40) NULL
)
-- DROP TABLE UserInfo

CREATE TABLE Feedback
(
	UserID char(12) NOT NULL REFERENCES Users(UserID),
	DestinationID char(8) NOT NULL REFERENCES Destination(DestinationID),
	Comment text,
	PRIMARY KEY (UserID, DestinationID)
)
-- DROP TABLE Feedback

CREATE TABLE Combo
(
	ComboID varchar(2) NOT NULL PRIMARY KEY,
	ComboName nvarchar(20)
)

CREATE TABLE ComboProvince
(
	ProvinceID char(4) NOT NULL REFERENCES Province(ProvinceID),
	ComboID varchar(2) NOT NULL REFERENCES Combo(ComboID),
	Detail text,
	PRIMARY KEY (ProvinceID, ComboID)
)

-- DROP TABLE ComboProvince	