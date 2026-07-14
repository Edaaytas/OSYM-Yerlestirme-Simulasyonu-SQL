USE OSYMYerlestirme2;
GO
UPDATE tbl_Bolumler
SET blm_puan_tur = N'SAY',
    blm_baraj_sirasi = CASE WHEN blm_ad = N'Týp Fakültesi' THEN 50000 ELSE 300000 END
WHERE blm_ad IN (N'Bilgisayar Mühendisliði', N'Týp Fakültesi');
UPDATE tbl_Bolumler
SET blm_puan_tur = N'EA',
    blm_baraj_sirasi = CASE WHEN blm_ad = N'Hukuk Fakültesi' THEN 125000 ELSE 300000 END
WHERE blm_ad IN (N'Hukuk Fakültesi', N'Ýþletme');
UPDATE P
SET P.puan_tur = B.blm_puan_tur
FROM tbl_OgrenciPuanlari P
INNER JOIN tbl_YerlestirmeSonuclari Y ON P.ogr_id = Y.ogr_id
INNER JOIN tbl_Bolumler B ON Y.blm_kod = B.blm_kod;
GO
-----------------------------------------------------------------------------------------------------
USE OSYMYerlestirme2;
GO

INSERT INTO tbl_Bolumler (blm_kod, uni_id, blm_ad, blm_puan_tur, blm_baraj_sirasi, blm_kampus_sehir, blm_egitim_suresi, blm_hazirlik_durumu)
VALUES 
(100201, (SELECT TOP 1 uni_id FROM tbl_Universiteler WHERE uni_ad LIKE '%Ankara%'), N'Tarih', N'SÖZ', 300000, N'Merkez Kampüs', 4, N'Yok'),
(100202, (SELECT TOP 1 uni_id FROM tbl_Universiteler WHERE uni_ad LIKE '%Orta Doðu%'), N'Tarih', N'SÖZ', 300000, N'Merkez Kampüs', 4, N'Zorunlu'),
(100203, (SELECT TOP 1 uni_id FROM tbl_Universiteler WHERE uni_ad LIKE '%Ýstanbul Üniversitesi%'), N'Türk Dili ve Edebiyatý', N'SÖZ', 300000, N'Merkez Kampüs', 4, N'Yok'),
(100204, (SELECT TOP 1 uni_id FROM tbl_Universiteler WHERE uni_ad LIKE '%Marmara%'), N'Radyo, Televizyon ve Sinema', N'SÖZ', 300000, N'Göztepe Kampüsü', 4, N'Yok');

INSERT INTO tbl_BolumKontenjanlari (blm_kod, kontenjan_yili, genel_kontenjan, kalan_genel_kontenjan, ob_kontenjan, kalan_ob_kontenjan)
VALUES 
(100201, 2025, 50, 5, 2, 0),
(100202, 2025, 40, 2, 2, 1),
(100203, 2025, 60, 8, 2, 0),
(100204, 2025, 50, 4, 2, 0);
UPDATE tbl_YerlestirmeSonuclari SET blm_kod = 100201 WHERE ogr_id = (SELECT MAX(ogr_id) FROM tbl_Ogrenciler);
UPDATE tbl_Tercihler SET blm_kod = 100201 WHERE ogr_id = (SELECT MAX(ogr_id) FROM tbl_Ogrenciler);
UPDATE tbl_YerlestirmeSonuclari SET blm_kod = 100202 WHERE ogr_id = (SELECT MAX(ogr_id)-1 FROM tbl_Ogrenciler);
UPDATE tbl_Tercihler SET blm_kod = 100202 WHERE ogr_id = (SELECT MAX(ogr_id)-1 FROM tbl_Ogrenciler);
UPDATE tbl_YerlestirmeSonuclari SET blm_kod = 100203 WHERE ogr_id = (SELECT MAX(ogr_id)-2 FROM tbl_Ogrenciler);
UPDATE tbl_Tercihler SET blm_kod = 100203 WHERE ogr_id = (SELECT MAX(ogr_id)-2 FROM tbl_Ogrenciler);
UPDATE tbl_YerlestirmeSonuclari SET blm_kod = 100204 WHERE ogr_id = (SELECT MAX(ogr_id)-3 FROM tbl_Ogrenciler);
UPDATE tbl_Tercihler SET blm_kod = 100204 WHERE ogr_id = (SELECT MAX(ogr_id)-3 FROM tbl_Ogrenciler);
UPDATE P
SET P.puan_tur = B.blm_puan_tur
FROM tbl_OgrenciPuanlari P
INNER JOIN tbl_YerlestirmeSonuclari Y ON P.ogr_id = Y.ogr_id
INNER JOIN tbl_Bolumler B ON Y.blm_kod = B.blm_kod;
GO

---------------------------------------------------------eeeee
USE OSYMYerlestirme2;
GO
DELETE FROM tbl_OgrenciPuanlari;
DECLARE @i INT = 1;
DECLARE @total_students INT;
DECLARE @current_ogr_id INT;
DECLARE @blm_kod INT;
DECLARE @blm_puan_tur NVARCHAR(10);
SELECT @total_students = COUNT(*) FROM tbl_Ogrenciler;

WHILE @i <= @total_students
BEGIN
    SELECT @current_ogr_id = ogr_id 
    FROM (SELECT ogr_id, ROW_NUMBER() OVER (ORDER BY ogr_id ASC) as RowNum FROM tbl_Ogrenciler) AS T 
    WHERE RowNum = @i;
    SELECT TOP 1 @blm_kod = blm_kod FROM tbl_YerlestirmeSonuclari WHERE ogr_id = @current_ogr_id;
    SELECT @blm_puan_tur = blm_puan_tur FROM tbl_Bolumler WHERE blm_kod = @blm_kod;

    INSERT INTO tbl_OgrenciPuanlari (ogr_id, puan_tur, yerlestirme_puani, basari_sirasi)
    VALUES (
        @current_ogr_id,
        ISNULL(@blm_puan_tur, N'SAY'),         
        290 + (@i * 1.6),                       
        210000 - (@i * 1600)                    
    );

    SET @i = @i + 1;
END
GO