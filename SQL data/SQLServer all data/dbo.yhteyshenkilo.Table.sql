USE [Vuokraus]
GO
SET IDENTITY_INSERT [dbo].[yhteyshenkilo] ON 

INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (1, N'Laskutus', N'Mikko', N'Karilainen', N'044 755 7473', N'Mikko.Karilainen@gmail.com', 1)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (2, N'Toimitus', N'Mika', N'Hakala', N'077 705 7420', N'Mika.Hakala@raseko.fi', 1)
SET IDENTITY_INSERT [dbo].[yhteyshenkilo] OFF
GO
