USE [master]
GO
Create database Y24SU1B1
GO
USE Y24SU1B1
GO

CREATE TABLE [dbo].[Executions](
	[ExecutionID] [int] NOT NULL PRIMARY KEY,
	[Result] [int] NOT NULL
)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
insert into [Executions] values(1,2)
insert into [Executions] values(2,1)
insert into [Executions] values(3,1)
GO

CREATE TABLE [dbo].[ExecutionItems](
	[ExecutionItemID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ArrayItem] [int] NOT NULL,
	[ExecutionID] int references [Executions]([ExecutionID])
)
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
insert into [ExecutionItems]([ArrayItem],[ExecutionID]) values(1,1)
insert into [ExecutionItems]([ArrayItem],[ExecutionID]) values(2,1)
insert into [ExecutionItems]([ArrayItem],[ExecutionID]) values(3,1)
insert into [ExecutionItems]([ArrayItem],[ExecutionID]) values(4,1)
insert into [ExecutionItems]([ArrayItem],[ExecutionID]) values(1,2)
insert into [ExecutionItems]([ArrayItem],[ExecutionID]) values(2,2)
insert into [ExecutionItems]([ArrayItem],[ExecutionID]) values(1,3)
insert into [ExecutionItems]([ArrayItem],[ExecutionID]) values(2,3)
GO

select * from ExecutionItems

select * from Executions

select * from ExecutionItems ei, Executions e where ei.ExecutionID= e.ExecutionID


 --get all
SELECT e.ExecutionID, 
       STRING_AGG(ei.ArrayItem, ' ') AS ArrayItems,
       e.Result
FROM Executions e
JOIN ExecutionItems ei ON e.ExecutionID = ei.ExecutionID
GROUP BY e.ExecutionID, e.Result

 --get by id
SELECT e.ExecutionID, 
       STRING_AGG(ei.ArrayItem, ' ') AS ArrayItems,
       e.Result
FROM Executions e
JOIN ExecutionItems ei ON e.ExecutionID = ei.ExecutionID
where e.ExecutionID = 1
GROUP BY e.ExecutionID, e.Result