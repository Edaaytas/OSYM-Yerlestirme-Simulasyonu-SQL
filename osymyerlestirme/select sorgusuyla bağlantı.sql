--- ogr kazandýðý bölüm
SELECT 
    o.ogr_id,
    o.ogr_tckn,
    o.ogr_ad,
    o.ogr_soyad,
    b.blm_ad AS KazandigiBolum
FROM tbl_Ogrenciler o
INNER JOIN tbl_YerlestirmeSonuclari y ON o.ogr_id = y.ogr_id
INNER JOIN tbl_Bolumler b ON y.blm_kod = b.blm_kod
WHERE o.ogr_id = 705; 

-- ogr baþarý sýrasý
select o.ogr_id, o.ogr_tckn, o.ogr_ad,o.ogr_soyad,
p.basari_sirasi AS BasariSirasi
From tbl_Ogrenciler o
INNER JOIN tbl_YerlestirmeSonuclari y ON o.ogr_id=y.ogr_id
LEFT JOIN tbl_OgrenciPuanlari p ON o.ogr_id=p.ogr_id


--öðrenciler kaçýncý tercihlerine yerleþti
SELECT 
    yerlesme_trc_sira AS [Yerleþilen Tercih Sýrasý],
    COUNT(*) AS [Öðrenci Sayýsý]
FROM tbl_YerlestirmeSonuclari
GROUP BY yerlesme_trc_sira;


--öðrenci tablosunu , yerleþtiði bölümü ve bölümün baðlý olduðu üniversite

select o.ogr_id as [Öðrencinin Numarasý],
o.ogr_ad +' ' + o.ogr_soyad as [Ad Soyad],
u.uni_ad as [Üniversite],
b.blm_ad as [Kazandýðý Bölüm],
b.blm_puan_tur as [Puan Türü]
from tbl_Ogrenciler o
 INNER JOIN tbl_YerlestirmeSonuclari y ON o.ogr_id=y.ogr_id
 INNER JOIN tbl_Bolumler b ON y.blm_kod=b.blm_kod
 INNER JOIN tbl_Universiteler u On b.uni_id=u.uni_id;


 --- öðrenciler ve yaptýklarý tercihler 
 select  o.ogr_id ,
 o.ogr_ad + '' + o.ogr_soyad as [Öðrenci Ad Soyad],
 t.trc_sira as [ Tercih Sýrasý],
 b.blm_ad as [ Tercih Ettiði Bölüm],
 p.basari_sirasi as [Öðrenci Baþarý Sýrasý]
 from tbl_Ogrenciler o
 INNER JOIN tbl_Tercihler t ON o.ogr_id=t.ogr_id
 INNER JOIN tbl_Bolumler b ON t.blm_kod= b.blm_kod
 LEFT JOIN tbl_OgrenciPuanlari p ON o.ogr_id=p.ogr_id;


 --- bölüm ad,üniversite ve kontenjan durumu

 select 
 u.uni_id as [Üniversite],
 b.blm_ad as [Bölüm Adý],
 bk.kontenjan_yili  as [Dönem],
 bk.genel_kontenjan as [Toplam kontenjan],
 bk.kalan_genel_kontenjan as [Boþ kontenjan]
 from tbl_Bolumler b
 INNER JOIN tbl_Universiteler u On b.uni_id=u.uni_id
 INNER JOIN tbl_BolumKontenjanlari bk On b.blm_kod= bk.blm_kod;


 select* from tbl_BolumKontenjanlari
 select* from tbl_Bolumler
 select* from tbl_Cinsiyetler
 select* from tbl_Ogrenciler
 select* from tbl_OgrenciPuanlari
 select* from tbl_Tercihler
 select* from tbl_Universiteler
 select* from tbl_YerlestirmeSonuclari