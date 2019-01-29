USE [DDPOSDB]
GO

INSERT [dbo].[AccountsNature] ( [NatureName]) VALUES ( N'CAPITAL')
INSERT [dbo].[AccountsNature] ( [NatureName]) VALUES ( N'LIABILITIES')
INSERT [dbo].[AccountsNature] ( [NatureName]) VALUES ( N'INCOME ')
INSERT [dbo].[AccountsNature] ( [NatureName]) VALUES ( N'EXPENSE')
INSERT [dbo].[AccountsNature] ( [NatureName]) VALUES ( N'ASSET')

INSERT INTO [dbo].[ComapanyProfile]
           ([Name]
           ,[Bussiness]
           ,[OwnerName]
           ,[Date]
           ,[RegNo]
           ,[NTNNo]
           ,[Phone1]
           ,[Phone2]
           ,[Mobile1]
           ,[Mobile2]
           ,[Email]
           ,[Website]
           ,[Address]
           ,[CompanyRemarks]
           ,[NoteForBill])
     VALUES
           (''
           ,''
           ,''
           ,''
           ,''
           ,''
           ,''
           ,''
           ,''
           ,''
           ,''
           ,''
           ,''
           ,''
           ,'')


INSERT [dbo].[UserAccounts] ([UserName], [UserPass], [UserRightId], [UserActive]) VALUES ( N'admin', N'4FEA2F6069E9CBD5DFD684EB49AD41FD54BBDA773A7765E2248E1F78AF0CBC1B1536423929830629306763837669537572036', N'ADMIN', 1)