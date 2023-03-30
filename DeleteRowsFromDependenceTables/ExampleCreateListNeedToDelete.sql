USE AdventureWorks2019
GO
---Create list with BusinessEntityID, which need to delete: 2,6,8,9

INSERT INTO HumanResources.listOfIdNeedToDelete
VALUES (2),(6),(8),(9)

SELECT * FROM HumanResources.listOfIdNeedToDelete