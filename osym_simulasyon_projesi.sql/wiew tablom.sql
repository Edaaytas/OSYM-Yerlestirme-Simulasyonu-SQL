CREATE VIEW vw_BolumIstatistikleri AS
SELECT 
    u.uni_ad AS [Universite],
    u.uni_tur AS [Universite Turu],
    u.uni_sehir AS [Sehir],
    b.blm_ad AS [Bolum],
    b.blm_puan_tur AS [Puan Turu],
    b.blm_genel_kontenjan AS [Genel Kontenjan],
    (b.blm_genel_kontenjan - b.blm_kalan_kontenjan) AS [Yerlesen Ogrenci],
    b.blm_kalan_kontenjan AS [Bos Kalan Kontenjan],
    CAST(((b.blm_genel_kontenjan - b.blm_kalan_kontenjan) * 100.0) / b.blm_genel_kontenjan AS DECIMAL(5,2)) AS [Doluluk Orani],
    MIN(ys.yerlesme_puani) AS [Taban Puan],
    MAX(ys.yerlesme_puani) AS [Tavan Puan]
FROM tbl_Bolumler b
INNER JOIN tbl_Universiteler u ON b.uni_id = u.uni_id
LEFT JOIN tbl_YerlestirmeSonuclari ys ON b.blm_kod = ys.blm_kod
GROUP BY u.uni_ad, u.uni_tur, u.uni_sehir, b.blm_ad, b.blm_puan_tur, b.blm_genel_kontenjan, b.blm_kalan_kontenjan;
GO