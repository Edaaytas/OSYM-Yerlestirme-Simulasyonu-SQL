USE OSYMYerlestirme2;
GO
DROP PROCEDURE IF EXISTS sp_OgrenciDetayGetir;
GO
CREATE PROCEDURE sp_OgrenciDetayGetir
    @OgrenciID INT 
AS
BEGIN
    SET NOCOUNT ON;
    SELECT 
        o.ogr_id AS [Öðrenci No],
        o.ogr_ad + ' ' + o.ogr_soyad AS [Ad Soyad],
        CASE WHEN o.cinsiyet_id = 0 THEN N'Kadýn' ELSE N'Erkek' END AS [Cinsiyet],
        p.puan_tur AS [Puan Türü],
        p.basari_sirasi AS [Baþarý Sýrasý],
        u.uni_ad AS [Kazandýðý Üniversite],
        b.blm_ad AS [Kazandýðý Bölüm],
        y.yerlesme_trc_sira AS [Yerleþtiði Tercih Sýrasý],
        y.yerlesme_yili AS [Yerleþme Yýlý]
    FROM tbl_Ogrenciler o
    INNER JOIN tbl_YerlestirmeSonuclari y ON o.ogr_id = y.ogr_id
    INNER JOIN tbl_Bolumler b ON y.blm_kod = b.blm_kod
    INNER JOIN tbl_Universiteler u ON b.uni_id = u.uni_id
    INNER JOIN tbl_OgrenciPuanlari p ON o.ogr_id = p.ogr_id
    WHERE o.ogr_id = @OgrenciID; 
END
GO

EXEC sp_OgrenciDetayGetir @OgrenciID = 724;
EXEC sp_OgrenciDetayGetir 711;