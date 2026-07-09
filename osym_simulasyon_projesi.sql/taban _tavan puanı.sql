SELECT 
    u.uni_ad AS [Üniversite],
    b.blm_ad AS [Bölüm],
    b.blm_puan_tur AS [Puan Türü],
    b.blm_genel_kontenjan AS [Genel Kontenjan],
    (b.blm_genel_kontenjan - b.blm_kalan_kontenjan) AS [Yerleþen Öðrenci],
    b.blm_kalan_kontenjan AS [Boþ Kalan Kontenjan],
    

    CAST(
        ((b.blm_genel_kontenjan - b.blm_kalan_kontenjan) * 100.0) / b.blm_genel_kontenjan 
        AS DECIMAL(5,2)
    ) AS [Doluluk Oraný (%)],
    
 
    MIN(ys.yerlesme_puani) AS [Taban Puan (En Küçük)],
    MAX(ys.yerlesme_puani) AS [Tavan Puan (En Yüksek)]

FROM tbl_Bolumler b
INNER JOIN tbl_Universiteler u ON b.uni_id = u.uni_id
LEFT JOIN tbl_YerlestirmeSonuclari ys ON b.blm_kod = ys.blm_kod
GROUP BY 
    u.uni_ad, 
    b.blm_ad, 
    b.blm_puan_tur, 
    b.blm_genel_kontenjan, 
    b.blm_kalan_kontenjan
ORDER BY [Doluluk Oraný (%)] DESC, [Taban Puan (En Küçük)] DESC;