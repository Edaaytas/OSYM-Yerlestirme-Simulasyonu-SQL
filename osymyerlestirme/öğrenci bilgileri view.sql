USE OSYMYerlestirme2;
GO


CREATE VIEW vw_OgrenciYerlesmeDetay
AS
SELECT 
    o.ogr_id AS [OgrenciID],
    o.ogr_tckn AS [TCKN],
    o.ogr_ad + ' ' + o.ogr_soyad AS [AdSoyad],
    c.cinsiyet_ad AS [Cinsiyet],
    p.puan_tur AS [PuanTuru],
    p.yerlestirme_puani AS [Puan],
    p.basari_sirasi AS [BasariSirasi],
    u.uni_ad AS [UniversiteAdi],
    u.uni_sehir AS [UniversiteSehir],
    b.blm_ad AS [BolumAdi],
    y.yerlesme_trc_sira AS [YerlesmeTercihSirasi],
    y.yerlesme_yili AS [YerlesmeYili]
FROM tbl_Ogrenciler o
INNER JOIN tbl_Cinsiyetler c ON o.cinsiyet_id = c.cinsiyet_id
INNER JOIN tbl_YerlestirmeSonuclari y ON o.ogr_id = y.ogr_id
INNER JOIN tbl_Bolumler b ON y.blm_kod = b.blm_kod
INNER JOIN tbl_Universiteler u ON b.uni_id = u.uni_id
INNER JOIN tbl_OgrenciPuanlari p ON o.ogr_id = p.ogr_id;
GO


-- Tüm kazananlarý listele
SELECT * FROM vw_OgrenciYerlesmeDetay;
