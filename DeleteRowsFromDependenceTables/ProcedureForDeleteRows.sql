----important
USE AdventureWorks2019
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE HumanResources.DeletedRowsEmployeeTable
AS

DECLARE @employeesHistory table (  
    BusinessEntityID INT NOT NULL,   
    EmployeeDepartmentHistory NVARCHAR(MAX) NULL  
    );



DECLARE @employees table (  
	BusinessEntityID [int] NULL,
	NationalIDNumber [nvarchar](15) NULL,
	LoginID [nvarchar](256) NULL,
	JobTitle [nvarchar](50) NULL,
	BirthDate [date] NULL,
	MaritalStatus [nchar](1)NULL,
	Gender [nchar](1) NULL,
	HireDate [date] NULL	
    );

DELETE HumanResources.EmployeeDepartmentHistoryLT
OUTPUT DELETED.BusinessEntityID	      
      ,'DepartmentID='+COALESCE(CONVERT(NVARCHAR,DELETED.DepartmentID),'')
      +';ShiftID='+COALESCE(CONVERT(NVARCHAR,DELETED.ShiftID),'')
      +';StartDate='+COALESCE(CONVERT(NVARCHAR,DELETED.StartDate),'')
      +'EndDate=;'+COALESCE(CONVERT(NVARCHAR,DELETED.EndDate),'')
      +';ModifiedDate='+COALESCE(CONVERT(NVARCHAR,DELETED.ModifiedDate),'')
     INTO @employeesHistory
FROM HumanResources.EmployeeDepartmentHistoryLT 
INNER JOIN HumanResources.listOfIdNeedToDelete ON HumanResources.listOfIdNeedToDelete.BusinessEntityID=HumanResources.EmployeeDepartmentHistoryLT.BusinessEntityID


DELETE HumanResources.EmployeeLT
OUTPUT DELETED.BusinessEntityID
      ,DELETED.NationalIDNumber
      ,DELETED.LoginID
      ,DELETED.JobTitle
      ,DELETED.BirthDate
      ,DELETED.MaritalStatus
      ,DELETED.Gender
      ,DELETED.HireDate
     INTO @employees
FROM HumanResources.EmployeeLT 
INNER JOIN HumanResources.listOfIdNeedToDelete ON HumanResources.listOfIdNeedToDelete.BusinessEntityID=[HumanResources].[EmployeeLT].BusinessEntityID


INSERT INTO [HumanResources].[logDeletedRowsEmployeeTable]
SELECT 
       e.BusinessEntityID
      ,e.NationalIDNumber
      ,e.LoginID
      ,e.JobTitle
      ,e.BirthDate
      ,e.MaritalStatus
      ,e.Gender
      ,e.HireDate
      ,eh.EmployeeDepartmentHistory
FROM  @employees e
LEFT OUTER JOIN @employeesHistory eh ON eh.BusinessEntityID=e.BusinessEntityID



