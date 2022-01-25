--BT Quan Li Hang Hoa

--1. Hiển thị thông tin (maNCC, tenNCC, thanhpho) của tất cả nhà cung cấp.
SELECT MANCC,TENNCC,THANHPHO FROM NHACUNGCAP;

--2. Hiển thị thông tin của tất cả các phụ tùng.
SELECT *FROM PHUTUNG;
--3. Hiển thị thông tin các nhà cung cấp ở thành phố London.
SELECT * FROM NHACUNGCAP
WHERE THANHPHO='LONDON';


--4. Hiển thị mã phụ tùng, tên và màu sắc của tất cả các phụ tùng ở thành
--phố Paris.
SELECT maPT,tenPT,mausac
FROM PHUTUNG 
WHERE thanhpho='PARIS';

--5. Hiển thị mã phụ tùng, tên, khối lượng của những phụ tùng có khối
--lượng lớn hơn 15.
SELECT MAPT,TENPT,KHOILUONG
FROM PHUTUNG
WHERE KHOILUONG>15;
--6. Tìm những phụ tùng (maPT, tenPt, mausac) có khối lượng lớn hơn 15,
--không phải màu đỏ (red).
SELECT MAPT,TENPT,MAUSAC FROM PHUTUNG
WHERE KHOILUONG>15 AND MAUSAC != 'RED';
--7. Tìm những phụ tùng (maPT, tenPt, mausac) có khối lượng lớn hơn 15,
--màu sắc khác màu đỏ (red) và xanh (green).
SELECT MAPT,TENPT,MAUSAC FROM PHUTUNG WHERE KHOILUONG>15
AND MAUSAC != 'RED'
INTERSECT
SELECT MAPT,TENPT,MAUSAC FROM PHUTUNG WHERE KHOILUONG>15
AND MAUSAC != 'GREEN'

--8. Hiển thị những phụ tùng (maPT, tenPT, khối lượng) có khối lượng lớn
--hơn 15 và nhỏ hơn 20, sắp xếp theo tên phụ tùng.
SELECT MAPT,TENPT,KHOILUONG
FROM Phutung
WHERE KHOILUONG  BETWEEN 16 AND 19;
--9. Hiển thị những phụ tùng được vận chuyển bởi nhà cung cấp có mã số S1.
--Không hiển thị kết quả trùng. (sử dụng phép kết).
SELECT DISTINCT PT.*
FROM PHUTUNG PT
JOIN VANCHUYEN VC ON VC.MAPT = PT.maPT
AND MANCC = 'S1';
--10. Hiển thị những nhà cung cấp vận chuyển phụ tùng có mã là P1 (sử dụng
--phép kết).
SELECT NCC.*
FROM NHACUNGCAP NCC
JOIN VANCHUYEN VC ON NCC.MANCC=VC.maNCC
WHERE MAPT = 'P1';
--11. Hiển thị thông tin nhà cung cấp ở thành phố London và có vận chuyển
--phụ tùng của thành phố London. Không hiển thị kết quả trùng. (Sử dụng
--phép kết)
SELECT DISTINCT NCC.*
FROM NHACUNGCAP NCC
JOIN VANCHUYEN VC ON VC.maNCC=NCC.maNCC
JOIN PHUTUNG PT ON PT.maPT=VC.maPT
WHERE NCC.thanhpho = 'LONDON'
AND PT.thanhpho = 'LONDON';
--12. Lặp lại câu 9 nhưng sử dụng toán tử IN.
SELECT PT.*
FROM PHUTUNG PT
WHERE MAPT IN
(SELECT MAPT FROM VANCHUYEN
WHERE MANCC = 'S1');
--13. Lặp lại câu 10 nhưng sử dụng toán tử IN
SELECT NCC.*
FROM NHACUNGCAP NCC
WHERE MANCC IN (SELECT MANCC FROM VANCHUYEN WHERE MAPT='P1');
--14. Lặp lại câu 9 nhưng sử dụng toán tử EXISTS
SELECT PT.*
FROM PHUTUNG PT WHERE EXISTS (SELECT *FROM VANCHUYEN VC 
									WHERE MANCC = 'S1' AND VC.MAPT=PT.maPT);
--15. Lặp lại câu 10 nhưng sử dụng toán tử EXISTS
SELECT NCC.*
FROM NHACUNGCAP NCC
WHERE EXISTS (SELECT*FROM VANCHUYEN VC
					WHERE VC.MANCC=NCC.MANCC
					AND MAPT = 'P1');


--16. Lặp lại câu 11 nhưng sử dụng truy vấn con. Sử dụng toán tử IN.

SELECT NCC.*
FROM NHACUNGCAP NCC
WHERE NCC.THANHPHO='LONDON'
AND MANCC IN (SELECT MANCC FROM VANCHUYEN VC,PHUTUNG PT WHERE VC.MAPT=PT.MAPT AND PT.THANHPHO = 'LONDON');


--17. Lặp lại câu 11 nhưng dùng truy vấn con. Sử dụng toán tử EXISTS.

SELECT NCC.*
FROM NHACUNGCAP NCC
WHERE NCC.THANHPHO = 'LONDON'
AND EXISTS(SELECT *FROM VANCHUYEN VC, PHUTUNG PT
					WHERE PT.THANHPHO='LONDON' AND VC.MANCC=NCC.MANCC
							AND PT.MAPT = VC.MAPT);


--18. Tìm nhà cung cấp chưa vận chuyển bất kỳ phụ tùng nào. Sử dụng NOT
--IN.
SELECT NCC.*
FROM NHACUNGCAP NCC
WHERE MANCC NOT IN(SELECT DISTINCT MANCC FROM VANCHUYEN);

--19. Tìm nhà cung cấp chưa vận chuyển bất kỳ phụ tùng nào. Sử dụng NOT
--EXISTS.
SELECT NCC.*
FROM NHACUNGCAP NCC
WHERE NOT EXISTS (SELECT*FROM VANCHUYEN VC WHERE VC.maNCC=NCC.maNCC);


--20. Tìm nhà cung cấp chưa vận chuyển bất kỳ phụ tùng nào. Sử dụng outer
--JOIN (Phép kết ngoài)

SELECT NCC.*
FROM NHACUNGCAP NCC
LEFT JOIN VANCHUYEN VC ON VC.MANCC = NCC.MANCC
WHERE VC.maNCC IS NULL;


--21. Có tất cả bao nhiêu nhà cung cấp?
SELECT COUNT(MANCC) 'SO_NCC'
FROM NHACUNGCAP;

--22. Có tất cả bao nhiêu nhà cung cấp ở London?
SELECT COUNT(MANCC) 'SO_NCC_LONDON'
FROM NHACUNGCAP
WHERE THANHPHO = 'LONDON';

--23. Hiển thị trị giá cao nhất, thấp nhất của trangthai của các nhà cung
--cấp.
SELECT MAX(TRANGTHAI) 'TT_CAONHAT',
MIN(TRANGTHAI) 'TT_THAPNHAT' 
FROM Nhacungcap;
--24. Hiển thị giá trị cao nhất, thấp nhất của trangthai trong table
--nhacungcap ở thành phố London.
SELECT MAX(TRANGTHAI) 'TT_CAONHAT_LONDON', MIN(TRANGTHAI) 'TT_THAPNHAT_LONDON'
FROM NHACUNGCAP WHERE THANHPHO = 'LONDON';
--25. Mỗi nhà cung cấp vận chuyển bao nhiêu phụ tùng? Chỉ hiển thị mã nhà
--cung cấp, tổng số phụ tùng đã vận chuyển.
SELECT NCC.MANCC, SUM(SOLUONG) 'TS_PT'
FROM NHACUNGCAP NCC
LEFT JOIN VANCHUYEN VC ON VC.MANCC=NCC.MANCC
GROUP BY NCC.MANCC;

--26. Mỗi nhà cung cấp vận chuyển bao nhiêu phụ tùng? Hiển thị mã nhà cung
--cấp, tên, thành phố của nhà cung cấp và tổng số phụ tùng đã vận chuyển
SELECT NCC.MANCC, TENNCC,NCC.THANHPHO, SUM(SOLUONG) 'TS_PT'
FROM NHACUNGCAP NCC
LEFT JOIN VANCHUYEN VC ON VC.MANCC = NCC.MANCC
GROUP BY NCC.MANCC,TENNCC,NCC.THANHPHO;

--27. Nhà cung cấp nào đã vận chuyển tổng cộng nhiều hơn 500 phụ tùng? Chỉ
--hiển thị mã nhà cung cấp
SELECT MANCC
FROM VANCHUYEN 
GROUP BY MANCC
HAVING SUM(SOLUONG) > 500;

--28. Nhà cung cấp nào đã vận chuyển nhiều hơn 300 phụ tùng màu đỏ (red).
--Chỉ hiển thị mã nhà cung cấp.
SELECT MANCC
FROM VANCHUYEN VC, PHUTUNG PT
WHERE PT.MAPT = VC.MAPT
AND MAUSAC = 'RED'
GROUP BY MANCC
HAVING SUM(SOLUONG) > 300;

--29. Nhà cung cấp nào đã vận chuyển nhiều hơn 300 phụ tùng màu đỏ (red).
--Hiển thị mã nhà cung cấp, tên, thành phố và số lượng phụ tùng màu đỏ đã
--vận chuyển.
SELECT NCC.MANCC,TENNCC,NCC.THANHPHO, SUM(SOLUONG) 'TS_PT_DO'
FROM NHACUNGCAP NCC
JOIN VANCHUYEN VC ON VC.maNCC=NCC.MANCC
JOIN PHUTUNG PT ON VC.maPT=PT.MAPT
WHERE MAUSAC = 'RED'
GROUP BY NCC.MANCC,TENNCC,NCC.THANHPHO
HAVING SUM(SOLUONG)>300;

--30. Có bao nhiêu nhà cung cấp ở mỗi thành phố
SELECT THANHPHO,COUNT(MANCC) 'SO_NCC'
FROM NHACUNGCAP
GROUP BY THANHPHO;
--31. Nhà cung cấp nào đã vận chuyển nhiều phụ tùng nhất. Hiển thị tên nhà
--cung cấp và số lượng phụ tùng đã vận chuyển.
SELECT TENNCC, SUM(SOLUONG) 'SL_PT'
FROM NHACUNGCAP NCC
JOIN VANCHUYEN VC ON NCC.MANCC=VC.MANCC
GROUP BY TENNCC
HAVING SUM(SOLUONG) >= ALL(
							SELECT SUM(SOLUONG) 
								FROM VANCHUYEN 
									GROUP BY MANCC);




--32. Thành phố nào có cả nhà cung cấp và phụ tùng.

SELECT THANHPHO FROM NHACUNGCAP
INTERSECT
SELECT THANHPHO FROM PHUTUNG;


--33. Viết câu lệnh SQL để insert nhà cung cấp mới: S6, Duncan, 30, Paris.
INSERT INTO NHACUNGCAP VALUES('S6', 'Duncan','30','Paris');


--34. Viết câu lệnh SQL để thay đổi thanh phố S6 (ở câu 33) thành Sydney.
UPDATE NHACUNGCAP SET THANHPHO = 'Sydney' WHERE MANCC = 'S6';
--35. Viết câu lệnh SQL tăng trangthai của nhà cung cấp ở London lên thêm 10.
UPDATE NHACUNGCAP SET TRANGTHAI=TRANGTHAI+10 WHERE THANHPHO = 'London';
--36. Viết câu lệnh SQL xoá nhà cung cấp S6
DELETE FROM NHACUNGCAP WHERE MANCC = 'S6';



--BT Quan Li Ban Hang
SET DATEFORMAT DMY;
--1. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT MASP,TENSP FROM SANPHAM WHERE NUOCSX = 'Trung Quoc';
--2. In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
SELECT MASP,TENSP FROM SANPHAM WHERE DVT IN('cay','quyen');

--3. In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết
--thúc là “01”.
SELECT MASP,TENSP FROM SANPHAM WHERE MASP LIKE 'B_01';
--4. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000
--đến 40.000.
SELECT MASP,TENSP FROM SANPHAM WHERE NUOCSX = 'Trung Quoc' AND GIA  BETWEEN 30000 AND 40000; 
--5. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000
--đến 40.000.
SELECT MASP,TENSP FROM SANPHAM WHERE (NUOCSX = 'Thai Lan' OR NUOCSX = 'Trung Quoc')
AND GIA BETWEEN 30000 AND 40000;

--6. In ra các số hóa đơn, trị giá hóa đơn bán ra trong ngày 1/1/2007 và ngày 2/1/2007.

SELECT SOHD,TRIGIA FROM HOADON
WHERE NGHD = '1/1/2007'
UNION 
SELECT SOHD,TRIGIA FROM HOADON
WHERE NGHD = '2/1/2007';

--7. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và
--trị giá của hóa đơn (giảm dần).
SELECT SOHD,TRIGIA FROM HOADON
WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007
ORDER BY DAY(NGHD) ASC, TRIGIA DESC;

--8. In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.

SELECT KH.MAKH,HOTEN
FROM KHACHHANG KH, HOADON HD
WHERE KH.MAKH=HD.MAKH AND NGHD = '1/1/2007';

--9. In ra số hóa đơn, trị giá các hóa đơn do nhân viên có tên “Nguyen Van B” lập trong ngày
--28/10/2006.
SELECT SOHD,TRIGIA
FROM HOADON HD, NHANVIEN NV
WHERE HD.MANV=NV.MANV AND HOTEN = 'Nguyen Van B' AND NGHD = '28/10/2006';

--10. In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A”
--mua trong tháng 10/2006.
SELECT SP.MASP, TENSP
FROM SANPHAM SP, KHACHHANG KH, HOADON HD, CTHD
WHERE SP.MASP = CTHD.MASP
AND KH.MAKH = HD.MAKH
AND HD.SOHD=CTHD.SOHD
AND HOTEN='Nguyen Van A'
AND MONTH(NGHD) = 10 AND YEAR(NGHD)=2006;
--11. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”.
SELECT SOHD FROM CTHD
WHERE MASP = 'BB01'
UNION
SELECT SOHD FROM CTHD
WHERE MASP='BB02';


--12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm
--mua với số lượng từ 10 đến 20.
SELECT SOHD FROM CTHD
WHERE MASP = 'BB01' AND SL BETWEEN 10 AND 20
UNION
SELECT SOHD FROM CTHD
WHERE MASP = 'BB02' AND SL BETWEEN 10 AND 20;
--13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản
--phẩm mua với số lượng từ 10 đến 20.
SELECT SOHD FROM CTHD
WHERE MASP = 'BB01' AND SL BETWEEN 10 AND 20
INTERSECT
SELECT SOHD FROM CTHD
WHERE MASP = 'BB02' AND SL BETWEEN 10 AND 20;
--14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản
--phẩm được bán ra trong ngày 1/1/2007.
SELECT MASP, TENSP
FROM SANPHAM WHERE NUOCSX = 'Trung Quoc'
UNION
SELECT SANPHAM.MASP,TENSP
FROM CTHD,SANPHAM,HOADON
WHERE CTHD.SOHD = HOADON.SOHD 
AND SANPHAM.MASP = CTHD.MASP
AND NGHD = '1/1/2007';


--15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
--C1
SELECT MASP,TENSP 
FROM SANPHAM 
WHERE MASP NOT IN (SELECT MASP FROM CTHD);
--C2
SELECT MASP,TENSP
FROM SANPHAM WHERE
NOT EXISTS(SELECT *FROM CTHD WHERE CTHD.MASP = SANPHAM.MASP);
--C3
SELECT MASP,TENSP
FROM SANPHAM
EXCEPT
SELECT SP.MASP, TENSP
FROM SANPHAM SP, CTHD
WHERE CTHD.MASP=SP.MASP
--16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
SELECT MASP,TENSP
FROM SANPHAM SP
WHERE MASP NOT IN (SELECT DISTINCT SP.MASP
FROM SANPHAM SP
JOIN CTHD ON CTHD.MASP=SP.MASP
JOIN HOADON HD ON HD.SOHD = CTHD.SOHD
WHERE YEAR(NGHD)=2006);

--17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán
--được trong năm 2006.
--C1
SELECT MASP,TENSP
FROM SANPHAM SP
WHERE NUOCSX = 'Trung Quoc'
EXCEPT 
SELECT SP.MASP,TENSP
FROM SANPHAM SP, CTHD, HOADON HD
WHERE HD.SOHD=HD.SOHD AND SP.MASP=CTHD.MASP
AND NUOCSX = 'Trung Quoc' AND YEAR(NGHD)=2006;

--C2
SELECT MASP,TENSP
FROM SANPHAM SP
WHERE NUOCSX = 'Trung Quoc'
AND MASP NOT IN (SELECT SP.MASP
					FROM SANPHAM SP, CTHD, HOADON HD
					WHERE HD.SOHD=HD.SOHD AND SP.MASP=CTHD.MASP
					AND NUOCSX = 'Trung Quoc' AND YEAR(NGHD)=2006); 


--18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
SELECT SOHD 
FROM HOADON HD
WHERE NOT EXISTS(SELECT *FROM SANPHAM SP
					WHERE NUOCSX='Singapore' AND NOT EXISTS
					(SELECT *FROM CTHD WHERE CTHD.MASP = SP.MASP
						AND CTHD.SOHD=HD.SOHD));

--19. Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản
--xuất.
SELECT HD.SOHD FROM HOADON HD
WHERE YEAR(NGHD) = 2006 AND NOT EXISTS(SELECT *FROM SANPHAM SP
										WHERE NUOCSX = 'Singapore' AND NOT EXISTS
										(SELECT *FROM CTHD WHERE CTHD.MASP=SP.MASP
											AND CTHD.SOHD=HD.SOHD));

--20. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(SOHD) 'KPKH_TV'
FROM HOADON
WHERE MAKH IS NULL;


--21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT(DISTINCT MASP) 'SP_DUOCBANRA_2006'
FROM HOADON,CTHD
WHERE CTHD.SOHD = HOADON.SOHD
AND YEAR(NGHD) = 2006;
--22. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT MAX(TRIGIA) 'TRIGIAHD_CAONHAT', MIN(TRIGIA) 'TRIGIAHD_NHONHAT'
FROM HOADON;
--23. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(TRIGIA) 'TRIGIAHD_TB'
FROM HOADON
WHERE YEAR(NGHD) = 2006;
--24. Tính doanh thu bán hàng trong năm 2006.
SELECT SUM(TRIGIA) 'DT_BH_2006'
FROM HOADON
WHERE YEAR(NGHD) = 2006;

--25. Tìm số hóa đơn có trị giá cao nhất trong năm 2006. 


SELECT SOHD
FROM HOADON
WHERE YEAR(NGHD)=2006
AND TRIGIA IN (SELECT MAX(TRIGIA) FROM HOADON WHERE YEAR(NGHD)=2006);



--26. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006.

SELECT HOTEN
FROM HOADON HD, KHACHHANG KH
WHERE HD.MAKH = KH.MAKH
AND YEAR(NGHD) = 2006 
AND TRIGIA >= ALL (SELECT TRIGIA FROM HOADON 
					WHERE YEAR(NGHD) = 2006);



--27. In ra danh sách 3 khách hàng đầu tiên (MAKH, HOTEN) sắp xếp theo doanh số giảm
--dần.

SELECT TOP 3 MAKH,HOTEN
FROM KHACHHANG 
ORDER BY DOANHSO DESC;



--28. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao
--nhất.
SELECT MASP, TENSP
FROM SANPHAM WHERE 
GIA = ANY(SELECT DISTINCT TOP 3 GIA FROM SANPHAM 
			ORDER BY GIA DESC);


--29. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1
--trong 3 mức giá cao nhất (của tất cả các sản phẩm).

SELECT MASP,TENSP
FROM SANPHAM
WHERE NUOCSX = 'Thai Lan' AND GIA = 
ANY (SELECT DISTINCT TOP 3 GIA 
		FROM SANPHAM ORDER BY GIA DESC);


--30. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1
--trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT MASP,TENSP
FROM SANPHAM 
WHERE NUOCSX = 'Trung Quoc' AND GIA
= ANY(SELECT DISTINCT TOP 3 GIA 
		FROM SANPHAM 
			WHERE NUOCSX = 'Trung Quoc' 
			ORDER BY GIA DESC);

--31. * In ra danh sách khách hàng nằm trong 3 hạng cao nhất (xếp hạng theo doanh số)
SELECT TOP 3 KH.*,
RANK() OVER (ORDER BY DOANHSO DESC) 'XEPHANG'
FROM KHACHHANG KH;


--32. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
SELECT COUNT(MASP) 'TS_SP_TRUNGQUOCSX'
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc';

--33. Tính tổng số sản phẩm của <từng nước sản xuất.>
SELECT NUOCSX, COUNT(MASP) 'TS_SP'
FROM SANPHAM
GROUP BY NUOCSX;

--34. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
SELECT NUOCSX, MAX(GIA) 'GIABAN_CAONHAT',
MIN(GIA) 'GIABAN_THAPNHAT',
AVG(GIA) 'GIABAN_TB'
FROM SANPHAM
GROUP BY NUOCSX;


--35. Tính doanh thu bán hàng mỗi ngày.
SELECT NGHD, SUM(TRIGIA) 'DOANHTHU_MOINGAY'
FROM HOADON
GROUP BY NGHD;

--36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT MASP, SUM(SL) 'TONG_SL_BANRA_THANG10'
FROM CTHD, HOADON
WHERE CTHD.SOHD = HOADON.SOHD
AND MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006
GROUP BY MASP;

--37. Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(NGHD) 'THANG', SUM(TRIGIA) 'DT_MOITHANG_NAM2006'
FROM HOADON
WHERE YEAR(NGHD) = 2006
GROUP BY MONTH(NGHD);



--38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
SELECT SOHD, COUNT(DISTINCT MASP) 'SL_SP_KHACNHAU'
FROM CTHD
GROUP BY SOHD
HAVING COUNT(DISTINCT MASP) >= 4;

--39. Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
SELECT HD.*
FROM HOADON HD
WHERE SOHD IN( SELECT SOHD
				FROM CTHD, SANPHAM SP
				WHERE CTHD.MASP = SP.MASP
				AND NUOCSX='Viet Nam'
				GROUP BY SOHD
				HAVING COUNT(SP.MASP) = 3);


--40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.

SELECT KH.MAKH,HOTEN
FROM KHACHHANG KH, HOADON HD
WHERE KH.MAKH = HD.MAKH
GROUP BY KH.MAKH,HOTEN
HAVING COUNT(SOHD) >= ALL (SELECT COUNT(SOHD)
							FROM HOADON HD
							JOIN KHACHHANG KH ON KH.MAKH = HD.MAKH 
							GROUP BY KH.MAKH,HOTEN);


--41. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?

SELECT MONTH(NGHD) 'THANG', SUM(TRIGIA) 'DS_BH_CAONHAT'
FROM HOADON
WHERE YEAR(NGHD) = 2006 
GROUP BY MONTH(NGHD) 
HAVING SUM(TRIGIA) >= ALL (SELECT SUM(TRIGIA) 
							FROM HOADON WHERE YEAR(NGHD) = 2006
							GROUP BY MONTH(NGHD));


--42. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
SELECT SANPHAM.MASP, TENSP, SUM (SL) AS TONGSL_BANRA_THAPNHAT
FROM SANPHAM, CTHD,HOADON
WHERE SANPHAM.MASP = CTHD.MASP
AND HOADON.SOHD = CTHD.SOHD
AND YEAR(NGHD) = 2006
GROUP BY SANPHAM.MASP, TENSP
HAVING SUM(SL) <= ALL (SELECT SUM(SL)
						FROM SANPHAM, CTHD,HOADON
						WHERE SANPHAM.MASP = CTHD.MASP
						AND HOADON.SOHD = CTHD.SOHD AND YEAR(NGHD) = 2006
						GROUP BY SANPHAM.MASP,TENSP);

--43.*Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
SELECT MASP,TENSP
FROM SANPHAM AS SP1
WHERE GIA IN(SELECT MAX(GIA)
					FROM SANPHAM AS SP2
						WHERE SP1.NUOCSX=SP2.NUOCSX);
		
--44. Tìm nước sản xuất ít nhất 3 sản phẩm có giá bán khác nhau.

SELECT NUOCSX
FROM SANPHAM
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA) >= 3;



--45. *Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều
--nhất.
SELECT *FROM KHACHHANG WHERE MAKH IN
(SELECT HOADON.MAKH FROM 
(SELECT TOP 10 MAKH,HOTEN
FROM KHACHHANG KH
ORDER BY DOANHSO DESC) AS A, HOADON
WHERE A.MAKH=HOADON.MAKH
GROUP BY HOADON.MAKH
HAVING COUNT(SOHD) >= ALL (SELECT COUNT(SOHD) FROM 
						(SELECT TOP 10 MAKH,HOTEN 
							FROM KHACHHANG KH 
								ORDER BY DOANHSO DESC) AS A, HOADON 
									WHERE A.MAKH=HOADON.MAKH 
										GROUP BY HOADON.MAKH,HOTEN)
										);





