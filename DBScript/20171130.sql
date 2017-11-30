USE master;  
GO  
IF DB_ID (N'IdentityExistingSample') IS NULL
CREATE DATABASE IdentityExistingSample;  
GO  

USE IdentityExistingSample;
GO

CREATE TABLE dbo.tbOrder(
	orderId uniqueidentifier not null default(NEWSEQUENTIALID()),
    orderTotalMoney decimal not null default(0.0),
	orderTotalDiscountMoney decimal not null default (0.0),
	orderTime datetime2 not null default(getdate()),
	CONSTRAINT PK_tbOrder PRIMARY KEY (orderId)
);

CREATE TABLE dbo.tbOrderDetail(
	orderDetailId uniqueidentifier not null default(NEWSEQUENTIALID()),
	orderDetailItemName nvarchar(100) not null,
	orderDetailItemAmount decimal not null default (0.0),
	orderDetailItemUnitPrice decimal not null default (0.0),
	orderDetailItemDiscountMoney decimal not null default (0.0),
	orderId uniqueidentifier not null,
	CONSTRAINT PK_tbOrderDetail PRIMARY KEY (orderDetailId),
	CONSTRAINT FK_tbOrder_tbOrderDetail FOREIGN KEY (orderId) REFERENCES dbo.tbOrder (orderId)
);
