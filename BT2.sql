--1. Tạo các quan hệ và khai báo các khóa chính, khóa ngoại của quan hệ
CREATE DATABASE QLBH
CREATE TABLE KHACHHANG (
	MAKH CHAR(4),
	HOTEN VARCHAR(40),
	DCHI VARCHAR(50),
	SODT VARCHAR(20),
	NGSINH SMALLDATETIME,
	NGDK SMALLDATETIME,
	DOANHSO MONEY,
	CONSTRAINT PK_KHACHHANG PRIMARY KEY (MAKH)
);

DROP TABLE KHACHHANG

CREATE TABLE NHANVIEN (
	MANV CHAR(4) NOT NULL,
	HOTEN VARCHAR(40),
	SODT VARCHAR(20),
	NGVL SMALLDATETIME
);

DROP TABLE NHANVIEN;

ALTER TABLE NHANVIEN ADD CONSTRAINT PK_NHANVIEN PRIMARY KEY (MANV);

CREATE TABLE SANPHAM (
	MASP CHAR(4),
	TENSP VARCHAR(40),
	DVT VARCHAR(20),
	NUOCSX VARCHAR(40),
	GIA MONEY,
	CONSTRAINT PK_SANPHAM PRIMARY KEY (MASP)
);

CREATE TABLE HOADON(
	SOHD INT CONSTRAINT PK_HOADON PRIMARY KEY,
	NGHD SMALLDATETIME,
	MAKH CHAR(4),
	MANV CHAR(4),
	TRIGIA MONEY
);


CREATE TABLE CTHD(
	SOHD INT,
	MASP CHAR(4),
	SL INT
	CONSTRAINT PK_CTHD PRIMARY KEY (SOHD,MASP)
);

SET DATEFORMAT DMY;

DROP TABLE KhachHang
DROP TABLE HOADON
DROP TABLE NHANVIEN
DROP TABLE SANPHAM 
DROP TABLE CTHD

-------------------------------
-- KHACHHANG
insert into khachhang values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960','22/07/2006',13060000)
insert into khachhang values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974','30/07/2006',280000)
insert into khachhang values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980','08/05/2006',3860000)
insert into khachhang values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965','10/02/2006',250000)
insert into khachhang values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950','28/10/2006',21000)
insert into khachhang values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981','24/11/2006',915000)
insert into khachhang values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','12/01/2006',12500)
insert into khachhang values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','13/12/2006',365000)
insert into khachhang values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','14/01/2007',70000)
insert into khachhang values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983','16/01/2007',67500)

-------------------------------
-- NHANVIEN
insert into nhanvien values('NV01','Nguyen Nhu Nhut','927345678','13/04/2006')
insert into nhanvien values('NV02','Le Thi Phi Yen','987567390','21/04/2006')
insert into nhanvien values('NV03','Nguyen Van B','997047382','27/04/2006')
insert into nhanvien values('NV04','Ngo Thanh Tuan','913758498','24/06/2006')
insert into nhanvien values('NV05','Nguyen Thi Truc Thanh','918590387','20/07/2006')

-------------------------------
-- SANPHAM
insert into sanpham values('BC01','But chi','cay','Singapore',3000)
insert into sanpham values('BC02','But chi','cay','Singapore',5000)
insert into sanpham values('BC03','But chi','cay','Viet Nam',3500)
insert into sanpham values('BC04','But chi','hop','Viet Nam',30000)
insert into sanpham values('BB01','But bi','cay','Viet Nam',5000)
insert into sanpham values('BB02','But bi','cay','Trung Quoc',7000)
insert into sanpham values('BB03','But bi','hop','Thai Lan',100000)
insert into sanpham values('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
insert into sanpham values('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
insert into sanpham values('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
insert into sanpham values('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
insert into sanpham values('TV05','Tap 100 trang','chuc','Viet Nam',23000)
insert into sanpham values('TV06','Tap 200 trang','chuc','Viet Nam',53000)
insert into sanpham values('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
insert into sanpham values('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
insert into sanpham values('ST02','So tay loai 1','quyen','Viet Nam',55000)
insert into sanpham values('ST03','So tay loai 2','quyen','Viet Nam',51000)
insert into sanpham values('ST04','So tay','quyen','Thai Lan',55000)
insert into sanpham values('ST05','So tay mong','quyen','Thai Lan',20000)
insert into sanpham values('ST06','Phan viet bang','hop','Viet Nam',5000)
insert into sanpham values('ST07','Phan khong bui','hop','Viet Nam',7000)
insert into sanpham values('ST08','Bong bang','cai','Viet Nam',1000)
insert into sanpham values('ST09','But long','cay','Viet Nam',5000)
insert into sanpham values('ST10','But long','cay','Trung Quoc',7000)

-------------------------------
-- HOADON
insert into hoadon values(1001,'23/07/2006','KH01','NV01',320000)
insert into hoadon values(1002,'12/08/2006','KH01','NV02',840000)
insert into hoadon values(1003,'23/08/2006','KH02','NV01',100000)
insert into hoadon values(1004,'01/09/2006','KH02','NV01',180000)
insert into hoadon values(1005,'20/10/2006','KH01','NV02',3800000)
insert into hoadon values(1006,'16/10/2006','KH01','NV03',2430000)
insert into hoadon values(1007,'28/10/2006','KH03','NV03',510000)
insert into hoadon values(1008,'28/10/2006','KH01','NV03',440000)
insert into hoadon values(1009,'28/10/2006','KH03','NV04',200000)
insert into hoadon values(1010,'01/11/2006','KH01','NV01',5200000)
insert into hoadon values(1011,'04/11/2006','KH04','NV03',250000)
insert into hoadon values(1012,'30/11/2006','KH05','NV03',21000)
insert into hoadon values(1013,'12/12/2006','KH06','NV01',5000)
insert into hoadon values(1014,'31/12/2006','KH03','NV02',3150000)
insert into hoadon values(1015,'01/01/2007','KH06','NV01',910000)
insert into hoadon values(1016,'01/01/2007','KH07','NV02',12500)
insert into hoadon values(1017,'02/01/2007','KH08','NV03',35000)
insert into hoadon values(1018,'13/01/2007','KH08','NV03',330000)
insert into hoadon values(1019,'13/01/2007','KH01','NV03',30000)
insert into hoadon values(1020,'14/01/2007','KH09','NV04',70000)
insert into hoadon values(1021,'16/01/2007','KH10','NV03',67500)
insert into hoadon values(1022,'16/01/2007',Null,'NV03',7000)
insert into hoadon values(1023,'17/01/2007',Null,'NV01',330000)

-------------------------------
-- CTHD
insert into cthd values(1001,'TV02',10)
insert into cthd values(1001,'ST01',5)
insert into cthd values(1001,'BC01',5)
insert into cthd values(1001,'BC02',10)
insert into cthd values(1001,'ST08',10)
insert into cthd values(1002,'BC04',20)
insert into cthd values(1002,'BB01',20)
insert into cthd values(1002,'BB02',20)
insert into cthd values(1003,'BB03',10)
insert into cthd values(1004,'TV01',20)
insert into cthd values(1004,'TV02',10)
insert into cthd values(1004,'TV03',10)
insert into cthd values(1004,'TV04',10)
insert into cthd values(1005,'TV05',50)
insert into cthd values(1005,'TV06',50)
insert into cthd values(1006,'TV07',20)
insert into cthd values(1006,'ST01',30)
insert into cthd values(1006,'ST02',10)
insert into cthd values(1007,'ST03',10)
insert into cthd values(1008,'ST04',8)
insert into cthd values(1009,'ST05',10)
insert into cthd values(1010,'TV07',50)
insert into cthd values(1010,'ST07',50)
insert into cthd values(1010,'ST08',100)
insert into cthd values(1010,'ST04',50)
insert into cthd values(1010,'TV03',100)
insert into cthd values(1011,'ST06',50)
insert into cthd values(1012,'ST07',3)
insert into cthd values(1013,'ST08',5)
insert into cthd values(1014,'BC02',80)
insert into cthd values(1014,'BB02',100)
insert into cthd values(1014,'BC04',60)
insert into cthd values(1014,'BB01',50)
insert into cthd values(1015,'BB02',30)
insert into cthd values(1015,'BB03',7)
insert into cthd values(1016,'TV01',5)
insert into cthd values(1017,'TV02',1)
insert into cthd values(1017,'TV03',1)
insert into cthd values(1017,'TV04',5)
insert into cthd values(1018,'ST04',6)
insert into cthd values(1019,'ST05',1)
insert into cthd values(1019,'ST06',2)
insert into cthd values(1020,'ST07',10)
insert into cthd values(1021,'ST08',5)
insert into cthd values(1021,'TV01',7)
insert into cthd values(1021,'TV02',10)
insert into cthd values(1022,'ST07',1)
insert into cthd values(1023,'ST04',6)
----------------------------------------------------------------
----------------------------------------------------------------

--I.
ALTER TABLE SANPHAM ADD GHICHU VARCHAR(20);

ALTER TABLE KHACHHANG ADD LOAIKH TINYINT;

--4.
ALTER TABLE SANPHAM ALTER COLUMN GHICHU VARCHAR(100);

--5.
ALTER TABLE SANPHAM DROP COLUMN GHICHU;

SELECT*FROM SANPHAM

--6.
ALTER TABLE KHACHHANG ALTER COLUMN LOAIKH VARCHAR(50)

--7
ALTER TABLE SANPHAM ADD CONSTRAINT CHK_DVT CHECK(DVT IN('cay','hop','cai','quyen','chuc'));
--8
ALTER TABLE SANPHAM ADD CONSTRAINT CHK_GIA CHECK(GIA >=500);

SELECT *FROM SANPHAM;

--II.
--1. Nhập dữ liệu cho các quan hệ trên (Đã được nhập liệu ở trên)

--2. Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM. Tạo quan hệ KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG.

CREATE TABLE SANPHAM1 (
	MASP CHAR(4),
	TENSP VARCHAR(40),
	DVT VARCHAR(20),
	NUOCSX VARCHAR(40),
	GIA MONEY,
	CONSTRAINT PK_SANPHAM1 PRIMARY KEY (MASP)
);

INSERT INTO SANPHAM1 SELECT*FROM SANPHAM

CREATE TABLE KHACHHANG1 (
	MAKH CHAR(4),
	HOTEN VARCHAR(40),
	DCHI VARCHAR(50),
	SODT VARCHAR(20),
	NGSINH SMALLDATETIME,
	NGDK SMALLDATETIME,
	DOANHSO MONEY,
	CONSTRAINT PK_KHACHHANG1 PRIMARY KEY (MAKH)
);



INSERT INTO KHACHHANG1 SELECT *FROM KHACHHANG
SELECT *FROM SANPHAM1
SELECT *FROM KHACHHANG1
SELECT *FROM KHACHHANG

--3. Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (cho quan hệ SANPHAM1)
UPDATE SANPHAM1 SET GIA = GIA*1.05 WHERE NUOCSX = 'THAI LAN'
--3.1.
UPDATE SANPHAM1 SET GIA = GIA/1.05 WHERE NUOCSX = 'THAI LAN'

--4. Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống (cho quan hệ SANPHAM1).
UPDATE SANPHAM SET GIA = GIA*0.95 WHERE NUOCSX = 'TRUNG QUOC' AND GIA <= 10000
--5. Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước ngày 1/1/2007 có doanh số từ 10.000.000 trở lên hoặc khách hàng đăng ký thành viên từ 1/1/2007 trở về sau có doanh số từ 2.000.000 trở lên (cho quan hệ KHACHHANG1).
UPDATE KHACHHANG SET LOAIKH = 'Vip' WHERE (NGDK < '1/1/2007' AND DOANHSO >= 10000000)
OR (NGDK >= '1/1/2007' AND DOANHSO >= 2000000)
--5.1.
UPDATE KHACHHANG SET LOAIKH = 'VANG LAI' WHERE LOAIKH IS NULL AND LOAIKH != 'VIP'

SELECT *FROM KHACHHANG


--III.
--1.In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất
SELECT MASP, TENSP FROM SANPHAM WHERE NUOCSX = 'TRUNG QUOC'
--2. In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”
SELECT MASP,TENSP FROM SANPHAM WHERE DVT IN ('QUYEN','CAY')
--3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT MASP, TENSP FROM SANPHAM WHERE MASP LIKE 'B_01'
--4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000
--CACH 1:
SELECT MASP,TENSP FROM SANPHAM 
WHERE NUOCSX = 'TRUNG QUOC' 
AND GIA  BETWEEN 30000 AND 40000
--CACH 2:
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'
INTERSECT
SELECT MASP, TENSP
FROM SANPHAM
WHERE GIA BETWEEN 30000 AND 40000

--5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
--CACH 1:
SELECT MASP,TENSP FROM SANPHAM WHERE NUOCSX IN ('TRUNG QUOC', 'THAILAN') AND GIA BETWEEN 30000 AND 40000
--CACH 2:
SELECT MASP, TENSP FROM SANPHAM WHERE (NUOCSX = 'Trung Quoc') AND (GIA BETWEEN 30000 AND 40000)
UNION
SELECT MASP, TENSP FROM SANPHAM WHERE (NUOCSX = 'Thai Lan') AND (GIA BETWEEN 30000 AND 40000)

--6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.
SELECT SOHD, TRIGIA 
FROM HOADON
WHERE NGHD = '1/1/2007' OR NGHD = '2/1/2007'


--7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần)
SELECT SOHD, TRIGIA FROM HOADON WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007 
ORDER BY NGHD ASC, TRIGIA DESC


--8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT KHACHHANG.MAKH , HOTEN
FROM KHACHHANG,HOADON
WHERE NGHD = '1/1/2007' AND KHACHHANG.MAKH = HOADON.MAKH

--9. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày 28/10/2006.
SELECT SOHD, TRIGIA FROM NHANVIEN, HOADON WHERE HOTEN = 'Nguyen Van B' AND NGHD = '28/10/2006'
--10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
SELECT SANPHAM.MASP,TENSP
FROM HOADON,KHACHHANG,CTHD,SANPHAM
WHERE HOADON.MAKH = KHACHHANG.MAKH AND CTHD.SOHD = HOADON.SOHD AND CTHD.MASP = SANPHAM.MASP AND HOTEN = 'Nguyen Van A' 
AND MONTH(NGHD)=10 AND YEAR(NGHD)=2006

--11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT CTHD.SOHD
FROM HOADON,CTHD,SANPHAM
WHERE HOADON.SOHD = CTHD.SOHD 
AND CTHD.MASP = SANPHAM.MASP 
AND (SANPHAM.MASP = 'BB01' OR SANPHAM.MASP ='BB02')

--12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP = 'BB01' AND SL BETWEEN 10 AND 20
UNION
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP = 'BB02' AND SL BETWEEN 10 AND 20
--13.  Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP = 'BB01' AND SL BETWEEN 10 AND 20
INTERSECT
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP = 'BB02' AND SL BETWEEN 10 AND 20

SELECT *FROM cthd

--BT QuanLiHangHoa
Create database PartShipmentDB



Create table Nhacungcap 
(
maNCC		varchar(5),
tenNCC	varchar(20), 
trangthai 	numeric(2),
thanhpho	varchar(30),
Constraint PKNcc primary key (maNCC)
)


create table Phutung 
(
 maPT		varchar(5),
 tenPT	varchar(10),
 mausac	varchar(10),
 khoiluong	float,
 thanhpho	 varchar(30),
 Constraint PKPt Primary Key (maPT) 
)


Create table Vanchuyen 
(
maNCC		varchar(5) ,
maPT		varchar(5),
soluong	numeric(5), 
Constraint PKVc primary key (maNCC,maPT),
Constraint FKShip1 foreign key (maNCC) references Nhacungcap (maNCC),
Constraint FKShip2 foreign key (maPT) references Phutung (maPT)
)


insert into Nhacungcap values ('S1','Smith','20','London')
insert into Nhacungcap values ('S2','Jones','10','Paris')
insert into Nhacungcap values ('S3','Blake','30','Paris')
insert into Nhacungcap values ('S4','Clark','20','London')
insert into Nhacungcap values ('S5','Adams','30','Athens')


Insert  into Phutung values  ( 'P1' , 'Nut' , 'Red' , 12.0 , 'London')
Insert  into Phutung values  ( 'P2' , 'Bolt' , 'Green', 17.0 , 'Paris')
Insert  into Phutung values  ( 'P3' , 'Screw' , 'Blue', 17.0 , 'Oslo')
Insert  into Phutung values  ( 'P4' , 'Screw' , 'Red' , 14.0 , 'London')
Insert  into Phutung values  ( 'P5' , 'Cam' , 'Blue' , 12.0 , 'Paris')
Insert  into Phutung values  ( 'P6' , 'Cog' , 'Red' , 19.0 , 'London')



Insert into Vanchuyen values ('S1','P1',300)
Insert into Vanchuyen values ('S1','P2',200)
Insert into Vanchuyen values ('S1','P3',400)
Insert into Vanchuyen values ('S1','P4',200)
Insert into Vanchuyen values ('S1','P5',100)
Insert into Vanchuyen values ('S1','P6',100)
Insert into Vanchuyen values ('S2','P1',300)
Insert into Vanchuyen values ('S2','P2',400)
Insert into Vanchuyen values ('S3','P2',200)
Insert into Vanchuyen values ('S4','P2',200)
Insert into Vanchuyen values ('S4','P4',300)
Insert into Vanchuyen values ('S4','P5',400)

select * from Vanchuyen 

--1. Hiển thị thông tin (maNCC, tenNCC, thanhpho) của tất cả nhà cung cấp.
SELECT MANCC, TENNCC, THANHPHO FROM NHACUNGCAP

--2. Hiển thị thông tin của tất cả các phụ tùng.
SELECT *FROM PHUTUNG

--3. Hiển thị thông tin các nhà cung cấp ở thành phố London.
SELECT *FROM NHACUNGCAP WHERE THANHPHO = 'LONDON'
--4. Hiển thị mã phụ tùng, tên và màu sắc của tất cả các phụ tùng ở thành phố Paris.
SELECT MAPT, TENPT, MAUSAC FROM PHUTUNG WHERE THANHPHO = 'PARIS'
--5. Hiển thị mã phụ tùng, tên, khối lượng của những phụ tùng có khối lượng lớn hơn 15.
SELECT MAPT, TENPT, KHOILUONG FROM PHUTUNG WHERE KHOILUONG > 15
--6.  Tìm những phụ tùng (maPT, tenPt, mausac) có khối lượng lớn hơn 15, không phải màu đỏ (red).
SELECT MAPT,TENPT,MAUSAC FROM PHUTUNG WHERE KHOILUONG > 15 AND MAUSAC != 'RED'

