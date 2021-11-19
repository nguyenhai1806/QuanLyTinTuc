CREATE DATABASE QLTinTuc;
GO

USE QLTinTuc;
GO

SET DATEFORMAT DMY;
GO

CREATE TABLE ChuDe
(
    MaChuDe   INT IDENTITY PRIMARY KEY,
    TenChuDe  NVARCHAR(50) NOT NULL UNIQUE,
    TrangThai BIT DEFAULT 1 --0 la khong hien thi, 1 la có hiển thị
);

CREATE TABLE TinTuc
(
    MaTinTuc    INT IDENTITY PRIMARY KEY,
    TieuDe      NVARCHAR(100) NOT NULL,
    HinhDaiDien NVARCHAR(MAX),
    NoiDung     NVARCHAR(MAX),
    Ngay        DATE DEFAULT GETDATE(),
    SoLanXem    INT DEFAULT 0 CHECK (SoLanXem > 0),
    TrangThai   BIT DEFAULT 1, --0 la khong hien thi, 1 la có hiển thị
    MaChuDe     INT NOT NULL,
	MaAccount INT NOT NULL,
    CONSTRAINT FK_TinTuc_ChuDe FOREIGN KEY (MaChuDe) REFERENCES dbo.ChuDe (MaChuDe),
	CONSTRAINT FK_TinTuc_Account FOREIGN KEY (MaAccount) REFERENCES dbo.Account (MaAccount)
);
GO

CREATE TABLE BinhLuan
(
    MaBinhLuan INT IDENTITY PRIMARY KEY,
    ThoiGian   DATETIME,
    Noidung    NVARCHAR(MAX),
    HoTen      NVARCHAR(50)  NOT NULL,
    Email      NVARCHAR(50),
    TrangThai  INT DEFAULT 1, --0 la khong hien thi, 1 la có hiển thị
	MaTinTuc   INT NOT NULL,
	CONSTRAINT FK_BinhLuan_TinTuc FOREIGN KEY (MaTinTuc) REFERENCES dbo.TinTuc(MaTinTuc)
);

CREATE TABLE Account
(
    MaAccount  INT IDENTITY PRIMARY KEY,
    Email      NVARCHAR(50)  NOT NULL UNIQUE,
    TenHienThi NVARCHAR(100),
    MatKhau    NVARCHAR(100) NOT NULL, -- Được mã hoá bằng MD5
    TrangThai  BIT DEFAULT 1,                     --0 đang bị khoá, 1 đang sử dụng
    Admin      BIT DEFAULT 0, --0: Thường, 1: admin
);

--Nhap lieu
INSERT INTO ChuDe (TenChuDe, TrangThai) VALUES
	(N'Thời sự', 1),
	(N'Thế giới', 1),
	(N'Kinh doanh', 1),
	(N'Giai trí', 1),
	(N'Thể thao', 1),
	(N'Pháp luật', 1),
	(N'Giao dục', 1),
	(N'Sức khoẻ', 1),
	(N'Đời sống', 0);


INSERT INTO TinTuc (TieuDe, hinhDaiDien, NoiDung, Ngay, SoLanXem, TrangThai, MaChuDe,MaAccount) VALUES
	(N'Apple đầu tư 200 triệu USD cho sản xuất tấm nền mini LED', 'Hinh1.png', N'Theo PhoneArena, iPad Pro 12,9 inch mà Apple ra mắt trong năm 2021 đi kèm màn hình mini LED thu hút được một lượng lớn khách hàng.<br/>Với sản lượng hiện tại không thể đáp ứng nhu cầu, Apple đã mua các thiết bị sản xuất tấm nền mini LED trị giá hàng trăm triệu USD. Máy móc sản xuất mới sẽ được sử dụng bởi các nhà cung cấp tấm nền mini LED duy nhất của Apple - Taiwan Surface Mounting Technology (TSMT). Báo cáo cũng nói Apple đã phải vật lộn với nhu cầu hiện tại về màn hình cho iPad Pro 12,9 inch 2021.
	Apple được cho là đang có kế hoạch giới thiệu công nghệ màn hình mới cho dòng máy tính xách tay MacBook Pro 14 và 16 inch. Các tin đồn cho biết Apple cũng đang có kế hoạch bổ sung tấm nền mini LED cho iPad mini 6 thiết kế lại và iPad giá rẻ. Với khoản đầu tư 200 triệu USD này, Apple hy vọng sẽ cung cấp thêm 700.000 đến 800.000 tấm nền mini LED được sản xuất mỗi tháng.', '27-1-2021', 7, 1, 1, 1),
	(N'14 cách giúp bạn tăng cường miễn dịch chống Covid-19', 'Hinh2.png', N'Trong khi chờ đợi có đủ vắc xin ngừa Covid-19, một trong những cách tốt nhất để tự bảo vệ mình khỏi sự tấn công của Covid-19 là tăng cường hệ miễn dịch. Sau đây là 14 lời khuyên của bác sĩ tim mạch hàng đầu, của các tổ chức y tế và từ nghiên cứu mới nhất, giúp bạn tăng cường khả năng miễn dịch chống lại Covid-19, theo eatthis.com.
	<br/>1. Tránh thực phẩm chế biến
	Tiến sĩ Luiza Petre, bác sĩ tim mạch kiêm chuyên gia dinh dưỡng, phó giáo sư lâm sàng về tim mạch tại Trường Y Mount Sinai và là thành viên tích cực của Trường cao đẳng Tim mạch Mỹ, cho biết nên ăn thực phẩm hữu cơ chưa qua chế biến, tránh đường và thực phẩm đóng hộp để giảm viêm và xây dựng hệ miễn dịch.
	2. Lập kế hoạch ăn uống lành mạnh
	Tiến sĩ Petre cho biết, trái cây và rau quả có chứa các dưỡng chất thực vật giúp bảo vệ chống lại chứng viêm.
	Hãy ăn nhiều rau, thảo mộc và trái cây giàu vitamin C, để ngăn ngừa và kiểm soát tình trạng viêm mạn tính, theo eatthis.com.
	Chất béo lành mạnh, như chất béo không bão hòa đơn (có nhiều trong dầu ô liu, dầu cải, dầu đậu nành, dầu mè, bơ đậu phộng, các loại hạt và trái bơ) và a xít béo omega-3 cũng giúp giảm viêm.
	Đồ chiên và chất béo bão hòa làm tăng tình trạng viêm và làm suy yếu khả năng miễn dịch. Vì vậy, nên tránh mỡ, da động vật, sữa nguyên kem, bơ thực vật, dầu dừa, bánh quy. 3. Ăn nhiều hành tỏi
	Tiến sĩ Petre khuyến khích ăn thêm hành tỏi.
	Tỏi rất giàu allicin, có đặc tính kháng khuẩn và kháng virus, giúp tăng cường hệ miễn dịch và chống lại cảm lạnh. Hãy ăn mỗi lần 1 tép tỏi, 2 - 3 lần mỗi ngày, theo eatthis.com.
	Hành rất giàu quercetin - một chất chống ô xy hóa và flavonoid rất mạnh, có đặc tính kháng virus và giúp miễn dịch. Hành còn chứa nhiều chất dinh dưỡng tăng cường miễn dịch như các hợp chất lưu huỳnh, selen, kẽm và vitamin C.
	4. Tăng cường vitamin C
	Tiến sĩ Petre chỉ ra rằng các loại trái cây giàu vitamin C, như cam, bưởi và quýt, là nòng cốt của hệ miễn dịch, giúp tăng sản xuất tế bào bạch cầu và cải thiện chức năng của tế bào lympho T - chống lại nhiễm trùng.
	5. Ăn thực phẩm giàu omega-3
	Thực phẩm giàu omega 3, như cá mòi, cá hồi, trái bơ và các loại hạt, rất tốt trong việc chống lại virus.
	Tiến sĩ Petre cho biết, mỗi loại đều tăng cường chức năng của các tế bào miễn dịch, bằng cách cải thiện chức năng của tế bào bạch cầu.
	6. Ăn thêm thực phẩm giàu Beta Glucan
	Theo tiến sĩ Petre, nấm hương, men, rong biển và tảo đều là những thực phẩm giàu beta glucan - có tác dụng hỗ trợ cải thiện chức năng tế bào T và có đặc tính kháng virus, theo eatthis.com.
	Bác sĩ giải thích, vhúng làm tăng phản ứng miễn dịch bằng cách tăng cường các tế bào tiêu diệt tự nhiên và tăng chức năng của đại thực bào, cũng như kích hoạt miễn dịch phòng thủ.
	7. Ăn nhiều rau củ màu xanh lá cây
	Tiến sĩ Petre khuyến khích bông cải xanh và rau bó xôi chứa đầy vitamin A, C và D, chất xơ, chất chống ô xy hóa. Và chất chống ô xy hóa làm tăng khả năng chống nhiễm trùng của hệ miễn dịch.
	Bí quyết là nấu càng ít càng tốt hoặc là ăn sống đối với những thứ ăn sống được.
	8. Ăn nhiều thực phẩm giàu vitamin D
	Vitamin D là thành phần quan trọng trong việc cải thiện khả năng miễn dịch. Một số thực phẩm giàu vitamin D gồm cá béo, trứng, nấm, sò và trứng cá muối, theo eatthis.com.
	Tiến sĩ Petre cho biết: “Chúng được mệnh danh là ''tốt hơn cả vắc xin'' và rất cần để chống lại nhiễm trùng do virus, vì vitamin D tăng cường khả năng miễn dịch tự nhiên". 9. Tiêu thụ nhiều men vi sinh
	Tiến sĩ Petre cho biết, khoảng 70% hệ miễn dịch nằm trong ruột. Thực phẩm lên men là chìa khóa để cân bằng hệ vi sinh vật đường ruột và tăng cường hệ miễn dịch. Chúng bảo vệ cơ thể khỏi các mầm bệnh nguy hiểm. Có thể uống chế phẩm sinh học hoặc ăn các loại thực phẩm lên men, như kim chi hoặc dưa muối để cung cấp các vi khuẩn lành mạnh, theo eatthis.com.
	10. Vận động và vận động
	Tiến sĩ Petre chỉ ra rằng tập thể dục là cách hiệu quả để tăng cường hệ miễn dịch.
	Đặc biệt, tập thể dục gây ra sự thay đổi trong các kháng thể và tế bào bạch cầu - những tế bào của hệ miễn dịch của cơ thể chống lại bệnh tật.
	Một nghiên cứu gần đây cho thấy rằng tập thể dục ít nhất 5 ngày một tuần làm giảm nguy cơ bị nhiễm trùng đường hô hấp trên.
	Người mắc Covid-19, nếu tuân theo thói quen này, có thể giảm được 32 - 41% nguy cơ mắc bệnh nghiêm trọng, theo eatthis.com.
	11. Thiền
	Tiến sĩ Petre chỉ ra, thiền làm giảm mức độ căng thẳng và mức cortisol, thúc đẩy phản ứng của cơ thể để chống lại virus.
	Suy nghĩ tiêu cực, căng thẳng và trạng thái cảm xúc có thể có tác động tiêu cực đến hệ thống miễn dịch, khiến người ta dễ bị nhiễm bệnh hơn.
	12. Ngủ ngon giấc
	Giấc ngủ giúp hỗ trợ các tế bào và protein của hệ miễn dịch tiêu diệt và phát hiện vi trùng. Nó cũng giúp ghi nhớ các loại vi trùng này, vì vậy trong tương lai hệ miễn dịch có thể chống lại chúng nhanh hơn, tiến sĩ Petre nhấn mạnh.
	Ngủ đủ giấc cũng làm tăng đáng kể phản ứng miễn dịch của cơ thể, vì vậy hãy đảm bảo ngủ từ 6 - 7 giờ mỗi đêm.
	13. Không uống rượu
	Tổ chức Y tế Thế giới cho biết, uống rượu làm suy yếu hệ miễn dịch và do đó làm giảm khả năng chống chọi với các bệnh truyền nhiễm.
	14. Không để béo phì
	Theo Trung tâm Kiểm soát và Phòng ngừa dịch bệnh Mỹ, béo phì nghiêm trọng làm tăng nguy cơ mắc các biến chứng do Covid-19. Nghiên cứu cho biết, béo phì làm suy giảm chức năng miễn dịch. Hãy giảm cân nếu bị thừa cân, theo eatthis.com.', '10-7-2021', 2, 1, 8,2);

INSERT INTO Account VALUES
	('admin@gmail.com', 'admin', '1234', 1, 1),
	('user1@gmail.com', 'user1', 'User123', 1, 0),
	('user2@gmail.com', 'user2', 'User123', 1, 0),
	('user3@gmail.com', 'user3', 'User123', 1, 0),
	('custom1@gmail.com', 'custom1', '1234', 1, 0);


INSERT INTO BinhLuan(ThoiGian, Noidung, HoTen, Email, TrangThai, MaTinTuc) VALUES
	('13-11-2021', N'Báo hôm nay tin tức hay đấy ', N'User 1', 'user1@gmail.com', 1, 2),
	('13-11-2021', N'Toàn tin vịt thế mà cũng đăng', N'User 2', 'user2@gmail.com', 0, 2),
	('14-11-2021', N'Nhiều thông tin quá .Tui học được nhiều tin tức mới', N'User 3', 'user3@gmail.com', 1, 2),
	('13-11-2021', N'Đọc thông tin để không bị lạc trôi nha mọi người ', N'Admin', 'admin@gmail.com', 1, 1),
	('15-11-2021', N'Chán', N'Custom1', 'custom1@gmail.com', 0, 1),
	('15-11-2021', N'Anh hùng bàn phím tới đây', N'Custom1', 'custom1@gmail.com', 1, 1);