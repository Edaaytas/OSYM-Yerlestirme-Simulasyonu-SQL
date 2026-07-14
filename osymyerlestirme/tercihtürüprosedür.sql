USE OSYMYerlestirme2;
GO

DROP PROCEDURE IF EXISTS sp_BolumKontenjanRaporu;
GO

CREATE PROCEDURE sp_BolumKontenjanRaporu
    @PuanTuru NVARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT 
        u.uni_ad AS [Üniversite],
        b.blm_ad AS [Bölüm Adý],
        b.blm_puan_tur AS [Puan Türü],
        bk.kontenjan_yili AS [Yýl],
        bk.genel_kontenjan AS [Toplam Kontenjan],
        bk.kalan_genel_kontenjan AS [Boþ Kalan Kontenjan],
        (bk.genel_kontenjan - bk.kalan_genel_kontenjan) AS [Yerleþen Öðrenci Sayýsý]
    FROM tbl_Bolumler b
    INNER JOIN tbl_Universiteler u ON b.uni_id = u.uni_id
    INNER JOIN tbl_BolumKontenjanlari bk ON b.blm_kod = bk.blm_kod
    WHERE b.blm_puan_tur = @PuanTuru
    ORDER BY u.uni_ad ASC, b.blm_ad ASC;
END
GO


EXEC sp_BolumKontenjanRaporu 'Say';