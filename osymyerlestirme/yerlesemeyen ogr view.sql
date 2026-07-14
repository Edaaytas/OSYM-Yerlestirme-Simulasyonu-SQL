USE OSYMYerlestirme2;
GO

CREATE VIEW vw_YerlesemeyenOgrenciler
AS
SELECT 
    o.ogr_id AS [OgrenciID],
    o.ogr_tckn AS [TCKN],
    o.ogr_ad + ' ' + o.ogr_soyad AS [AdSoyad],
    p.yerlestirme_puani AS [Puan],
    p.basari_sirasi AS [BasariSirasi]
FROM tbl_Ogrenciler o
INNER JOIN tbl_OgrenciPuanlari p ON o.ogr_id = p.ogr_id
LEFT JOIN tbl_YerlestirmeSonuclari y ON o.ogr_id = y.ogr_id
WHERE y.ogr_id IS NULL; -- Sadece yerleþemeyenleri filtrele
GO


SELECT * FROM vw_YerlesemeyenOgrenciler;