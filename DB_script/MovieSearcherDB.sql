USE [master]
GO
/****** Object:  Database [MovieSearcherDB]    Script Date: 02.08.2022 20:43:17 ******/
CREATE DATABASE [MovieSearcherDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieSearcherDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MovieSearcherDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieSearcherDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MovieSearcherDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MovieSearcherDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieSearcherDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieSearcherDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieSearcherDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieSearcherDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MovieSearcherDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieSearcherDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieSearcherDB] SET  MULTI_USER 
GO
ALTER DATABASE [MovieSearcherDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieSearcherDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieSearcherDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieSearcherDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieSearcherDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MovieSearcherDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MovieSearcherDB] SET QUERY_STORE = OFF
GO
USE [MovieSearcherDB]
GO
/****** Object:  Table [dbo].[ActorMovieLink]    Script Date: 02.08.2022 20:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActorMovieLink](
	[MovieId] [int] NOT NULL,
	[ActorId] [int] NOT NULL,
 CONSTRAINT [PK_ActorMovieLink] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC,
	[ActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 02.08.2022 20:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[BirthDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 02.08.2022 20:43:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Year] [int] NOT NULL,
	[Genre] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (1, 1)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (2, 1)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (7, 1)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (2, 2)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (3, 2)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (3, 3)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (4, 3)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (4, 4)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (5, 4)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (5, 5)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (6, 5)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (7, 6)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (8, 6)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (8, 7)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (9, 7)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (9, 8)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (10, 8)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (10, 9)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (11, 9)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (10, 10)
INSERT [dbo].[ActorMovieLink] ([MovieId], [ActorId]) VALUES (11, 10)
GO
SET IDENTITY_INSERT [dbo].[Actors] ON 

INSERT [dbo].[Actors] ([Id], [Name], [BirthDate]) VALUES (1, N'Rami Malek', CAST(N'1981-05-12T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Actors] ([Id], [Name], [BirthDate]) VALUES (2, N'Margot Robbie', CAST(N'1990-07-02T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Actors] ([Id], [Name], [BirthDate]) VALUES (3, N'Simon Pegg', CAST(N'1970-02-14T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Actors] ([Id], [Name], [BirthDate]) VALUES (4, N'Vladimir Mashkov', CAST(N'1963-11-27T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Actors] ([Id], [Name], [BirthDate]) VALUES (5, N'Vladimir Epifantsev', CAST(N'1970-09-08T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Actors] ([Id], [Name], [BirthDate]) VALUES (6, N'Tom Holland', CAST(N'1996-06-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Actors] ([Id], [Name], [BirthDate]) VALUES (7, N'Jeff Wahlberg', CAST(N'1996-07-17T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Actors] ([Id], [Name], [BirthDate]) VALUES (8, N'James Franco', CAST(N'1978-04-19T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Actors] ([Id], [Name], [BirthDate]) VALUES (9, N'Greg Sestero', CAST(N'1978-07-15T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Actors] ([Id], [Name], [BirthDate]) VALUES (10, N'Tommy Wiseau', CAST(N'1955-11-03T00:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Actors] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

INSERT [dbo].[Movies] ([Id], [Title], [Year], [Genre], [Description]) VALUES (1, N'Bohemian Rhapsody', 2018, N'drama', N'The story of the legendary British rock band Queen and lead singer Freddie Mercury, leading up to their famous performance at Музыкальный фестиваль Live Aid (1985).')
INSERT [dbo].[Movies] ([Id], [Title], [Year], [Genre], [Description]) VALUES (2, N'Amsterdam', 2022, N'drama', N'Set in the ''30s, it follows three friends who witness a murder, become suspects themselves, and uncover one of the most outrageous plots in American history.')
INSERT [dbo].[Movies] ([Id], [Title], [Year], [Genre], [Description]) VALUES (3, N'Terminal', 2018, N'crime', N'A film noir taking place in a train terminal at night. Add 2 male assassins, female assassin, waitress, teacher, janitor and crime boss. Add revenge. Who says mystery is a lost art?')
INSERT [dbo].[Movies] ([Id], [Title], [Year], [Genre], [Description]) VALUES (4, N'Mission: Impossible - Ghost Protocol', 2011, N'action', N'The IMF is shut down when it''s implicated in the bombing of the Kremlin, causing Ethan Hunt and his new team to go rogue to clear their organization''s name.')
INSERT [dbo].[Movies] ([Id], [Title], [Year], [Genre], [Description]) VALUES (5, N'The State Counsellor', 2005, N'detective', N'A revolutionary organisation is planning to assassinate the Governor of Moscow as the first step to overthrowing the Tsarist state. Detective Erast Fandorin attempts to counter them, but his efforts are hindered by his dealings with Prince Pozharsky')
INSERT [dbo].[Movies] ([Id], [Title], [Year], [Genre], [Description]) VALUES (6, N'The Green Elephant', 1999, N'horor', N'Two men (both being junior officers in the Soviet Army in 1986), nicknamed "Bratishka" (Brother) and "Poekhavshiy" (Nutcase), are being held in a penal military prison.')
INSERT [dbo].[Movies] ([Id], [Title], [Year], [Genre], [Description]) VALUES (7, N'Dolittle', 2021, N'adventure', N'A physician who can talk to animals embarks on an adventure to find a legendary island with a young apprentice and a crew of strange pets.')
INSERT [dbo].[Movies] ([Id], [Title], [Year], [Genre], [Description]) VALUES (8, N'Cherry', 2021, N'crime', N'Cherry drifts from college dropout to army medic in Iraq - anchored only by his true love, Emily. But after returning from the war with PTSD, his life spirals into drugs and crime as he struggles to find his place in the world.')
INSERT [dbo].[Movies] ([Id], [Title], [Year], [Genre], [Description]) VALUES (9, N'Future World', 2018, N'adventure', N'A young boy searches a future world wasteland for a rumored cure for his dying mother.')
INSERT [dbo].[Movies] ([Id], [Title], [Year], [Genre], [Description]) VALUES (10, N'The Disaster Artist', 2017, N'comedy', N'When Greg Sestero, an aspiring film actor, meets the weird and mysterious Tommy Wiseau in an acting class, they form a unique friendship and travel to Hollywood to make their dreams come true.')
INSERT [dbo].[Movies] ([Id], [Title], [Year], [Genre], [Description]) VALUES (11, N'The Room', 2003, N'drama', N'Johnny is a successful bank executive who lives quietly in a San Francisco townhouse with his fiancee, Lisa. One day, putting aside any scruple, she seduces Johnny''s best friend, Mark. From there, nothing will be the same again.')
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
/****** Object:  Index [IX_ActorMovieLink_ActorId]    Script Date: 02.08.2022 20:43:17 ******/
CREATE NONCLUSTERED INDEX [IX_ActorMovieLink_ActorId] ON [dbo].[ActorMovieLink]
(
	[ActorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActorMovieLink]  WITH CHECK ADD  CONSTRAINT [FK_ActorMovieLink_Actors_ActorId] FOREIGN KEY([ActorId])
REFERENCES [dbo].[Actors] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActorMovieLink] CHECK CONSTRAINT [FK_ActorMovieLink_Actors_ActorId]
GO
ALTER TABLE [dbo].[ActorMovieLink]  WITH CHECK ADD  CONSTRAINT [FK_ActorMovieLink_Movies_MovieId] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movies] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ActorMovieLink] CHECK CONSTRAINT [FK_ActorMovieLink_Movies_MovieId]
GO
USE [master]
GO
ALTER DATABASE [MovieSearcherDB] SET  READ_WRITE 
GO
