USE [master]
GO
/****** Object:  Database [maxmind]    Script Date: 24/05/2022 06:36:36 p.m. ******/
CREATE DATABASE [maxmind]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'maxmind', FILENAME = N'/var/opt/mssql/data/maxmind.mdf' , SIZE = 45184KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'maxmind_log', FILENAME = N'/var/opt/mssql/data/maxmind_log.ldf' , SIZE = 106496KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [maxmind] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [maxmind].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [maxmind] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [maxmind] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [maxmind] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [maxmind] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [maxmind] SET ARITHABORT OFF 
GO
ALTER DATABASE [maxmind] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [maxmind] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [maxmind] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [maxmind] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [maxmind] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [maxmind] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [maxmind] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [maxmind] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [maxmind] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [maxmind] SET  DISABLE_BROKER 
GO
ALTER DATABASE [maxmind] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [maxmind] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [maxmind] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [maxmind] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [maxmind] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [maxmind] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [maxmind] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [maxmind] SET RECOVERY FULL 
GO
ALTER DATABASE [maxmind] SET  MULTI_USER 
GO
ALTER DATABASE [maxmind] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [maxmind] SET DB_CHAINING OFF 
GO
ALTER DATABASE [maxmind] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [maxmind] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [maxmind] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'maxmind', N'ON'
GO
ALTER DATABASE [maxmind] SET QUERY_STORE = OFF
GO
USE [maxmind]
GO
/****** Object:  Table [dbo].[ip]    Script Date: 24/05/2022 06:36:37 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ip](
	[network] [varchar](50) NULL,
	[geoname_id] [varchar](50) NULL,
	[registered_country_geoname_id] [varchar](50) NULL,
	[represented_country_geoname_id] [varchar](50) NULL,
	[is_anonymous_proxy] [varchar](50) NULL,
	[is_satellite_provider] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[country]    Script Date: 24/05/2022 06:36:37 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[geoname_id] [varchar](50) NULL,
	[locale_code] [varchar](50) NULL,
	[continent_code] [varchar](50) NULL,
	[continent_name] [varchar](50) NULL,
	[country_iso_code] [varchar](50) NULL,
	[country_name] [varchar](50) NULL,
	[is_in_european_union] [varchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[vcountrygeo]    Script Date: 24/05/2022 06:36:37 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[vcountrygeo]
as

SELECT TOP (100) 
	i.network
   ,i.geoname_id
   ,i.registered_country_geoname_id
   ,i.represented_country_geoname_id
   ,i.is_anonymous_proxy
   ,i.is_satellite_provider
   ,c.locale_code
   ,c.continent_code
   ,c.continent_name
   ,c.country_iso_code
   ,c.country_name
   ,c.is_in_european_union
FROM ip AS i
INNER JOIN country AS c
	ON i.geoname_id = c.geoname_id
 


GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'49518', N'es', N'AF', N'"Ãfrica"', N'RW', N'Ruanda', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'51537', N'es', N'AF', N'"Ãfrica"', N'SO', N'Somalia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'69543', N'es', N'AS', N'Asia', N'YE', N'Yemen', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'99237', N'es', N'AS', N'Asia', N'IQ', N'Irak', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'102358', N'es', N'AS', N'Asia', N'SA', N'"Arabia SaudÃ­"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'130758', N'es', N'AS', N'Asia', N'IR', N'IrÃ¡n', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'146669', N'es', N'EU', N'Europa', N'CY', N'Chipre', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'149590', N'es', N'AF', N'"Ãfrica"', N'TZ', N'Tanzania', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'163843', N'es', N'AS', N'Asia', N'SY', N'Siria', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'174982', N'es', N'AS', N'Asia', N'AM', N'Armenia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'192950', N'es', N'AF', N'"Ãfrica"', N'KE', N'Kenia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'203312', N'es', N'AF', N'"Ãfrica"', N'CD', N'"Congo DemocrÃ¡tico"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'223816', N'es', N'AF', N'"Ãfrica"', N'DJ', N'Yibuti', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'226074', N'es', N'AF', N'"Ãfrica"', N'UG', N'Uganda', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'239880', N'es', N'AF', N'"Ãfrica"', N'CF', N'"RepÃºblica Centroafricana"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'241170', N'es', N'AF', N'"Ãfrica"', N'SC', N'Seychelles', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'248816', N'es', N'AS', N'Asia', N'JO', N'Jordania', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'272103', N'es', N'AS', N'Asia', N'LB', N'LÃ­bano', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'285570', N'es', N'AS', N'Asia', N'KW', N'Kuwait', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'286963', N'es', N'AS', N'Asia', N'OM', N'OmÃ¡n', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'289688', N'es', N'AS', N'Asia', N'QA', N'Catar', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'290291', N'es', N'AS', N'Asia', N'BH', N'BahrÃ©in', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'290557', N'es', N'AS', N'Asia', N'AE', N'"Emiratos Ãrabes Unidos"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'294640', N'es', N'AS', N'Asia', N'IL', N'Israel', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'298795', N'es', N'AS', N'Asia', N'TR', N'TurquÃ­a', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'337996', N'es', N'AF', N'"Ãfrica"', N'ET', N'EtiopÃ­a', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'338010', N'es', N'AF', N'"Ãfrica"', N'ER', N'Eritrea', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'357994', N'es', N'AF', N'"Ãfrica"', N'EG', N'Egipto', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'366755', N'es', N'AF', N'"Ãfrica"', N'SD', N'SudÃ¡n', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'390903', N'es', N'EU', N'Europa', N'GR', N'Grecia', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'433561', N'es', N'AF', N'"Ãfrica"', N'BI', N'Burundi', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'453733', N'es', N'EU', N'Europa', N'EE', N'Estonia', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'458258', N'es', N'EU', N'Europa', N'LV', N'Letonia', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'587116', N'es', N'AS', N'Asia', N'AZ', N'AzerbaiyÃ¡n', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'597427', N'es', N'EU', N'Europa', N'LT', N'Lituania', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'607072', N'es', N'EU', N'Europa', N'SJ', N'"Svalbard y Jan Mayen"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'614540', N'es', N'AS', N'Asia', N'GE', N'Georgia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'617790', N'es', N'EU', N'Europa', N'MD', N'Moldavia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'630336', N'es', N'EU', N'Europa', N'BY', N'Bielorrusia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'660013', N'es', N'EU', N'Europa', N'FI', N'Finlandia', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'661882', N'es', N'EU', N'Europa', N'AX', N'"Islas Aland"', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'690791', N'es', N'EU', N'Europa', N'UA', N'Ucrania', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'718075', N'es', N'EU', N'Europa', N'MK', N'"Macedonia del Norte"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'719819', N'es', N'EU', N'Europa', N'HU', N'HungrÃ­a', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'732800', N'es', N'EU', N'Europa', N'BG', N'Bulgaria', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'783754', N'es', N'EU', N'Europa', N'AL', N'Albania', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'798544', N'es', N'EU', N'Europa', N'PL', N'Polonia', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'798549', N'es', N'EU', N'Europa', N'RO', N'RumanÃ­a', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'831053', N'es', N'EU', N'Europa', N'XK', N'Kosovo', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'878675', N'es', N'AF', N'"Ãfrica"', N'ZW', N'Zimbawe', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'895949', N'es', N'AF', N'"Ãfrica"', N'ZM', N'Zambia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'921929', N'es', N'AF', N'"Ãfrica"', N'KM', N'Comoras', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'927384', N'es', N'AF', N'"Ãfrica"', N'MW', N'Malaui', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'932692', N'es', N'AF', N'"Ãfrica"', N'LS', N'Lesotho', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'933860', N'es', N'AF', N'"Ãfrica"', N'BW', N'Botsuana', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'934292', N'es', N'AF', N'"Ãfrica"', N'MU', N'Mauricio', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'934841', N'es', N'AF', N'"Ãfrica"', N'SZ', N'Esuatini', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'935317', N'es', N'AF', N'"Ãfrica"', N'RE', N'ReuniÃ³n', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'953987', N'es', N'AF', N'"Ãfrica"', N'ZA', N'SudÃ¡frica', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1024031', N'es', N'AF', N'"Ãfrica"', N'YT', N'Mayotte', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1036973', N'es', N'AF', N'"Ãfrica"', N'MZ', N'Mozambique', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1062947', N'es', N'AF', N'"Ãfrica"', N'MG', N'Madagascar', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1149361', N'es', N'AS', N'Asia', N'AF', N'AfganistÃ¡n', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1168579', N'es', N'AS', N'Asia', N'PK', N'PakistÃ¡n', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1210997', N'es', N'AS', N'Asia', N'BD', N'Bangladesh', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1218197', N'es', N'AS', N'Asia', N'TM', N'TurkmenistÃ¡n', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1220409', N'es', N'AS', N'Asia', N'TJ', N'TayikistÃ¡n', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1227603', N'es', N'AS', N'Asia', N'LK', N'"Sri Lanka"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1252634', N'es', N'AS', N'Asia', N'BT', N'ButÃ¡n', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1269750', N'es', N'AS', N'Asia', N'IN', N'India', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1282028', N'es', N'AS', N'Asia', N'MV', N'Maldivas', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1282588', N'es', N'AS', N'Asia', N'IO', N'"Territorio BritÃ¡nico del OcÃ©ano Ãndico"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1282988', N'es', N'AS', N'Asia', N'NP', N'Nepal', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1327865', N'es', N'AS', N'Asia', N'MM', N'"Myanmar (Birmania)"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1512440', N'es', N'AS', N'Asia', N'UZ', N'UzbekistÃ¡n', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1522867', N'es', N'AS', N'Asia', N'KZ', N'KazajstÃ¡n', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1527747', N'es', N'AS', N'Asia', N'KG', N'KirguistÃ¡n', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1546748', N'es', N'AN', N'AntÃ¡rtida', N'TF', N'"Territorios Australes Franceses"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1547314', N'es', N'AN', N'AntÃ¡rtida', N'HM', N'"Islas Heard y McDonald"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1547376', N'es', N'AS', N'Asia', N'CC', N'"Islas Cocos"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1559582', N'es', N'OC', N'OceanÃ­a', N'PW', N'Palaos', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1562822', N'es', N'AS', N'Asia', N'VN', N'Vietnam', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1605651', N'es', N'AS', N'Asia', N'TH', N'Tailandia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1643084', N'es', N'AS', N'Asia', N'ID', N'Indonesia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1655842', N'es', N'AS', N'Asia', N'LA', N'Laos', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1668284', N'es', N'AS', N'Asia', N'TW', N'TaiwÃ¡n', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1694008', N'es', N'AS', N'Asia', N'PH', N'Filipinas', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1733045', N'es', N'AS', N'Asia', N'MY', N'Malasia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1814991', N'es', N'AS', N'Asia', N'CN', N'China', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1819730', N'es', N'AS', N'Asia', N'HK', N'"Hong Kong"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1820814', N'es', N'AS', N'Asia', N'BN', N'BrunÃ©i', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1821275', N'es', N'AS', N'Asia', N'MO', N'Macao', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1831722', N'es', N'AS', N'Asia', N'KH', N'Camboya', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1835841', N'es', N'AS', N'Asia', N'KR', N'"Corea del Sur"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1861060', N'es', N'AS', N'Asia', N'JP', N'JapÃ³n', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1873107', N'es', N'AS', N'Asia', N'KP', N'"Corea del Norte"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1880251', N'es', N'AS', N'Asia', N'SG', N'Singapur', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1899402', N'es', N'OC', N'OceanÃ­a', N'CK', N'"Islas Cook"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'1966436', N'es', N'OC', N'OceanÃ­a', N'TL', N'Timor-Leste', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2017370', N'es', N'EU', N'Europa', N'RU', N'Rusia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2029969', N'es', N'AS', N'Asia', N'MN', N'Mongolia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2077456', N'es', N'OC', N'OceanÃ­a', N'AU', N'Australia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2078138', N'es', N'OC', N'OceanÃ­a', N'CX', N'"Isla de Navidad"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2080185', N'es', N'OC', N'OceanÃ­a', N'MH', N'"Islas Marshall"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2081918', N'es', N'OC', N'OceanÃ­a', N'FM', N'Micronesia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2088628', N'es', N'OC', N'OceanÃ­a', N'PG', N'"PapÃºa-Nueva Guinea"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2103350', N'es', N'OC', N'OceanÃ­a', N'SB', N'"Islas SalomÃ³n"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2110297', N'es', N'OC', N'OceanÃ­a', N'TV', N'Tuvalu', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2110425', N'es', N'OC', N'OceanÃ­a', N'NR', N'Nauru', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2134431', N'es', N'OC', N'OceanÃ­a', N'VU', N'Vanuatu', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2139685', N'es', N'OC', N'OceanÃ­a', N'NC', N'"Nueva Caledonia"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2155115', N'es', N'OC', N'OceanÃ­a', N'NF', N'"Isla Norfolk"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2186224', N'es', N'OC', N'OceanÃ­a', N'NZ', N'"Nueva Zelanda"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2205218', N'es', N'OC', N'OceanÃ­a', N'FJ', N'Fiyi', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2215636', N'es', N'AF', N'"Ãfrica"', N'LY', N'Libia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2233387', N'es', N'AF', N'"Ãfrica"', N'CM', N'CamerÃºn', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2245662', N'es', N'AF', N'"Ãfrica"', N'SN', N'Senegal', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2260494', N'es', N'AF', N'"Ãfrica"', N'CG', N'Congo', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2264397', N'es', N'EU', N'Europa', N'PT', N'Portugal', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2275384', N'es', N'AF', N'"Ãfrica"', N'LR', N'Liberia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2287781', N'es', N'AF', N'"Ãfrica"', N'CI', N'"CÃ´te dâ€™Ivoire"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2300660', N'es', N'AF', N'"Ãfrica"', N'GH', N'Ghana', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2309096', N'es', N'AF', N'"Ãfrica"', N'GQ', N'"Guinea Ecuatorial"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2328926', N'es', N'AF', N'"Ãfrica"', N'NG', N'Nigeria', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2361809', N'es', N'AF', N'"Ãfrica"', N'BF', N'"Burkina Faso"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2363686', N'es', N'AF', N'"Ãfrica"', N'TG', N'Togo', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2372248', N'es', N'AF', N'"Ãfrica"', N'GW', N'Guinea-BissÃ¡u', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2378080', N'es', N'AF', N'"Ãfrica"', N'MR', N'Mauritania', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2395170', N'es', N'AF', N'"Ãfrica"', N'BJ', N'BenÃ­n', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2400553', N'es', N'AF', N'"Ãfrica"', N'GA', N'GabÃ³n', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2403846', N'es', N'AF', N'"Ãfrica"', N'SL', N'"Sierra Leona"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2410758', N'es', N'AF', N'"Ãfrica"', N'ST', N'"Santo TomÃ© y PrÃ­ncipe"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2411586', N'es', N'EU', N'Europa', N'GI', N'Gibraltar', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2413451', N'es', N'AF', N'"Ãfrica"', N'GM', N'Gambia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2420477', N'es', N'AF', N'"Ãfrica"', N'GN', N'Guinea', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2434508', N'es', N'AF', N'"Ãfrica"', N'TD', N'Chad', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2440476', N'es', N'AF', N'"Ãfrica"', N'NE', N'NÃ­ger', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2453866', N'es', N'AF', N'"Ãfrica"', N'ML', N'Mali', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2461445', N'es', N'AF', N'"Ãfrica"', N'EH', N'"SÃ¡hara Occidental"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2464461', N'es', N'AF', N'"Ãfrica"', N'TN', N'TÃºnez', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2510769', N'es', N'EU', N'Europa', N'ES', N'EspaÃ±a', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2542007', N'es', N'AF', N'"Ãfrica"', N'MA', N'Marruecos', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2562770', N'es', N'EU', N'Europa', N'MT', N'Malta', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2589581', N'es', N'AF', N'"Ãfrica"', N'DZ', N'Argelia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2622320', N'es', N'EU', N'Europa', N'FO', N'"Islas Feroe"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2623032', N'es', N'EU', N'Europa', N'DK', N'Dinamarca', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2629691', N'es', N'EU', N'Europa', N'IS', N'Islandia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2635167', N'es', N'EU', N'Europa', N'GB', N'RU', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2658434', N'es', N'EU', N'Europa', N'CH', N'Suiza', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2661886', N'es', N'EU', N'Europa', N'SE', N'Suecia', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2750405', N'es', N'EU', N'Europa', N'NL', N'Holanda', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2782113', N'es', N'EU', N'Europa', N'AT', N'Austria', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2802361', N'es', N'EU', N'Europa', N'BE', N'BÃ©lgica', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2921044', N'es', N'EU', N'Europa', N'DE', N'Alemania', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2960313', N'es', N'EU', N'Europa', N'LU', N'Luxemburgo', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2963597', N'es', N'EU', N'Europa', N'IE', N'Irlanda', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'2993457', N'es', N'EU', N'Europa', N'MC', N'MÃ³naco', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3017382', N'es', N'EU', N'Europa', N'FR', N'Francia', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3041565', N'es', N'EU', N'Europa', N'AD', N'Andorra', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3042058', N'es', N'EU', N'Europa', N'LI', N'Liechtenstein', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3042142', N'es', N'EU', N'Europa', N'JE', N'Jersey', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3042225', N'es', N'EU', N'Europa', N'IM', N'"Isla de Man"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3042362', N'es', N'EU', N'Europa', N'GG', N'Guernesey', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3057568', N'es', N'EU', N'Europa', N'SK', N'Eslovaquia', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3077311', N'es', N'EU', N'Europa', N'CZ', N'Chequia', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3144096', N'es', N'EU', N'Europa', N'NO', N'Noruega', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3164670', N'es', N'EU', N'Europa', N'VA', N'"Ciudad del Vaticano"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3168068', N'es', N'EU', N'Europa', N'SM', N'"San Marino"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3175395', N'es', N'EU', N'Europa', N'IT', N'Italia', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3190538', N'es', N'EU', N'Europa', N'SI', N'Eslovenia', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3194884', N'es', N'EU', N'Europa', N'ME', N'Montenegro', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3202326', N'es', N'EU', N'Europa', N'HR', N'Croacia', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3277605', N'es', N'EU', N'Europa', N'BA', N'Bosnia-Herzegovina', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3351879', N'es', N'AF', N'"Ãfrica"', N'AO', N'Angola', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3355338', N'es', N'AF', N'"Ãfrica"', N'NA', N'Namibia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3370751', N'es', N'AF', N'"Ãfrica"', N'SH', N'"Santa Elena"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3371123', N'es', N'AN', N'AntÃ¡rtida', N'BV', N'"Isla Bouvet"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3374084', N'es', N'NA', N'NorteamÃ©rica', N'BB', N'Barbados', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3374766', N'es', N'AF', N'"Ãfrica"', N'CV', N'"Cabo Verde"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3378535', N'es', N'SA', N'SudamÃ©rica', N'GY', N'Guyana', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3381670', N'es', N'SA', N'SudamÃ©rica', N'GF', N'"Guayana Francesa"', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3382998', N'es', N'SA', N'SudamÃ©rica', N'SR', N'Surinam', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3424932', N'es', N'NA', N'NorteamÃ©rica', N'PM', N'"San Pedro y MiquelÃ³n"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3425505', N'es', N'NA', N'NorteamÃ©rica', N'GL', N'Groenlandia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3437598', N'es', N'SA', N'SudamÃ©rica', N'PY', N'Paraguay', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3439705', N'es', N'SA', N'SudamÃ©rica', N'UY', N'Uruguay', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3469034', N'es', N'SA', N'SudamÃ©rica', N'BR', N'Brasil', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3474414', N'es', N'SA', N'SudamÃ©rica', N'FK', N'"Islas Malvinas"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3474415', N'es', N'AN', N'AntÃ¡rtida', N'GS', N'"Islas Georgia del Sur y Sandwich del Sur"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3489940', N'es', N'NA', N'NorteamÃ©rica', N'JM', N'Jamaica', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3508796', N'es', N'NA', N'NorteamÃ©rica', N'DO', N'"Santo Domingo"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3562981', N'es', N'NA', N'NorteamÃ©rica', N'CU', N'Cuba', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3570311', N'es', N'NA', N'NorteamÃ©rica', N'MQ', N'Martinica', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3572887', N'es', N'NA', N'NorteamÃ©rica', N'BS', N'Bahamas', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3573345', N'es', N'NA', N'NorteamÃ©rica', N'BM', N'Bermudas', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3573511', N'es', N'NA', N'NorteamÃ©rica', N'AI', N'Anguila', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3573591', N'es', N'NA', N'NorteamÃ©rica', N'TT', N'"Trinidad y Tobago"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3575174', N'es', N'NA', N'NorteamÃ©rica', N'KN', N'"San CristÃ³bal y Nieves"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3575830', N'es', N'NA', N'NorteamÃ©rica', N'DM', N'Dominica', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3576396', N'es', N'NA', N'NorteamÃ©rica', N'AG', N'"Antigua y Barbuda"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3576468', N'es', N'NA', N'NorteamÃ©rica', N'LC', N'"Santa LucÃ­a"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3576916', N'es', N'NA', N'NorteamÃ©rica', N'TC', N'"Islas Turcas y Caicos"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3577279', N'es', N'NA', N'NorteamÃ©rica', N'AW', N'Aruba', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3577718', N'es', N'NA', N'NorteamÃ©rica', N'VG', N'"Islas VÃ­rgenes"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3577815', N'es', N'NA', N'NorteamÃ©rica', N'VC', N'"San Vicente y las Granadinas"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3578097', N'es', N'NA', N'NorteamÃ©rica', N'MS', N'Montserrat', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3578421', N'es', N'NA', N'NorteamÃ©rica', N'MF', N'"San MartÃ­n"', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3578476', N'es', N'NA', N'NorteamÃ©rica', N'BL', N'"San BartolomÃ©"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3579143', N'es', N'NA', N'NorteamÃ©rica', N'GP', N'Guadalupe', N'1')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3580239', N'es', N'NA', N'NorteamÃ©rica', N'GD', N'Granada', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3580718', N'es', N'NA', N'NorteamÃ©rica', N'KY', N'"Islas CaimÃ¡n"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3582678', N'es', N'NA', N'NorteamÃ©rica', N'BZ', N'Belice', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3585968', N'es', N'NA', N'NorteamÃ©rica', N'SV', N'"El Salvador"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3595528', N'es', N'NA', N'NorteamÃ©rica', N'GT', N'Guatemala', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3608932', N'es', N'NA', N'NorteamÃ©rica', N'HN', N'Honduras', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3617476', N'es', N'NA', N'NorteamÃ©rica', N'NI', N'Nicaragua', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3624060', N'es', N'NA', N'NorteamÃ©rica', N'CR', N'"Costa Rica"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3625428', N'es', N'SA', N'SudamÃ©rica', N'VE', N'Venezuela', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3658394', N'es', N'SA', N'SudamÃ©rica', N'EC', N'Ecuador', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3686110', N'es', N'SA', N'SudamÃ©rica', N'CO', N'Colombia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3703430', N'es', N'NA', N'NorteamÃ©rica', N'PA', N'PanamÃ¡', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3723988', N'es', N'NA', N'NorteamÃ©rica', N'HT', N'HaitÃ­', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3865483', N'es', N'SA', N'SudamÃ©rica', N'AR', N'Argentina', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3895114', N'es', N'SA', N'SudamÃ©rica', N'CL', N'Chile', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3923057', N'es', N'SA', N'SudamÃ©rica', N'BO', N'Bolivia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3932488', N'es', N'SA', N'SudamÃ©rica', N'PE', N'PerÃº', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'3996063', N'es', N'NA', N'NorteamÃ©rica', N'MX', N'MÃ©xico', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'4030656', N'es', N'OC', N'OceanÃ­a', N'PF', N'"Polinesia Francesa"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'4030699', N'es', N'OC', N'OceanÃ­a', N'PN', N'"Islas Pitcairn"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'4030945', N'es', N'OC', N'OceanÃ­a', N'KI', N'Kiribati', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'4031074', N'es', N'OC', N'OceanÃ­a', N'TK', N'Tokelau', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'4032283', N'es', N'OC', N'OceanÃ­a', N'TO', N'Tonga', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'4034749', N'es', N'OC', N'OceanÃ­a', N'WF', N'"Wallis y Futuna"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'4034894', N'es', N'OC', N'OceanÃ­a', N'WS', N'Samoa', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'4036232', N'es', N'OC', N'OceanÃ­a', N'NU', N'Niue', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'4041468', N'es', N'OC', N'OceanÃ­a', N'MP', N'"Islas Marianas del Norte"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'4043988', N'es', N'OC', N'OceanÃ­a', N'GU', N'Guam', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'4566966', N'es', N'NA', N'NorteamÃ©rica', N'PR', N'"Puerto Rico"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'4796775', N'es', N'NA', N'NorteamÃ©rica', N'VI', N'"Islas VÃ­rgenes de EE. UU."', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'5854968', N'es', N'OC', N'OceanÃ­a', N'UM', N'"Islas menores alejadas de EE. UU."', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'5880801', N'es', N'OC', N'OceanÃ­a', N'AS', N'"Samoa Americana"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'6251999', N'es', N'NA', N'NorteamÃ©rica', N'CA', N'CanadÃ¡', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'6252001', N'es', N'NA', N'NorteamÃ©rica', N'US', N'"Estados Unidos"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'6254930', N'es', N'AS', N'Asia', N'PS', N'Palestina', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'6255147', N'es', N'AS', N'Asia', N'', N'', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'6255148', N'es', N'EU', N'Europa', N'', N'', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'6290252', N'es', N'EU', N'Europa', N'RS', N'Serbia', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'6697173', N'es', N'AN', N'AntÃ¡rtida', N'AQ', N'AntÃ¡rtida', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'7609695', N'es', N'NA', N'NorteamÃ©rica', N'SX', N'"Isla de San MartÃ­n"', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'7626836', N'es', N'NA', N'NorteamÃ©rica', N'CW', N'Curazao', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'7626844', N'es', N'NA', N'NorteamÃ©rica', N'BQ', N'Bonaire', N'0')
GO
INSERT [dbo].[country] ([geoname_id], [locale_code], [continent_code], [continent_name], [country_iso_code], [country_name], [is_in_european_union]) VALUES (N'7909807', N'es', N'AF', N'"Ãfrica"', N'SS', N'"SudÃ¡n del Sur"', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.0.', N'2077456', N'2077456', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.0.1.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.0.2.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.0.4.0', N'2077456', N'2077456', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.0.8.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.0.16.0', N'1861060', N'1861060', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.0.32.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.0.64.0', N'1861060', N'1861060', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.0.128.0', N'1605651', N'1605651', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.1.0.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.1.1.0', N'2077456', N'2077456', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.1.2.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.1.4.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.1.8.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.1.16.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.1.32.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.1.64.0', N'1861060', N'1861060', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.1.128.0', N'1605651', N'1605651', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.2.0.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.2.2.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.2.3.0', N'2077456', N'2077456', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.2.4.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.2.8.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.2.9.0', N'2017370', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.2.10.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.2.12.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.2.16.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.2.32.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.2.64.0', N'1814991', N'1814991', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.2.128.0', N'1605651', N'1605651', N'', N'0', N'0')
GO
INSERT [dbo].[ip] ([network], [geoname_id], [registered_country_geoname_id], [represented_country_geoname_id], [is_anonymous_proxy], [is_satellite_provider]) VALUES (N'1.3.0.0', N'1814991', N'1814991', N'', N'0', N'0')
GO

/****** Object:  StoredProcedure [dbo].[sp_countrygeo]    Script Date: 24/05/2022 06:36:41 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE procedure [dbo].[sp_countrygeo]
@ips varchar(1000)
as
DECLARE @SQL VARCHAR(MAX);
--SET @ips = replace(@ips,'"','''')
-- SET @ips = REPLACE(@ips, ',', '","')
SET @ips = REPLACE(@ips, ',', ''',''')
SET @SQL = ' select * from vcountrygeo where network in (' +'''' + @ips + '''' +')'
print @SQL
EXECUTE (@SQL);

GO
USE [master]
GO
ALTER DATABASE [maxmind] SET  READ_WRITE 
GO
