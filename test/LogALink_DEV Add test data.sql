USE [LogALink_DEV]
GO

-- Drop constraints from [dbo].[TempAccounts]
ALTER TABLE [dbo].[TempAccounts] DROP CONSTRAINT [FK_TempAccountPlan]

TRUNCATE TABLE [dbo].[Plans]
TRUNCATE TABLE [dbo].[TempAccounts]

-- Add 2 rows to [dbo].[Plans]
SET IDENTITY_INSERT [dbo].[Plans] ON
INSERT INTO [dbo].[Plans] ([Id], [Code], [Name], [Description], [Price], [PromoDays], [ExpirationDate], [IsTrial], [FrequencyDays], [PayPalButtonId], [PlanType]) VALUES (1, N'TRL7DAY', N'7 Day Free Trial', N'Trial Account, Not Billed', 0.0000, 7, '9999-12-31 23:59:59.997', 1, 0, 0, N'Trial')
INSERT INTO [dbo].[Plans] ([Id], [Code], [Name], [Description], [Price], [PromoDays], [ExpirationDate], [IsTrial], [FrequencyDays], [PayPalButtonId], [PlanType]) VALUES (2, N'MTHSTD', N'TEST LogALink.com Monthly Access', N'Billed Monthly', 19.9900, 0, '9999-12-31 00:00:00.000', 0, 1, 464692, N'Consumer')
SET IDENTITY_INSERT [dbo].[Plans] OFF

-- Add 1 row to [dbo].[TempAccounts]
SET IDENTITY_INSERT [dbo].[TempAccounts] ON
INSERT INTO [dbo].[TempAccounts] ([Id], [FirstName], [LastName], [Email], [Phone], [CompanyName], [Address], [Address2], [City], [State], [ZipCode], [CompanyPhone], [CompanyFax], [DateCreated], [DateEmailed], [Plan_Id]) VALUES (1, N'Damien', N'White', N'damien.white@visoftinc.com', N'860621751', N'Visoft, Inc.', N'20 Karen Rd.', NULL, N'Bristol', N'CT', N'06010', N'8606281751', NULL, '2010-04-27 23:49:00.000', '2010-04-27 23:49:00.000', 1)
SET IDENTITY_INSERT [dbo].[TempAccounts] OFF

-- Add constraints to [dbo].[TempAccounts]
ALTER TABLE [dbo].[TempAccounts] ADD CONSTRAINT [FK_TempAccountPlan] FOREIGN KEY ([Plan_Id]) REFERENCES [dbo].[Plans] ([Id])
