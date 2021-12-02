USE [Vuokraus]
GO
SET IDENTITY_INSERT [dbo].[tuote] ON 

INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (1, N'Akkuporakone', N'Bosch', N'GX12', 8, N'Sähkötyökalut')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (2, N'Henkilönostin', N'Dino', N'1200', 60, N'Nostimet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (3, N'Taso', N'Protools', N'100x 300', 3, N'Telineet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (4, N'Poravasara', N'Kangoo', N'Bx100', 12, N'Sähkötyökalut')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (6, N'Akkuporakone', N'Makita', N'DC24-7', 10, N'Sähkötyökalut')
SET IDENTITY_INSERT [dbo].[tuote] OFF
GO
