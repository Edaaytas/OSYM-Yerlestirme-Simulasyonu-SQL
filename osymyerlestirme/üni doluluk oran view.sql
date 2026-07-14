USE OSYMYerlestirme2;
GO

CREATE VIEW vw_UniversiteDolulukAnalizi
AS
SELECT 
    u.uni_ad AS [UniversiteAdi],
    u.uni_tur AS [UniversiteTuru],
    b.blm_ad AS [BolumAdi],
    b.blm_puan_tur AS [PuanTuru],
    bk.kontenjan_yili AS [Yil],
    bk.genel_kontenjan AS [ToplamKontenjan],
    bk.kalan_genel_kontenjan AS [BosKalanKontenjan],
    (bk.genel_kontenjan - bk.kalan_genel_kontenjan) AS [YerlesenOgrenciSayisi],
    CAST(((bk.genel_kontenjan - bk.kalan_genel_kontenjan) * 100.0 / bk.genel_kontenjan) AS DECIMAL(5,2)) AS [DolulukOraniYuzde]
FROM tbl_Bolumler b
INNER JOIN tbl_Universiteler u ON b.uni_id = u.uni_id
INNER JOIN tbl_BolumKontenjanlari bk ON b.blm_kod = bk.blm_kod;
GO

SELECT * FROM vw_UniversiteDolulukAnalizi 
ORDER BY DolulukOraniYuzde DESC;