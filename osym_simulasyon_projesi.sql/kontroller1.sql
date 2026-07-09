--- üniversitelerin birincilik kontenjanlarý ve kalanlar
SELECT 
    u.uni_ad AS [Üniversite],
    b.blm_ad AS [Bölüm],
    b.blm_okul_birincisi_kontenjan AS [Toplam OB Kontenjaný],
    b.blm_kalan_ob_kontenjan AS [Kalan OB Kontenjaný],
    (b.blm_okul_birincisi_kontenjan - b.blm_kalan_ob_kontenjan) AS [Yerleþen Okul Birincisi Sayýsý]
FROM tbl_Bolumler b
INNER JOIN tbl_Universiteler u ON b.uni_id = u.uni_id;


----yeni prosdürün çalýþmasý
SELECT 
    o.ogr_id,
    o.ogr_ad + ' ' + o.ogr_soyad AS [Öðrenci Ad Soyad],
    CASE WHEN o.ogr_okul_birincisi_mi = 1 THEN 'Evet' ELSE 'Hayýr' END AS [Okul Birincisi],
    u.uni_ad AS [Üniversite],
    b.blm_ad AS [Yerleþtiði Bölüm],
    ys.yerlesme_trc_sira AS [Kaçýncý Tercih],
    ys.yerlesme_puani AS [Yerleþme Puaný]
FROM tbl_YerlestirmeSonuclari ys
INNER JOIN tbl_Ogrenciler o ON ys.ogr_id = o.ogr_id
INNER JOIN tbl_Bolumler b ON ys.blm_kod = b.blm_kod
INNER JOIN tbl_Universiteler u ON b.uni_id = u.uni_id
ORDER BY ys.yerlesme_puani DESC;

---1. prosedürün çalýþtýrdým
SELECT 
    o.ogr_id,
    o.ogr_ad + ' ' + o.ogr_soyad AS [Öðrenci Ad Soyad],
    u.uni_ad AS [Üniversite],
    b.blm_ad AS [Yerleþtiði Bölüm],
    ys.yerlesme_trc_sira AS [Kaçýncý Tercih],
    ys.yerlesme_puani AS [Yerleþme Puaný]
FROM tbl_YerlestirmeSonuclari ys
INNER JOIN tbl_Ogrenciler o ON ys.ogr_id = o.ogr_id
INNER JOIN tbl_Bolumler b ON ys.blm_kod = b.blm_kod
INNER JOIN tbl_Universiteler u ON b.uni_id = u.uni_id
ORDER BY ys.yerlesme_puani DESC;


---- baraja takýlma olasýlýðý
SELECT 
    o.ogr_id,
    o.ogr_ad + ' ' + o.ogr_soyad AS [Öðrenci Ad Soyad],
    b.blm_ad AS [Yerleþtiði Bölüm],
    b.blm_puan_tur AS [Puan Türü],
    p.basari_sirasi AS [Öðrencinin Baþarý Sýrasý],
    b.blm_baraj_sirasi AS [Bölümün Baraj Sýnýrý],
    -- Kontrol Sütunu: Durumu gözle teyit etmek için
    CASE 
        WHEN p.basari_sirasi <= b.blm_baraj_sirasi THEN 'Güvenli (Barajý Geçti)'
        WHEN b.blm_baraj_sirasi IS NULL THEN 'Baraj Yok'
        ELSE 'HATA! Barajý Geçemediði Halde Yerleþti'
    END AS [Baraj Kontrol Durumu]
FROM tbl_YerlestirmeSonuclari ys
INNER JOIN tbl_Ogrenciler o ON ys.ogr_id = o.ogr_id
INNER JOIN tbl_Bolumler b ON ys.blm_kod = b.blm_kod
INNER JOIN tbl_OgrenciPuanlari p ON ys.ogr_id = p.ogr_id AND b.blm_puan_tur = p.puan_tur
WHERE b.blm_baraj_sirasi IS NOT NULL -- Sadece barajý olan bölümleri filtreleyelim
ORDER BY b.blm_ad, p.basari_sirasi ASC;
