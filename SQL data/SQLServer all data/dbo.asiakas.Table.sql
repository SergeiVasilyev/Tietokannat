USE [Vuokraus]
GO
SET IDENTITY_INSERT [dbo].[asiakas] ON 

INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (1, N'Raseko', N'Eeronkuja 3', N'21200', N'Raisio')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (2, N'Mähönen', N'Kuormakatu 2', N'21200', N'Raisio')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (3, N'Autoliike', N'Keskuskatu 22', N'23100', N'Mynämäki')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (4, N'Huttu', N'Eerikinkatu 54', N'20100', N'Turku')
SET IDENTITY_INSERT [dbo].[asiakas] OFF
GO
