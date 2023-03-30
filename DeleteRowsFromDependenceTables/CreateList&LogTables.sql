----important
USE [AdventureWorks2019]
GO

CREATE TABLE [HumanResources].[listOfIdNeedToDelete](
	[BusinessEntityID] [int] NULL,
) ON [PRIMARY]
GO

CREATE TABLE [HumanResources].[logDeletedRowsEmployeeTable](
	[IdIdentity] [int] IDENTITY(1,1) NOT NULL,
	[BusinessEntityID] [int] NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[LoginID] [nvarchar](256) NULL,
	[JobTitle] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [nchar](1)NULL,
	[Gender] [nchar](1) NULL,
	[HireDate] [date] NULL,
	EmployeeDepartmentHistory NVARCHAR(MAX) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO