USE [master]
GO
Create database Y23FA1B1
GO
USE Y23FA1B1
GO
CREATE TABLE [dbo].[Suppliers](
	[SupplierID] [nvarchar](10) NOT NULL primary key,
	[SupplierName] [nvarchar](30) NOT NULL,
	[BirthDate] datetime not NULL,
	[Gender] [bit] NULL,
	[Address] [nvarchar](50) NULL
)
GO

insert into Suppliers values('S05001','Hua Tien Dat',CAST(N'1990-03-03' AS Date),1,'Ha Dong, Ha Noi')
insert into Suppliers values('S05002','Tran Hung Dung',CAST(N'1995-10-02' AS Date),1,'Tu Liem, Ha Noi')
insert into Suppliers values('S05003','Le Khanh Thi',CAST(N'1987-02-04' AS Date),0,'Cau Giay, Ha Noi')
insert into Suppliers values('S05004','Nguyen Thanh Nhan',CAST(N'1987-05-09' AS Date),1,'Soc Son, Ha Noi')
insert into Suppliers values('S05005','Ha Hung Huy',CAST(N'1978-03-01' AS Date),1,'Hoai Duc, Ha Noi')
insert into Suppliers values('S05006','Do Nhu Huy',CAST(N'1995-03-01' AS Date),1,'Ba Vi, Ha Noi')
GO

CREATE TABLE [dbo].[Customers](
	[CustomerID] [nvarchar](10) NOT NULL primary key,
	[CustomerName] [nvarchar](30) NOT NULL,
	[BirthDate] datetime not NULL,
	[Gender] [bit] NULL,
	[Address] [nvarchar](50) NULL
)
GO

insert into Customers values('C05001','Tran Hung Cuong',CAST(N'1989-03-04' AS Date),1,'Gia Lam, Ha Noi')
insert into Customers values('C05002','Le Thi Van',CAST(N'1990-05-04' AS Date),0,'Dong Anh, Ha Noi')
insert into Customers values('C05003','Nguyen Thanh Cong',CAST(N'1980-07-04' AS Date),1,'Hoan Kiem, Ha Noi')
insert into Customers values('C05004','Ho Thi Khanh',CAST(N'1969-06-06' AS Date),0,'Thanh Xuan, Ha Noi')
insert into Customers values('C05005','Nguyen Khanh Ha',CAST(N'1985-05-08' AS Date),0,'Ba Dinh, Ha Noi')
insert into Customers values('C05006','Ha Viet Ha',CAST(N'1990-05-08' AS Date),0,'Dong Da, Ha Noi')
GO

select * from Suppliers where SupplierName like '%hu%' and YEAR(BirthDate) = 1995