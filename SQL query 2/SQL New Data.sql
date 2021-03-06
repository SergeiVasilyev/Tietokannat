USE [master]
GO
/****** Object:  Database [Vuokraus]    Script Date: 29.09.2021 20:40:03 ******/
CREATE DATABASE [Vuokraus]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Vuokraus', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Vuokraus.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Vuokraus_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Vuokraus_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Vuokraus] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Vuokraus].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Vuokraus] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Vuokraus] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Vuokraus] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Vuokraus] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Vuokraus] SET ARITHABORT OFF 
GO
ALTER DATABASE [Vuokraus] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Vuokraus] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Vuokraus] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Vuokraus] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Vuokraus] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Vuokraus] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Vuokraus] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Vuokraus] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Vuokraus] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Vuokraus] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Vuokraus] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Vuokraus] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Vuokraus] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Vuokraus] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Vuokraus] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Vuokraus] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Vuokraus] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Vuokraus] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Vuokraus] SET  MULTI_USER 
GO
ALTER DATABASE [Vuokraus] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Vuokraus] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Vuokraus] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Vuokraus] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Vuokraus] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Vuokraus] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Vuokraus] SET QUERY_STORE = OFF
GO
USE [Vuokraus]
GO
/****** Object:  Table [dbo].[tuote]    Script Date: 29.09.2021 20:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tuote](
	[yksilointikoodi] [int] IDENTITY(1,1) NOT NULL,
	[nimike] [nvarchar](40) NOT NULL,
	[merkki] [nvarchar](20) NOT NULL,
	[malli] [nvarchar](20) NOT NULL,
	[paivavuokra] [float] NOT NULL,
	[tuoteryhma] [nvarchar](20) NOT NULL,
 CONSTRAINT [tuote_pk] PRIMARY KEY CLUSTERED 
(
	[yksilointikoodi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[asiakas]    Script Date: 29.09.2021 20:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[asiakas](
	[asiakasnumero] [int] IDENTITY(1,1) NOT NULL,
	[yritys] [nvarchar](30) NOT NULL,
	[laskutusosoite] [nvarchar](30) NOT NULL,
	[postinumero] [nvarchar](10) NOT NULL,
	[postitoimipaikka] [nvarchar](30) NOT NULL,
 CONSTRAINT [asiakas_pk] PRIMARY KEY CLUSTERED 
(
	[asiakasnumero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vuokraus]    Script Date: 29.09.2021 20:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vuokraus](
	[tapahtumaid] [int] IDENTITY(1,1) NOT NULL,
	[asiakasnumero] [int] NOT NULL,
	[yksilointikoodi] [int] NOT NULL,
	[alkamispaiva] [datetime] NOT NULL,
	[paattymispaiva] [datetime] NOT NULL,
 CONSTRAINT [vuokraus_pk] PRIMARY KEY CLUSTERED 
(
	[tapahtumaid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 29.09.2021 20:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.asiakas.yritys, dbo.tuote.nimike, dbo.tuote.merkki, dbo.tuote.malli, dbo.tuote.paivavuokra, dbo.vuokraus.alkamispaiva, dbo.vuokraus.paattymispaiva, DATEDIFF(day, dbo.vuokraus.alkamispaiva, 
                         dbo.vuokraus.paattymispaiva) AS päiviä
FROM            dbo.asiakas INNER JOIN
                         dbo.vuokraus ON dbo.asiakas.asiakasnumero = dbo.vuokraus.asiakasnumero INNER JOIN
                         dbo.tuote ON dbo.vuokraus.yksilointikoodi = dbo.tuote.yksilointikoodi
GO
/****** Object:  Table [dbo].[tuoteryhma]    Script Date: 29.09.2021 20:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tuoteryhma](
	[tuoteryhma] [nvarchar](20) NOT NULL,
 CONSTRAINT [tuoteryhma_pk] PRIMARY KEY CLUSTERED 
(
	[tuoteryhma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yhteyshenkilo]    Script Date: 29.09.2021 20:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yhteyshenkilo](
	[yhteyshenkilo_id] [int] IDENTITY(1,1) NOT NULL,
	[yhteystyyppi] [nvarchar](20) NOT NULL,
	[etunimi] [nvarchar](20) NOT NULL,
	[sukunimi] [nvarchar](30) NOT NULL,
	[puhelin] [nvarchar](15) NULL,
	[sahkoposti] [nvarchar](40) NOT NULL,
	[asiakasnumero] [int] NOT NULL,
 CONSTRAINT [yhteyshenkilo_pk] PRIMARY KEY CLUSTERED 
(
	[yhteyshenkilo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[yhteystyyppi]    Script Date: 29.09.2021 20:40:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[yhteystyyppi](
	[yhteystyyppi] [nvarchar](20) NOT NULL,
 CONSTRAINT [yhteystyyppi_pk] PRIMARY KEY CLUSTERED 
(
	[yhteystyyppi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[asiakas] ON 

INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (1, N'Raseko', N'Eeronkuja 3', N'21200', N'Raisio')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (2, N'Mähönen', N'Kuormakatu 2', N'21200', N'Raisio')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (3, N'Autoliike', N'Keskuskatu 22', N'23100', N'Mynämäki')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (4, N'Huttu', N'Eerikinkatu 54', N'20100', N'Turku')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (11, N'Wikido', N'1 Ryan Parkway', N'614097', N'Perm')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (13, N'Zoombeat', N'443 Hooker Parkway', N'111831', N'Bogotá')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (16, N'Skipfire', N'67 Paget Pass', N'423440', N'Nizhnyaya Maktama')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (18, N'Riffwire', N'3 Hanover Plaza', N'5311', N'Saidpur')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (19, N'Jabbersphere', N'22921 Clove Point', N'29330-000', N'Itapemirim')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (20, N'Riffpath', N'6567 Melby Street', N'L4K', N'Concord')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (24, N'Thoughtworks', N'503 Debra Pass', N'7114', N'Caracal')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (26, N'Livetube', N'5503 Charing Cross Pass', N'47302', N'Oštarije')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (27, N'Thoughtbeat', N'28653 Bellgrove Street', N'36740-000', N'Recreio')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (29, N'Gabtype', N'3 South Circle', N'50906', N'Bejuco')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (31, N'Topicware', N'19131 Transport Pass', N'20910', N'Silver Spring')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (34, N'Wikizz', N'5092 Glacier Hill Terrace', N'85271', N'Scottsdale')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (35, N'Innojam', N'48297 Park Meadow Center', N'613648', N'Stulovo')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (36, N'Skajo', N'0565 Pepper Wood Parkway', N'517 01', N'Solnice')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (37, N'Divape', N'928 Nancy Alley', N'4215', N'Liuhu')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (38, N'Jabbersphere', N'89 Scott Lane', N'340388', N'Socota')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (39, N'Ooba', N'79809 Myrtle Parkway', N'75498', N'La Soledad')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (40, N'Oyondu', N'80 Granby Terrace', N'204112', N'Daxi')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (41, N'Twitterwire', N'3 Waxwing Center', N'297966', N'Hexi')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (42, N'Quimm', N'01857 Arapahoe Hill', N'468891', N'Sepolong Timur')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (43, N'Eayo', N'5018 Eastlawn Center', N'5014', N'Quipot')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (44, N'Jabbersphere', N'20984 Ramsey Hill', N'562244', N'San Lorenzo')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (45, N'Jaxspan', N'6 Havey Street', N'89-412', N'Sosno')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (46, N'Mynte', N'0907 Claremont Junction', N'191154', N'Potrerillos Arriba')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (47, N'Photospace', N'9 Forster Junction', N'2870-013', N'Afonsoeiro')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (48, N'Devcast', N'43623 Forest Run Road', N'989-2474', N'Asahi')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (49, N'Buzzdog', N'4330 Prairieview Place', N'69115-000', N'Rio Preto da Eva')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (50, N'Ooba', N'7 Ruskin Lane', N'456339', N'Pochayiv')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (51, N'BlogXS', N'8 Golf View Place', N'423583', N'Huji')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (52, N'Tambee', N'402 Carioca Hill', N'2430-482', N'São Pedro de Muel')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (53, N'Thoughtbeat', N'114 Grasskamp Way', N'43211', N'Jiashi')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (54, N'Meejo', N'4 Holmberg Junction', N'284070', N'Asahbadung')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (55, N'Tagfeed', N'135 Butterfield Lane', N'409315', N'Tizguine')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (56, N'Devpoint', N'215 Eggendart Road', N'0472', N'Oslo')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (57, N'Realfire', N'0937 Ridgeway Court', N'796174', N'Klina')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (58, N'Aimbo', N'76005 Loeprich Pass', N'766305', N'La Mesa')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (59, N'Riffwire', N'2 Talisman Parkway', N'541328', N'Jiancheng')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (60, N'Realcube', N'676 Homewood Terrace', N'3019', N'Marilao')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (61, N'Buzzster', N'2 Randy Parkway', N'13920-000', N'Pedreira')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (62, N'Fivespan', N'3 Shopko Park', N'565780', N'Veguitas')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (63, N'Pixope', N'52743 Sycamore Way', N'366868', N'Peñaflor')
INSERT [dbo].[asiakas] ([asiakasnumero], [yritys], [laskutusosoite], [postinumero], [postitoimipaikka]) VALUES (64, N'Fivebridge', N'578 Main Avenue', N'50295', N'Delok')
SET IDENTITY_INSERT [dbo].[asiakas] OFF
GO
SET IDENTITY_INSERT [dbo].[tuote] ON 

INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (1, N'Akkuporakone', N'Bosch', N'GX12', 8, N'Sähkötyökalut')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (2, N'Henkilönostin', N'Dino', N'1200', 60, N'Nostimet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (3, N'Taso', N'Protools', N'100x 300', 3, N'Telineet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (4, N'Poravasara', N'Kangoo', N'Bx100', 12, N'Sähkötyökalut')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (5, N'Mercedes-Benz', N'CLK-Class', N'2000', 8, N'Sähkötyökalut')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (6, N'MINI', N'Cooper', N'2005', 26, N'Sähkötyökalut')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (7, N'Toyota', N'Celica', N'1994', 5, N'Sähkötyökalut')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (8, N'Mazda', N'MX-5', N'2001', 30, N'Telineet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (9, N'Plymouth', N'Voyager', N'1999', 1, N'Telineet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (10, N'Mazda', N'929', N'1994', 15, N'Telineet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (11, N'GMC', N'Yukon XL 1500', N'2001', 14, N'Sähkötyökalut')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (12, N'Suzuki', N'Kizashi', N'2010', 22, N'Nostimet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (13, N'Volvo', N'XC90', N'2003', 29, N'Telineet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (14, N'Infiniti', N'G', N'2004', 25, N'Sähkötyökalut')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (15, N'BMW', N'7 Series', N'1998', 27, N'Sähkötyökalut')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (16, N'Ford', N'F-250 Super Duty', N'2006', 10, N'Telineet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (17, N'Mazda', N'MX-5', N'1995', 8, N'Telineet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (18, N'Mazda', N'Mazda3', N'2007', 11, N'Sähkötyökalut')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (19, N'Dodge', N'Viper', N'2006', 12, N'Sähkötyökalut')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (20, N'Volkswagen', N'Jetta', N'2009', 21, N'Nostimet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (21, N'Studebaker', N'Avanti', N'1962', 16, N'Telineet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (22, N'Mazda', N'RX-7', N'1984', 21, N'Telineet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (23, N'Land Rover', N'Discovery', N'1999', 24, N'Telineet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (24, N'Saab', N'9-5', N'2001', 19, N'Telineet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (25, N'Plymouth', N'Grand Voyager', N'2000', 17, N'Nostimet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (26, N'Subaru', N'Impreza WRX', N'2011', 28, N'Nostimet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (27, N'Pontiac', N'Trans Sport', N'1999', 30, N'Telineet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (28, N'Aptera', N'2e', N'2009', 9, N'Nostimet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (29, N'Nissan', N'Frontier', N'2006', 8, N'Nostimet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (30, N'Saab', N'9-5', N'2000', 4, N'Nostimet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (31, N'Chevrolet', N'Silverado', N'2011', 26, N'Sähkötyökalut')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (32, N'Cadillac', N'Allante', N'1992', 10, N'Telineet')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (33, N'Ford', N'Club Wagon', N'1996', 24, N'Sähkötyökalut')
INSERT [dbo].[tuote] ([yksilointikoodi], [nimike], [merkki], [malli], [paivavuokra], [tuoteryhma]) VALUES (34, N'Chevrolet', N'Uplander', N'2007', 13, N'Telineet')
SET IDENTITY_INSERT [dbo].[tuote] OFF
GO
INSERT [dbo].[tuoteryhma] ([tuoteryhma]) VALUES (N'Nostimet')
INSERT [dbo].[tuoteryhma] ([tuoteryhma]) VALUES (N'Sähkötyökalut')
INSERT [dbo].[tuoteryhma] ([tuoteryhma]) VALUES (N'Telineet')
GO
SET IDENTITY_INSERT [dbo].[vuokraus] ON 

INSERT [dbo].[vuokraus] ([tapahtumaid], [asiakasnumero], [yksilointikoodi], [alkamispaiva], [paattymispaiva]) VALUES (1, 1, 2, CAST(N'2021-09-15T00:00:00.000' AS DateTime), CAST(N'2021-09-22T00:00:00.000' AS DateTime))
INSERT [dbo].[vuokraus] ([tapahtumaid], [asiakasnumero], [yksilointikoodi], [alkamispaiva], [paattymispaiva]) VALUES (2, 2, 1, CAST(N'2021-09-16T00:00:00.000' AS DateTime), CAST(N'2021-09-17T00:00:00.000' AS DateTime))
INSERT [dbo].[vuokraus] ([tapahtumaid], [asiakasnumero], [yksilointikoodi], [alkamispaiva], [paattymispaiva]) VALUES (3, 3, 3, CAST(N'2021-10-12T00:00:00.000' AS DateTime), CAST(N'2021-10-20T00:00:00.000' AS DateTime))
INSERT [dbo].[vuokraus] ([tapahtumaid], [asiakasnumero], [yksilointikoodi], [alkamispaiva], [paattymispaiva]) VALUES (6, 3, 1, CAST(N'2021-09-29T00:00:00.000' AS DateTime), CAST(N'2021-10-05T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[vuokraus] OFF
GO
SET IDENTITY_INSERT [dbo].[yhteyshenkilo] ON 

INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (1, N'Laskutus', N'Mikko', N'Karilainen', N'044 755 7473', N'Mikko.Karilainen@gmail.com', 1)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (2, N'Toimitus', N'Mika', N'Hakala', N'077 705 7420', N'Mika.Hakala@raseko.fi', 1)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (3, N'Laskutus', N'Bernie', N'Ayton', N'227-964-3905', N'bayton0@lulu.com', 56)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (4, N'Toimitus', N'Clayton', N'Woloschinski', N'900-754-3592', N'cwoloschinski1@sciencedaily.com', 52)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (7, N'Toimitus', N'Mehetabel', N'Pollicott', N'811-179-4396', N'mpollicott4@mozilla.com', 1)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (8, N'Toimitus', N'Jermain', N'Lennox', N'825-318-0724', N'jlennox5@usa.gov', 50)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (9, N'Laskutus', N'Tanney', N'Jendrach', N'927-647-6751', N'tjendrach6@wired.com', 58)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (10, N'Laskutus', N'Hermia', N'Lapping', N'203-236-4111', N'hlapping7@rakuten.co.jp', 60)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (15, N'Toimitus', N'Leandra', N'Reary', N'386-944-2495', N'lrearyc@skyrock.com', 60)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (16, N'Laskutus', N'Clair', N'Pimm', N'310-799-9346', N'cpimmd@house.gov', 52)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (17, N'Toimitus', N'Oralla', N'Coggins', N'837-662-4626', N'ocogginse@usda.gov', 19)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (18, N'Toimitus', N'Nikolos', N'Fairholme', N'498-530-2881', N'nfairholmef@moonfruit.com', 3)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (19, N'Toimitus', N'Koressa', N'Crowth', N'571-688-1655', N'kcrowthg@lycos.com', 26)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (21, N'Laskutus', N'Steven', N'Allard', N'798-562-3114', N'sallardi@reverbnation.com', 48)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (22, N'Toimitus', N'Allsun', N'Batram', N'849-435-8564', N'abatramj@trellian.com', 64)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (24, N'Toimitus', N'Sara-ann', N'Shilton', N'944-213-1445', N'sshiltonl@independent.co.uk', 41)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (25, N'Laskutus', N'Silvanus', N'Vanin', N'231-285-2587', N'svaninm@woothemes.com', 46)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (26, N'Laskutus', N'Lucy', N'Sirette', N'209-962-4026', N'lsiretten@google.co.uk', 51)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (28, N'Laskutus', N'Marjorie', N'Tures', N'621-760-5063', N'mturesp@dell.com', 34)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (29, N'Toimitus', N'Edee', N'Prowse', N'107-575-3718', N'eprowseq@yahoo.com', 39)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (30, N'Toimitus', N'Biron', N'Dendle', N'798-370-0079', N'bdendler@craigslist.org', 3)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (31, N'Laskutus', N'Marius', N'Merriton', N'979-327-2151', N'mmerritons@nbcnews.com', 50)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (32, N'Laskutus', N'Kathrine', N'Tindle', N'297-905-0545', N'ktindlet@engadget.com', 64)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (33, N'Laskutus', N'Bernie', N'Ayton', N'227-964-3905', N'bayton0@lulu.com', 56)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (34, N'Toimitus', N'Clayton', N'Woloschinski', N'900-754-3592', N'cwoloschinski1@sciencedaily.com', 52)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (35, N'Toimitus', N'Faustine', N'Gilhooley', N'975-341-5554', N'fgilhooley2@nasa.gov', 16)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (36, N'Laskutus', N'Orlan', N'Pactat', N'761-228-9128', N'opactat3@behance.net', 1)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (37, N'Toimitus', N'Mehetabel', N'Pollicott', N'811-179-4396', N'mpollicott4@mozilla.com', 1)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (38, N'Toimitus', N'Jermain', N'Lennox', N'825-318-0724', N'jlennox5@usa.gov', 50)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (39, N'Laskutus', N'Tanney', N'Jendrach', N'927-647-6751', N'tjendrach6@wired.com', 58)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (40, N'Laskutus', N'Hermia', N'Lapping', N'203-236-4111', N'hlapping7@rakuten.co.jp', 60)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (41, N'Laskutus', N'Guido', N'Goody', N'123-371-3524', N'ggoody8@nhs.uk', 52)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (42, N'Laskutus', N'Hadria', N'Probat', N'353-224-1105', N'hprobat9@cdc.gov', 56)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (43, N'Laskutus', N'Godard', N'McTurk', N'770-709-6926', N'gmcturka@bravesites.com', 2)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (45, N'Toimitus', N'Leandra', N'Reary', N'386-944-2495', N'lrearyc@skyrock.com', 60)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (46, N'Laskutus', N'Clair', N'Pimm', N'310-799-9346', N'cpimmd@house.gov', 52)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (47, N'Toimitus', N'Oralla', N'Coggins', N'837-662-4626', N'ocogginse@usda.gov', 19)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (48, N'Toimitus', N'Nikolos', N'Fairholme', N'498-530-2881', N'nfairholmef@moonfruit.com', 3)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (49, N'Toimitus', N'Koressa', N'Crowth', N'571-688-1655', N'kcrowthg@lycos.com', 26)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (50, N'Laskutus', N'Lorena', N'Hadgraft', N'795-818-0848', N'lhadgrafth@hibu.com', 16)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (51, N'Laskutus', N'Steven', N'Allard', N'798-562-3114', N'sallardi@reverbnation.com', 48)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (52, N'Toimitus', N'Allsun', N'Batram', N'849-435-8564', N'abatramj@trellian.com', 64)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (53, N'Toimitus', N'Mindy', N'Lince', N'766-904-1138', N'mlincek@issuu.com', 50)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (54, N'Toimitus', N'Sara-ann', N'Shilton', N'944-213-1445', N'sshiltonl@independent.co.uk', 41)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (55, N'Laskutus', N'Silvanus', N'Vanin', N'231-285-2587', N'svaninm@woothemes.com', 46)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (56, N'Laskutus', N'Lucy', N'Sirette', N'209-962-4026', N'lsiretten@google.co.uk', 51)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (57, N'Laskutus', N'Ryan', N'Meriott', N'292-561-0128', N'rmeriotto@deviantart.com', 2)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (58, N'Laskutus', N'Marjorie', N'Tures', N'621-760-5063', N'mturesp@dell.com', 34)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (59, N'Toimitus', N'Edee', N'Prowse', N'107-575-3718', N'eprowseq@yahoo.com', 39)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (60, N'Toimitus', N'Biron', N'Dendle', N'798-370-0079', N'bdendler@craigslist.org', 3)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (61, N'Laskutus', N'Marius', N'Merriton', N'979-327-2151', N'mmerritons@nbcnews.com', 50)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (62, N'Laskutus', N'Kathrine', N'Tindle', N'297-905-0545', N'ktindlet@engadget.com', 64)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (63, N'Laskutus', N'Bernie', N'Ayton', N'227-964-3905', N'bayton0@lulu.com', 56)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (64, N'Toimitus', N'Clayton', N'Woloschinski', N'900-754-3592', N'cwoloschinski1@sciencedaily.com', 52)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (65, N'Toimitus', N'Faustine', N'Gilhooley', N'975-341-5554', N'fgilhooley2@nasa.gov', 16)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (66, N'Laskutus', N'Orlan', N'Pactat', N'761-228-9128', N'opactat3@behance.net', 1)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (67, N'Toimitus', N'Mehetabel', N'Pollicott', N'811-179-4396', N'mpollicott4@mozilla.com', 1)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (68, N'Toimitus', N'Jermain', N'Lennox', N'825-318-0724', N'jlennox5@usa.gov', 50)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (69, N'Laskutus', N'Tanney', N'Jendrach', N'927-647-6751', N'tjendrach6@wired.com', 58)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (70, N'Laskutus', N'Hermia', N'Lapping', N'203-236-4111', N'hlapping7@rakuten.co.jp', 60)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (71, N'Laskutus', N'Guido', N'Goody', N'123-371-3524', N'ggoody8@nhs.uk', 52)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (72, N'Laskutus', N'Hadria', N'Probat', N'353-224-1105', N'hprobat9@cdc.gov', 56)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (73, N'Laskutus', N'Godard', N'McTurk', N'770-709-6926', N'gmcturka@bravesites.com', 2)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (74, N'Toimitus', N'Jen', N'Miko', N'229-321-0412', N'jmikob@prnewswire.com', 3)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (75, N'Toimitus', N'Leandra', N'Reary', N'386-944-2495', N'lrearyc@skyrock.com', 60)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (76, N'Laskutus', N'Clair', N'Pimm', N'310-799-9346', N'cpimmd@house.gov', 52)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (77, N'Toimitus', N'Oralla', N'Coggins', N'837-662-4626', N'ocogginse@usda.gov', 19)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (78, N'Toimitus', N'Nikolos', N'Fairholme', N'498-530-2881', N'nfairholmef@moonfruit.com', 3)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (79, N'Toimitus', N'Koressa', N'Crowth', N'571-688-1655', N'kcrowthg@lycos.com', 26)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (80, N'Laskutus', N'Lorena', N'Hadgraft', N'795-818-0848', N'lhadgrafth@hibu.com', 16)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (81, N'Laskutus', N'Steven', N'Allard', N'798-562-3114', N'sallardi@reverbnation.com', 48)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (82, N'Toimitus', N'Allsun', N'Batram', N'849-435-8564', N'abatramj@trellian.com', 64)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (83, N'Toimitus', N'Mindy', N'Lince', N'766-904-1138', N'mlincek@issuu.com', 50)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (84, N'Toimitus', N'Sara-ann', N'Shilton', N'944-213-1445', N'sshiltonl@independent.co.uk', 41)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (85, N'Laskutus', N'Silvanus', N'Vanin', N'231-285-2587', N'svaninm@woothemes.com', 46)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (86, N'Laskutus', N'Lucy', N'Sirette', N'209-962-4026', N'lsiretten@google.co.uk', 51)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (87, N'Laskutus', N'Ryan', N'Meriott', N'292-561-0128', N'rmeriotto@deviantart.com', 2)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (88, N'Laskutus', N'Marjorie', N'Tures', N'621-760-5063', N'mturesp@dell.com', 34)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (89, N'Toimitus', N'Edee', N'Prowse', N'107-575-3718', N'eprowseq@yahoo.com', 39)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (90, N'Toimitus', N'Biron', N'Dendle', N'798-370-0079', N'bdendler@craigslist.org', 3)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (91, N'Laskutus', N'Marius', N'Merriton', N'979-327-2151', N'mmerritons@nbcnews.com', 50)
INSERT [dbo].[yhteyshenkilo] ([yhteyshenkilo_id], [yhteystyyppi], [etunimi], [sukunimi], [puhelin], [sahkoposti], [asiakasnumero]) VALUES (92, N'Laskutus', N'Kathrine', N'Tindle', N'297-905-0545', N'ktindlet@engadget.com', 64)
SET IDENTITY_INSERT [dbo].[yhteyshenkilo] OFF
GO
INSERT [dbo].[yhteystyyppi] ([yhteystyyppi]) VALUES (N'Laskutus')
INSERT [dbo].[yhteystyyppi] ([yhteystyyppi]) VALUES (N'Toimitus')
GO
ALTER TABLE [dbo].[tuote]  WITH CHECK ADD  CONSTRAINT [tuoteryhma_tuote_fk] FOREIGN KEY([tuoteryhma])
REFERENCES [dbo].[tuoteryhma] ([tuoteryhma])
GO
ALTER TABLE [dbo].[tuote] CHECK CONSTRAINT [tuoteryhma_tuote_fk]
GO
ALTER TABLE [dbo].[vuokraus]  WITH CHECK ADD  CONSTRAINT [asiakas_vuokraus_fk] FOREIGN KEY([asiakasnumero])
REFERENCES [dbo].[asiakas] ([asiakasnumero])
GO
ALTER TABLE [dbo].[vuokraus] CHECK CONSTRAINT [asiakas_vuokraus_fk]
GO
ALTER TABLE [dbo].[vuokraus]  WITH CHECK ADD  CONSTRAINT [tuote_vuokraus_fk] FOREIGN KEY([yksilointikoodi])
REFERENCES [dbo].[tuote] ([yksilointikoodi])
GO
ALTER TABLE [dbo].[vuokraus] CHECK CONSTRAINT [tuote_vuokraus_fk]
GO
ALTER TABLE [dbo].[yhteyshenkilo]  WITH CHECK ADD  CONSTRAINT [asiakas_yhteyshenkilo_fk] FOREIGN KEY([asiakasnumero])
REFERENCES [dbo].[asiakas] ([asiakasnumero])
GO
ALTER TABLE [dbo].[yhteyshenkilo] CHECK CONSTRAINT [asiakas_yhteyshenkilo_fk]
GO
ALTER TABLE [dbo].[yhteyshenkilo]  WITH CHECK ADD  CONSTRAINT [yhteystyyppi_yhteyshenkilo_fk] FOREIGN KEY([yhteystyyppi])
REFERENCES [dbo].[yhteystyyppi] ([yhteystyyppi])
GO
ALTER TABLE [dbo].[yhteyshenkilo] CHECK CONSTRAINT [yhteystyyppi_yhteyshenkilo_fk]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[32] 4[34] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "asiakas"
            Begin Extent = 
               Top = 15
               Left = 50
               Bottom = 173
               Right = 275
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tuote"
            Begin Extent = 
               Top = 5
               Left = 759
               Bottom = 180
               Right = 988
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "vuokraus"
            Begin Extent = 
               Top = 13
               Left = 420
               Bottom = 173
               Right = 617
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1980
         Width = 1980
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 6555
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
USE [master]
GO
ALTER DATABASE [Vuokraus] SET  READ_WRITE 
GO
