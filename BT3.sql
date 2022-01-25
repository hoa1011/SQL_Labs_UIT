--BT QuanLi_HangHoa

--7. Tìm những phụ tùng (maPT, tenPt, mausac) có khối lượng lớn hơn 15,
--màu sắc khác màu đỏ (red) và xanh (green).
SELECT MAPT,TENPT,MAUSAC 
FROM PHUTUNG
WHERE KHOILUONG > 15
AND (MAUSAC != 'RED' AND MAUSAC != 'GREEN')

--8. Hiển thị những phụ tùng (maPT, tenPT, khối lượng) có khối lượng lớn
--hơn 15 và nhỏ hơn 20, sắp xếp theo tên phụ tùng.

SELECT MAPT,TENPT,KHOILUONG
FROM PHUTUNG
WHERE KHOILUONG BETWEEN 16 AND 19
ORDER BY TENPT

--9.1 Hiển thị những phụ tùng được vận chuyển bởi nhà cung cấp có mã số S1.
--Không hiển thị kết quả trùng. (Không sử dụng phép kết)

SELECT DISTINCT PHUTUNG.MAPT, TENPT,MAUSAC,KHOILUONG,THANHPHO
FROM PHUTUNG, VANCHUYEN
WHERE VANCHUYEN.MAPT = PHUTUNG.MAPT
AND MANCC = 'S1'

--9. Hiển thị những phụ tùng được vận chuyển bởi nhà cung cấp có mã số S1.
--Không hiển thị kết quả trùng. (sử dụng phép kết).
SELECT DISTINCT PHUTUNG.MAPT, TENPT,MAUSAC,KHOILUONG,THANHPHO
FROM PHUTUNG 
INNER JOIN VANCHUYEN ON VANCHUYEN.MAPT = PHUTUNG.MAPT
WHERE MANCC = 'S1'
--10. Hiển thị những nhà cung cấp vận chuyển phụ tùng có mã là P1 (sử dụng
--phép kết).

SELECT NHACUNGCAP.MANCC,TENNCC,TRANGTHAI,THANHPHO
FROM NHACUNGCAP
INNER JOIN VANCHUYEN ON VANCHUYEN.MANCC = NHACUNGCAP.MANCC
WHERE MAPT = 'P1'

--11. Hiển thị thông tin <nhà cung cấp ở thành phố London và có vận chuyển
--phụ tùng của thành phố London>. Không hiển thị kết quả trùng. (Sử dụng
--phép kết)

SELECT DISTINCT NHACUNGCAP.*
FROM NHACUNGCAP
INNER JOIN VANCHUYEN ON VANCHUYEN.MANCC = NHACUNGCAP.MANCC
INNER JOIN PHUTUNG ON VANCHUYEN.MAPT = PHUTUNG.MAPT
WHERE NHACUNGCAP.THANHPHO = 'London' AND PHUTUNG.THANHPHO = 'London'

--9. Hiển thị những phụ tùng được vận chuyển bởi nhà cung cấp có mã số S1.
--Không hiển thị kết quả trùng. (sử dụng phép kết).
--12. Lặp lại câu 9 nhưng sử dụng toán tử IN.

SELECT DISTINCT PHUTUNG.*
FROM PHUTUNG 
WHERE 
PHUTUNG.MAPT IN
(SELECT VANCHUYEN.MAPT
FROM VANCHUYEN WHERE VANCHUYEN.MANCC = 'S1')

--10. Hiển thị những nhà cung cấp vận chuyển phụ tùng có mã là P1 (sử dụng
--phép kết).
--13. Lặp lại câu 10 nhưng sử dụng toán tử IN

SELECT NHACUNGCAP.*
FROM NHACUNGCAP
WHERE NHACUNGCAP.MANCC IN
(SELECT VANCHUYEN.MANCC
FROM VANCHUYEN
WHERE VANCHUYEN.MAPT = 'P1')

--9. Hiển thị những phụ tùng được vận chuyển bởi nhà cung cấp có mã số S1.
--Không hiển thị kết quả trùng. 
--14. Lặp lại câu 9 nhưng sử dụng toán tử EXISTS
SELECT DISTINCT PHUTUNG.*
FROM PHUTUNG
WHERE EXISTS
(SELECT VANCHUYEN.MANCC
FROM VANCHUYEN
WHERE VANCHUYEN.MANCC = 'S1' AND VANCHUYEN.MAPT = PHUTUNG.MAPT)
--15. Lặp lại câu 10 nhưng sử dụng toán tử EXISTS
--10. Hiển thị những nhà cung cấp vận chuyển phụ tùng có mã là P1

SELECT NHACUNGCAP.*
FROM NHACUNGCAP
WHERE
EXISTS
(SELECT MAPT
FROM VANCHUYEN WHERE MAPT = 'P1' AND VANCHUYEN.MANCC = NHACUNGCAP.MANCC)

--16. Lặp lại câu 11 nhưng sử dụng truy vấn con. Sử dụng toán tử IN.
--11. Hiển thị thông tin <nhà cung cấp ở thành phố London và có vận chuyển
--phụ tùng của thành phố London>. Không hiển thị kết quả trùng.

SELECT DISTINCT NHACUNGCAP.*
FROM NHACUNGCAP
WHERE THANHPHO = 'London'
AND MANCC IN 
(SELECT VANCHUYEN.MANCC
FROM VANCHUYEN,PHUTUNG
WHERE PHUTUNG.THANHPHO = 'London' AND
PHUTUNG.MAPT = VANCHUYEN.MAPT)

--17. Lặp lại câu 11 nhưng dùng truy vấn con. Sử dụng toán tử EXISTS.
--11. Hiển thị thông tin <nhà cung cấp ở thành phố London và có vận chuyển
--phụ tùng của thành phố London>. Không hiển thị kết quả trùng.

SELECT DISTINCT NHACUNGCAP.*
FROM NHACUNGCAP
WHERE THANHPHO = 'London'
AND EXISTS
(
	SELECT PHUTUNG.MAPT
	FROM PHUTUNG,VANCHUYEN
	WHERE PHUTUNG.THANHPHO = 'London'
	AND PHUTUNG.MAPT = VANCHUYEN.MAPT
	AND VANCHUYEN.MANCC = NHACUNGCAP.MANCC
)


--18. Tìm nhà cung cấp chưa vận chuyển bất kỳ phụ tùng nào. Sử dụng NOT
--IN.

SELECT NHACUNGCAP.*
FROM NHACUNGCAP
WHERE MANCC NOT IN(
SELECT MANCC
FROM VANCHUYEN)

--19. Tìm nhà cung cấp chưa vận chuyển bất kỳ phụ tùng nào. Sử dụng NOT
--EXISTS.

SELECT NHACUNGCAP.*
FROM NHACUNGCAP WHERE
NOT EXISTS
(SELECT VANCHUYEN.MAPT
FROM VANCHUYEN WHERE 
VANCHUYEN.MANCC = NHACUNGCAP.MANCC)



--20. Tìm nhà cung cấp chưa vận chuyển bất kỳ phụ tùng nào. Sử dụng outer
--JOIN (Phép kết ngoài)

SELECT NHACUNGCAP.*
FROM NHACUNGCAP
LEFT JOIN VANCHUYEN ON NHACUNGCAP.MANCC = VANCHUYEN.MANCC
WHERE VANCHUYEN.MAPT IS NULL



--BT QuanLi_BanHang

--13.  Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP = 'BB01' AND SL BETWEEN 10 AND 20
INTERSECT
SELECT DISTINCT SOHD
FROM CTHD
WHERE MASP = 'BB02' AND SL BETWEEN 10 AND 20 
--14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
--C1: Không sử dụng phép kết
SELECT MASP, TENSP
FROM SANPHAM WHERE NUOCSX = 'Trung Quoc'
UNION
SELECT SANPHAM.MASP,TENSP
FROM CTHD,SANPHAM,HOADON
WHERE CTHD.SOHD = HOADON.SOHD 
AND SANPHAM.MASP = CTHD.MASP
AND NGHD = '1/1/2007'
--C2: Sử dụng phép kết

SELECT DISTINCT SANPHAM.MASP,TENSP
FROM
HOADON JOIN CTHD ON CTHD.SOHD = HOADON.SOHD
RIGHT JOIN SANPHAM ON SANPHAM.MASP = CTHD.MASP
WHERE NUOCSX = 'Trung Quoc' OR NGHD = '1/1/2007'


--15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.

SELECT MASP,TENSP
FROM SANPHAM
WHERE MASP NOT IN (SELECT MASP FROM CTHD)

--16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.

SELECT MASP,TENSP
FROM SANPHAM
WHERE SANPHAM.MASP
NOT IN( SELECT CTHD.MASP FROM
HOADON,CTHD
WHERE HOADON.SOHD  = CTHD.SOHD
AND YEAR(NGHD) = 2006)


--17.  In ra danh sách các sản phẩm (MASP,TENSP) <do “Trung Quoc” sản xuất> không bán được trong năm 2006.
SELECT MASP,TENSP
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'
AND SANPHAM.MASP
NOT IN(
SELECT CTHD.MASP
FROM CTHD,HOADON
WHERE CTHD.SOHD = HOADON.SOHD
AND YEAR(NGHD) = 2006)

--18. Tìm số hóa đơn đã mua <tất cả các sản phẩm do Singapore sản xuất.>
SELECT SOHD
FROM HOADON 
WHERE NOT EXISTS (SELECT *FROM SANPHAM WHERE NUOCSX = 'Singapore' 
AND NOT EXISTS (SELECT *FROM CTHD 
WHERE CTHD.MASP = SANPHAM.MASP AND CTHD.SOHD = HOADON.SOHD))

