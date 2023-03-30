----important
USE [AdventureWorks2019]
GO

----Create Tables
CREATE TABLE [HumanResources].[EmployeeLT](
	[BusinessEntityID] [int] IDENTITY(1,1) NOT NULL,
	[NationalIDNumber] [nvarchar](15) NULL,
	[LoginID] [nvarchar](256) NULL,
	[JobTitle] [nvarchar](50) NULL,
	[BirthDate] [date] NULL,
	[MaritalStatus] [nchar](1)NULL,
	[Gender] [nchar](1) NULL,
	[HireDate] [date] NULL,
 PRIMARY KEY CLUSTERED 
(
	[BusinessEntityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [HumanResources].[EmployeeDepartmentHistoryLT](
    [IdIdentity] [int] IDENTITY(1,1) NOT NULL,
	[BusinessEntityID] [int] NULL,
	[DepartmentID] [smallint]  NULL,
	[ShiftID] [tinyint]  NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[ModifiedDate] [datetime] NULL,
 PRIMARY KEY CLUSTERED 
(
	[IdIdentity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [HumanResources].[EmployeeDepartmentHistoryLT]  WITH CHECK ADD  CONSTRAINT [FK_EmployeeDepartmentHistory_Employee_BusinessEntityID_LT] FOREIGN KEY([BusinessEntityID])
REFERENCES [HumanResources].[EmployeeLT] ([BusinessEntityID])
GO

------Insert Data

INSERT INTO [HumanResources].[EmployeeLT]
           ([NationalIDNumber]
           ,[LoginID]
           ,[JobTitle]
           ,[BirthDate]
           ,[MaritalStatus]
           ,[Gender]
           ,[HireDate])
SELECT [NationalIDNumber]
      ,[LoginID]
      ,[JobTitle]
      ,[BirthDate]
      ,[MaritalStatus]
      ,[Gender]
      ,[HireDate]
  FROM [HumanResources].[Employee]
  ORDER BY BusinessEntityID


INSERT INTO [HumanResources].[EmployeeDepartmentHistoryLT]
           ([BusinessEntityID]
           ,[DepartmentID]
           ,[ShiftID]
           ,[StartDate]
           ,[EndDate]
           ,[ModifiedDate])
SELECT 
       [BusinessEntityID]
      ,[DepartmentID]
      ,[ShiftID]
      ,[StartDate]
      ,[EndDate]
      ,[ModifiedDate]
  FROM [HumanResources].[EmployeeDepartmentHistory]