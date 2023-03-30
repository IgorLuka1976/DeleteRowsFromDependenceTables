# DeleteRowsFromDependenceTablesWithLog
Delete Rows From Dependence Tables By ID Parrent Table with Log Table, which will store all deleted rows.

   Problem:
It is necessary to delete a group of rows from the parent table(EmployeeLT) by unique ID, knowing that one of the columns is a foreign key in another child table(EmployeeDepartmentHistoryLT).

   Decision:
Given a list with identifiers that need to be imported into the table(listOfIdNeedToDelete), and then run a procedure that will remove the necessary rows from the tables(EmployeeLT,EmployeeDepartmentHistoryLT) with identifiers from the table listOfIdNeedToDelete.

In this example, deleted data from parrent table(EmployeeLT) will collected to the columns with the same names and dta types, but deleted data from child table (EmployeeDepartmentHistoryLT) will collected in one NVARCHAR column: EmployeeDepartmentHistory.
