USE [master]
GO
/****** Object:  Database [QLTinTuc]    Script Date: 12/4/2021 6:39:02 PM ******/
CREATE DATABASE [QLTinTuc]
Go

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
/****** Object:  Table [dbo].[Account]    Script Date: 12/4/2021 6:39:02 PM ******/
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
/****** Object:  Table [dbo].[BinhLuan]    Script Date: 12/4/2021 6:39:02 PM ******/
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
/****** Object:  Table [dbo].[ChuDe]    Script Date: 12/4/2021 6:39:02 PM ******/
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
/****** Object:  Table [dbo].[TinTuc]    Script Date: 12/4/2021 6:39:02 PM ******/
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

INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (2, N'Ronaldo chào đón Rangnick', N'2.jpg', N'ANHBruno Fernandes, vì đá hỏng quả phạt đền gần nhất, nhường lại quyền thực hiện cho đàn anh Cristiano Ronaldo trong trận Man Utd hạ Arsenal 3-2 hôm 2/12.

"Chúng tôi chưa trao đổi về người sẽ đá phạt đền. Tôi đá hỏng quả penalty gần nhất, nên tôi tin tưởng Ronaldo như tin tưởng chính bản thân. Đây là lúc để Ronaldo sút phạt đền, vì tôi hỏng ăn cú gần nhất. Không quan trọng ai là người thực hiện", Fernandes nói với BBC Sport sau trận thắng tại Old Trafford.

Trước khi Ronaldo trở lại hè 2021, Fernandes luôn lãnh trách nhiệm đá 11m cho Man Utd. Tiền vệ 27 tuổi đã đá 23 quả phạt đền cho Man Utd tính trên mọi đấu trường, và hỏng ăn chỉ hai lần, ở trận thua Aston Villa 0-1 hôm 25/9, và trận gặp Newcastle mùa trước.

Cả Fernandes và Ronaldo đều vui vì cùng ghi bàn giúp Man Utd hạ Arsenal hôm 2/12. Ảnh: Reuters

Ronaldo chung vui với đồng đội sau khi ghi bàn thứ hai giúp Man Utd hạ Arsenal hôm 2/12. Ảnh: Reuters

Tại Old Trafford hôm 2/12, Arsenal mở tỷ số từ phút 13, khi Emile Smith Rowe chớp thời cơ thủ thành David De Gea nằm sân để ghi bàn bằng cú vô-lê từ ngoài cấm địa. Trước khi hiệp một khép lại, Fred nhả ngược để Fernandes sút cận thành quân bình tỷ số.

Đầu hiệp hai, Ronaldo đưa chủ nhà vượt lên dẫn trước nhờ cú đặt lòng vào góc xa. Sau khi Martin Odegaard gỡ hòa cho Arsenal, CR7 tiếp tục nổ súng với cú đá phạt đền thành bàn ấn định thắng lợi 3-2 cho "Quỷ Đỏ". Đây lần lượt là các bàn thứ 800 và 801 trong sự nghiệp của Ronaldo.

Khi được hỏi về màn trình diễn của đồng đội đàn anh, Fernandes nói: "Thật đáng kinh ngạc. Chúng ta đều biết Ronaldo luôn cải thiện qua từng trận, từng năm một. Ronaldo muốn tiếp tục làm người giỏi nhất và anh ấy nỗ lực từng ngày để làm điều đó. Ronaldo biết cách tự tạo động lực cho bản thân".

Tiền vệ Bồ Đào Nha cũng hào hứng khi Man Utd bổ nhiệm Ralf Rangnick làm HLV tạm quyền đến mùa hết mùa. Anh nói: "Bây giờ là một khởi đầu mới, một chương mới. Toàn đội đều mong muốn được sớm làm việc với Rangnick. HLV mới sẽ mang thêm nhiều cơ hội mới. Tất cả đều có cơ hội để thể hiện bản thân. Ai cũng phải nỗ lực, tập luyện chăm chỉ nếu muốn giành suất đá chính. Chúng tôi sẽ gặp Rangnick vào ngày mai và bắt tay vào chuẩn bị trận đấu tiếp theo".

Quyền HLV Michael Carrick thông báo từ chức HLV đội một và chia tay Man Utd, ngay sau trận thắng Arsenal. "Carrick có thể trở thành một HLV hàng đầu trong tương lai nếu có cơ hội. Carrick biết cách giao tiếp với cầu thủ, và rất am hiểu bóng đá", Fernandes nhắn nhủ cựu tiền vệ người Anh.

Trong 12 năm gắn bó với tư cách cầu thủ, Carrick đá 464 trận, ghi 24 bàn và cùng Man Utd đoạt 17 danh hiệu, trong đó có sáu Ngoại hạng Anh, một Champions League và một Europa League. Sau khi giải nghệ, Carrick tham gia ban huấn luyện Man Utd và được giao một chân trợ lý, phụ trách đội một dưới thời HLV trưởng Jose Mourinho, rồi tiếp tục cộng tác với Ole Gunnar Solskjaer.

Ở vòng 15 Ngoại hạng Anh cuối tuần này, Man Utd tiếp tục ở lại Old Trafford tiếp Crystal Palace ngày 5/12.', CAST(N'2021-12-04' AS Date), 1, 1, 5, 1)
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (3, N'Rangnick lần đầu chỉ đạo Man Utd cuối tuần này', N'3.jpg', N'<div class="section-inner inset-column special-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 700px; width: 700px; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <h2 style="margin: 0px 0px 1.05263rem; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; font: 400 19px / 1.618 Arial, serif;">Tiếp Crystal Palace sẽ l&agrave; thử th&aacute;ch đầu ti&ecirc;n với Ralf Rangnick tr&ecirc;n cương vị HLV tạm quyền trong s&aacute;u th&aacute;ng của Man Utd.</h2>
</div>
<div class="section-inner inset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 700px; width: 700px; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;"><b style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility;">Man Utd - Crystal Palace</b>: 21h Chủ Nhật, 5/12 (giờ H&agrave; Nội)</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">10 ng&agrave;y sau khi đạt thỏa thuận dẫn dắt Man Utd, Ralf Rangnick bắt đầu c&ocirc;ng việc tại đội b&oacute;ng mới với nhiều ho&agrave;i nghi. Sau ba năm được dẫn dắt bởi đội ngũ của Ole Gunnar Solskjaer, cầu thủ Man Utd sẽ l&agrave;m việc với một HLV mới - người m&agrave; họ biết sẽ chỉ tại vị trong s&aacute;u th&aacute;ng.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Rangnick được biết đến l&agrave; chiến lược gia t&agrave;i ba, người ti&ecirc;n phong cho lối đ&aacute; pressing tổng lực đang l&ecirc;n ng&ocirc;i. &Ocirc;ng từng l&agrave; thầy của những cầu thủ xuất sắc, tạo ra những tập thể mạnh. Nhưng thử th&aacute;ch tại s&acirc;n Old Trafford ho&agrave;n to&agrave;n kh&aacute;c. Rangnick kh&ocirc;ng ở m&ocirc;i trường b&oacute;ng đ&aacute; Đức quen thuộc, v&agrave; nếu n&acirc;ng tầm Man Utd th&agrave;nh c&ocirc;ng, đ&oacute; sẽ l&agrave; mốc son trong sự nghiệp của HLV 63 tuổi.</p>
    <div class="medium-insert-images" style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; text-align: center; position: relative; z-index: 9;">
        <figure style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; display: block;"><img src="https://i1-thethao.vnecdn.net/2021/12/04/Rangnick2-jpeg-7765-1638580209.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=DjAXgj-XS0iDmGsbX5BW3A" alt="" style="padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%;"></figure>
    </div>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Ngo&agrave;i ra, Rangnick nổi tiếng l&agrave; người coi trọng hệ thống chiến thuật. Nhưng Man Utd hiện tại sở hữu những si&ecirc;u sao v&agrave; những cầu thủ th&iacute;ch chơi ngẫu hứng. Đ&acirc;y l&agrave; vấn đề phổ biến ở những CLB lớn nhưng kh&ocirc;ng tồn tại ở c&aacute;c đội b&oacute;ng trước đ&acirc;y Rangnick l&agrave;m việc. Điều đ&oacute; đ&ograve;i hỏi nh&agrave; cầm qu&acirc;n người Đức&nbsp;<a href="https://vnexpress.net/rangnick-cau-thu-man-utd-can-tin-tuong-toi-4398171.html" style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; color: rgb(22, 143, 214); text-decoration: underline; outline: none; position: relative; text-underline-position: under;">phải th&iacute;ch nghi</a>, kh&ocirc;ng chỉ trong chiến thuật m&agrave; c&ograve;n ở c&aacute;ch quản l&yacute; ph&ograve;ng thay đồ.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Man Utd tiếp tục kh&ocirc;ng c&oacute; Raphael Varane, Paul Pogba v&agrave; Edinson Cavani. Luke Shaw chưa chắc c&oacute; thể thi đấu sau khi vắng mặt ở trận thắng Arsenal. Về ph&iacute;a đội kh&aacute;ch, Joel Ward bị treo gi&ograve; c&ograve;n James McArthur v&agrave; Nathan Ferguson vắng mặt v&igrave; chấn thương.</p>
</div>
<div class="section-inner inset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 700px; width: 700px; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;"><b style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility;">West Ham - Chelsea</b>: 19h30 thứ Bảy, 4/12</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Thomas Tuchel thừa nhận Chelsea&nbsp;<a href="https://vnexpress.net/tuchel-chelsea-da-an-cap-ba-diem-4397472.html" style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; color: rgb(22, 143, 214); text-decoration: underline; outline: none; position: relative; text-underline-position: under;">may mắn</a> khi thắng Watford 2-1 hồi giữa tuần. Chiến lược gia 48 tuổi phải xoay tua đội h&igrave;nh v&agrave; điều đ&oacute; khiến lối chơi của Chelsea trở n&ecirc;n th&ocirc; cứng. Đội chủ s&acirc;n Stamford Bridge vẫn ra về với ba điểm, nhưng trả gi&aacute; cho điều đ&oacute; l&agrave; chấn thương của Trevoh Chalobah.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Trung vệ 22 tuổi gia nhập nh&oacute;m thương binh của Chelsea, bao gồm những trụ cột như Reece James, Mateo Kovacic, N&apos;Golo Kante v&agrave; Ben Chilwell. Điều đ&oacute; sẽ ảnh hưởng đến t&iacute;nh to&aacute;n của Tuchel ở trận derby London với West Ham. Tin vui cho Chelsea l&agrave; Romelu Lukaku đ&atilde; trở lại v&agrave; đ&aacute; 21 ph&uacute;t ở trận thắng Watford.</p>
</div>
<div class="section-inner outset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 1130px; width: 1130px; z-index: 9; float: none; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <div class="medium-insert-images medium-insert-images-large" style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; text-align: center; position: relative; z-index: 9;">
        <figure style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; display: block;"><img src="https://i1-thethao.vnecdn.net/2021/12/04/Untitled-8849-1638560668.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=8ByO8N4bNv2yAlFqVw3azQ" alt="" style="padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; width: 1100px;"></figure>
    </div>
</div>
<div class="section-inner inset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 700px; width: 700px; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Sau chuỗi trận thăng hoa m&agrave; đỉnh cao l&agrave; trận thắng Liverpool 3-2 h&ocirc;m 7/11, West Ham sa s&uacute;t trong hai tuần qua. Họ thua Wolves, Man City rồi h&ograve;a Brighton. Thầy tr&ograve; David Moyes vẫn đứng thứ tư do c&aacute;c đội ph&iacute;a sau k&igrave;m ch&acirc;n nhau. Nhưng nếu kh&ocirc;ng nhanh ch&oacute;ng t&igrave;m lại sự tự tin, vị tr&iacute; đ&oacute; sẽ tuột khỏi tay West Ham.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Tr&aacute;i với sự thiếu hụt lực lượng của Chelsea, West Ham chỉ kh&ocirc;ng c&oacute; trung vệ Angelo Ogbonna trong khi Aaron Cresswell c&oacute; thể trở lại.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;"><b style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility;">Wolves - Liverpool</b>: 22h thứ Bảy, 4/12</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Trước trận đấu n&agrave;y, c&oacute; th&ocirc;ng tin Liverpool muốn chi&ecirc;u mộ Adama Traore. Cầu thủ chạy c&aacute;nh của Wolves l&agrave; một trong những cầu thủ kh&oacute; kiểm so&aacute;t nhất tại Ngoại hạng Anh. Nhưng năng lực dứt điểm v&agrave; đưa ra quyết định trước khung th&agrave;nh của anh kh&ocirc;ng được đ&aacute;nh gi&aacute; cao. Điều đ&oacute; l&yacute; giải cho việc Traore mới ghi bảy b&agrave;n sau 152 trận kho&aacute;c &aacute;o &quot;Bầy s&oacute;i&quot;.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Nhưng Jurgen Klopp tự tin c&oacute; thể gi&uacute;p tuyển thủ T&acirc;y Ban Nha thể hiện những điểm mạnh nhất. Trận đấu tr&ecirc;n s&acirc;n Molineux cuối tuần n&agrave;y l&agrave; dịp Traore chứng tỏ anh đủ sức g&oacute;p mặt tại s&acirc;n Anfield, cũng như cơ hội để Klopp mời ch&agrave;o cầu thủ đối phương với đội h&igrave;nh tuyệt vời &ocirc;ng đang sở hữu.</p>
</div>
<div class="section-inner outset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 1130px; width: 1130px; z-index: 9; float: none; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <div class="medium-insert-images medium-insert-images-large" style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; text-align: center; position: relative; z-index: 9;">
        <figure style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; display: block;"><img src="https://i1-thethao.vnecdn.net/2021/12/04/Untitled-4423-1638560668.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=blU1Zx2xalFwUEJbRGARpQ" alt="" style="padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; width: 1100px;"></figure>
    </div>
</div>
<div class="section-inner inset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 700px; width: 700px; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Ba v&ograve;ng gần nhất, Liverpool đều ghi bốn b&agrave;n v&agrave;o lưới đối thủ v&agrave; chỉ một lần thủng lưới. Cầu thủ ưa th&iacute;ch tốc độ như Traore chắc hẳn rất muốn thi đấu theo triết l&yacute; của Klopp. Việc chưa t&igrave;m được chỗ đứng trong mắt HLV Bruno Lage v&agrave; mới đ&aacute; ch&iacute;nh bảy trận m&ugrave;a n&agrave;y c&agrave;ng củng cố mong muốn ra đi v&agrave;o th&aacute;ng Một của Traore.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Roberto Firmino, Harvey Elliott v&agrave; Curtis Jones vắng mặt b&ecirc;n ph&iacute;a Liverpool. Naby Keita v&agrave; Joe Gomez đ&atilde; tập trở lại nhưng nhiều khả năng chỉ dự bị. Wolves kh&ocirc;ng c&oacute; Pedro Neto, Hugo Bueno, Jonny, Willy Boly, Yerson Mosquera v&agrave; Marcal. Daniel Podence trở lại sau khi nhiễm nCoV.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;"><b style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility;">Watford - Man City</b>: 0h30 Chủ Nhật, 5/12</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Pep Guardiola thừa nhận Man City đang rơi v&agrave;o t&igrave;nh trạng b&aacute;o động về nh&acirc;n sự khi nhiều trụ cột d&iacute;nh chấn thương. HLV người T&acirc;y Ban Nha phải bổ sung nhiều cầu thủ trẻ từ học viện tr&ecirc;n ghế dự bị. Nhưng điều đ&oacute; kh&ocirc;ng ngăn bước tiến của Man City.&nbsp;<a href="https://vnexpress.net/man-city-cat-dut-ky-trang-mat-cua-gerrard-4397294.html" style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; color: rgb(22, 143, 214); text-decoration: underline; outline: none; position: relative; text-underline-position: under;">Thắng Aston Villa 2-1</a> hồi giữa tuần l&agrave; chiến thắng thứ s&aacute;u li&ecirc;n tiếp của họ tr&ecirc;n mọi đấu trường.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Vận đen của người n&agrave;y c&oacute; thể l&agrave; may mắn với người kh&aacute;c. Aymeric Laporte vắng mặt do thẻ phạt c&ugrave;ng với chấn thương của John Stones gi&uacute;p Nathan Ake c&oacute; cơ hội ghi điểm với Guardiola. Trận thắng Aston Villa mới l&agrave; lần thứ tư trung vệ người H&agrave; Lan đ&aacute; ch&iacute;nh m&ugrave;a n&agrave;y. M&ugrave;a trước, anh chỉ đ&aacute; ch&iacute;nh ch&iacute;n trận do bị chấn thương, sau khi gia nhập Man City với gi&aacute; 53 triệu USD v&agrave;o h&egrave; 2020. Nhưng khi Laporte trở lại, liệu Ake c&oacute; tiếp tục được tin tưởng?</p>
</div>
<div class="section-inner outset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 1130px; width: 1130px; z-index: 9; float: none; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <div class="medium-insert-images medium-insert-images-large" style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; text-align: center; position: relative; z-index: 9;">
        <figure style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; display: block;"><img src="https://i1-thethao.vnecdn.net/2021/12/04/Untitled-3755-1638560668.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=5E-2TAIXkuVtwl6Ez_1dew" alt="" style="padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; width: 1100px;"></figure>
    </div>
</div>
<div class="section-inner inset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 700px; width: 700px; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Watford mới thắng hai trong bảy trận cầm qu&acirc;n của Claudio Ranieri. Nhưng đ&oacute; l&agrave; hai chiến thắng đậm trước Everton v&agrave; Man Utd. Việc tạo khoảng c&aacute;ch ba điểm với nh&oacute;m cầm đ&egrave;n đỏ l&agrave; th&agrave;nh c&ocirc;ng của đội chủ s&acirc;n Vicarage Road bởi họ trải qua lịch đấu kh&oacute; khăn trong hai th&aacute;ng qua. Emmanuel Dennis l&agrave; ng&ocirc;i sao s&aacute;ng nhất của Watford l&uacute;c n&agrave;y. Tiền đạo người Nigeria đ&atilde; ghi b&agrave;n ba trận gần nhất v&agrave; được đề cử cầu thủ hay nhất th&aacute;ng 11 của Ngoại hạng Anh. Tốc độ của Dennis c&oacute; thể l&agrave; &aacute;c mộng với Man City nếu họ để Watford c&oacute; cơ hội phản c&ocirc;ng.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Watford tiếp tục vật lộn với khủng hoảng chấn thương khi Nicolas Nkoulou, Francisco Sierralta, Peter Etebo, Ismaila Sarr, Ken Sema, Kwadwo Baah v&agrave; Ben Forster ngồi ngo&agrave;i. Adam Masina phải rời s&acirc;n sớm ở trận thua Chelsea v&agrave; chưa chắc c&oacute; thể thi đấu. Man City chưa c&oacute; sự phục vụ của Ferran Torres v&agrave; Kevin De Bruyne nhưng John Stones, Kyle Walker v&agrave; Ilkay Gundogan c&oacute; thể trở lại.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;"><b style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility;">Tottenham - Norwich</b>: 21h Chủ Nhật, 5/12</p>
</div>
<div class="section-inner inset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 700px; width: 700px; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Kể từ khi Antonio Conte được bổ nhiệm, Tottenham đ&atilde; đ&aacute; ba trận Ngoại hạng Anh với kết quả thắng hai, h&ograve;a một. Đ&oacute; l&agrave; khởi đầu tốt của HLV người Italy nhưng kh&ocirc;ng đủ sức khiến người h&acirc;m mộ đội b&oacute;ng London h&agrave;i l&ograve;ng. Bởi h&agrave;ng c&ocirc;ng Tottenham thi đấu rời rạc, chưa đ&aacute;p ứng kỳ vọng với tập thể c&oacute; nhiều ng&ocirc;i sao.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Conte r&otilde; r&agrave;ng cần nhiều thời gian hơn để định h&igrave;nh lối chơi của Tottenham. Đ&oacute; l&agrave; l&yacute; do tại sao những sai s&oacute;t ở h&agrave;ng thủ của Tottenham được th&ocirc;ng cảm, nhất l&agrave; khi Cristian Romero vắng mặt v&igrave; chấn thương. Tuy nhi&ecirc;n, với Harry Kane, Son Heung-min, Steven Bergwijn hay Lucas Moura, Conte cần l&agrave;m tốt hơn con số bốn b&agrave;n qua ba trận.</p>
</div>
<div class="section-inner outset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 1130px; width: 1130px; z-index: 9; float: none; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <div class="medium-insert-images medium-insert-images-large" style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; text-align: center; position: relative; z-index: 9;">
        <figure style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; display: block;"><img src="https://i1-thethao.vnecdn.net/2021/12/04/Untitled-1116-1638560668.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=UGzqraaGMeELC80i-MhCFA" alt="" style="padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; width: 1100px;"></figure>
    </div>
</div>
<div class="section-inner inset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 700px; width: 700px; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Gặp đội &aacute;p ch&oacute;t Norwich l&agrave; cơ hội để Tottenham cải thiện hiệu suất ghi b&agrave;n. &quot;Chim ho&agrave;ng yến&quot; đ&atilde; lọt lưới 28 b&agrave;n sau 14 trận, chỉ &iacute;t hơn Newcastle (30 b&agrave;n). Tuy nhi&ecirc;n, bộ mặt của Norwich đang dần cải thiện sau khi họ bổ nhiệm Dean Smith. Sự tự tin trở lại với đội kh&aacute;ch sẽ l&agrave; yếu tố khiến kết quả của cặp đấu n&agrave;y kh&oacute; đo&aacute;n hơn.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">B&ecirc;n cạnh Romero, Tottenham thiếu Giovani Lo Celso v&agrave; Dane Scarlett. Norwich kh&ocirc;ng c&oacute; Christoph Zimmermann, Mathias Normann, Sam Byram v&agrave; Milot Rashica nhưng Todd Cantwell c&oacute; thể trở lại.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;"><b style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility;">Everton - Arsenal</b>: 3h thứ Ba, 7/12</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Arsenal sống nhờ hơi thở của những cầu thủ trẻ ở m&ugrave;a n&agrave;y. Vai tr&ograve; của Bukayo Saka v&agrave; Emile Smith Rowe qu&aacute; lớn, đến nỗi khi họ vắng mặt, &quot;Ph&aacute;o thủ&quot; kh&ocirc;ng c&ograve;n l&agrave; ch&iacute;nh m&igrave;nh. Tuy nhi&ecirc;n, hai trận thua Liverpool v&agrave; Man Utd khiến người h&acirc;m mộ đặt c&acirc;u hỏi: &quot;C&aacute;c l&atilde;o tướng của Arsenal ở đ&acirc;u khi đội nh&agrave; cần?&quot;.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Pierre-Emerick Aubameyang, Nicolas Pepe, Martin Odegaard v&agrave; Alexandre Lacazette, những cầu thủ từng được kỳ vọng sẽ lĩnh xướng h&agrave;ng c&ocirc;ng v&agrave; d&igrave;u dắt c&aacute;c cầu thủ trẻ, nhưng giờ chỉ c&ograve;n l&agrave; c&aacute;i b&oacute;ng của ch&iacute;nh họ. Bốn người n&agrave;y đ&oacute;ng g&oacute;p bảy b&agrave;n, hai kiến tạo trong 41 lần ra s&acirc;n, kh&ocirc;ng bằng bảy b&agrave;n v&agrave; bốn kiến tạo trong 28 lần ra s&acirc;n của Saka v&agrave; Smith Rowe.</p>
</div>
<div class="section-inner outset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 1130px; width: 1130px; z-index: 9; float: none; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <div class="medium-insert-images medium-insert-images-large" style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; text-align: center; position: relative; z-index: 9;">
        <figure style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; display: block;"><img src="https://i1-thethao.vnecdn.net/2021/12/04/Untitled-5015-1638560668.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=WbEsGYKWRw97ZUSxerbIZQ" alt="" style="padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; width: 1100px;"></figure>
    </div>
</div>
<div class="section-inner inset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 700px; width: 700px; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">C&aacute;c cầu thủ trẻ c&oacute; thể thăng hoa nhưng sự bất ổn khiến họ kh&ocirc;ng thể l&agrave; chỗ dựa của đội b&oacute;ng. V&igrave; vậy, Mikel Arteta rất cần c&aacute;c cựu binh của Arsenal t&igrave;m lại phong độ khi m&ugrave;a giải bước v&agrave;o giai đoạn thi đấu d&agrave;y đặc. Everton đang gặp khủng hoảng với t&aacute;m trận li&ecirc;n tiếp kh&ocirc;ng thắng, thua s&aacute;u trong số đ&oacute;. Đ&acirc;y l&agrave; cơ hội để Arsenal t&igrave;m lại cảm gi&aacute;c chiến thắng.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">&quot;Ph&aacute;o thủ&quot; tiếp tục kh&ocirc;ng c&oacute; sự phục vụ của Sead Kolasinac v&agrave; Granit Xhaka. Về ph&iacute;a Everton, Mason Holgate trở lại sau &aacute;n treo gi&ograve; nhưng Tom Davies, Andre Gomes, Salomon Rondon v&agrave; Dominic Calvert-Lewin tiếp tục ngồi ngo&agrave;i trong khi Gylfi Sigurdsson dương t&iacute;nh với Covid-19.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;"><b style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility;">Barca - Betis</b>: 22h15 thứ Bảy, 4/12</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Thắng hai, h&ograve;a một trong ba trận đầu cầm qu&acirc;n, Xavi khởi đầu tương đối ấn tượng tr&ecirc;n cương vị HLV Barca. Hai chiến thắng li&ecirc;n tiếp tại La Liga trước Espanyol v&agrave; Villarreal gi&uacute;p đội chủ s&acirc;n Nou Camp leo l&ecirc;n thứ bảy. Nhưng ưu ti&ecirc;n số một của Barca l&agrave; chuyến l&agrave;m kh&aacute;ch tr&ecirc;n s&acirc;n Bayern ở lượt trận cuối bảng E v&agrave;o tuần tới.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Barca buộc phải thắng nếu muốn c&oacute; quyền tự quyết v&eacute; v&agrave;o v&ograve;ng 1/8 Champions League. Đ&oacute; l&agrave; nhiệm vụ kh&ocirc;ng đơn giản, đ&ograve;i hỏi Xavi t&iacute;nh to&aacute;n lực lượng v&agrave; chiến thuật từ b&acirc;y giờ. Nhưng Barca cũng kh&ocirc;ng được ph&eacute;p ph&acirc;n t&acirc;m khi tiếp Betis - đội đang đứng tr&ecirc;n họ hai bậc v&agrave; hơn bốn điểm.</p>
</div>
<div class="section-inner outset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 1130px; width: 1130px; z-index: 9; float: none; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <div class="medium-insert-images medium-insert-images-large" style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; text-align: center; position: relative; z-index: 9;">
        <figure style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; display: block;"><img src="https://i1-thethao.vnecdn.net/2021/12/04/Untitled-2119-1638560668.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=5pKha2MK_f3VnnDO1751Eg" alt="" style="padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; width: 1100px;"></figure>
    </div>
</div>
<div class="section-inner inset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 700px; width: 700px; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Betis to&agrave;n thắng bốn trận gần đ&acirc;y, trong đ&oacute; c&oacute; trận thắng Ferencvaros ở Europa League h&ocirc;m 25/11, gi&uacute;p họ v&agrave;o v&ograve;ng knock-out giải đấu n&agrave;y sớm một lượt ở bảng G. Thầy tr&ograve; Manuel Pellegrini chỉ k&eacute;m đội thứ tư Sevilla một điểm v&agrave; c&oacute; thể chen v&agrave;o top bốn nếu gi&agrave;nh kết quả tốt. Tuy nhi&ecirc;n, Betis thua Barca trong năm lần đối đầu gần nhất.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Martin Braithwaite, Ansu Fati v&agrave; Pedri ngồi ngo&agrave;i b&ecirc;n ph&iacute;a Barca trong khi Dani Alves v&agrave; Sergio Aguero kh&ocirc;ng đủ điều kiện ra s&acirc;n. Về ph&iacute;a Betis, Nabil Fekir bị treo gi&ograve;. Youssouf Sabaly kh&ocirc;ng thể ra s&acirc;n nhưng Claudio Bravo, Martin Montoya v&agrave; German Pezzella c&oacute; thể kịp trở lại.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;"><b style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility;">Sociedad - Real</b>: 3h Chủ Nhật, 5/12</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Real c&oacute; cơ hội nối d&agrave;i chuỗi thắng tr&ecirc;n mọi đấu trường l&ecirc;n t&aacute;m trận, nhưng Sociedad rất quyết t&acirc;m thắng để thu hẹp c&aacute;ch biệt với đội đầu bảng. Đội chủ s&acirc;n San Sebastian từng dẫn đầu La Liga c&aacute;ch đ&acirc;y một th&aacute;ng nhưng chỉ gi&agrave;nh một chiến thắng trong bốn v&ograve;ng gần đ&acirc;y khiến họ bị Real dẫn bảy điểm.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Cuối tuần trước, Sociedad thua 0-1 tr&ecirc;n s&acirc;n Espanyol. Trước đ&oacute;, thất bại 1-2 trước Monaco khiến thầy tr&ograve; Imanol Alguacil l&acirc;m v&agrave;o thế kh&oacute; tại bảng B Europa League. Sociedad buộc phải thắng PSV Eindhoven v&agrave;o giữa tuần tới nếu muốn đi tiếp ở Cup ch&acirc;u &Acirc;u. Điều n&agrave;y sẽ khiến họ ph&acirc;n t&acirc;m trong khi Real đ&atilde; gi&agrave;nh v&eacute; đi tiếp tại Champions League v&agrave; chỉ cần h&ograve;a Inter ở lượt cuối tr&ecirc;n s&acirc;n nh&agrave; để chắc suất nhất bảng.</p>
</div>
<div class="section-inner outset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 1130px; width: 1130px; z-index: 9; float: none; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <div class="medium-insert-images medium-insert-images-large" style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; text-align: center; position: relative; z-index: 9;">
        <figure style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; display: block;"><img src="https://i1-thethao.vnecdn.net/2021/12/04/Untitled-2343-1638560668.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=lGhNiyBp4rT_6aH8KGGQRw" alt="" style="padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; width: 1100px;"></figure>
    </div>
</div>
<div class="section-inner inset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 700px; width: 700px; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Chiến thắng 2-0 trước Panaderia Pulido ở Cup Nh&agrave; Vua h&ocirc;m 2/12 l&agrave; liều thuốc tinh thần kịp thời cho Sociedad trước khi tiếp Real. Tuy nhi&ecirc;n, đội b&oacute;ng xứ Basque chịu thiệt th&ograve;i lớn về lực lượng khi mất cặp tiền vệ quan trọng Merino v&agrave; David Silva.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Đội chủ nh&agrave; cũng kh&ocirc;ng c&oacute; Aritz Elustondo, Nacho Monreal v&agrave; Carlos Fernandez trong khi Dani Ceballos v&agrave; Gareth Bale l&agrave; hai trường hợp vắng mặt b&ecirc;n ph&iacute;a Real.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;"><b style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility;">Roma - Inter</b>: 0h Chủ Nhật, 5/12</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Thầy tr&ograve; Jose Mourinho th&ecirc;m một lần nếm tr&aacute;i đắng khi thua Bologna 0-1 cuối tuần trước. Đ&oacute; l&agrave; trận thua thứ ba trong năm v&ograve;ng gần nhất của AS Roma v&agrave; c&aacute;ch biệt giữa họ với đội thứ tư Atalanta đ&atilde; l&agrave; s&aacute;u điểm. Ph&iacute;a trước đội b&oacute;ng thủ đ&ocirc; Italy l&agrave; cuộc đối đầu với CSKA Sofia ở lượt cuối bảng C Europa Conference League v&agrave; trận gặp Atalanta v&agrave;o ng&agrave;y 18/12. V&igrave; thế, Roma cần bước đ&agrave; t&acirc;m l&yacute; tốt.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Nhưng đ&aacute;nh bại Inter l&uacute;c n&agrave;y kh&ocirc;ng dễ. Thầy tr&ograve; Simone Inzaghi to&agrave;n thắng bốn trận gần nhất, ghi &iacute;t nhất hai b&agrave;n mỗi trận. Họ l&agrave; đội đầu ti&ecirc;n khiến đầu bảng Napoli thất bại h&ocirc;m 22/11. Inter đ&atilde; kh&ocirc;ng thua một th&aacute;ng rưỡi, kể từ thất bại 1-3 trước Lazio v&agrave;o ng&agrave;y 16/10. Phong độ đ&oacute; gi&uacute;p họ thu hẹp c&aacute;ch biệt với đỉnh bảng c&ograve;n hai điểm. Lịch thi đấu dễ thở ph&iacute;a trước, gặp Cagliari, Salernitana v&agrave; Torino, sẽ l&agrave; cơ hội để thầy tr&ograve; Inzaghi vượt l&ecirc;n.</p>
</div>
<div class="section-inner outset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 1130px; width: 1130px; z-index: 9; float: none; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <div class="medium-insert-images medium-insert-images-large" style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; text-align: center; position: relative; z-index: 9;">
        <figure style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; display: block;"><img src="https://i1-thethao.vnecdn.net/2021/12/04/Untitled-9479-1638560668.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=Kdn_p_uqL8O_tDeRBRhT6Q" alt="" style="padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; width: 1100px;"></figure>
    </div>
</div>
<div class="section-inner inset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 700px; width: 700px; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Ngo&agrave;i trận thắng Napoli, Inter đ&atilde; h&ograve;a Milan, Juventus v&agrave; Atalanta. Thống k&ecirc; đ&oacute; l&agrave; cơ sở để Roma tin họ sẽ g&acirc;y kh&oacute; cho đối thủ tr&ecirc;n s&acirc;n nh&agrave;. Nhưng đội b&oacute;ng của Mourinho phải l&agrave;m điều đ&oacute; m&agrave; kh&ocirc;ng c&oacute; thủ qu&acirc;n Lorenzo Pellegrini, người phải nghỉ hết năm do chấn thương. Pellegrini l&agrave; thủ lĩnh tinh thần của Roma v&agrave; l&agrave; cầu thủ quan trọng với Mourinho trong những trận cầu lớn.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Ngo&agrave;i ra, Roma cũng kh&ocirc;ng c&oacute; Rick Karsdorp v&agrave; Tammy Abraham do thẻ phạt. Gonzalo Villar v&agrave; Felix Afena-Gyan bị nhiễm nCoV trong khi Leonardo Spinazzola chưa trở lại. Inter thiếu Andrea Ranocchia, Matteo Darmian, Stefan de Vrij v&agrave; Aleksandar Kolarov.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;"><b style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility;">Napoli - Atalanta</b>: 2h45 Chủ Nhật, 5/12</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Tưởng như chiến thắng gi&ograve;n gi&atilde; 4-0 trước Lazio đ&aacute;nh dấu sự trở lại của Napoli, sau hai trận thua Inter v&agrave; Spartak Moscow. Tuy nhi&ecirc;n, thầy tr&ograve; Luciano Spalletti tiếp tục g&acirc;y thất vọng ở v&ograve;ng trước khi bị Sassuolo cầm ch&acirc;n 2-2.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Kết quả n&agrave;y kh&ocirc;ng khiến Napoli mất ng&ocirc;i đầu, nhưng khoảng c&aacute;ch giữa họ với nh&igrave; bảng Milan chỉ c&ograve;n một điểm. Atalanta, đội l&agrave;m kh&aacute;ch tr&ecirc;n s&acirc;n Maradona cuối tuần n&agrave;y, cũng chỉ c&ograve;n c&aacute;ch chủ nh&agrave; năm điểm.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Spalletti b&agrave;y tỏ sự lo ngại về h&agrave;ng thủ đội nh&agrave; trong những trận gần đ&acirc;y. Napoli l&agrave; đội duy nhất thủng lưới dưới 10 b&agrave;n sau 15 v&ograve;ng đầu Serie A, nhưng họ chỉ giữ sạch lưới một lần trong s&aacute;u trận gần đ&acirc;y tr&ecirc;n mọi đấu trường.</p>
</div>
<div class="section-inner outset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 1130px; width: 1130px; z-index: 9; float: none; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <div class="medium-insert-images medium-insert-images-large" style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; text-align: center; position: relative; z-index: 9;">
        <figure style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; display: block;"><img src="https://i1-thethao.vnecdn.net/2021/12/04/Untitled-2638-1638560668.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=ubd9FYrzNPik6GZsJEoVQw" alt="" style="padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; width: 1100px;"></figure>
    </div>
</div>
<div class="section-inner inset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 700px; width: 700px; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">X&eacute;t về số b&agrave;n thua, Atalanta gần gấp đ&ocirc;i Napoli (17 b&agrave;n) nhưng họ ghi b&agrave;n chẳng k&eacute;m đối thủ (32). Đội b&oacute;ng v&ugrave;ng Bergamo sẽ h&agrave;nh qu&acirc;n đến Naples với t&acirc;m ly hưng phấn sau khi HLV Gian Piero Gasperini gia hạn hợp đồng. Atalanta cũng kh&ocirc;ng thua Napoli trong ch&iacute;n lần đối đầu gần nhất, trong đ&oacute; c&oacute; chiến thắng 4-2 ở cuộc đối đầu gần nhất.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Napoli bất lợi nhiều hơn về lực lượng khi Kalidou Koulibaly, Andre-Frank Zambo Anguissa v&agrave; Victor Osimhen vắng mặt trong khi Fabian Ruiz v&agrave; Lorenzo Insigne chưa chắc c&oacute; thể ra s&acirc;n. Atalanta kh&ocirc;ng c&oacute; Robin Gosens v&agrave; Matteo Lovato.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;"><b style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility;">Juventus - Genoa</b>: 2h45 thứ Hai, 6/12</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Lần đầu k&yacute; hợp đồng dẫn dắt một CLB khi được Genoa bổ nhiệm h&ocirc;m 7/11, huyền thoại Ukraine Andriy Shevchenko gặp nhiều trắc trở. &Ocirc;ng thua hai, h&ograve;a một trong ba trận đầu. D&ugrave; thất bại trước những đội b&oacute;ng mạnh như AS Roma hay AC Milan ở v&ograve;ng trước, Genoa đ&atilde; kh&ocirc;ng ghi b&agrave;n cả ba trận.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">L&agrave;m kh&aacute;ch của Juventus l&agrave; b&agrave;i to&aacute;n kh&oacute; với Shevchenko trong bối cảnh Genoa đối mặt nhiều ca chấn thương. Hy vọng của đội kh&aacute;ch l&agrave; Juventus sẽ tự bắn v&agrave;o ch&acirc;n, điều xảy ra kh&ocirc;ng &iacute;t lần m&ugrave;a n&agrave;y.</p>
</div>
<div class="section-inner outset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 1130px; width: 1130px; z-index: 9; float: none; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <div class="medium-insert-images medium-insert-images-large" style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; text-align: center; position: relative; z-index: 9;">
        <figure style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; display: block;"><img src="https://i1-thethao.vnecdn.net/2021/12/04/Untitled-9461-1638560668.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=7soBc7fl20jKQ9zuAwpKuw" alt="" style="padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; width: 1100px;"></figure>
    </div>
</div>
<div class="section-inner inset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 700px; width: 700px; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Trận thắng Salernitana 2-0 gi&uacute;p Juventus lấy lại thể diện sau hai thất bại li&ecirc;n tiếp trước Chelsea v&agrave; Atalanta. Nhưng hai b&agrave;n thắng của Alvaro Morata v&agrave; Paulo Dybala kh&ocirc;ng gi&uacute;p &quot;B&agrave; đầm gi&agrave;&quot; tho&aacute;t khỏi sự thật rằng họ l&agrave; đội ghi b&agrave;n &iacute;t nhất trong 12 đội dẫn đầu Serie A. Juventus mới ghi 20 b&agrave;n sau 15 trận trong khi đ&atilde; thủng lưới 16 lần. Max Allegri hy vọng c&aacute;c học tr&ograve; c&oacute; thể thay đổi bộ mặt khi tiếp đội đứng thứ 18.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Genoa sẽ kh&ocirc;ng c&oacute; Mohamed Fares, Felipe Caicedo, Domenico Criscito, Mattia Bani v&agrave; Nikola Maksimovic trong khi Mattia Destro chưa chắc c&oacute; thể ra s&acirc;n. Nhưng Juventus cũng gặp kh&oacute; khăn kh&ocirc;ng k&eacute;m khi Mattia De Sciglio, Danilo, Federico Chiesa, Weston McKennie v&agrave; Aaron Ramsey đều phải ngồi ngo&agrave;i.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;"><b style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility;">Dortmund - Bayern</b>: 0h30 Chủ Nhật, 5/12</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Trận Der Klassiker ở v&ograve;ng 14 Bundesliga th&ecirc;m phần hấp dẫn khi Bayern v&agrave; Dortmund đang ganh đua quyết liệt vị tr&iacute; dẫn đầu. Khoảng c&aacute;ch giữa hai đội chỉ l&agrave; một điểm. Dortmund hy vọng c&oacute; thể chấm dứt ch&iacute;n năm thống trị của k&igrave;nh địch ở m&ugrave;a n&agrave;y.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Sự trở lại của Erling Haaland c&oacute; thể l&agrave; nh&acirc;n tố quyết định thắng bại với đội chủ nh&agrave;. Sau hơn một th&aacute;ng dưỡng thương, tiền đạo người Na Uy chỉ đ&aacute; 17 ph&uacute;t ở trận thắng Wolfsburg 3-1 h&ocirc;m 27/11 nhưng đ&atilde;&nbsp;<a href="https://vnexpress.net/haaland-ghi-ban-ngay-tran-dau-tro-lai-4395502.html" style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; color: rgb(22, 143, 214); text-decoration: underline; outline: none; position: relative; text-underline-position: under;">kịp ghi một b&agrave;n</a>. Đ&oacute; l&agrave; pha lập c&ocirc;ng thứ 50 của Haaland sau 50 lần ra s&acirc;n tại Bundesliga.</p>
</div>
<div class="section-inner outset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 1130px; width: 1130px; z-index: 9; float: none; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <div class="medium-insert-images medium-insert-images-large" style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; text-align: center; position: relative; z-index: 9;">
        <figure style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; display: block;"><img src="https://i1-thethao.vnecdn.net/2021/12/04/Untitled-6798-1638560668.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=rUEdafOFqXpLFf_ipQuHZw" alt="" style="padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; width: 1100px;"></figure>
    </div>
</div>
<div class="section-inner inset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 700px; width: 700px; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Haaland đ&atilde; ghi bốn b&agrave;n trong năm lần đối đầu Bayern trước đ&acirc;y. Nhưng anh lu&ocirc;n nếm m&ugrave;i thất bại bởi Dortmund đ&atilde; thua k&igrave;nh địch s&aacute;u trận li&ecirc;n tiếp, bao gồm thất bại 1-3 ở Si&ecirc;u Cup Đức hồi th&aacute;ng T&aacute;m.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Bayern đ&atilde; thua hai trận từ đầu m&ugrave;a, đều l&agrave; những thất bại g&acirc;y sốc trước hai đội ở nửa dưới bảng điểm Augsburg v&agrave; Eintracht Frankfurt. C&ugrave;ng với trận thua Gladbach 0-5 ở Cup quốc gia, c&oacute; thể n&oacute;i cỗ m&aacute;y Bayern chưa hoạt động trơn tru nhất dưới thời Julian Nagelsmann. Tuy nhi&ecirc;n, khi chạm tr&aacute;n c&aacute;c đối thủ trực tiếp, &quot;H&ugrave;m x&aacute;m xứ Bavaria&quot; lu&ocirc;n chứng tỏ sức mạnh như khi đ&aacute;nh bại RB Leipzig 4-1 hay Leverkusen 5-1.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Hai đội đều c&oacute; kh&oacute; khăn ri&ecirc;ng về lực lượng. Dortmund thiếu Youssoufa Moukoko, Marcel Schmelzer, Mateu Morey, trong khi Thorgan Hazard, Giovanni Reyna v&agrave; Jude Bellingham cần đợi kiểm tra y tế để biết c&oacute; thể ra s&acirc;n hay kh&ocirc;ng. Bayern kh&ocirc;ng c&oacute; Marcel Sabitzer, Bouna Sarr, Josip Stanisic do chấn thương. Eric Maxim Choupo-Moting v&agrave; Joshua Kimmich đang c&aacute;ch ly Covid-19.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;"><b style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility;">Lens - PSG</b>: 3h Chủ Nhật, 5/12</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Lens l&agrave; một trong những đội khởi đầu m&ugrave;a giải tốt nhất tại Ligue 1. Họ gi&agrave;nh 18 điểm qua ch&iacute;n v&ograve;ng đầu. Tuy nhi&ecirc;n, đội chủ s&acirc;n Stade Bollaert-Delelis đ&aacute;nh mất phong độ thời gian gần đ&acirc;y. Họ chỉ thắng hai trong bảy trận gần nhất. Hai v&ograve;ng gần đ&acirc;y, Lens bị Angers v&agrave; Clermont Foot cầm ch&acirc;n.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Đội chủ nh&agrave; vẫn đứng thứ năm, chỉ k&eacute;m nh&igrave; bảng Marseille ba điểm. Đ&oacute; l&agrave; th&agrave;nh t&iacute;ch đ&aacute;ng kh&iacute;ch lệ với Lens - đội mới thăng hạng Ligue 1 c&aacute;ch đ&acirc;y 18 th&aacute;ng. Tuy nhi&ecirc;n, khoảng c&aacute;ch giữa họ v&agrave; đối thủ l&ecirc;n tới 15 điểm. D&ugrave; m&ugrave;a giải chưa đến kỳ nghỉ đ&ocirc;ng, PSG đ&atilde; tạo ra khoảng c&aacute;ch qu&aacute; xa so với phần c&ograve;n lại của Ligue 1.</p>
</div>
<div class="section-inner outset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 1130px; width: 1130px; z-index: 9; float: none; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <div class="medium-insert-images medium-insert-images-large" style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; text-align: center; position: relative; z-index: 9;">
        <figure style="margin: 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; max-width: 100%; clear: both; position: relative; display: block;"><img src="https://i1-thethao.vnecdn.net/2021/12/04/Untitled-2487-1638560668.jpg?w=0&h=0&q=100&dpr=1&fit=crop&s=_9xphkuFQIPy5G2T3SsZtw" alt="" style="padding: 0px; box-sizing: border-box; text-rendering: optimizelegibility; border: 0px; font-size: 0px; line-height: 0; max-width: 100%; width: 1100px;"></figure>
    </div>
</div>
<div class="section-inner inset-column" style="margin: 0px auto; padding: 0px 15px; box-sizing: border-box; text-rendering: optimizelegibility; position: relative; clear: both; background: rgb(255, 255, 255); max-width: 700px; width: 700px; color: rgb(34, 34, 34); font-family: Arial, serif; font-size: 20px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; white-space: normal; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">M&agrave;n tr&igrave;nh diễn của PSG trong giai đoạn đ&atilde; qua thiếu thuyết phục. C&oacute; năm lần họ gi&agrave;nh chiến thắng ở thế bị dẫn b&agrave;n v&agrave; đ&atilde; để lọt lưới 15 lần, nhiều nhất trong top bốn. Trong năm 2021, PSG 11 lần bị đối thủ ghi b&agrave;n trước, nhiều nhất kể từ năm 2012. Họ bước v&agrave;o trận đấu n&agrave;y sau khi bị Nice cầm ch&acirc;n 0-0 cuối tuần trước.</p>
    <p style="margin: 1em 0px; padding: 0px; box-sizing: border-box; text-rendering: optimizespeed; line-height: 32px; letter-spacing: 0.01em; font-family: Arial !important;">Kh&ocirc;ng l&acirc;u sau khi đ&aacute; trận ra mắt CLB, Sergio Ramos tiếp tục ngồi ngo&agrave;i v&igrave; chấn thương cơ. Ander Herrera, Julian Draxler v&agrave; Neymar cũng chịu chung số phận trong khi khả năng ra s&acirc;n của Georginio Wijnaldum c&ograve;n để ngỏ. Lens kh&ocirc;ng c&oacute; Wesley Said v&agrave; Deiver Machado.</p>
</div>', CAST(N'2021-12-04' AS Date), 3, 1, 5, 1)
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
</article>', CAST(N'2021-12-04' AS Date), 3, 1, 5, 1)
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
</article>', CAST(N'2021-12-04' AS Date), 3, 1, 2, 1)
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
', NULL, 3, 1, 2, 1)
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
', NULL, NULL, 1, 1, 1)
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
', CAST(N'2021-12-04' AS Date), NULL, 1, 1, 1)
INSERT [dbo].[TinTuc] ([MaTinTuc], [TieuDe], [HinhDaiDien], [NoiDung], [Ngay], [SoLanXem], [TrangThai], [MaChuDe], [MaAccount]) VALUES (11, N'test', NULL, N'<p>test</p>
', CAST(N'2021-12-04' AS Date), NULL, 1, 1, 1)
SET IDENTITY_INSERT [dbo].[TinTuc] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Account__A9D1053433ABFE13]    Script Date: 12/4/2021 6:39:02 PM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__ChuDe__19B17CFBE8CCB4B4]    Script Date: 12/4/2021 6:39:02 PM ******/
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
