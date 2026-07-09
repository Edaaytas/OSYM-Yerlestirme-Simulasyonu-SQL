CREATE PROCEDURE sp_TercihRobotu
    @OgrenciID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @OgrenciAd VARCHAR(100);
    SELECT @OgrenciAd = ogr_ad + ' ' + ogr_soyad FROM tbl_Ogrenciler WHERE ogr_id = @OgrenciID;

    PRINT '--- ' + UPPER(@OgrenciAd) + ' ÝÇÝN AKILLI TERCÝH ROBOTU RAPORU ---';
    PRINT '';

    SELECT 
        u.uni_ad AS [Üniversite],
        b.blm_ad AS [Bölüm],
        b.blm_puan_tur AS [Puan Türü],
        op.yerlestirme_puani AS [Benim Puaným],
        
        ISNULL(TabanPuanlar.TabanPuan, 300.000) AS [Bölüm Taban Puaný],
        
        CAST(op.yerlestirme_puani - ISNULL(TabanPuanlar.TabanPuan, 300.000) AS DECIMAL(6,3)) AS [Puan Farký],

        CASE 
            WHEN (op.yerlestirme_puani - ISNULL(TabanPuanlar.TabanPuan, 300.000)) >= 15.000 THEN 'Garanti (Kesin Gelir)'
            WHEN (op.yerlestirme_puani - ISNULL(TabanPuanlar.TabanPuan, 300.000)) BETWEEN -5.000 AND 14.999 THEN 'Kritik (Sýnýrda, Þansýný Dene)'
            ELSE 'Zor / Hayal (Puanýn Yetmiyor)'
        END AS [Kazanma Ýhtimali]

    FROM tbl_Bolumler b
    INNER JOIN tbl_Universiteler u ON b.uni_id = u.uni_id
    INNER JOIN tbl_OgrenciPuanlari op ON op.ogr_id = @OgrenciID AND op.puan_tur = b.blm_puan_tur
    
    LEFT JOIN (
        SELECT blm_kod, MIN(yerlesme_puani) AS TabanPuan 
        FROM tbl_YerlestirmeSonuclari 
        GROUP BY blm_kod
    ) TabanPuanlar ON b.blm_kod = TabanPuanlar.blm_kod

    ORDER BY b.blm_puan_tur, [Puan Farký] DESC;
END;
GO


EXEC sp_TercihRobotu @OgrenciID = 123;