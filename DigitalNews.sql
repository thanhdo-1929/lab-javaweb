USE [master]
GO
/****** Object:  Database [DigitalNews]    Script Date: 6/9/2021 9:56:04 AM ******/
CREATE DATABASE [DigitalNews]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DigitalNews', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DigitalNews.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DigitalNews_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\DigitalNews_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DigitalNews] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DigitalNews].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DigitalNews] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DigitalNews] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DigitalNews] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DigitalNews] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DigitalNews] SET ARITHABORT OFF 
GO
ALTER DATABASE [DigitalNews] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DigitalNews] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DigitalNews] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DigitalNews] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DigitalNews] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DigitalNews] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DigitalNews] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DigitalNews] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DigitalNews] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DigitalNews] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DigitalNews] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DigitalNews] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DigitalNews] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DigitalNews] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DigitalNews] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DigitalNews] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DigitalNews] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DigitalNews] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DigitalNews] SET  MULTI_USER 
GO
ALTER DATABASE [DigitalNews] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DigitalNews] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DigitalNews] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DigitalNews] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DigitalNews] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DigitalNews] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DigitalNews] SET QUERY_STORE = OFF
GO
USE [DigitalNews]
GO
/****** Object:  Table [dbo].[Article]    Script Date: 6/9/2021 9:56:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Article](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](max) NULL,
	[content] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[image] [nvarchar](max) NULL,
	[time] [datetime] NULL,
	[author] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Article] ON 
GO
INSERT [dbo].[Article] ([id], [title], [content], [description], [image], [time], [author]) VALUES (1, N'Lorem Ipsum
', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id nulla neque. Phasellus ullamcorper erat id nisi aliquet, et egestas orci lacinia. Proin id enim non lectus dignissim ornare id sed orci. Curabitur nisl dui, varius et neque et, lacinia suscipit mauris. Aliquam vitae leo molestie, condimentum tortor in, congue lorem. Proin finibus libero vel nulla porta, et volutpat ligula rhoncus. Vivamus aliquet accumsan scelerisque. Integer et diam vel nisl fermentum finibus. In ultrices nunc non augue venenatis condimentum. Ut tristique tortor sed diam efficitur, nec fringilla sem laoreet. Duis lacus velit, lobortis non tortor sed, semper scelerisque mauris. Mauris vitae posuere ligula, a hendrerit enim. Aliquam tristique nisl ac est interdum, vel fermentum turpis pretium.
<br /><br />
Quisque mollis mauris est, et imperdiet arcu ullamcorper faucibus. Etiam euismod nibh at lobortis facilisis. Donec efficitur commodo elit, at pellentesque neque porttitor et. Sed iaculis lectus in leo faucibus, ut commodo turpis ultrices. Sed pharetra sapien at velit condimentum blandit. Etiam tincidunt mauris ut diam faucibus, vestibulum accumsan massa tempor. Nulla bibendum nulla ut lacus sodales feugiat. Cras sit amet ultrices arcu. Duis eu euismod purus, ac volutpat ante. Phasellus ac arcu a odio mattis tincidunt at vitae arcu. Fusce dictum magna at eros dignissim, pharetra mattis erat ultrices. Nunc et massa ac quam venenatis congue nec eu magna. Vestibulum libero risus, cursus at elementum vel, luctus sed erat. Nam a mauris vehicula, sollicitudin quam eu, feugiat ante. Ut eget porttitor felis. Etiam justo tortor, venenatis a commodo nec, vehicula et ipsum.', N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In id nulla neque. Phasellus ullamcorper erat id nisi aliquet, et egestas orci lacinia. Proin id enim non lectus dignissim ornare id sed orci. Curabitur nisl dui, varius et neque et, lacinia suscipit mauris. Aliquam vitae leo molestie, condimentum tortor in, congue lorem. Proin finibus libero vel nulla porta, et volutpat ligula rhoncus. Vivamus aliquet accumsan scelerisque. Integer et diam vel nisl fermentum finibus.', N'i1.jpg', CAST(N'2021-05-17T10:35:48.937' AS DateTime), N'Canh Nam')
GO
INSERT [dbo].[Article] ([id], [title], [content], [description], [image], [time], [author]) VALUES (2, N'Why do we use it?
', N'Maecenas elit enim, vehicula a magna non, tincidunt mollis ligula. Donec eget risus posuere, dignissim mauris quis, interdum ante. Ut sapien mi, posuere a diam a, viverra sodales massa. Etiam euismod ligula eget interdum eleifend. Nunc sem ipsum, accumsan fringilla sapien id, porta maximus mauris. Fusce vulputate scelerisque massa. Mauris fermentum risus risus, id porttitor sapien tincidunt ac. Pellentesque pharetra mi eget lobortis sagittis. Suspendisse massa metus, feugiat venenatis tincidunt non, maximus vitae sapien. Aenean at pharetra tellus.
<br /><br />
Cras pharetra odio magna, sed ullamcorper nibh tempus sit amet. Nulla eu malesuada nulla, at tincidunt diam. Sed ultricies facilisis nibh ut laoreet. Ut id erat ipsum. Maecenas risus risus, auctor vel consequat ac, euismod fringilla velit. Duis facilisis, nibh vitae eleifend rhoncus, tellus diam semper elit, sit amet interdum nunc ex ut justo. Praesent pharetra lacus nec porta blandit. Aenean congue nisl id velit ornare porttitor. Nullam ac quam sed elit mattis iaculis. Sed posuere auctor quam, ut suscipit sapien gravida a. Donec finibus leo ut nisi posuere, eget faucibus quam bibendum. Donec et ex quis erat porttitor laoreet eu in tortor. Aliquam id pellentesque nulla. Nulla ipsum quam, tristique ac commodo vel, volutpat ac est. Etiam sit amet diam nunc. Aenean sed mi est.
<br /><br />
Donec a semper neque. Nunc ullamcorper, odio fringilla tincidunt dapibus, enim velit mattis ligula, et rutrum lacus mauris consectetur est. Nulla facilisi. Quisque convallis ut mi id mattis. Mauris congue libero non mi fringilla, quis faucibus ex eleifend. Nam id felis finibus, auctor magna quis, efficitur mi. Pellentesque vel ex quam. Nunc tincidunt ligula vel placerat mattis. Maecenas id consequat arcu, quis lobortis quam. Cras eget consectetur arcu, eget venenatis dolor. In at elementum est, et scelerisque magna. Sed vehicula sem felis, id finibus augue vulputate sed. Nulla tempus ex quis lorem scelerisque, eget ultricies ligula blandit.', N'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using ''Content here, content here'', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for ''lorem ipsum'' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).', N'i1.jpg', CAST(N'2021-05-17T11:35:48.937' AS DateTime), N'Canh Nam')
GO
INSERT [dbo].[Article] ([id], [title], [content], [description], [image], [time], [author]) VALUES (3, N'Where can I get some?
', N'Aliquam orci nibh, iaculis in lacus dictum, accumsan volutpat orci. Maecenas in dui est. Nulla ex lorem, suscipit at viverra pharetra, fermentum non ligula. Etiam vel lacus vitae lorem dignissim vestibulum. In urna est, consequat eget lectus eget, vulputate imperdiet nibh. Ut vel fermentum odio. Donec porttitor ullamcorper turpis, ac posuere nisl tempor non. Nunc eu ligula pulvinar, hendrerit sem id, bibendum tortor. Maecenas nec finibus nisi. Praesent mollis augue vel cursus consequat. Curabitur pulvinar elit at tincidunt cursus. Nunc congue erat eros, quis hendrerit orci euismod vel.
<br /><br />
Aenean interdum ultrices nulla, ornare volutpat orci suscipit tincidunt. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed volutpat dolor vel est hendrerit tristique non eu nisi. Vivamus sit amet odio vehicula, imperdiet leo sit amet, venenatis quam. Maecenas sed odio nec orci pretium sodales. Phasellus eu imperdiet tellus. Etiam non sem id leo fermentum pulvinar. Nulla vehicula lacus non varius fringilla. Cras mi erat, porttitor nec accumsan at, fermentum et sem. Nulla id efficitur est. Quisque vel velit a turpis egestas egestas. Vivamus rhoncus neque sit amet neque laoreet vulputate. Aliquam vitae erat non eros ultrices blandit. Nam ac arcu vitae sapien mattis blandit.
<br /><br />
Praesent congue ipsum lorem, porta vehicula est consectetur at. Donec vestibulum scelerisque mi ut sagittis. Quisque ut erat eu dui commodo facilisis. Pellentesque vulputate nibh sed dictum dapibus. Integer tempor sodales pulvinar. Vivamus eu mauris egestas, ullamcorper elit consequat, bibendum augue. Suspendisse tempus, arcu nec maximus rutrum, tortor tortor volutpat orci, semper egestas nulla orci id nulla.', N'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.

', N'i1.jpg', CAST(N'2021-05-17T12:35:48.937' AS DateTime), N'Canh Nam')
GO
INSERT [dbo].[Article] ([id], [title], [content], [description], [image], [time], [author]) VALUES (4, N'Where does it come from?
', N'Aliquam orci nibh, iaculis in lacus dictum, accumsan volutpat orci. Maecenas in dui est. Nulla ex lorem, suscipit at viverra pharetra, fermentum non ligula. Etiam vel lacus vitae lorem dignissim vestibulum. In urna est, consequat eget lectus eget, vulputate imperdiet nibh. Ut vel fermentum odio. Donec porttitor ullamcorper turpis, ac posuere nisl tempor non. Nunc eu ligula pulvinar, hendrerit sem id, bibendum tortor. Maecenas nec finibus nisi. Praesent mollis augue vel cursus consequat. Curabitur pulvinar elit at tincidunt cursus. Nunc congue erat eros, quis hendrerit orci euismod vel.
<br /><br />
Aenean interdum ultrices nulla, ornare volutpat orci suscipit tincidunt. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Sed volutpat dolor vel est hendrerit tristique non eu nisi. Vivamus sit amet odio vehicula, imperdiet leo sit amet, venenatis quam. Maecenas sed odio nec orci pretium sodales. Phasellus eu imperdiet tellus. Etiam non sem id leo fermentum pulvinar. Nulla vehicula lacus non varius fringilla. Cras mi erat, porttitor nec accumsan at, fermentum et sem. Nulla id efficitur est. Quisque vel velit a turpis egestas egestas. Vivamus rhoncus neque sit amet neque laoreet vulputate. Aliquam vitae erat non eros ultrices blandit. Nam ac arcu vitae sapien mattis blandit.
<br /><br />
Praesent congue ipsum lorem, porta vehicula est consectetur at. Donec vestibulum scelerisque mi ut sagittis. Quisque ut erat eu dui commodo facilisis. Pellentesque vulputate nibh sed dictum dapibus. Integer tempor sodales pulvinar. Vivamus eu mauris egestas, ullamcorper elit consequat, bibendum augue. Suspendisse tempus, arcu nec maximus rutrum, tortor tortor volutpat orci, semper egestas nulla orci id nulla.', N'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don''t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn''t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.

', N'i1.jpg', CAST(N'2021-05-17T13:35:48.937' AS DateTime), N'Canh Nam')
GO
INSERT [dbo].[Article] ([id], [title], [content], [description], [image], [time], [author]) VALUES (5, N'What is Lorem Ipsum?
', N'Nunc dui neque, dignissim eu enim non, ultrices maximus felis. Nam ut nunc auctor, imperdiet elit a, gravida leo. Phasellus vulputate eu libero at sodales. Fusce ultrices, lacus quis vehicula auctor, ante ante bibendum ex, non molestie leo mi quis dui. Ut blandit diam aliquet nunc aliquet, sed varius diam ultrices. Nulla faucibus vestibulum mollis. Pellentesque imperdiet, odio vitae aliquet dictum, libero lectus aliquet sem, in aliquet ligula nunc sit amet erat. Nullam dignissim mi eget ultricies finibus. In hac habitasse platea dictumst. Nullam ullamcorper dui vitae arcu gravida ultricies. Nullam egestas est vitae tellus ornare vehicula. Vestibulum id congue nisi. Praesent at facilisis dui. Sed congue maximus mauris, vitae gravida velit gravida id. Donec vel sem fermentum, mollis erat et, faucibus lorem. Aenean lobortis augue vel lacus iaculis fermentum.
<br /><br />
Ut faucibus imperdiet massa, nec eleifend mauris pellentesque vitae. In lacinia commodo velit vel aliquam. Maecenas commodo massa at finibus lobortis. Praesent commodo, enim eget gravida condimentum, elit eros tempor lectus, quis rutrum ante lectus non ex. Suspendisse rhoncus dui in imperdiet sagittis. Duis eu sapien quis nunc auctor pellentesque. Nullam tristique ultrices nulla. Nam sit amet malesuada elit, sed molestie elit. Phasellus tristique ac augue nec vestibulum. Cras sagittis eleifend purus, vel auctor ex auctor a. Sed mollis massa vel egestas cursus. Proin dictum ultrices ligula, at tempor velit posuere tincidunt. Cras maximus ultrices pharetra. Maecenas eu placerat lorem. Etiam mauris tellus, maximus eu sapien eu, lobortis tincidunt erat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.', N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

', N'i1.jpg', CAST(N'2021-05-17T14:35:48.937' AS DateTime), N'Canh Nam')
GO
INSERT [dbo].[Article] ([id], [title], [content], [description], [image], [time], [author]) VALUES (6, N'A particular item or object', N'Nunc dui neque, dignissim eu enim non, ultrices maximus felis. Nam ut nunc auctor, imperdiet elit a, gravida leo. Phasellus vulputate eu libero at sodales. Fusce ultrices, lacus quis vehicula auctor, ante ante bibendum ex, non molestie leo mi quis dui. Ut blandit diam aliquet nunc aliquet, sed varius diam ultrices. Nulla faucibus vestibulum mollis. Pellentesque imperdiet, odio vitae aliquet dictum, libero lectus aliquet sem, in aliquet ligula nunc sit amet erat. Nullam dignissim mi eget ultricies finibus. In hac habitasse platea dictumst. Nullam ullamcorper dui vitae arcu gravida ultricies. Nullam egestas est vitae tellus ornare vehicula. Vestibulum id congue nisi. Praesent at facilisis dui. Sed congue maximus mauris, vitae gravida velit gravida id. Donec vel sem fermentum, mollis erat et, faucibus lorem. Aenean lobortis augue vel lacus iaculis fermentum.
<br /><br />
Ut faucibus imperdiet massa, nec eleifend mauris pellentesque vitae. In lacinia commodo velit vel aliquam. Maecenas commodo massa at finibus lobortis. Praesent commodo, enim eget gravida condimentum, elit eros tempor lectus, quis rutrum ante lectus non ex. Suspendisse rhoncus dui in imperdiet sagittis. Duis eu sapien quis nunc auctor pellentesque. Nullam tristique ultrices nulla. Nam sit amet malesuada elit, sed molestie elit. Phasellus tristique ac augue nec vestibulum. Cras sagittis eleifend purus, vel auctor ex auctor a. Sed mollis massa vel egestas cursus. Proin dictum ultrices ligula, at tempor velit posuere tincidunt. Cras maximus ultrices pharetra. Maecenas eu placerat lorem. Etiam mauris tellus, maximus eu sapien eu, lobortis tincidunt erat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.', N'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.

', N'i1.jpg', CAST(N'2021-05-17T15:35:48.937' AS DateTime), N'Canh Nam')
GO
SET IDENTITY_INSERT [dbo].[Article] OFF
GO
USE [master]
GO
ALTER DATABASE [DigitalNews] SET  READ_WRITE 
GO
