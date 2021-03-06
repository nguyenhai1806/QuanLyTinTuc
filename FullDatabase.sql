USE [master]
GO
/****** Object:  Database [QLTinTuc]    Script Date: 12/10/2021 10:15:55 PM ******/
CREATE DATABASE [QLTinTuc]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QLTinTuc', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLTinTuc.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QLTinTuc_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QLTinTuc_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QLTinTuc] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLTinTuc].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLTinTuc] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLTinTuc] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLTinTuc] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLTinTuc] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLTinTuc] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLTinTuc] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLTinTuc] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLTinTuc] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLTinTuc] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLTinTuc] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLTinTuc] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLTinTuc] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLTinTuc] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLTinTuc] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLTinTuc] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QLTinTuc] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLTinTuc] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLTinTuc] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLTinTuc] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLTinTuc] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLTinTuc] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLTinTuc] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLTinTuc] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLTinTuc] SET  MULTI_USER 
GO
ALTER DATABASE [QLTinTuc] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLTinTuc] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLTinTuc] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLTinTuc] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QLTinTuc] SET DELAYED_DURABILITY = DISABLED 
GO
USE [QLTinTuc]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 12/10/2021 10:15:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[MaAccount] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[TenHienThi] [nvarchar](100) NULL,
	[MatKhau] [nvarchar](100) NOT NULL,
	[TrangThai] [bit] NULL DEFAULT ((1)),
	[Admin] [bit] NULL DEFAULT ((0)),
PRIMARY KEY CLUSTERED 
(
	[MaAccount] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 12/10/2021 10:15:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BinhLuan](
	[MaBinhLuan] [int] IDENTITY(1,1) NOT NULL,
	[ThoiGian] [datetime] NULL,
	[Noidung] [nvarchar](max) NULL,
	[HoTen] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NULL,
	[TrangThai] [int] NULL,
	[MaTinTuc] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaBinhLuan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChuDe]    Script Date: 12/10/2021 10:15:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChuDe](
	[MaChuDe] [int] IDENTITY(1,1) NOT NULL,
	[TenChuDe] [nvarchar](50) NOT NULL,
	[TrangThai] [bit] NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[MaChuDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TinTuc]    Script Date: 12/10/2021 10:15:55 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinTuc](
	[MaTinTuc] [int] IDENTITY(1,1) NOT NULL,
	[TieuDe] [nvarchar](100) NOT NULL,
	[HinhDaiDien] [nvarchar](max) NULL,
	[NoiDung] [nvarchar](max) NULL,
	[Ngay] [date] NULL DEFAULT (getdate()),
	[SoLanXem] [int] NULL DEFAULT ((0)),
	[TrangThai] [bit] NULL DEFAULT ((1)),
	[MaChuDe] [int] NOT NULL,
	[MaAccount] [int] NOT NULL DEFAULT ((1)),
PRIMARY KEY CLUSTERED 
(
	[MaTinTuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([MaAccount], [Email], [TenHienThi], [MatKhau], [TrangThai], [Admin]) VALUES (1, N'nguyenhai86.it@gmail.com', N'admin', N'1234', 1, 1)
INSERT [dbo].[Account] ([MaAccount], [Email], [TenHienThi], [MatKhau], [TrangThai], [Admin]) VALUES (2, N'user1@gmail.com', N'user1', N'User123', 1, 0)
INSERT [dbo].[Account] ([MaAccount], [Email], [TenHienThi], [MatKhau], [TrangThai], [Admin]) VALUES (3, N'user2@gmail.com', N'user2', N'User123', 1, 0)
INSERT [dbo].[Account] ([MaAccount], [Email], [TenHienThi], [MatKhau], [TrangThai], [Admin]) VALUES (4, N'user3@gmail.com', N'user3', N'User123', 1, 0)
INSERT [dbo].[Account] ([MaAccount], [Email], [TenHienThi], [MatKhau], [TrangThai], [Admin]) VALUES (5, N'custom1@gmail.com', N'custom1', N'1234', 1, 0)
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[ChuDe] ON 

INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe], [TrangThai]) VALUES (1, N'Thời sự', 1)
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe], [TrangThai]) VALUES (2, N'Thế giới', 1)
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe], [TrangThai]) VALUES (3, N'Kinh doanh', 1)
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe], [TrangThai]) VALUES (4, N'Giai trí', 1)
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe], [TrangThai]) VALUES (5, N'Thể thao', 1)
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe], [TrangThai]) VALUES (6, N'Pháp luật', 1)
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe], [TrangThai]) VALUES (7, N'Giao dục', 1)
INSERT [dbo].[ChuDe] ([MaChuDe], [TenChuDe], [TrangThai]) VALUES (8, N'Sức khoẻ', 1)
SET IDENTITY_INSERT [dbo].[ChuDe] OFF
SET IDENTITY_INSERT [dbo].[TinTuc] ON 

INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (4, N'Vì sao Ronaldo đá phạt đền trước Arsenal?', N'4.jpg', N'<p style="text-align: justify;">ANHBruno Fernandes, v&igrave; đ&aacute; hỏng quả phạt đền gần nhất, nhường lại quyền thực hiện cho đ&agrave;n anh Cristiano Ronaldo trong trận Man Utd hạ Arsenal 3-2 h&ocirc;m 2/12.</p>
<article>
<p style="text-align: justify;">"Ch&uacute;ng t&ocirc;i chưa trao đổi về người sẽ đ&aacute; phạt đền. T&ocirc;i đ&aacute; hỏng quả penalty gần nhất, n&ecirc;n t&ocirc;i tin tưởng Ronaldo như tin tưởng ch&iacute;nh bản th&acirc;n. Đ&acirc;y l&agrave; l&uacute;c để Ronaldo s&uacute;t phạt đền, v&igrave; t&ocirc;i hỏng ăn c&uacute; gần nhất. Kh&ocirc;ng quan trọng ai l&agrave; người thực hiện",&nbsp;<a href="https://vnexpress.net/chu-de/bruno-fernandes-1253" rel="dofollow">Fernandes</a>&nbsp;n&oacute;i với&nbsp;<em>BBC Sport</em>&nbsp;sau&nbsp;<a href="https://vnexpress.net/ronaldo-giup-man-utd-thang-nguoc-arsenal-4397799.html" rel="dofollow">trận thắng</a>&nbsp;tại Old Trafford.</p>
<p style="text-align: justify;">Trước khi Ronaldo trở lại h&egrave; 2021, Fernandes lu&ocirc;n l&atilde;nh tr&aacute;ch nhiệm đ&aacute; 11m cho Man Utd. Tiền vệ 27 tuổi đ&atilde; đ&aacute; 23 quả phạt đền cho Man Utd t&iacute;nh tr&ecirc;n mọi đấu trường, v&agrave; hỏng ăn chỉ hai lần, ở trận thua Aston Villa 0-1 h&ocirc;m 25/9, v&agrave; trận gặp Newcastle m&ugrave;a trước.</p>
<p style="text-align: justify;"><img src="https://i1-thethao.vnecdn.net/2021/12/04/0-Premier-League-Manchester-Un-3549-2722-1638574424.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=_5ul3LbNmzDX95kCZa4HTA" alt="Cả Fernandes v&agrave; Ronaldo đều vui v&igrave; c&ugrave;ng ghi b&agrave;n gi&uacute;p Man Utd hạ Arsenal h&ocirc;m 2/12. Ảnh: Reuters" data-src="https://i1-thethao.vnecdn.net/2021/12/04/0-Premier-League-Manchester-Un-3549-2722-1638574424.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=_5ul3LbNmzDX95kCZa4HTA" data-ll-status="loaded" /></p>
<figure style="text-align: justify;" data-size="true">
<figcaption>
<p>Ronaldo chung vui với đồng đội sau khi ghi b&agrave;n thứ hai gi&uacute;p Man Utd hạ Arsenal h&ocirc;m 2/12. Ảnh:&nbsp;<em>Reuters</em></p>
</figcaption>
</figure>
<p style="text-align: justify;">Tại Old Trafford h&ocirc;m 2/12,&nbsp;<a href="https://vnexpress.net/the-thao/du-lieu-bong-da/doi-bong/arsenal-42" rel="dofollow">Arsenal</a>&nbsp;mở tỷ số từ ph&uacute;t 13, khi Emile Smith Rowe chớp thời cơ thủ th&agrave;nh David De Gea nằm s&acirc;n để&nbsp;<a href="https://vnexpress.net/ban-mo-ty-so-hy-huu-cua-arsenal-4397846.html" rel="dofollow">ghi b&agrave;n</a>&nbsp;bằng c&uacute; v&ocirc;-l&ecirc; từ ngo&agrave;i cấm địa. Trước khi hiệp một kh&eacute;p lại, Fred nhả ngược để Fernandes s&uacute;t cận th&agrave;nh qu&acirc;n b&igrave;nh tỷ số.</p>
<p style="text-align: justify;">Đầu hiệp hai, Ronaldo đưa chủ nh&agrave; vượt l&ecirc;n dẫn trước nhờ c&uacute; đặt l&ograve;ng v&agrave;o g&oacute;c xa. Sau khi Martin Odegaard gỡ h&ograve;a cho Arsenal, CR7 tiếp tục nổ s&uacute;ng với c&uacute; đ&aacute; phạt đền th&agrave;nh b&agrave;n ấn định thắng lợi 3-2 cho "Quỷ Đỏ". Đ&acirc;y lần lượt l&agrave; c&aacute;c b&agrave;n thứ&nbsp;<a href="https://vnexpress.net/bong-da/ronaldo-vuot-moc-800-ban-4397803.html" rel="dofollow">800 v&agrave; 801</a>&nbsp;trong sự nghiệp của Ronaldo.</p>
<p style="text-align: justify;">Khi được hỏi về m&agrave;n tr&igrave;nh diễn của đồng đội đ&agrave;n anh, Fernandes n&oacute;i: "Thật đ&aacute;ng kinh ngạc. Ch&uacute;ng ta đều biết Ronaldo lu&ocirc;n cải thiện qua từng trận, từng năm một. Ronaldo muốn tiếp tục l&agrave;m người giỏi nhất v&agrave; anh ấy nỗ lực từng ng&agrave;y để l&agrave;m điều đ&oacute;. Ronaldo biết c&aacute;ch tự tạo động lực cho bản th&acirc;n".</p>
<p style="text-align: justify;">Tiền vệ Bồ Đ&agrave;o Nha cũng h&agrave;o hứng khi Man Utd bổ nhiệm&nbsp;<a href="https://vnexpress.net/chu-de/ralf-rangnick-3840" rel="dofollow">Ralf Rangnick</a>&nbsp;l&agrave;m HLV tạm quyền đến m&ugrave;a hết m&ugrave;a. Anh n&oacute;i: "B&acirc;y giờ l&agrave; một khởi đầu mới, một chương mới. To&agrave;n đội đều mong muốn được sớm l&agrave;m việc với Rangnick. HLV mới sẽ mang th&ecirc;m nhiều cơ hội mới. Tất cả đều c&oacute; cơ hội để thể hiện bản th&acirc;n. Ai cũng phải nỗ lực, tập luyện chăm chỉ nếu muốn gi&agrave;nh suất đ&aacute; ch&iacute;nh. Ch&uacute;ng t&ocirc;i sẽ gặp Rangnick v&agrave;o ng&agrave;y mai v&agrave; bắt tay v&agrave;o chuẩn bị trận đấu tiếp theo".</p>
<p style="text-align: justify;">Quyền HLV Michael Carrick th&ocirc;ng b&aacute;o từ chức HLV đội một v&agrave;&nbsp;<a href="https://vnexpress.net/bong-da/carrick-roi-man-utd-4397798.html" rel="dofollow">chia tay Man Utd</a>, ngay sau trận thắng Arsenal. "Carrick c&oacute; thể trở th&agrave;nh một HLV h&agrave;ng đầu trong tương lai nếu c&oacute; cơ hội. Carrick biết c&aacute;ch giao tiếp với cầu thủ, v&agrave; rất am hiểu b&oacute;ng đ&aacute;", Fernandes nhắn nhủ cựu tiền vệ người Anh.</p>
<p style="text-align: justify;">Trong 12 năm gắn b&oacute; với tư c&aacute;ch cầu thủ, Carrick đ&aacute; 464 trận, ghi 24 b&agrave;n v&agrave; c&ugrave;ng Man Utd đoạt 17 danh hiệu, trong đ&oacute; c&oacute; s&aacute;u Ngoại hạng Anh, một Champions League v&agrave; một Europa League. Sau khi giải nghệ, Carrick tham gia ban huấn luyện Man Utd v&agrave; được giao một ch&acirc;n trợ l&yacute;, phụ tr&aacute;ch đội một dưới thời HLV trưởng Jose Mourinho, rồi tiếp tục cộng t&aacute;c với Ole Gunnar Solskjaer.</p>
<p style="text-align: justify;">Ở v&ograve;ng 15 Ngoại hạng Anh cuối tuần n&agrave;y, Man Utd tiếp tục ở lại Old Trafford tiếp Crystal Palace ng&agrave;y 5/12.</p>
</article>', CAST(N'2021-12-04' AS Date), 13, 1, 5, 1)
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (5, N'Hành trình giải cứu "cô dâu 9 tuổi" Afghanistan', N'5.jpg', N'<p>Tr&ecirc;n chuyến xe rời khu trại tị nạn ở ph&iacute;a t&acirc;y bắc Afghanistan, người mẹ trẻ Reza Gul đang gh&igrave; chặt 6 đứa con b&eacute; bỏng của m&igrave;nh.</p>
<article>
<p>Chỉ tr&ugrave;m một chiếc chăn để sưởi ấm, Parwana Malik, 9 tuổi, ngồi gọn trong l&ograve;ng mẹ, b&ecirc;n cạnh c&aacute;c anh chị em khi cả gia đ&igrave;nh được giải cứu bởi một nh&oacute;m chuy&ecirc;n gi&uacute;p đỡ c&aacute;c b&eacute; g&aacute;i tho&aacute;t khỏi nạn tảo h&ocirc;n.</p>
<p>"Ch&aacute;u rất hạnh ph&uacute;c", Parwana li&ecirc;n tục b&agrave;y tỏ niềm vui của m&igrave;nh trong suốt h&agrave;nh tr&igrave;nh. "Tổ chức đ&atilde; gi&uacute;p ch&aacute;u tho&aacute;t khỏi chồng ch&aacute;u. &Ocirc;ng ấy gi&agrave; lắm".</p>
<p><img src="https://i1-vnexpress.vnecdn.net/2021/12/03/parwana-malik-8690-1638504638.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=HusXb6rfu0bgPgwJuX6l0g" alt="Parwana Malik, 9 tuổi, khi bị b&aacute;n l&agrave;m c&ocirc; d&acirc;u cho một người đ&agrave;n &ocirc;ng 55 tuổi. Ảnh: CNN." data-src="https://i1-vnexpress.vnecdn.net/2021/12/03/parwana-malik-8690-1638504638.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=HusXb6rfu0bgPgwJuX6l0g" data-ll-status="loaded" /></p>
<figure data-size="true">
<figcaption>
<p>Parwana Malik, 9 tuổi, khi bị b&aacute;n l&agrave;m c&ocirc; d&acirc;u cho một người đ&agrave;n &ocirc;ng 55 tuổi. Ảnh:&nbsp;<em>CNN.</em></p>
</figcaption>
</figure>
<p>Parwana l&agrave; một trong số nhiều b&eacute; g&aacute;i bị cha gả cưới hồi th&aacute;ng trước. V&agrave;o thời điểm đ&oacute;, cha của Parwana, Abdul Malik, cho biết c&ocirc; b&eacute; đ&atilde; kh&oacute;c cả ng&agrave;y lẫn đ&ecirc;m, cầu xin &ocirc;ng đừng b&aacute;n em, n&oacute;i rằng em muốn đến trường học.</p>
<p>Th&ocirc;ng tin đ&atilde; l&agrave;m dấy l&ecirc;n l&agrave;n s&oacute;ng phản đối kịch liệt từ c&ocirc;ng ch&uacute;ng, nhờ đ&oacute; m&agrave; Parwana được trở về với gia đ&igrave;nh.</p>
<p>Tổ chức phi lợi nhuận Too Young to Wed (TYTW - Qu&aacute; trẻ để kết h&ocirc;n), c&oacute; trụ sở tại Mỹ, cũng đ&atilde; tham gia giải cứu c&aacute;c b&eacute; g&aacute;i, đưa anh chị em v&agrave; mẹ của c&aacute;c em đến một ng&ocirc;i nh&agrave; tạm l&aacute;nh an to&agrave;n.</p>
<p>"Đ&acirc;y chỉ l&agrave; giải ph&aacute;p tạm thời", Stephanie Sinclair, người s&aacute;ng lập TYTW, nhấn mạnh. "Những g&igrave; ch&uacute;ng t&ocirc;i đang cố gắng l&agrave;m l&agrave; ngăn c&aacute;c b&eacute; g&aacute;i bị b&aacute;n v&agrave; &eacute;p buộc kết h&ocirc;n".</p>
<p>Nền kinh tế&nbsp;<a href="https://vnexpress.net/chu-de/afghanistan-2324" rel="dofollow">Afghanistan&nbsp;</a>bị tổn thương nghi&ecirc;m trọng kể từ giữa th&aacute;ng 8, sau khi&nbsp;<a href="https://vnexpress.net/chu-de/taliban-3633" rel="dofollow">Taliban&nbsp;</a>l&ecirc;n nắm quyền kiểm so&aacute;t đất nước. H&agrave;ng tỷ USD t&agrave;i sản của ng&acirc;n h&agrave;ng trung ương gửi ở nước ngo&agrave;i đ&atilde; bị đ&oacute;ng băng, c&aacute;c ng&acirc;n h&agrave;ng đang cạn kiệt tiền mặt v&agrave; người lao động kh&ocirc;ng được nhận lương trong nhiều th&aacute;ng qua.</p>
<p>C&aacute;c cơ quan viện trợ v&agrave; nh&oacute;m nh&acirc;n quyền, trong đ&oacute; c&oacute; Tổ chức Gi&aacute;m s&aacute;t Nh&acirc;n quyền (HRW), cảnh b&aacute;o những người d&acirc;n ngh&egrave;o nhất đất nước sẽ phải đối mặt với nạn đ&oacute;i khi m&ugrave;a đ&ocirc;ng lạnh gi&aacute; ập đến.</p>
<p>Theo một b&aacute;o c&aacute;o gần đ&acirc;y của IPC, tổ chức chuy&ecirc;n đ&aacute;nh gi&aacute; t&igrave;nh trạng mất an ninh lương thực, tới th&aacute;ng 3/2022, hơn một nửa trong khoảng 39 triệu d&acirc;n Afghanistan sẽ phải đối mặt với nạn đ&oacute;i. IPC ước t&iacute;nh hơn 3 triệu trẻ em dưới 5 tuổi tại nước n&agrave;y đang bị suy dinh dưỡng cấp t&iacute;nh.</p>
<p>"Cộng đồng quốc tế đang quay lưng trong l&uacute;c Afghanistan đứng trước bờ vực của thảm họa nh&acirc;n đạo", Dominik Stillhart, gi&aacute;m đốc điều h&agrave;nh Ủy ban Chữ thập Đỏ Quốc tế (ICRC), người vừa trở về sau chuyến thăm Afghanistan 6 ng&agrave;y, cho biết.</p>
<p>Ngay cả trước khi Taliban tiếp quản, nạn đ&oacute;i đ&atilde; ho&agrave;nh h&agrave;nh khắp đất nước. Giờ đ&acirc;y, c&aacute;c c&ocirc; g&aacute;i trẻ đang phải trả gi&aacute; bằng cơ thể v&agrave; ch&iacute;nh mạng sống của họ.</p>
<p>"C&aacute;c c&ocirc; g&aacute;i trẻ Afghanistan đang trở th&agrave;nh m&oacute;n h&agrave;ng để đổi lấy thực phẩm, bởi v&igrave; nếu kh&ocirc;ng l&agrave;m vậy, gia đ&igrave;nh họ sẽ chết đ&oacute;i", Mahbouba Seraj, nh&agrave; hoạt động v&igrave; quyền phụ nữ Afghanistan, cho hay.</p>
<p>D&ugrave; kết h&ocirc;n dưới 15 tuổi l&agrave; bất hợp ph&aacute;p tại Afghanistan, t&igrave;nh trạng n&agrave;y vẫn diễn ra suốt nhiều năm qua, đặc biệt l&agrave; ở c&aacute;c v&ugrave;ng n&ocirc;ng th&ocirc;n ngh&egrave;o kh&oacute;. T&igrave;nh h&igrave;nh c&agrave;ng trở n&ecirc;n tồi tệ hơn trong bối cảnh hiện nay của đất nước.</p>
<p>Theo Seraj, c&aacute;c b&eacute; g&aacute;i bị &eacute;p kết h&ocirc;n thường phải chịu rất nhiều đau khổ, ngược đ&atilde;i v&agrave; lạm dụng. Một số em thậm ch&iacute; chết khi mang thai v&igrave; cơ thể chưa đủ trưởng th&agrave;nh.</p>
<p>Sau h&agrave;nh tr&igrave;nh 4 tiếng qua những con đường n&uacute;i hiểm trở, tới tối muộn, gia đ&igrave;nh Parwana mới đến được một kh&aacute;ch sạn nhỏ ở Herat, th&agrave;nh phố lớn thứ ba Afghanistan. Họ được hộ tống bởi một đại diện của TYTW, c&ugrave;ng với mẹ Parwana, Reza Gul, v&agrave; anh trai b&agrave;, Payinda.</p>
<p>Reza Gul v&agrave; Payinda cho hay họ phản đối cha của Parwana b&aacute;n c&ocirc; b&eacute;. "Tất nhi&ecirc;n, t&ocirc;i rất tức giận, t&ocirc;i đ&atilde; đấu tranh với &ocirc;ng ấy v&agrave; t&ocirc;i đ&atilde; kh&oacute;c rất nhiều", Reza Gul chia sẻ. "&Ocirc;ng ấy bảo t&ocirc;i rằng kh&ocirc;ng c&ograve;n lựa chọn n&agrave;o kh&aacute;c".</p>
<p>CNN đ&atilde; được ph&eacute;p quay phim v&agrave;o ng&agrave;y 24/10, khi Parwana bị b&aacute;n cho một người đ&agrave;n &ocirc;ng 55 tuổi với m&aacute;i t&oacute;c bạc trắng. Đổi lại, họ nhận được tiền mặt, cừu v&agrave; đất trị gi&aacute; khoảng 2.200 USD.</p>
<p>"Cha b&aacute;n ch&aacute;u v&igrave; nh&agrave; ch&aacute;u kh&ocirc;ng c&ograve;n b&aacute;nh mỳ hay gạo nữ", Parwana l&uacute;c bấy giờ n&oacute;i. "Cha b&aacute;n ch&aacute;u cho một &ocirc;ng gi&agrave;".</p>
<p>Qorban, người mua, cho biết đ&acirc;y sẽ l&agrave; "cuộc h&ocirc;n nh&acirc;n thứ hai" của &ocirc;ng ta, khẳng định Parwana sẽ được đối xử tử tế.</p>
<p>Theo lời mẹ Parwana, c&ocirc; b&eacute; đ&atilde; cầu xin được về gặp gia đ&igrave;nh v&agrave; được ph&eacute;p về nh&agrave; v&agrave;i lần. "Con b&eacute; n&oacute;i họ đ&aacute;nh n&oacute; v&agrave; kh&ocirc;ng muốn quay trở lại nơi đ&oacute;", Reza Gul kể.</p>
<p>"Họ đối xử rất tệ với ch&aacute;u, họ chửi bới ch&aacute;u, đ&aacute;nh thức ch&aacute;u dậy rất sớm v&agrave; bắt ch&aacute;u l&agrave;m việc", Parwana n&oacute;i th&ecirc;m.</p>
<p>Sau khi c&acirc;u chuyện về ho&agrave;n cảnh của Parwana được ph&aacute;t s&oacute;ng, l&agrave;n s&oacute;ng phẫn nộ của cộng đồng đ&atilde; buộc Qorban phải lẩn trốn. CNN từ đ&oacute; kh&ocirc;ng thể li&ecirc;n lạc với Qorban hay gia đ&igrave;nh &ocirc;ng.</p>
<p>Trong một cuộc phỏng vấn sau đ&oacute;, cha của Parwana cho biết &ocirc;ng cũng bị chỉ tr&iacute;ch v&agrave; cảm thấy &aacute;p lực. Hai tuần sau vụ mua b&aacute;n, Parwana được trở về với gia đ&igrave;nh, nhưng cha c&ocirc; b&eacute; vẫn nợ người mua số tiền tương đương 2.200 USD. &Ocirc;ng đ&atilde; d&ugrave;ng hết số tiền b&aacute;n Parwana để trả c&aacute;c khoản nợ kh&aacute;c.</p>
<p>Parwana v&agrave; năm anh chị em ban đầu cảm thấy mệt mỏi v&igrave; phải đi xe qu&aacute; l&acirc;u v&agrave; bị ngợp trước &aacute;nh đ&egrave;n rực rỡ v&agrave; giao th&ocirc;ng của th&agrave;nh phố. Nhưng khi đ&atilde; ổn định hơn, c&aacute;c em liền đ&ugrave;a nghịch kh&ocirc;ng ngừng v&agrave; cười kh&uacute;c kh&iacute;ch với nhau tr&ecirc;n giường, tận hưởng cuộc phi&ecirc;u lưu mới.</p>
<p>Sau hai đ&ecirc;m ở kh&aacute;ch sạn, gia đ&igrave;nh được TYTW chuyển đến một ng&ocirc;i nh&agrave; l&aacute;nh nạn gần đ&oacute;. Đ&acirc;y l&agrave; lần đầu ti&ecirc;n Parwana được ở dưới một m&aacute;i nh&agrave; thực sự. Trong 4 năm qua, gia đ&igrave;nh em sống tạm bợ tại khu trại d&agrave;nh cho những người di cư thuộc thị trấn Qala-e-Naw, tỉnh Badghis.</p>
<p>"Ch&aacute;u thấy rất hạnh ph&uacute;c khi ở trong ng&ocirc;i nh&agrave; n&agrave;y", Parwana n&oacute;i. "Họ đ&atilde; cho ch&aacute;u cuộc sống mới".</p>
<p>"T&ocirc;i cũng thấy hạnh ph&uacute;c v&agrave; an to&agrave;n ở đ&acirc;y", Reza Gul cho hay. "C&aacute;c con t&ocirc;i ăn uống rất tốt kể từ khi ch&uacute;ng t&ocirc;i chuyển đến, ch&uacute;ng đang vui chơi thoải m&aacute;i v&agrave; ch&uacute;ng t&ocirc;i đều vui vẻ".<img src="https://i1-vnexpress.vnecdn.net/2021/12/03/be-9-tuoi-bi-ban-lam-vo-7764-1-5488-9182-1638504638.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=XSr86OB5igbWWojJoaHJmQ" alt="Parwana ngồi c&ugrave;ng cha trong căn lều tại trại di cư ở tỉnh Badghis, Afghanistan, h&ocirc;m 22/10. Ảnh: CNN." data-src="https://i1-vnexpress.vnecdn.net/2021/12/03/be-9-tuoi-bi-ban-lam-vo-7764-1-5488-9182-1638504638.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=XSr86OB5igbWWojJoaHJmQ" data-ll-status="loaded" /></p>
<figure data-size="true">
<figcaption>
<p>Parwana ngồi c&ugrave;ng cha trong căn lều tại trại di cư ở tỉnh Badghis, Afghanistan, h&ocirc;m 22/10. Ảnh:&nbsp;<em>CNN</em>.</p>
</figcaption>
</figure>
<p>Gia đ&igrave;nh sẽ ở đ&oacute; trong những th&aacute;ng m&ugrave;a đ&ocirc;ng v&agrave; được hỗ trợ, bảo vệ bởi TYTW. Stephanie Sinclair từ TYTW cho biết hiện họ chưa c&oacute; kế hoạch d&agrave;i hạn cho gia đ&igrave;nh Parwana, th&ecirc;m rằng mọi chuyện c&ograve;n phụ thuộc v&agrave;o c&aacute;c nguồn t&agrave;i trợ tới m&aacute;i ấm.</p>
<p>Ngo&agrave;i ra, TYTW cũng đang cố gắng chuyển viện trợ lương thực v&agrave;o trại Qala-e-Naw, nơi hiện c&oacute; khoảng 150 người di cư. Điều n&agrave;y cũng nhằm gi&uacute;p đỡ cha của Parwana khi &ocirc;ng ở lại đ&oacute; để cố gắng l&agrave;m việc, trang trải khoản nợ của gia đ&igrave;nh.</p>
<p>"Ch&uacute;ng t&ocirc;i rất vui v&igrave; Parwana được cứu", người cha n&oacute;i trước khi chia tay gia đ&igrave;nh. "Ch&uacute;ng t&ocirc;i rất vui v&igrave; TYTW gi&uacute;p đỡ v&agrave; cung cấp cho ch&uacute;ng t&ocirc;i một nơi để sinh sống".</p>
<p>C&aacute;c nh&agrave; hoạt động v&igrave; quyền phụ nữ như Mahbouba Seraj cho hay phụ nữ Afghanistan hiện vẫn phải chịu những điều tồi tệ nhất.</p>
<p>"Đ&acirc;y thực sự chỉ l&agrave; phần nổi của tảng băng ch&igrave;m", b&agrave; n&oacute;i. "N&oacute; sẽ tiếp tục diễn ra khi đ&oacute;i ngh&egrave;o, m&ugrave;a đ&ocirc;ng lạnh gi&aacute; v&agrave; sự thiếu hiểu biết vẫn &aacute;m ảnh người d&acirc;n".</p>
<p>L&atilde;nh đạo tối cao Taliban Hibatullah Akhunzada ng&agrave;y 3/12 ra&nbsp;<a href="https://vnexpress.net/taliban-cam-ep-phu-nu-ket-hon-4398237.html" rel="dofollow">sắc lệnh</a>&nbsp;cấm &eacute;p buộc phụ nữ kết h&ocirc;n th&ocirc;ng qua h&agrave;nh vi cưỡng bức hoặc g&acirc;y &aacute;p lực.</p>
<p>Mawlawi Baz Mohammad Sarwary, người đứng đầu sở th&ocirc;ng tin v&agrave; văn h&oacute;a tỉnh Badghis trong ch&iacute;nh quyền Taliban, m&ocirc; tả hoạt động tảo h&ocirc;n l&agrave; "phổ biến" trong khu vực do ngh&egrave;o đ&oacute;i c&ugrave;ng cực, nhưng khẳng định Taliban đang cố gắng chấm dứt t&igrave;nh trạng bất hợp ph&aacute;p n&agrave;y.</p>
<p>"Tảo h&ocirc;n kh&ocirc;ng phải l&agrave; điều tốt đẹp g&igrave; v&agrave; ch&uacute;ng t&ocirc;i l&ecirc;n &aacute;n điều đ&oacute;", Sarwary khẳng định. "Một số người buộc phải l&agrave;m vậy v&igrave; họ qu&aacute; ngh&egrave;o".</p>
<p>&Ocirc;ng cũng k&ecirc;u gọi c&aacute;c nh&oacute;m phi lợi nhuận v&agrave; quốc tế gửi viện trợ để cứu c&aacute;c gia đ&igrave;nh Afghanistan khỏi nạn đ&oacute;i. "Ch&uacute;ng t&ocirc;i mong những người d&acirc;n Badghis được gi&uacute;p đỡ. Ch&uacute;ng t&ocirc;i sẽ bảo vệ cho họ, ch&uacute;ng t&ocirc;i sẽ d&ugrave;ng tất cả những g&igrave; m&igrave;nh c&oacute;, phối hợp l&agrave;m việc với họ", Sarwary cho biết.</p>
<p>Stillhart từ ICRC cho rằng ch&iacute;nh phủ c&aacute;c nước cần khẩn cấp nối lại viện trợ cho Afghanistan để ngăn c&aacute;c bệnh viện v&agrave; dịch vụ cơ bản sụp đổ.</p>
<p>"T&ocirc;i k&ecirc;u gọi cộng đồng quốc tế t&igrave;m ra giải ph&aacute;p cho ph&eacute;p duy tr&igrave; c&aacute;c dịch vụ thiết yếu n&agrave;y", Stillhart n&oacute;i. "Kinh tế Afghanistan đ&atilde; suy giảm 40% kể từ cuối th&aacute;ng 8 do bị ngừng viện trợ song phương".</p>
<p>C&aacute;c tổ chức phi lợi nhuận vẫn c&ograve;n hoạt động tại Afghanistan cũng đang k&ecirc;u gọi phối hợp h&agrave;nh động chặt chẽ hơn nữa để gi&uacute;p đỡ những người ngh&egrave;o kh&oacute; nhất đất nước.</p>
<p>Tại một khu chợ địa phương ở Herat, TYTW đang gi&uacute;p gia đ&igrave;nh Parwana mua đồ d&ugrave;ng nh&agrave; bếp v&agrave; thực phẩm.</p>
<p>"Ch&uacute;ng t&ocirc;i từng thức trắng h&agrave;ng đ&ecirc;m v&igrave; đ&oacute;i", Reza Gul, mẹ của Parwana, cho biết. "Hiện tại, ch&uacute;ng t&ocirc;i rất vui v&igrave; TYTW đ&atilde; gi&uacute;p đỡ ch&uacute;ng t&ocirc;i v&agrave; đưa ch&uacute;ng t&ocirc;i đến Herat".</p>
<p>Parwana, hiện đ&atilde; tho&aacute;t khỏi cuộc sống với người chồng gấp s&aacute;u lần tuổi em, rất h&agrave;o hứng với viễn cảnh được đi học.</p>
<p>"Ch&aacute;u muốn học để trở th&agrave;nh b&aacute;c sĩ", Parwana n&oacute;i. "Ch&aacute;u muốn học để phục vụ người d&acirc;n nước ch&aacute;u".</p>
<p>Đối với những người đang đấu tranh cho quyền phụ nữ Afghanistan, quyết t&acirc;m vươn tới một tương lai tốt đẹp hơn của Parwana mang đến tia hy vọng rằng thế hệ trẻ em g&aacute;i tiếp theo c&oacute; thể vượt qua nghịch cảnh cuộc sống để tạo ra thay đổi lớn lao cho x&atilde; hội.</p>
</article>', CAST(N'2021-12-04' AS Date), 55, 1, 2, 1)
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (6, N'Dân Australia nhậu xỉn nhiều nhất thế giới', N'7.jpg', N'<p>Khảo s&aacute;t mới nhất cho thấy người Australia nhậu xỉn trung b&igrave;nh 27 lần trong năm, gần gấp đ&ocirc;i mức trung b&igrave;nh to&agrave;n cầu.</p>

<p>Trang Global Drug Survey tuần n&agrave;y c&ocirc;ng bố khảo s&aacute;t cho thấy trung b&igrave;nh người Australia nhậu khoảng hai tối một tuần v&agrave; cứ hai tuần th&igrave; nhậu tới mức say xỉn một lần. Tần suất nhậu xỉn n&agrave;y tương đương 27 lần một năm, gần gấp đ&ocirc;i mức trung b&igrave;nh to&agrave;n cầu l&agrave; 15 lần/năm.</p>

<p>Khảo s&aacute;t cũng chỉ ra rằng khoảng 1/4 người Australia được hỏi đều cảm thấy hối hận v&igrave; đ&atilde; say xỉn. Cuộc khảo s&aacute;t c&oacute; hơn 32.000 người từ 22 nước tham dự, nhằm đ&aacute;nh gi&aacute; mức độ ti&ecirc;u thụ rượu v&agrave; chất k&iacute;ch th&iacute;ch họ d&ugrave;ng trong năm 2020.</p>

<p>Tỷ lệ người d&acirc;n Australia cần chăm s&oacute;c y tế khẩn cấp do uống rượu l&agrave; 3,9%, gấp khoảng ba lần so với mức trung b&igrave;nh to&agrave;n cầu l&agrave; 1,2%.</p>

<div><img alt="Người dân uống bia trong một nhà hàng ở Sydney, Australia, hôm 11/10. Ảnh: Reuters." src="https://i1-vnexpress.vnecdn.net/2021/12/04/anh-cat-MZ3WACBGBBIZNGRIY2ZINJ-3007-8068-1638587116.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=JIUmwz14jfTT9D5256Zj8w" /></div>

<p>Người d&acirc;n uống bia trong một nh&agrave; h&agrave;ng ở Sydney, Australia, h&ocirc;m 11/10. Ảnh:&nbsp;Reuters.</p>

<p>Gi&aacute;m đốc điều h&agrave;nh Quỹ Nghi&ecirc;n cứu v&agrave; Gi&aacute;o dục về Rượu Caterina Giorgi đ&aacute;nh gi&aacute; số liệu từ khảo s&aacute;t &quot;đ&aacute;ng quan ngại&quot;.</p>

<p>&quot;Australia đứng đầu thế giới về cả số người say xỉn lẫn số người cần chăm s&oacute;c y tế khẩn cấp do rượu. Hai chỉ số n&agrave;y cho thấy mọi người đang uống rượu ở mức kh&aacute; nguy hiểm&quot;, Giorgi n&oacute;i.</p>

<p>Giorgi cũng b&agrave;y tỏ lo ngại khi ng&agrave;y c&agrave;ng c&oacute; nhiều người uống rượu say xỉn như c&aacute;ch để giải quyết căng thẳng v&agrave; lo lắng. &quot;Những th&oacute;i quen đ&oacute; rất kh&oacute; cải thiện khi ch&uacute;ng ta tiếp tục sống trong m&ocirc;i trường chịu ảnh hưởng từ đại dịch Covid-19&quot;, b&agrave; n&oacute;i.</p>

<p>Theo Giorgi, doanh số b&aacute;n rượu cho người d&acirc;n năm 2020 tăng 3,3 tỷ USD v&agrave; tiếp tục tăng năm 2021.</p>

<p>Khảo s&aacute;t của Global Drug Survey cho thấy ngo&agrave;i&nbsp;<a href="https://vnexpress.net/chu-de/australia-735" rel="dofollow">Australia</a>, 9 nước c&oacute; người d&acirc;n nhậu xỉn nhất thế giới theo thứ tự giảm dần gồm Đan Mạch, Phần Lan, Mỹ, Anh, Canada, Ireland, Ph&aacute;p, Thụy Điển v&agrave; H&agrave; Lan. Khảo s&aacute;t kh&ocirc;ng được tiến h&agrave;nh ở Việt Nam.</p>

<p>Global Drug Survey l&agrave; một c&ocirc;ng ty nghi&ecirc;n cứu độc lập c&oacute; trụ sở ở London, Anh. C&ocirc;ng ty tiến h&agrave;nh c&aacute;c khảo s&aacute;t trực tuyến thường ni&ecirc;n bằng 10 thứ tiếng ở hơn 20 quốc gia, với mục ti&ecirc;u nghi&ecirc;n cứu về thực trạng sử dụng rượu bia, chất k&iacute;ch th&iacute;ch v&agrave; chia sẻ th&ocirc;ng tin để n&acirc;ng cao sức khỏe cộng đồng.</p>
', CAST(N'2018-03-21' AS Date), 13, 1, 2, 1)
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (7, N'Đề nghị dừng nhập cảnh hành khách từ 10 nước châu Phi', N'https://i1-vnexpress.vnecdn.net/2021/12/04/242858498-410999873932266-1947-2581-4680-1638593042.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=WZKtYBX7sjZ5X6suoagmqQ', N'<p style="text-align:justify">Cục H&agrave;ng kh&ocirc;ng Việt Nam kiến nghị dừng c&aacute;c chuyến bay cứu trợ v&agrave; cấm nhập cảnh với h&agrave;nh kh&aacute;ch từ 10 quốc gia ch&acirc;u Phi.</p>

<p style="text-align:justify">Ng&agrave;y 4/12, đại diện Cục H&agrave;ng kh&ocirc;ng Việt Nam cho hay đ&atilde; kiến nghị Bộ Giao th&ocirc;ng Vận tải kh&ocirc;ng thực hiện chuyến bay đưa người Việt hồi hương từ 10 quốc gia ch&acirc;u Phil gồm: Botswana, Eswatini, Lesotho, Mozambique, Namibia, Nam Phi, Zimbabwe, Malawi, Angola v&agrave; Zambia; cấm nhập cảnh h&agrave;nh kh&aacute;ch đ&atilde; đi qua c&aacute;c quốc gia n&agrave;y trong 30 ng&agrave;y trước khi v&agrave;o Việt Nam.</p>

<p style="text-align:justify">Hiện Việt Nam chưa c&oacute; đường bay đến ch&acirc;u Phi, c&aacute;c h&atilde;ng h&agrave;ng kh&ocirc;ng chỉ thực hiện chuyến bay cứu trợ, đưa người Việt hồi hương theo y&ecirc;u cầu của Bộ Ngoại giao.</p>

<p style="text-align:justify">Cục H&agrave;ng kh&ocirc;ng Việt Nam cũng đề nghị Bộ Y tế hướng dẫn kiểm so&aacute;t y tế chặt hơn đối với h&agrave;nh kh&aacute;ch đến từ một số quốc gia đ&atilde; xuất hiện Omicron như H&agrave;n Quốc, Nhật Bản; c&aacute;ch ly y tế với to&agrave;n bộ h&agrave;nh kh&aacute;ch quốc tế đến từ c&aacute;c quốc gia đ&atilde; xuất hiện biến chủng Omicron khi nhập cảnh v&agrave;o Việt Nam.</p>

<p style="text-align:justify">Cục cũng kiến nghị Bộ C&ocirc;ng an kiểm so&aacute;t chặt chẽ, ph&aacute;t hiện kh&aacute;ch đến v&agrave; đi qua c&aacute;c nước đ&atilde; ghi nhận ca bệnh nhiễm chủng mới Omicron nhập cảnh v&agrave;o Việt Nam để th&ocirc;ng b&aacute;o kịp thời cho cơ quan y tế địa phương, ngăn chặn nguy cơ x&acirc;m nhập.</p>

<p style="text-align:justify"><img alt="Máy bay tại sân bay Nội Bài. Ảnh: Ngọc Thành" src="https://i1-vnexpress.vnecdn.net/2021/12/04/242858498-410999873932266-1947-2581-4680-1638593042.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=rCoP9RUxMLC9DVHPLTw1Wg" /></p>

<p style="text-align:justify">M&aacute;y bay tại s&acirc;n bay Nội B&agrave;i. Ảnh:&nbsp;<em>Ngọc Th&agrave;nh</em></p>

<p style="text-align:justify">Theo Cục H&agrave;ng kh&ocirc;ng Việt Nam, c&aacute;c nước l&acirc;n cận đ&atilde; cấm nhập cảnh h&agrave;nh kh&aacute;ch từ ch&acirc;u Phi v&agrave; siết chặt kiểm dịch qua đường h&agrave;ng kh&ocirc;ng. Từ ng&agrave;y 3/12, kh&aacute;ch đến Singapore bằng đường h&agrave;ng kh&ocirc;ng, bao gồm cư d&acirc;n của nước n&agrave;y v&agrave; người qu&aacute; cảnh tại s&acirc;n bay Changi, phải tu&acirc;n thủ quy định x&eacute;t nghiệm nghi&ecirc;m ngặt. Nước n&agrave;y cũng tạm ho&atilde;n chương tr&igrave;nh L&agrave;n đi lại d&agrave;nh cho người đ&atilde; ti&ecirc;m vaccine với 27 quốc gia v&agrave; v&ugrave;ng l&atilde;nh thổ.</p>

<p style="text-align:justify">Malaysia đ&atilde; th&ocirc;ng b&aacute;o tạm thời cấm nhập cảnh đối với người đến từ c&aacute;c quốc gia c&oacute; ca nhiễm biến thể Omicron hoặc được xem l&agrave; c&oacute; nguy cơ cao. Malaysia cũng dự kiến cấm nhập cảnh kh&aacute;ch từ khu vực c&oacute; biến củng Omicron như Hong Kong, Anh, Australia...</p>

<p style="text-align:justify">Bộ Y tế Th&aacute;i Lan từ ng&agrave;y 1/12 cấm người nhập cảnh đến từ 8 quốc gia ch&acirc;u Phi.</p>

<p style="text-align:justify">Ng&agrave;y 28/11, H&agrave;n Quốc đ&atilde; &aacute;p đặt lệnh cấm nhập cảnh đối với 8 quốc gia ch&acirc;u Phi. Người đ&atilde; ti&ecirc;m vaccine từ c&aacute;c quốc gia kh&aacute;c phải nộp bản cứng kết quả x&eacute;t nghiệm PCR khi đến, sau đ&oacute; l&agrave;m x&eacute;t nghiệm tại trung t&acirc;m y tế c&ocirc;ng cộng địa phương v&agrave; tự c&aacute;ch ly tại nơi cư tr&uacute; cho đến khi nhận được kết quả.</p>

<p style="text-align:justify">C&aacute;c quốc gia kh&aacute;c như Nhật Bản, Campuchia... đ&atilde; &aacute;p dụng c&aacute;c biện ph&aacute;p cấm nhập cảnh kh&aacute;ch đến từ một số nước ch&acirc;u Phi hoặc những du kh&aacute;ch c&oacute; lịch sử đi qua c&aacute;c quốc gia n&agrave;y trong v&ograve;ng 3 tuần.</p>

<p style="text-align:justify">Đến nay, Việt Nam chưa ghi nhận ca biến chủng Omicron. Tuy nhi&ecirc;n, tối 28/11, Bộ Y tế đề xuất Ch&iacute;nh phủ xem x&eacute;t chỉ đạo dừng c&aacute;c chuyến bay đến v&agrave; đi từ c&aacute;c quốc gia: Nam Phi, Botswana, Namibia, Zimbabwe, Eswatini, Lesotho, Mozambique; dừng cấp ph&eacute;p nhập cảnh với kh&aacute;ch đến từ c&aacute;c nước n&agrave;y.</p>

<p style="text-align:justify">Ng&agrave;y 25/11, WHO th&ocirc;ng b&aacute;o ghi nhận biến chủng mới đ&aacute;ng lo ngại, gọi l&agrave; Omicron (B.1.1.529), ph&aacute;t hiện tại một số quốc gia nam ch&acirc;u Phi.</p>
', CAST(N'2019-03-21' AS Date), 26, 1, 1, 1)
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (8, N'Dự kiến các ngày nghỉ lễ, Tết năm 2022', N'1.jpg', N'<p style="text-align:justify">C&ocirc;ng chức, lao động c&oacute; 22 ng&agrave;y nghỉ lễ Tết trong năm 2022, gồm 11 ng&agrave;y ch&iacute;nh thức v&agrave; nghỉ b&ugrave; do rơi v&agrave;o cuối tuần.</p>

<p style="text-align:justify">Bộ Lao động Thương binh v&agrave; X&atilde; hội vừa đề xuất Ch&iacute;nh phủ phương &aacute;n nghỉ lễ, Tết năm 2022 tr&ecirc;n cơ sở lấy &yacute; kiến đồng &yacute; của 16 cơ quan, bộ ng&agrave;nh.</p>

<p style="text-align:justify">Dịp Tết Nh&acirc;m Dần nghỉ k&eacute;o d&agrave;i 9 ng&agrave;y, gồm 5 ng&agrave;y ch&iacute;nh thức v&agrave; 4 ng&agrave;y cuối tuần, từ 27 th&aacute;ng Chạp năm T&acirc;n Sửu đến hết m&ugrave;ng 6 th&aacute;ng Gi&ecirc;ng năm Nh&acirc;n Dần, tức 29/1/2022 đến 6/2/2022. Việc bố tr&iacute; n&agrave;y đảm bảo việc h&agrave;i h&ograve;a thời gian nghỉ trước v&agrave; sau Tết.</p>

<p style="text-align:justify">Kỳ nghỉ Quốc kh&aacute;nh dự kiến nghỉ bốn ng&agrave;y, từ 1/9 đến 4/9/2022, tức từ thứ năm đến hết Chủ nhật. Với phương &aacute;n n&agrave;y, c&ocirc;ng chức, người lao động được nghỉ trọn vẹn trong tuần v&agrave; kh&ocirc;ng phải nghỉ b&ugrave;.</p>

<p style="text-align:justify"><img alt="Hoa đào theo những xe hàng rong xuống phố Hà Nội, cận Tết Tân Sửu. Ảnh: Giang Huy" src="https://i1-vnexpress.vnecdn.net/2021/12/04/06-1423539242-9927-1638592554.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=OmldOjB5jLDBz8iPRETsPg" /></p>

<p style="text-align:justify">Hoa đ&agrave;o theo những xe h&agrave;ng rong xuống phố H&agrave; Nội, cận Tết T&acirc;n Sửu. Ảnh:&nbsp;<em>Giang Huy</em></p>

<p style="text-align:justify">Một số ng&agrave;y nghỉ lễ hằng năm thực hiện theo quy định của luật lao động. Dịp Tết Dương lịch sắp tới, người lao động sẽ nghỉ li&ecirc;n tục từ 1/1 đến hết 3/1/2022, do ng&agrave;y đầu năm 2022 rơi v&agrave;o cuối tuần v&agrave; được nghỉ b&ugrave; thứ hai tuần kế tiếp. Kỳ nghỉ k&eacute;o d&agrave;i ba ng&agrave;y.</p>

<p style="text-align:justify">Ng&agrave;y Giỗ tổ 10/3 &Acirc;m lịch tức 10/4 Dương lịch rơi v&agrave;o Chủ nhật, người lao động được nghỉ b&ugrave; thứ hai tuần kế tiếp.</p>

<p style="text-align:justify">Ng&agrave;y thống nhất 30/4 v&agrave; Quốc tế lao động 1/5 nghỉ li&ecirc;n tiếp bốn ng&agrave;y do rơi v&agrave;o cuối tuần, c&ocirc;ng chức, người lao động sẽ được nghỉ b&ugrave; thứ hai v&agrave; thứ ba tuần kế tiếp.</p>

<p style="text-align:justify">Bộ Lao động Thương binh v&agrave; X&atilde; hội khuyến kh&iacute;ch doanh nghiệp cho người lao động nghỉ Tết như lịch chung v&agrave; b&aacute;o trước cho người lao động biết trước &iacute;t nhất 30 ng&agrave;y.</p>

<p style="text-align:justify">Người lao động nếu l&agrave;m th&ecirc;m giờ, l&agrave;m việc ban đ&ecirc;m v&agrave;o kỳ nghỉ lễ, Tết hưởng lương &iacute;t nhất bằng 300%, chưa bao gồm tiền lương l&agrave;m việc ng&agrave;y n&agrave;y. Lao động l&agrave; người nước ngo&agrave;i l&agrave;m việc tại Việt Nam ngo&agrave;i 11 ng&agrave;y nghỉ tr&ecirc;n c&ograve;n được nghỉ th&ecirc;m một ng&agrave;y Tết cổ truyền v&agrave; một ng&agrave;y Quốc kh&aacute;nh của nước họ.</p>
', CAST(N'2021-12-04' AS Date), 53, 1, 1, 1)
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (12, N'Lưu Gia Linh sánh đôi Lương Triều Vỹ', N'https://i1-giaitri.vnecdn.net/2021/12/10/luu-gia-linh-3-8436-1639128229.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=Gwqteag1WMW_R9LElSohRA', N'<h1>Lưu Gia Linh s&aacute;nh đ&ocirc;i Lương Triều Vỹ</h1>

<p>TRUNG QUỐCDiễn vi&ecirc;n Lưu Gia Linh diện v&aacute;y xẻ ngực, s&aacute;nh đ&ocirc;i chồng - t&agrave;i tử Lương Triều Vỹ.</p>

<p><img alt="Ngày 10/12, minh tinh 56 tuổi đăng trên trang cá nhân ảnh trong tiệc sinh nhật tổ chức ở Thượng Hải, nơi Lương Triều Vỹ đang đóng phim." src="https://i1-giaitri.vnecdn.net/2021/12/10/luu-gia-linh-3-8436-1639128229.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=tEctXrAvgX05LezWEiHZ3g" /></p>

<p>Ng&agrave;y 10/12, minh tinh 56 tuổi đăng tr&ecirc;n trang c&aacute; nh&acirc;n ảnh trong tiệc sinh nhật tổ chức ở Thượng Hải, nơi&nbsp;<a href="https://vnexpress.net/tag/luu-gia-linh-33750" rel="dofollow" target="_blank">Lương Triều Vỹ</a>&nbsp;đang đ&oacute;ng phim.</p>

<p><img alt="Theo Sina, Lương Triều Vỹ mặc lịch thiệp, cùng Lưu Gia Linh tiếp đón khách. Đôi diễn viên kết hôn 13 năm, những năm gần đây, Gia Linh quản lý công việc của chồng." src="https://i1-giaitri.vnecdn.net/2021/12/10/luu-gia-linh-4-4892-1639128229.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=mKxs8At4FmSKGRliEXE9zQ" /></p>

<p>Theo&nbsp;<em>Sina</em>, Lương Triều Vỹ mặc lịch thiệp, c&ugrave;ng Lưu Gia Linh tiếp đ&oacute;n kh&aacute;ch. Đ&ocirc;i diễn vi&ecirc;n kết h&ocirc;n 13 năm, những năm gần đ&acirc;y, Gia Linh quản l&yacute; c&ocirc;ng việc của chồng.</p>

<p><img alt="Minh tinh Hong Kong nhận nhiều lời chúc mừng từ đồng nghiệp, khán giả. Diễn viên Lý Nhược Đồng bình luận dưới loạt ảnh: Chị Gia Linh, chúc chị mạnh khỏe và vui vẻ. Chị luôn là tấm gương của chúng em." src="https://i1-giaitri.vnecdn.net/2021/12/10/luu-gia-linh-1-8685-1639128229.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=CJVdc8LxNABY1DdnCrY9Rg" /></p>

<p>Minh tinh Hong Kong nhận nhiều lời ch&uacute;c mừng từ đồng nghiệp, kh&aacute;n giả. Diễn vi&ecirc;n L&yacute; Nhược Đồng b&igrave;nh luận dưới loạt ảnh: &quot;Chị Gia Linh, ch&uacute;c chị mạnh khỏe v&agrave; vui vẻ. Chị lu&ocirc;n l&agrave; tấm gương của ch&uacute;ng em&quot;.</p>

<p><img alt="Lưu Gia Linh sánh đôi Lương Triều Vỹ - 3" src="https://i1-giaitri.vnecdn.net/2021/12/10/luu-gia-linh-2-9277-1639128229.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=RH9PmA8RDV5o0T-6ZE9p9w" /></p>

<p><img alt="Hàng nghìn khán giả khen cô trẻ trung, gợi cảm tuổi ngoài 50." src="https://i1-giaitri.vnecdn.net/2021/12/10/luu-gia-linh-8-8016-1639128229.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=ZqYE19IyWoVJFzg-gJV6uQ" /></p>

<p>H&agrave;ng ngh&igrave;n kh&aacute;n giả khen c&ocirc; trẻ trung, gợi cảm tuổi ngo&agrave;i 50.</p>

<p><img alt="Diễn viên bên mẹ của cô, năm nay 76 tuổi." src="https://i1-giaitri.vnecdn.net/2021/12/10/luu-gia-linh-5-7354-1639128229.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=7g8meEj23rSgln3yYxhcNg" /></p>

<p>Diễn vi&ecirc;n b&ecirc;n mẹ của c&ocirc;, năm nay 76 tuổi.</p>

<p>&nbsp;</p>

<p><img alt="Gia Linh cùng người thân. Cô đóng phim từ đầu thập niên 1980, được giới chuyên môn, khán giả đánh giá tích cực diễn xuất qua A Phi chính truyện, 2046, Đông Tà Tây Độc, Kim chi ngọc diệp..." src="https://i1-giaitri.vnecdn.net/2021/12/10/luu-gia-linh-6-8576-1639128230.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=NSIqFon3iF6lkN7_92-ZJQ" /></p>
', CAST(N'2021-12-01' AS Date), 6, 1, 4, 1)
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (13, N'Võ Hoàng Yến về nước', N'https://i1-giaitri.vnecdn.net/2021/12/10/yen-7486-1639129273.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=Ui7afHjgH3SAQNeKn2BbaQ', N'<p>Si&ecirc;u mẫu V&otilde; Ho&agrave;ng Yến bay từ Mỹ về Việt Nam s&aacute;ng 10/12, đang c&aacute;ch ly ở Hội An.</p>

<p>C&ocirc; cho biết lần về nước n&agrave;y, c&ocirc; thấy thoải m&aacute;i hơn v&igrave; được lựa chọn tự c&aacute;ch ly bảy ng&agrave;y ở kh&aacute;ch sạn. Sau khi ho&agrave;n tất thời hạn,&nbsp;<a href="https://vnexpress.net/chu-de/vo-hoang-yen-1355" rel="dofollow">V&otilde; Ho&agrave;ng Yến</a>&nbsp;dự định tham quan Hội An một v&ograve;ng rồi bay về TP HCM. &quot;Thời gian tr&ocirc;i qu&aacute; nhanh, mới đ&oacute; đ&atilde; gần s&aacute;u th&aacute;ng t&ocirc;i ở Mỹ. T&ocirc;i h&aacute;o hức được về nước l&agrave;m việc, gặp lại gia đ&igrave;nh, bạn b&egrave;. Nhưng t&ocirc;i cũng lưu luyến v&agrave; kh&oacute;c nhiều khi tạm biệt chồng sắp cưới. Hy vọng c&aacute;c chuyến bay thương mại sớm mở để ch&uacute;ng t&ocirc;i gặp lại nhau thường xuy&ecirc;n hơn&quot;, c&ocirc; n&oacute;i.</p>

<p><img alt="Võ Hoàng Yến tiếc nuối khi xa chồng sắp cưới sau sáu tháng bên nhau." src="https://i1-giaitri.vnecdn.net/2021/12/10/yen-7486-1639129273.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=H3umP7QG0m6yWz8qAwdTGA" /></p>

<p><iframe frameborder="0" height="0" id="google_ads_iframe_/27973503/Vnexpress/Desktop/Inimage/Giaitri/Giaitri.gioisao.detail_0" name="" scrolling="no" src="https://753472150c8610228eda62df8fd007e6.safeframe.googlesyndication.com/safeframe/1-0-38/html/container.html" title="3rd party ad content" width="0"></iframe></p>

<p>V&otilde; Ho&agrave;ng Yến hồi th&aacute;ng 11. Ảnh:&nbsp;<em>Nh&acirc;n vật cung cấp</em></p>

<p>Trước đ&oacute;, giữa th&aacute;ng 6, si&ecirc;u mẫu sang California, Mỹ hội ngộ chồng sắp cưới sau một năm rưỡi xa c&aacute;ch. C&ocirc; quay nhiều Vlog kể về cuộc sống thường ng&agrave;y. Cả hai chưa l&ecirc;n kế hoạch tổ chức h&ocirc;n lễ v&igrave; vẫn đợi hết dịch ở cả hai nước. Trước đ&oacute;, họ dự định cưới th&aacute;ng 7/2020 nhưng phải ho&atilde;n.</p>

<p>Ho&agrave;ng Yến v&agrave; bạn trai t&igrave;nh cờ quen nhau trong một bữa tiệc ở Mỹ v&agrave; tr&uacute;ng &quot;tiếng s&eacute;t &aacute;i t&igrave;nh&quot;. C&ocirc; giữ k&iacute;n danh t&iacute;nh bạn trai, cho biết anh l&agrave; người k&iacute;n tiếng, chững chạc, khiến c&ocirc; nể phục v&agrave; lu&ocirc;n cảm thấy an to&agrave;n khi ở b&ecirc;n. C&ocirc; thường bị anh tr&aacute;ch mắng v&igrave; t&iacute;nh t&igrave;nh trẻ con. Đầu năm ngo&aacute;i, c&ocirc; sang Mỹ đ&oacute;n Tết Nguy&ecirc;n đ&aacute;n c&ugrave;ng anh. Về nước đ&uacute;ng thời gian dịch b&ugrave;ng ph&aacute;t, c&ocirc; từng khiến người y&ecirc;u lo lắng, đứng ngồi kh&ocirc;ng y&ecirc;n khi đi&nbsp;<a href="https://vnexpress.net/vo-hoang-yen-roi-khu-cach-ly-4078485.html" rel="dofollow" target="_blank">c&aacute;ch ly tập trung</a>&nbsp;17 ng&agrave;y.</p>
', CAST(N'2021-12-08' AS Date), 4, 1, 4, 1)
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (14, N'Hulk và Diego Costa vô địch Brazil', N'https://i1-thethao.vnecdn.net/2021/12/10/1-6279-1639123551.jpg?w=1020&h=0&q=100&dpr=1&fit=crop&s=vxJOl6hKfvzCCjwUIR33GA', N'<p>BRAZILCặp tiền đạo Hulk v&agrave; Diego Costa g&oacute;p c&ocirc;ng gi&uacute;p Atletico Mineiro giải cơn kh&aacute;t v&ocirc; địch Brazil k&eacute;o d&agrave;i nửa thế kỷ.</p>

<p>Bốn th&aacute;ng sau khi trở về qu&ecirc; nh&agrave; Brazil, tiền đạo&nbsp;<a href="https://vnexpress.net/chu-de/diego-costa-206" rel="dofollow">Diego Costa</a>&nbsp;gi&uacute;p Atletico Mineiro v&ocirc; địch nhờ chiến thắng 3-2 trước Bahia ở v&ograve;ng 37 giải VĐQG, h&ocirc;m 3/12. Atletico Mineiro bị dẫn 0-2 nhưng thắng ngược 3-2 nhờ một b&agrave;n của cựu tuyển thủ Brazil Hulk. Họ c&oacute; 84 điểm sau 38 v&ograve;ng, hơn đội &aacute; qu&acirc;n Flamengo 13 điểm.</p>

<p><img alt="Hulk và Costa góp 23 bàn cho Atletico Mineiro ở giải VĐQG Brazil 2021. Ảnh: Goal" src="https://i1-thethao.vnecdn.net/2021/12/10/1-6279-1639123551.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=K8W5iuLcGUFPE3D-QQB8rA" /></p>

<p><iframe frameborder="0" height="1" id="google_ads_iframe_/27973503/Vnexpress/Desktop/Inimage/Thethao/Thethao.bongda.detail_0" name="google_ads_iframe_/27973503/Vnexpress/Desktop/Inimage/Thethao/Thethao.bongda.detail_0" scrolling="no" title="3rd party ad content" width="1"></iframe></p>

<p>Hulk v&agrave; Costa g&oacute;p 23 b&agrave;n cho Atletico Mineiro ở giải VĐQG Brazil 2021. Ảnh:&nbsp;<em>Goal</em></p>

<p>Costa chơi 14 trận, ghi bốn b&agrave;n v&agrave; c&oacute; một kiến tạo m&ugrave;a n&agrave;y, c&ograve;n Hulk c&oacute; 19 lần lập c&ocirc;ng v&agrave; bảy kiến tạo. Hulk đeo băng đội trưởng Atletico Mineiro, đoạt Vua ph&aacute; lưới giải VĐQG Brazil 2021. Ngo&agrave;i cặp tiền đạo lừng danh, đội b&oacute;ng của th&agrave;nh phố Belo Horizonte c&ograve;n c&oacute; tuyển thủ Chile Eduardo Vargas, c&ugrave;ng cặp đ&ocirc;i Argentina Ignacio Fernandez v&agrave; Matias Zaracho.</p>

<p>Atletico Mineiro c&ograve;n cơ hội đoạt th&ecirc;m danh hiệu khi chuẩn bị bước v&agrave;o chung kết Cup Quốc gia Brazil với đối thủ Atletico Paranaense. Trước đ&oacute;, Hulk v&agrave; đồng đội thua b&aacute;n kết Copa Libertadores, dưới tay đội v&ocirc; địch sau đ&oacute; l&agrave; Palmeiras.</p>

<p>Trước vinh quang ở Brazil, Costa từng v&ocirc; địch T&acirc;y Ban Nha v&agrave; Anh, c&ograve;n Hulk đ&atilde; v&ocirc; địch ở Bồ Đ&agrave;o Nha, Nga v&agrave; Trung Quốc. Hulk rời Shanghai SIPG năm ngo&aacute;i v&agrave; về Brazil th&aacute;ng 1/2021, c&ograve;n Costa thanh l&yacute; hợp đồng với Atletico Madrid th&aacute;ng 12/2020. Ở tuổi 35, Hulk vẫn chơi 66 trận trong năm 2021, c&ograve;n Costa ở tuổi 33 chơi 25 trận trong ba th&aacute;ng gần nhất.</p>

<p>&quot;T&ocirc;i trở lại Brazil sau hơn 16 năm v&agrave; thực sự hạnh ph&uacute;c với th&agrave;nh quả n&agrave;y&quot;, Hulk b&agrave;y tỏ. &quot;Ch&uacute;ng t&ocirc;i c&oacute; cơ hội đoạt ba chức v&ocirc; địch, gồm danh hiệu v&ocirc; địch bang Mineirao. Điều đ&oacute; thật tuyệt vời. Ch&uacute;ng t&ocirc;i sẽ cầu nguyện để mọi chuyện đi theo đ&uacute;ng kế hoạch&quot;.</p>
', CAST(N'2021-12-09' AS Date), 2, 1, 5, 1)
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (16, N'Cựu giám đốc Bệnh viện Bạch Mai bị bắt', N'z2504622736014-2d7631988a69c41-4628-6298-1639120292.jpg', N'<p>H&Agrave; NỘIGS.TS Nguyễn Quang Tuấn, 54 tuổi, cựu Gi&aacute;m đốc Bệnh viện Bạch Mai, bị tạm giam để điều tra sai phạm khi l&agrave;m Gi&aacute;m đốc Bệnh viện Tim.</p>

<p>Ng&agrave;y 10/12, Cơ quan Cảnh s&aacute;t điều tra Bộ C&ocirc;ng an (C03) ra quyết định hủy bỏ biện ph&aacute;p ngăn chặn cấm đi khỏi nơi cư tr&uacute;, ra lệnh bắt tạm giam với &ocirc;ng Tuấn. Quyết định được Vụ 3 (VKSND Tối cao) ph&ecirc; chuẩn.</p>

<p>C03 giải th&iacute;ch &quot;nhận thấy cần phải tạm giam bị can&quot; mới l&agrave;m r&otilde; được bản chất vụ &aacute;n. Hơn 20 ng&agrave;y trước, &ocirc;ng Tuấn bị khởi tố song được tại ngoại.</p>

<p><img alt="GS.TS Nguyễn Quang Tuấn. Ảnh: Hoàng Phong" src="https://i1-vnexpress.vnecdn.net/2021/12/10/z2504622736014-2d7631988a69c41-4628-6298-1639120292.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=uK_2n7sVhrr8hB6by7QUsg" /></p>

<p>GS.TS Nguyễn Quang Tuấn. Ảnh:&nbsp;<em>Ho&agrave;ng Phong</em></p>

<p>C03 c&aacute;o buộc &ocirc;ng Tuấn khi l&agrave;m Gi&aacute;m đốc Bệnh viện Tim H&agrave; Nội đ&atilde; c&ugrave;ng một số c&aacute;n bộ v&agrave; c&aacute;c đơn vị li&ecirc;n quan c&oacute; vi phạm trong đấu thầu mua sắm vật tư, h&oacute;a chất, thiết bị y tế. Điều n&agrave;y l&agrave;m tăng chi ph&iacute;, g&acirc;y thiệt hại t&agrave;i sản cho Nh&agrave; nước v&agrave; người bệnh, ảnh hưởng c&ocirc;ng t&aacute;c kh&aacute;m chữa bệnh.</p>

<p>Li&ecirc;n quan vụ &aacute;n n&agrave;y, từ ng&agrave;y 13/5 đến nay, C03 đ&atilde; khởi tố, tạm giam 9 người, trong đ&oacute; c&oacute; b&agrave; Ho&agrave;ng Thị Ngọc Hưởng, cựu ph&oacute; gi&aacute;m đốc Bệnh viện Tim; Nguyễn Thị Dung Hạnh, cựu kế to&aacute;n trưởng, ủy vi&ecirc;n Hội đồng mua sắm, th&agrave;nh vi&ecirc;n Tổ thẩm định đấu thầu; Đo&agrave;n Trọng B&igrave;nh, cựu ph&oacute; ph&ograve;ng phụ tr&aacute;ch Ph&ograve;ng Vật tư, ủy vi&ecirc;n Hội đồng mua sắm, th&agrave;nh vi&ecirc;n tổ thẩm định; Nghi&ecirc;m Tuấn Linh, cựu ph&oacute; trưởng ph&ograve;ng Vật tư, th&agrave;nh vi&ecirc;n tổ chuy&ecirc;n gia đấu thầu...</p>

<p>&Ocirc;ng Tuấn bị khởi tố h&ocirc;m 21/10 về tội&nbsp;<em>Vi phạm c&aacute;c quy định về đấu thầu g&acirc;y hậu quả nghi&ecirc;m trọng,&nbsp;</em>theo điều 222 Bộ luật H&igrave;nh sự, sau 3 th&aacute;ng dẫn đầu đo&agrave;n y, b&aacute;c sĩ Bệnh viện Bạch Mai v&agrave;o chi viện cho TP HCM chống dịch Covid-19. Tại đ&acirc;y, &ocirc;ng l&agrave;m Gi&aacute;m đốc Trung t&acirc;m hồi sức Bệnh viện d&atilde; chiến số 16 đặt tại quận 7.</p>

<p>&Ocirc;ng Tuấn c&oacute; nhiều năm l&agrave;m giảng vi&ecirc;n bộ m&ocirc;n Tim mạch, Đại học Y H&agrave; Nội. Từ 3/2020 đến nay, &ocirc;ng l&agrave;m Gi&aacute;m đốc Bệnh viện Bạch Mai, Hiệu trưởng Cao đẳng Y tế Bạch Mai; Chủ tịch Hội Tim mạch học H&agrave; Nội; Ủy vi&ecirc;n Hội đồng chuy&ecirc;n m&ocirc;n bảo vệ sức khỏe c&aacute;n bộ miền Bắc thuộc Ban Bảo vệ sức khỏe Trung ương.</p>

<p>&Ocirc;ng l&agrave; Đại biểu Quốc Hội kh&oacute;a XIV; từng nhận được nhiều bằng khen của Thủ tướng; Danh hiệu &quot;C&ocirc;ng d&acirc;n thủ đ&ocirc; ưu t&uacute;&quot; năm 2016; Thầy thuốc ưu t&uacute; năm 2017; Hu&acirc;n chương Lao động hạng Ba năm 2019... Ng&agrave;y 16/5, &ocirc;ng xin r&uacute;t khỏi danh s&aacute;ch ứng cử đại biểu Quốc hội kh&oacute;a XV v&igrave; &quot;l&yacute; do sức khoẻ&quot;.</p>
', CAST(N'2021-12-07' AS Date), 15, 1, 1, 1)
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (17, N'5 người đi ôtô tạt sơn căn nhà', N'chiec-quan-tai-5195-1639111283.jpg', N'<p>B&Igrave;NH THUẬNNgo&agrave;i chiếc qu&aacute;ch (loại đựng tro cốt) đặt trước cửa gia đ&igrave;nh F0 đang c&aacute;ch ly y tế, camera an ninh ghi h&igrave;nh 5 người đi &ocirc;t&ocirc; tạt sơn v&agrave;o trong, nghi để đ&ograve;i nợ.</p>

<p>Ng&agrave;y 10/12, C&ocirc;ng an huyện H&agrave;m Thuận Nam x&aacute;c định sự việc g&acirc;y mất an ninh trật tự, truy x&eacute;t nh&oacute;m thủ phạm để xử l&yacute;.</p>

<p><img alt="Hiện trường vụ tạt sơn và mang quách bỏ trước nhà f0 ở xã Tân Thành, sáng 9/12. Ảnh: Văn Lâm" src="https://i1-vnexpress.vnecdn.net/2021/12/10/Hien-truong-vu-tat-son-2299-1639111283.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=0zENErb4W6pw9f5JcOj-KA" /></p>

<p>Nh&agrave; F0 bị tạt sơn, &quot;khủng bố tinh thần&quot;. Ảnh:&nbsp;<em>Tư Huynh</em></p>

<p>S&aacute;ng 9/10, 7 người trong gia đ&igrave;nh F0 - đang thực hiện c&aacute;ch ly y tế, điều trị tại nh&agrave; ở x&atilde; T&acirc;n Th&agrave;nh, hoảng hốt khi thấy trước cửa chiếc qu&aacute;ch c&oacute; d&ograve;ng chữ &quot;Thoa về trả nợ&quot; v&agrave; xấp giấy v&agrave;ng m&atilde; phủ ph&iacute;a tr&ecirc;n. Trước s&acirc;n, cổng bảng hiệu tạp h&oacute;a của gia đ&igrave;nh bị tạt sơn đỏ tung t&oacute;e.</p>

<p>Tr&iacute;ch xuất camera an ninh, C&ocirc;ng an H&agrave;m Thuận Nam x&aacute;c định sự việc do 5 người đi &ocirc;t&ocirc; thực hiện l&uacute;c gần 1h s&aacute;ng. Nh&oacute;m n&agrave;y đeo khẩu trang, h&igrave;nh ảnh camera mờ, n&ecirc;n cảnh s&aacute;t chưa thể nhận dạng.</p>

<p><img alt="Chiếc quách do nhóm người đi ôtô bỏ trước nhà gia đình f0. Ảnh: Tư Huynh" src="https://i1-vnexpress.vnecdn.net/2021/12/10/chiec-quan-tai-5195-1639111283.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=y7n65wVLZFNXZyARFKCrIw" /></p>

<p>Chiếc qu&aacute;ch do nh&oacute;m người đi &ocirc;t&ocirc; bỏ trước nh&agrave; F0. Ảnh:&nbsp;<em>Tư Huynh</em></p>

<p>Theo tường tr&igrave;nh của chủ nh&agrave;, con g&aacute;i họ c&oacute; vay tiền của người ở TP Phan Thiết. Tiền l&atilde;i qu&aacute; cao, gia đ&igrave;nh đ&atilde; b&aacute;n một mảnh đất trả nợ nhưng chưa đủ theo y&ecirc;u cầu. Vợ chồng chủ nợ từng đe dọa sẽ &quot;xẻo thịt&quot;, thu&ecirc; người l&agrave;m đ&aacute;m tang nếu gia đ&igrave;nh kh&ocirc;ng trả hết tiền.</p>
', CAST(N'2021-12-08' AS Date), 17, 1, 1, 1)
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (18, N'Câu đố: Tìm bằng chứng lật tẩy âm mưu của người vợ', N'6-3376-1639044081.jpg', N'<p>Bạn h&atilde;y quan s&aacute;t h&igrave;nh vẽ v&agrave; lời khai để l&yacute; giải vụ &aacute;n người vợ b&agrave;y mưu hại người chồng triệu ph&uacute;.</p>

<p><strong>C&acirc;u 1:&nbsp;</strong>S&aacute;ng chủ nhật, cảnh s&aacute;t nhận được cuộc gọi từ c&ocirc; Hops, vợ của một triệu ph&uacute; nổi tiếng, th&ocirc;ng b&aacute;o chồng đang bị mắc kẹt trong ng&ocirc;i nh&agrave; ch&aacute;y. Cảnh s&aacute;t v&agrave; xe cứu hỏa lập tức đến hiện trường. Họ hỏi c&ocirc; Hops xem chuyện g&igrave; đ&atilde; xảy ra.</p>

<p>&quot;T&ocirc;i kh&ocirc;ng biết. T&ocirc;i đang đi mua sắm th&igrave; chồng gọi n&oacute;i nh&agrave; bị ch&aacute;y. T&ocirc;i chưa kịp hỏi th&ecirc;m th&igrave; anh ấy bất tỉnh&quot;, Hops n&oacute;i.</p>

<p>Tại hiện trường, cảnh s&aacute;t t&igrave;m thấy &ocirc;ng Hops nằm gục tr&ecirc;n b&agrave;n v&igrave; h&iacute;t phải kh&oacute;i nhưng may mắn vẫn c&ograve;n sống. Sau khi điều tra, cảnh s&aacute;t nhận định c&ocirc; Hops đ&atilde; đ&aacute;nh ngất chồng rồi ph&oacute;ng hỏa để mưu s&aacute;t chồng.</p>

<p>Họ đ&atilde; suy luận từ đ&acirc;u?</p>

<p><img alt="Câu đố: Tìm bằng chứng lật tẩy âm mưu của người vợ" src="https://i1-vnexpress.vnecdn.net/2021/12/09/0-3274-1639044081.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=AU81eouiiyO8HZu-IEYrxg" /></p>

<p><a href="https://vnexpress.net/cau-do-suy-luan-tim-bang-chung-lat-tay-am-muu-cua-nguoi-vo-4400946-p2.html" title="&gt;&gt;Đáp án"><strong>&gt;&gt;Đ&aacute;p &aacute;n</strong></a></p>

<p><strong>C&acirc;u 2:&nbsp;</strong>Mary đang l&aacute;i chiếc BMW mới tr&ecirc;n đường nhưng đi kh&ocirc;ng chắc tay. Khi v&ograve;ng qua kh&uacute;c quanh, c&ocirc; đ&acirc;m phải một người đi xe đạp. Kh&ocirc;ng may, nạn nh&acirc;n tử vong tại chỗ.</p>

<p>Tại hiện trường, cảnh s&aacute;t x&aacute;c định Mary kh&ocirc;ng c&oacute; bằng l&aacute;i xe, đang đi học l&aacute;i. Trong tai nạn n&agrave;y, một kẻ kh&aacute;c bị buộc tội g&acirc;y tai nạn.</p>

<p>Chuyện g&igrave; đ&atilde; xảy ra?</p>

<p><img alt="Câu đố: Tìm bằng chứng lật tẩy âm mưu của người vợ - 1" src="https://i1-vnexpress.vnecdn.net/2021/12/09/2-4866-1639044081.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=Aa8tE2T0igykQTUshivC0w" /></p>

<p><a href="https://vnexpress.net/cau-do-suy-luan-tim-bang-chung-lat-tay-am-muu-cua-nguoi-vo-4400946-p3.html" title="&gt;&gt;Đáp án"><strong>&gt;&gt;Đ&aacute;p &aacute;n</strong></a></p>

<p><strong>C&acirc;u 3:&nbsp;</strong>C&ocirc; g&aacute;i xinh đẹp Nicole l&agrave; nạn nh&acirc;n của vụ &aacute;n mạng. Cảnh s&aacute;t t&igrave;m thấy một con dao b&ecirc;n cạnh thi thể v&agrave; thu được dấu v&acirc;n tay tr&ecirc;n đ&oacute;.</p>

<p>Nicole c&oacute; rất nhiều người theo đuổi khiến c&ocirc; gặp rắc rối v&igrave; bị đeo b&aacute;m, ghen tu&ocirc;ng. Cảnh s&aacute;t thu thập tất cả dấu v&acirc;n tay của những người c&oacute; động cơ, gồm: Carl - chồng Nicole; Mike - người y&ecirc;u cũ, Mia - bạn g&aacute;i của Mike, Chuck - người bị Nicole từ chối t&igrave;nh cảm.</p>

<p>Bạn h&atilde;y đối chiếu c&aacute;c dấu v&acirc;n tay với dấu v&acirc;n tay tr&ecirc;n hung kh&iacute; để xem đ&acirc;y l&agrave; vụ giết người hay tự s&aacute;t?</p>

<p><img alt="Câu đố: Tìm bằng chứng lật tẩy âm mưu của người vợ - 2" src="https://i1-vnexpress.vnecdn.net/2021/12/09/4-3834-1639044081.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=J48MK_bp7wFmxAhwtAm0Xw" /></p>

<p><a href="https://vnexpress.net/cau-do-suy-luan-tim-bang-chung-lat-tay-am-muu-cua-nguoi-vo-4400946-p4.html" title="&gt;&gt;Đáp án"><strong>&gt;&gt;Đ&aacute;p &aacute;n</strong></a></p>

<p><strong>C&acirc;u 4:&nbsp;</strong>&Ocirc;ng chủ đi thị s&aacute;t c&ocirc;ng trường x&acirc;y dựng để kiểm tra tiến độ thi c&ocirc;ng kh&aacute;ch sạn mới. Khi đi rửa tay, &ocirc;ng th&aacute;o chiếc đồng hồ đắt tiền đặt tr&ecirc;n b&agrave;n. Một c&ocirc;ng nh&acirc;n vụt đến cướp lấy vật n&agrave;y v&agrave; chạy trốn. Chủ kh&aacute;ch sạn kh&ocirc;ng nh&igrave;n r&otilde; kẻ gian l&agrave; ai n&ecirc;n gọi cảnh s&aacute;t.</p>

<p>Cảnh s&aacute;t t&igrave;m ra ba kẻ t&igrave;nh nghi. Kiến tr&uacute;c sư n&oacute;i anh đang gọi điện thoại b&agrave;n về việc lắp đặt hệ thống điện cho c&ocirc;ng trường. Nh&agrave; thiết kế cho biết đang bận rộn t&igrave;m kiếm bản vẽ đẹp nhất cho c&aacute;c bức tường. Thợ điện giải th&iacute;ch rằng đang ở dưới tầng hầm để sửa chiếc b&oacute;ng đ&egrave;n bị ch&aacute;y.</p>

<p>Cảnh s&aacute;t đ&atilde; nhanh ch&oacute;ng t&igrave;m ra kẻ n&oacute;i dối, đ&oacute; l&agrave; ai?</p>

<p>&nbsp;</p>

<p><img alt="Câu đố: Tìm bằng chứng lật tẩy âm mưu của người vợ - 3" src="https://i1-vnexpress.vnecdn.net/2021/12/09/6-3376-1639044081.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=kEJ7h174FMSAuZ0BKMBiMw" /></p>
', CAST(N'2021-12-10' AS Date), 12, 1, 6, 1)
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (19, N'Bé trai bị vỡ gan, dập phổi', N'264835757-3427769007450723-771-9340-8178-1639049767.jpg', N'<div>
<p>QUẢNG NINH</p>

<p>B&eacute; 7 tuổi ở Hạ Long, bị tai nạn giao th&ocirc;ng đa chấn thương vỡ gan, dập phổi, nguy kịch.</p>

<p>B&aacute;c sĩ L&ecirc; Tiến Hưng, Đơn nguy&ecirc;n Điện quang can thiệp, Bệnh viện B&atilde;i Ch&aacute;y, ng&agrave;y 9/12 cho biết bệnh nhi bị chấn thương gan độ 4, chấn thương tuyến thượng thận phải, dập phổi hai b&ecirc;n... ảnh hưởng h&ocirc; hấp, nguy cơ tử vong. T&igrave;nh trạng bệnh nh&acirc;n đ&ograve;i hỏi c&aacute;c b&aacute;c sĩ phải xử tr&iacute; khẩn trương, đặt nội kh&iacute; quản kiểm so&aacute;t đường thở, điều trị bằng n&uacute;t mạch kết hợp hồi sức t&iacute;ch cực.</p>

<p>Tuy nhi&ecirc;n, n&uacute;t mạch tr&ecirc;n bệnh nhi l&agrave; th&aacute;ch thức đối với b&aacute;c sĩ, bởi từ trước đến nay đa số ca n&uacute;t mạch đều tr&ecirc;n người trưởng th&agrave;nh. Phương ph&aacute;p n&uacute;t mạch tức l&agrave; b&aacute;c sĩ đưa ống sone v&agrave;o vị tr&iacute; vỡ của tạng để b&iacute;t lỗ r&ograve; cầm m&aacute;u. &quot;Trường hợp của b&eacute;, k&iacute;p mổ gặp kh&oacute; khăn về dụng cụ can thiệp, cụ thể l&agrave; c&aacute;c sonde để can thiệp đều kh&ocirc;ng vừa với trẻ nhỏ, đ&ograve;i hỏi b&aacute;c sĩ phải linh hoạt cải tiến dụng cụ ph&ugrave; hợp, đảm bảo an to&agrave;n cho bệnh nhi&quot;, b&aacute;c sĩ Hưng n&oacute;i. T&igrave;nh trạng bệnh nh&acirc;n kh&ocirc;ng thể chuyển tuyến, nguy cơ sốc do mất m&aacute;u, vỡ gan, suy h&ocirc; hấp... đe dọa tử vong.</p>

<p>Trong qu&aacute; tr&igrave;nh n&uacute;t mạch, c&aacute;c b&aacute;c sĩ phải theo d&otilde;i s&aacute;t c&aacute;c chức năng sinh tồn của b&eacute;, dấu hiệu mất m&aacute;u, chức năng h&ocirc; hấp để tr&aacute;nh biến chứng do hậu quả đa chấn thương như vi&ecirc;m phổi tiến triển nặng, suy tạng...</p>

<p>&quot;Rất may mắn, đến l&uacute;c n&agrave;y, bệnh nhi đ&atilde; tho&aacute;t nguy kịch, chỉ số sinh tồn ổn định, tỉnh t&aacute;o, giao tiếp tốt&quot;, b&aacute;c sĩ Nguyễn Thế Hưng (Trưởng Khoa Hồi sức t&iacute;ch cực) n&oacute;i.</p>

<p>Phương ph&aacute;p n&uacute;t mạch cấp cứu đ&atilde; được c&aacute;c b&aacute;c sĩ Bệnh viện B&atilde;i Ch&aacute;y thực hiện hiệu quả tr&ecirc;n bệnh nh&acirc;n vỡ tạng như gan, thận, l&aacute;ch... Đ&acirc;y l&agrave; giải ph&aacute;p gi&uacute;p bệnh nh&acirc;n kh&ocirc;ng phải trải qua ca đại phẫu, tr&aacute;nh biến chứng chảy m&aacute;u kh&ocirc;ng cầm, nhiễm tr&ugrave;ng vết mổ. Ưu điểm của n&uacute;t mạch cầm m&aacute;u vỡ gan l&agrave; bảo tồn gan, hạn chế tối đa x&acirc;m lấn gi&uacute;p tổn thương ở gan phục hồi nhanh ch&oacute;ng. Vị tr&iacute; luồn thiết bị can thiệp k&iacute;ch thước rất nhỏ, chỉ khoảng 0,5 mm, kh&ocirc;ng chảy m&aacute;u, kh&ocirc;ng để lại sẹo.</p>

<p><img alt="Can thiệp nút mạch cầm máu chấn thương vỡ gan độ 4 cho bệnh nhi trên hệ thống DSA. Ảnh: Bệnh viện cung cấp" src="https://i1-suckhoe.vnecdn.net/2021/12/09/264835757-3427769007450723-771-9340-8178-1639049767.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=5ok5wQzrvtnyWYuuln6IDw" /></p>

<p><iframe frameborder="0" height="0" id="google_ads_iframe_/27973503/Vnexpress/Desktop/Inimage/Suckhoe/suckhoe.tintuc.detail_0" name="" scrolling="no" src="https://a08625a66f7f9c44b0a6333ca58f4ac1.safeframe.googlesyndication.com/safeframe/1-0-38/html/container.html" title="3rd party ad content" width="0"></iframe></p>

<p>Can thiệp n&uacute;t mạch cầm m&aacute;u chấn thương vỡ gan độ 4 cho bệnh nhi. Ảnh:<em>&nbsp;Bệnh viện cung cấp</em></p>

<p><strong>Th&ugrave;y Anh</strong></p>
</div>

<div class="box-cate-featured box-category box-covid-2021 has-border">&nbsp;</div>
', CAST(N'2021-12-10' AS Date), 21, 1, 8, 1)
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (20, N'Thầy giáo Thể dục đánh nhiều học sinh', N'thay-giao-danh-hoc-sinh-5177-1639125298.jpg', N'<p>LAI CH&Acirc;U</p>

<p>Một gi&aacute;o vi&ecirc;n Thể dục ở huyện Than Uy&ecirc;n bị ghi lại h&igrave;nh ảnh đang đ&aacute;nh đập nhiều nam sinh.</p>

<p>Chiều 9/12, một video d&agrave;i 22 gi&acirc;y k&egrave;m ch&uacute; th&iacute;ch &quot;Thầy gi&aacute;o đ&aacute;nh học sinh d&atilde; man tại trường THCS Mường Cang, x&atilde; Mường Cang, huyện Than Uy&ecirc;n, tỉnh Lai Ch&acirc;u&quot; được lan truyền tr&ecirc;n mạng x&atilde; hội.</p>

<p>Trong video, người đ&agrave;n &ocirc;ng mặc &aacute;o đỏ t&uacute;m t&oacute;c, t&aacute;t li&ecirc;n tiếp v&agrave;o mặt, đầu, d&ugrave;ng ch&acirc;n đ&aacute; v&agrave;o &iacute;t nhất hai nam sinh mặc đồng phục trường THCS x&atilde; Mường Cang, trước sự chứng kiến của nhiều học sinh kh&aacute;c. Người n&agrave;y sau đ&oacute; đi v&agrave;o một ph&ograve;ng cạnh nơi học sinh tập trung n&oacute;i lớn &quot;C&ograve;n thằng n&agrave;o nữa&quot; v&agrave; y&ecirc;u cầu &quot;đứng dậy, đứng ra ngo&agrave;i n&agrave;y&quot;.</p>

<p><img alt="Hình ảnh từ đoạn clip lan truyền trên mạng xã hội." src="https://i1-vnexpress.vnecdn.net/2021/12/10/thay-giao-danh-hoc-sinh-5177-1639125298.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=vNj9GxwETKT0_0Fa1AKXkA" /></p>

<p><iframe frameborder="0" height="1" id="google_ads_iframe_/27973503/Vnexpress/Desktop/Inimage/Giaoduc/Giaoduc.detail_0" name="google_ads_iframe_/27973503/Vnexpress/Desktop/Inimage/Giaoduc/Giaoduc.detail_0" scrolling="no" title="3rd party ad content" width="1"></iframe></p>

<p>H&igrave;nh ảnh từ video.</p>

<p>&Ocirc;ng Trịnh Ngọc Hải, Trưởng ph&ograve;ng Gi&aacute;o dục v&agrave; Đ&agrave;o tạo huyện Than Uy&ecirc;n, cho hay, sự việc xảy ra v&agrave;o ng&agrave;y 6/11 tại trường THCS Mường Cang.&nbsp;<strong>Người h&agrave;nh hung học tr&ograve; l&agrave; thầy gi&aacute;o thể dục với 17-18 năm kinh nghiệm trong ng&agrave;nh.</strong></p>

<p>Những em bị thầy đ&aacute;nh học lớp 8C của trường. &quot;Thầy gi&aacute;o đang bị đ&igrave;nh chỉ c&ocirc;ng t&aacute;c để chờ kết quả x&aacute;c minh. Thầy đ&atilde; c&oacute; tường tr&igrave;nh v&agrave; nh&agrave; trường đ&atilde; c&oacute; b&aacute;o c&aacute;o gửi cơ quan chức năng. Tuy nhi&ecirc;n, ch&uacute;ng t&ocirc;i cần x&aacute;c minh th&ecirc;m nguy&ecirc;n nh&acirc;n v&agrave; c&aacute;c vấn đề li&ecirc;n quan&quot;, &ocirc;ng Hải n&oacute;i.</p>

<p>&Ocirc;ng Lưu Hồng Phương, Ph&oacute; gi&aacute;m đốc Sở Gi&aacute;o dục v&agrave; Đ&agrave;o tạo tỉnh Lai Ch&acirc;u, cho hay tỉnh chưa từng ghi nhận sự việc tương tự trong những năm gần đ&acirc;y. &quot;Quan điểm của ch&uacute;ng t&ocirc;i l&agrave; xử l&yacute; nghi&ecirc;m theo quy định&quot;, &ocirc;ng Phương n&oacute;i.</p>

<p>&Ocirc;ng L&igrave;m Văn Khơi, Chủ tịch UBND x&atilde; Mường Cang, cũng cho biết x&atilde; đ&atilde; nắm được th&ocirc;ng tin v&agrave;o tối qua, sau khi xem video. Theo sự chỉ đạo của UBND huyện, Ph&ograve;ng Gi&aacute;o dục v&agrave; Đ&agrave;o tạo đang phối hợp với C&ocirc;ng an huyện, Ph&ograve;ng Nội vụ v&agrave; ch&iacute;nh quyền địa phương x&aacute;c minh sự việc.</p>

<p>Từ đầu năm học, hơn 150.000 học sinh Lai Ch&acirc;u được đến trường học trực tiếp do tỉnh n&agrave;y &iacute;t bị ảnh hưởng bởi Covid-19. Trong đợt dịch thứ tư kể từ cuối th&aacute;ng 4 đến nay, to&agrave;n tỉnh ghi nhận 39 ca F0, trong đ&oacute; ca gần nhất được ph&aacute;t hiện v&agrave;o ng&agrave;y 8/12, từ TP HCM đến.</p>
', CAST(N'2021-12-08' AS Date), 11, 1, 7, 1)
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (21, N'Cậu bé lớp 6 cứu sống bạn bị đuối nước', N'khen-6104-1639058082.jpg', N'<p>H&Agrave; NỘI</p>

<p>C&ugrave;ng ng&atilde; xuống giếng ch&ugrave;a, Minh Đức v&ugrave;ng vẫy, b&aacute;m được v&agrave;o bờ, sau đ&oacute; nhổ cọc tre, l&ocirc;i người bạn đang lịm dần dưới nước l&ecirc;n.</p>

<p>H&agrave; C&ocirc;ng Minh Đức kể, chiều 7/12, em v&agrave; Nguyễn Hữu Bắc, trường Tiểu học T&acirc;y Tựu A, chơi trong s&acirc;n ch&ugrave;a Hưng Kh&aacute;nh, phường T&acirc;y Tựu, quận Bắc Từ Li&ecirc;m, c&aacute;ch nh&agrave; khoảng 600 m. Ch&ugrave;a c&oacute; giếng nước lớn, đường k&iacute;nh hơn 20 m, s&acirc;u khoảng 2 m. Hai em ra giếng cho c&aacute; ăn th&igrave; Bắc trượt ch&acirc;n ng&atilde;. Trong l&uacute;c v&ugrave;ng vẫy, Bắc v&ocirc; t&igrave;nh l&ocirc;i cả Đức xuống nước.</p>

<p>&quot;L&uacute;c ấy con rất sợ, cố đạp mạnh rồi với tay b&aacute;m được v&agrave;o bờ. L&ecirc;n khỏi giếng, con nhổ cọc tre gần đ&oacute; v&agrave; bảo &#39;Bắc ơi cố l&ecirc;n&#39;. Thấy Bắc nổi l&ecirc;n, con cố hết sức k&eacute;o bạn v&agrave;o&quot;, Minh Đức, lớp 6A6, trường THCS T&acirc;y Tựu nhớ lại.</p>

<p>Đưa được bạn l&ecirc;n bờ, Đức tiến h&agrave;nh sơ cứu, &eacute;p ngực. Kh&ocirc;ng thấy bạn c&oacute; phản ứng, cậu b&eacute; hoảng sợ đi gọi sư b&aacute;c v&agrave; h&ocirc; ho&aacute;n. Người d&acirc;n xung quanh chạy tới, gi&uacute;p Bắc tỉnh lại, sưởi ấm v&agrave; đưa đến trạm y tế.</p>

<p><img alt="Đức đứng trong sân chùa, sau khi đưa được bạn từ giếng lên bờ chiều 7/12. Ảnh: Hà Thái Dương" src="https://i1-vnexpress.vnecdn.net/2021/12/09/khen3-3012-1639058082.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=OfOMJRstysjyE71tFS2s-Q" /></p>

<p>Đức đứng trong s&acirc;n ch&ugrave;a, sau khi đưa được bạn từ giếng l&ecirc;n bờ chiều 7/12. Ảnh:&nbsp;<em>H&agrave; Th&aacute;i Dương</em></p>

<p>H&agrave; Th&aacute;i Dương, b&iacute; thư Đo&agrave;n phường T&acirc;y Tựu, l&agrave; một trong những người chạy đến khi nghe tiếng k&ecirc;u cứu. &quot;Thấy Bắc nằm s&otilde;ng so&agrave;i, lịm dần, t&ocirc;i vội v&aacute;c l&ecirc;n vai rồi chạy một đoạn, tới khi cậu b&eacute; kh&oacute;c to. Nghe tiếng kh&oacute;c, t&ocirc;i v&agrave; mọi người mới y&ecirc;n t&acirc;m&quot;, anh Dương kể.</p>

<p>Theo anh Dương, Bắc hiện điều trị tại Bệnh viện E v&igrave; bị vi&ecirc;m phổi nhưng đ&atilde; ổn định.</p>

<p>Gần hai ng&agrave;y sau, Minh Đức chưa hết &aacute;m ảnh. Em ngủ chập chờn, hay giật m&igrave;nh tỉnh dậy v&agrave; nhớ lại cảnh m&igrave;nh chới với dưới nước. Kh&ocirc;ng biết bơi nhưng nhờ những kỹ năng học ở trường v&agrave; xem tr&ecirc;n mạng, Đức đ&atilde; cứu được bạn.</p>

<p>&quot;Con cảm thấy nhẹ nh&otilde;m khi bạn c&ograve;n sống. Nếu l&uacute;c đ&oacute; con bỏ đi, con sẽ &aacute;y n&aacute;y lắm. L&uacute;c dưới nước, con tưởng m&igrave;nh sẽ chết&quot;, Đức chia sẻ.</p>

<p>Sau sự việc, Đức r&uacute;t ra b&agrave;i học kh&ocirc;ng chơi chỗ nguy hiểm m&agrave; kh&ocirc;ng c&oacute; người lớn gi&aacute;m s&aacute;t. Cậu cũng mong Bắc sớm khỏe lại v&agrave; đi học b&igrave;nh thường.</p>

<p>Đức l&agrave; con trai &uacute;t trong gia đ&igrave;nh c&oacute; ba anh em. Cậu b&eacute; nhanh nhẹn, th&ocirc;ng minh v&agrave; hoạt ng&ocirc;n. Sau giờ học, Đức thường ra ruộng hoa của gia đ&igrave;nh gi&uacute;p đỡ bố mẹ.</p>

<p><img alt="Anh Dương (bìa phải) tới động viên và khen thưởng Đức ngay hôm 7/12. Ảnh: Hà Thái Dương" src="https://i1-vnexpress.vnecdn.net/2021/12/09/khen-6104-1639058082.jpg?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=UWts6OBjWFGEnyTBcbZqCg" /></p>

<p>Anh Dương (b&igrave;a phải) tới động vi&ecirc;n v&agrave; khen thưởng Đức ngay trong ng&agrave;y 7/12. Ảnh:&nbsp;<em>H&agrave; Th&aacute;i Dương</em></p>

<p>Chiều 7/12, anh Dương thay mặt Đo&agrave;n phường tới thăm hỏi v&agrave; khen thưởng h&agrave;nh động của Đức. Quận Đo&agrave;n v&agrave; th&agrave;nh Đo&agrave;n sau đ&oacute; cũng tặng bằng khen cho anh Dương v&agrave; em Đức.</p>

<p>&quot;Sau vụ việc, ch&uacute;ng t&ocirc;i sẽ tăng cường tuy&ecirc;n truyền với mọi người về sự nguy hiểm của đuối nước v&agrave; c&aacute;ch sơ cấp cứu khi c&oacute; người gặp nạn&quot;, anh Dương cho hay.</p>

<p><strong>B&igrave;nh Minh</strong></p>
', CAST(N'2021-12-10' AS Date), 33, 1, 1, 1)
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (22, N'Kiều hối về Việt Nam dự kiến lập kỷ lục mới', N'screen-shot-2021-12-10-at-6-11-9021-7632-1639136097.png', N'<p>Bất chấp Covid-19, kiều hối về Việt Nam năm nay dự kiến đạt hơn 18 tỷ USD, cao nhất từ trước đến nay v&agrave; thuộc top 10 nước nhận kiều hối lớn nhất.</p>

<p>Ng&acirc;n h&agrave;ng Thế giới (WB) v&agrave; Tổ chức hợp t&aacute;c quốc tế về người di cư (KNOMAD) dự b&aacute;o lượng kiều hối về Việt Nam năm 2021 tăng 5% so với năm ngo&aacute;i l&ecirc;n 18,06 tỷ USD (chiếm 4,9% GDP).</p>

<p>Với mức n&agrave;y, lượng kiều hối của Việt Nam đứng thứ 3 trong khu vực Đ&ocirc;ng &Aacute; - Th&aacute;i B&igrave;nh Dương v&agrave; xếp thứ 8 thế giới.</p>

<p><img alt="Lượng kiều hố đổ về các nước dự kiến năm 2021, đơn vị Tỷ USDi. Nguồn: WB và KNOMAD." src="https://i1-kinhdoanh.vnecdn.net/2021/12/10/screen-shot-2021-12-10-at-6-11-9021-7632-1639136097.png?w=680&amp;h=0&amp;q=100&amp;dpr=1&amp;fit=crop&amp;s=P_k-r-BSXD6OlRbhtKR4Sw" /></p>

<p><iframe frameborder="0" height="1" id="google_ads_iframe_/27973503/Vnexpress/Desktop/Inimage/Kinhdoanh/Kinhdoanh.ebank.detail_0" name="google_ads_iframe_/27973503/Vnexpress/Desktop/Inimage/Kinhdoanh/Kinhdoanh.ebank.detail_0" scrolling="no" title="3rd party ad content" width="1"></iframe></p>

<p>Lượng kiều hố đổ về c&aacute;c nước dự kiến năm 2021, đơn vị tỷ USD.&nbsp;<em>Nguồn: WB v&agrave; KNOMAD.</em></p>

<p>Kh&ocirc;ng chỉ tại Việt Nam, lượng kiều hối ghi nhận về c&aacute;c nước thu nhập thấp v&agrave; trung b&igrave;nh cũng tăng hơn 7%, l&ecirc;n mức 589 tỷ USD trong năm nay. Lượng kiều hối tăng bất chấp đại dịch được &ocirc;ng Michal Rutkowski, Gi&aacute;m đốc To&agrave;n cầu của Ng&acirc;n h&agrave;ng Thế giới (WB) về an sinh x&atilde; hội v&agrave; việc l&agrave;m l&yacute; giải, do người di cư quyết t&acirc;m gi&uacute;p đỡ gia đ&igrave;nh v&agrave; sự phục hồi kinh tế ở ch&acirc;u &Acirc;u, Mỹ nhờ lực đẩy từ c&aacute;c g&oacute;i k&iacute;ch th&iacute;ch t&agrave;i kh&oacute;a, chương tr&igrave;nh hỗ trợ việc l&agrave;m.</p>

<p>Tại Việt Nam, TP HCM l&agrave; một trong những địa phương c&oacute; lượng kiều hối cao nhất, chiếm khoảng 30%, sau đ&oacute; l&agrave; c&aacute;c tỉnh miền Trung, miền Bắc v&agrave; miền T&acirc;y.</p>

<p>Hiện nay, kiều hối chuyển về Việt Nam qua hai k&ecirc;nh ng&acirc;n h&agrave;ng thương mại v&agrave; c&aacute;c c&ocirc;ng ty kiều hối. Tại Agribank, một trong c&aacute;c đơn vị chi trả kiều hối lớn nhất, dự kiến lượng kiều hối cả năm đạt 1,2 tỷ USD, tăng 15% so với năm ngo&aacute;i.</p>

<p>Chia sẻ với&nbsp;<em>VnExpress</em>, &ocirc;ng Nguyễn Quốc H&ugrave;ng, Gi&aacute;m đốc trung t&acirc;m dịch vụ thanh to&aacute;n v&agrave; kiều hối Agribank cho biết, t&iacute;nh đến cuối th&aacute;ng 11, lượng kiều hối Agribank chi trả đ&atilde; đạt 1,1 tỷ USD. Việc mở rộng hợp t&aacute;c với hai đơn vị chuyển tiền 24/7 tại Nhật Bản cũng g&oacute;p phần v&agrave;o tăng trưởng kiều hối chi trả qua hệ thống Agribank.</p>

<p>Tỷ USDLượng kiều hối đổ về Việt Nam*:Dự đo&aacute;n. Nguồn số liệu: WB3.153.153.83.86.186.186.86.86.026.028.268.268.68.61010111112121313141415151616171717.217.218.0618.062006200820102012201420162018202005101520VnExpress</p>

<p>4 thị trường chiếm thị phần kiều hối lớn nhất tại nh&agrave; băng n&agrave;y l&agrave; Nhật Bản (14%), Mỹ (12%), Đ&agrave;i Loan (4,5%) v&agrave; H&agrave;n Quốc 3%, c&ograve;n lại chia đều cho c&aacute;c thị trường kh&aacute;c. &Ocirc;ng H&ugrave;ng cho biết, kiều hối chi trả qua Agribank chủ yếu đến từ c&ocirc;ng nh&acirc;n xuất khẩu lao động với gi&aacute; trị mỗi giao dịch từ v&agrave;i trăm USD đến ngh&igrave;n USD.</p>

<p>C&ograve;n &ocirc;ng Đ&agrave;o Minh Tuấn, Ph&oacute; tổng gi&aacute;m đốc Ng&acirc;n h&agrave;ng Ngoại Thương - Vietcombank nhận định, cũng như mọi năm, lượng kiều hối chuyển về được ghi nhận nhiều nhất l&agrave; ở khu vực Bắc Mỹ (Mỹ v&agrave; Canada), ch&acirc;u &Aacute;, ch&acirc;u &Uacute;c v&agrave; ch&acirc;u &Acirc;u. Thị trường Mỹ - nơi c&oacute; nhiều người Việt sinh sống v&agrave; l&agrave;m việc - chiếm tới 50% tổng lượng kiều hối về Việt Nam, g&oacute;p phần lớn trong việc giữ Việt Nam nằm trong top 10 quốc gia nhận tiền kiều hối lớn nhất thế giới.</p>

<p>Vietcombank cũng ghi nhận một lượng kiều hối lớn từ c&aacute;c nước v&agrave; v&ugrave;ng l&atilde;nh thổ ở ch&acirc;u &Aacute; như H&agrave;n Quốc, Nhật Bản v&agrave; Đ&agrave;i Loan. Đ&acirc;y l&agrave; những nơi c&oacute; lượng người Việt sang lao động v&agrave; học tập đ&ocirc;ng đảo, do đ&oacute;, nhu cầu gửi tiền về để trả nợ vay ng&acirc;n h&agrave;ng cũng như hỗ trợ cuộc sống người th&acirc;n ở Việt Nam kh&aacute; lớn.</p>

<p>Ở ch&acirc;u &Acirc;u v&agrave; ch&acirc;u &Uacute;c, c&aacute;c ch&iacute;nh s&aacute;ch của c&aacute;c quốc gia về hoạt động kiều hối vẫn chưa c&oacute; sự cải thiện nhiều n&ecirc;n d&ograve;ng tiền kiều hối từ khu vực n&agrave;y về Việt Nam chưa c&oacute; sự tăng trưởng vượt bậc trong c&aacute;c năm vừa qua, &ocirc;ng Tuấn chia sẻ.</p>

<p>Năm ngo&aacute;i, người Việt ở nước ngo&agrave;i gửi về nước 17,2 tỷ USD, tăng nhẹ gần 3% so với năm 2019.</p>
', CAST(N'2021-12-10' AS Date), 0, 1, 3, 1)
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Account__A9D1053433ABFE13]    Script Date: 12/10/2021 10:15:55 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__ChuDe__19B17CFBE8CCB4B4]    Script Date: 12/10/2021 10:15:55 PM ******/
ALTER TABLE [dbo].[ChuDe] ADD UNIQUE NONCLUSTERED 
(
	[TenChuDe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BinhLuan] ADD  DEFAULT ((1)) FOR [TrangThai]
GO
ALTER TABLE [dbo].[BinhLuan]  WITH CHECK ADD  CONSTRAINT [FK_BinhLuan_TinTuc] FOREIGN KEY([MaTinTuc])
REFERENCES [dbo].[TinTuc] ([MaTinTuc])
GO
ALTER TABLE [dbo].[BinhLuan] CHECK CONSTRAINT [FK_BinhLuan_TinTuc]
GO
ALTER TABLE [dbo].[TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TinTuc_Account] FOREIGN KEY([MaAccount])
REFERENCES [dbo].[Account] ([MaAccount])
GO
ALTER TABLE [dbo].[TinTuc] CHECK CONSTRAINT [FK_TinTuc_Account]
GO
ALTER TABLE [dbo].[TinTuc]  WITH CHECK ADD  CONSTRAINT [FK_TinTuc_ChuDe] FOREIGN KEY([MaChuDe])
REFERENCES [dbo].[ChuDe] ([MaChuDe])
GO
ALTER TABLE [dbo].[TinTuc] CHECK CONSTRAINT [FK_TinTuc_ChuDe]
GO
ALTER TABLE [dbo].[TinTuc]  WITH CHECK ADD CHECK  (([SoLanXem]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [QLTinTuc] SET  READ_WRITE 
GO
