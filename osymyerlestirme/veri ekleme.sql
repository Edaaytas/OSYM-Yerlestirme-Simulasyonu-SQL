DELETE FROM tbl_YerlestirmeSonuclari;
DELETE FROM tbl_Tercihler;
DELETE FROM tbl_BolumKontenjanlari;
DELETE FROM tbl_OgrenciPuanlari;
DELETE FROM tbl_Ogrenciler;
DELETE FROM tbl_Bolumler;
DELETE FROM tbl_Universiteler;
DELETE FROM tbl_Cinsiyetler;

INSERT INTO tbl_Cinsiyetler (cinsiyet_ad) VALUES (N'Kadýn'), (N'Erkek');

INSERT INTO tbl_Universiteler (uni_kod, uni_ad, uni_tur, uni_sehir) VALUES 
(N'1001', N'Ankara Üniversitesi', N'Devlet', N'Ankara'),
(N'1002', N'Orta Doðu Teknik Üniversitesi', N'Devlet', N'Ankara'),
(N'1003', N'Hacettepe Üniversitesi', N'Devlet', N'Ankara'),
(N'1004', N'Gazi Üniversitesi', N'Devlet', N'Ankara'),
(N'1005', N'Bilkent Üniversitesi', N'Vakýf', N'Ankara'),
(N'1006', N'TOBB Ekonomi ve Teknoloji Üniversitesi', N'Vakýf', N'Ankara'),
(N'1007', N'Ankara Yýldýrým Beyazýt Üniversitesi', N'Devlet', N'Ankara'),
(N'1008', N'TED Üniversitesi', N'Vakýf', N'Ankara'),
(N'1009', N'Baþkent Üniversitesi', N'Vakýf', N'Ankara'),
(N'1010', N'Atýlým Üniversitesi', N'Vakýf', N'Ankara'),
(N'1011', N'Ýstanbul Üniversitesi', N'Devlet', N'Ýstanbul'),
(N'1012', N'Ýstanbul Üniversitesi-Cerrahpaþa', N'Devlet', N'Ýstanbul'),
(N'1013', N'Ýstanbul Teknik Üniversitesi', N'Devlet', N'Ýstanbul'),
(N'1014', N'Boðaziçi Üniversitesi', N'Devlet', N'Ýstanbul'),
(N'1015', N'Marmara Üniversitesi', N'Devlet', N'Ýstanbul'),
(N'1016', N'Yýldýz Teknik Üniversitesi', N'Devlet', N'Ýstanbul'),
(N'1017', N'Mimar Sinan Güzel Sanatlar Üniversitesi', N'Devlet', N'Ýstanbul'),
(N'1018', N'Koç Üniversitesi', N'Vakýf', N'Ýstanbul'),
(N'1019', N'Sabancý Üniversitesi', N'Vakýf', N'Ýstanbul'),
(N'1020', N'Bahçeþehir Üniversitesi', N'Vakýf', N'Ýstanbul'),
(N'1021', N'Yeditepe Üniversitesi', N'Vakýf', N'Ýstanbul'),
(N'1022', N'Özyeðin Üniversitesi', N'Vakýf', N'Ýstanbul'),
(N'1023', N'Galatasaray Üniversitesi', N'Devlet', N'Ýstanbul'),
(N'1024', N'Ýstanbul Bilgi Üniversitesi', N'Vakýf', N'Ýstanbul'),
(N'1025', N'Ýstanbul Medipol Üniversitesi', N'Vakýf', N'Ýstanbul'),
(N'1026', N'Ýstanbul Aydýn Üniversitesi', N'Vakýf', N'Ýstanbul'),
(N'1027', N'Ýstanbul Kültür Üniversitesi', N'Vakýf', N'Ýstanbul'),
(N'1028', N'Ýstanbul Ticaret Üniversitesi', N'Vakýf', N'Ýstanbul'),
(N'1029', N'Ýstanbul Geliþim Üniversitesi', N'Vakýf', N'Ýstanbul'),
(N'1030', N'Ýstanbul Sabahattin Zaim Üniversitesi', N'Vakýf', N'Ýstanbul'),
(N'1031', N'Ege Üniversitesi', N'Devlet', N'Ýzmir'),
(N'1032', N'Dokuz Eylül Üniversitesi', N'Devlet', N'Ýzmir'),
(N'1033', N'Ýzmir Yüksek Teknoloji Enstitüsü', N'Devlet', N'Ýzmir'),
(N'1034', N'Ýzmir Ekonomi Üniversitesi', N'Vakýf', N'Ýzmir'),
(N'1035', N'Yaþar Üniversitesi', N'Vakýf', N'Ýzmir'),
(N'1036', N'Ýzmir Katip Çelebi Üniversitesi', N'Devlet', N'Ýzmir'),
(N'1037', N'Ýzmir Demokrasi Üniversitesi', N'Devlet', N'Ýzmir'),
(N'1038', N'Anadolu Üniversitesi', N'Devlet', N'Eskiþehir'),
(N'1039', N'Eskiþehir Osmangazi Üniversitesi', N'Devlet', N'Eskiþehir'),
(N'1040', N'Eskiþehir Teknik Üniversitesi', N'Devlet', N'Eskiþehir'),
(N'1041', N'Bursa Uludað Üniversitesi', N'Devlet', N'Bursa'),
(N'1042', N'Bursa Teknik Üniversitesi', N'Devlet', N'Bursa'),
(N'1043', N'Çukurova Üniversitesi', N'Devlet', N'Adana'),
(N'1044', N'Akdeniz Üniversitesi', N'Devlet', N'Antalya'),
(N'1045', N'Antalya Bilim Üniversitesi', N'Vakýf', N'Antalya'),
(N'1046', N'Ondokuz Mayýs Üniversitesi', N'Devlet', N'Samsun'),
(N'1047', N'Karadeniz Teknik Üniversitesi', N'Devlet', N'Trabzon'),
(N'1048', N'Erciyes Üniversitesi', N'Devlet', N'Kayseri'),
(N'1049', N'Abdullah Gül Üniversitesi', N'Devlet', N'Kayseri'),
(N'1050', N'Selçuk Üniversitesi', N'Devlet', N'Konya'),
(N'1051', N'Necmettin Erbakan Üniversitesi', N'Devlet', N'Konya'),
(N'1052', N'KTO Karatay Üniversitesi', N'Vakýf', N'Konya'),
(N'1053', N'Gaziantep Üniversitesi', N'Devlet', N'Gaziantep'),
(N'1054', N'Hasan Kalyoncu Üniversitesi', N'Vakýf', N'Gaziantep'),
(N'1055', N'Sanko Üniversitesi', N'Vakýf', N'Gaziantep'),
(N'1056', N'Mersin Üniversitesi', N'Devlet', N'Mersin'),
(N'1057', N'Çað Üniversitesi', N'Vakýf', N'Mersin'),
(N'1058', N'Kocaeli Üniversitesi', N'Devlet', N'Kocaeli'),
(N'1059', N'Gebze Teknik Üniversitesi', N'Devlet', N'Kocaeli'),
(N'1060', N'Sakarya Üniversitesi', N'Devlet', N'Sakarya'),
(N'1061', N'Sakarya Uygulamalý Bilimler Üniversitesi', N'Devlet', N'Sakarya'),
(N'1062', N'Pamukkale Üniversitesi', N'Devlet', N'Denizli'),
(N'1063', N'Muðla Sýtký Koçman Üniversitesi', N'Devlet', N'Muðla'),
(N'1064', N'Aydýn Adnan Menderes Üniversitesi', N'Devlet', N'Aydýn'),
(N'1065', N'Balýkesir Üniversitesi', N'Devlet', N'Balýkesir'),
(N'1066', N'Manisa Celal Bayar Üniversitesi', N'Devlet', N'Manisa'),
(N'1067', N'Trakya Üniversitesi', N'Devlet', N'Edirne'),
(N'1068', N'Tekirdað Namýk Kemal Üniversitesi', N'Devlet', N'Tekirdað'),
(N'1069', N'Çanakkale Onsekiz Mart Üniversitesi', N'Devlet', N'Çanakkale'),
(N'1070', N'Dumlupýnar Üniversitesi', N'Devlet', N'Kütahya'),
(N'1071', N'Afyon Kocatepe Üniversitesi', N'Devlet', N'Afyonkarahisar'),
(N'1072', N'Bolu Abant Ýzzet Baysal Üniversitesi', N'Devlet', N'Bolu'),
(N'1073', N'Zonguldak Bülent Ecevit Üniversitesi', N'Devlet', N'Zonguldak'),
(N'1074', N'Düzce Üniversitesi', N'Devlet', N'Düzce'),
(N'1075', N'Yalova Üniversitesi', N'Devlet', N'Yalova'),
(N'1076', N'Sivas Cumhuriyet Üniversitesi', N'Devlet', N'Sivas'),
(N'1077', N'Fýrat Üniversitesi', N'Devlet', N'Elazýð'),
(N'1078', N'Ýnönü Üniversitesi', N'Devlet', N'Malatya'),
(N'1079', N'Dicle Üniversitesi', N'Devlet', N'Diyarbakýr'),
(N'1080', N'Atatürk Üniversitesi', N'Devlet', N'Erzurum'),
(N'1081', N'Erzurum Teknik Üniversitesi', N'Devlet', N'Erzurum'),
(N'1082', N'Van Yüzüncü Yýl Üniversitesi', N'Devlet', N'Van'),
(N'1083', N'Harran Üniversitesi', N'Devlet', N'Þanlýurfa'),
(N'1084', N'Süleyman Demirel Üniversitesi', N'Devlet', N'Isparta'),
(N'1085', N'Isparta Uygulamalý Bilimler Üniversitesi', N'Devlet', N'Isparta'),
(N'1086', N'Mehmet Akif Ersoy Üniversitesi', N'Devlet', N'Burdur'),
(N'1087', N'Kýrýkkale Üniversitesi', N'Devlet', N'Kýrýkkale'),
(N'1088', N'Tokat Gaziosmanpaþa Üniversitesi', N'Devlet', N'Tokat'),
(N'1089', N'Amasya Üniversitesi', N'Devlet', N'Amasya'),
(N'1090', N'Hitit Üniversitesi', N'Devlet', N'Çorum'),
(N'1091', N'Kastamonu Üniversitesi', N'Devlet', N'Kastamonu'),
(N'1092', N'Karabük Üniversitesi', N'Devlet', N'Karabük'),
(N'1093', N'Bartýn Üniversitesi', N'Devlet', N'Bartýn'),
(N'1094', N'Sinop Üniversitesi', N'Devlet', N'Sinop'),
(N'1095', N'Giresun Üniversitesi', N'Devlet', N'Giresun'),
(N'1096', N'Ordu Üniversitesi', N'Devlet', N'Ordu'),
(N'1097', N'Recep Tayyip Erdoðan Üniversitesi', N'Devlet', N'Rize'),
(N'1098', N'Artvin Çoruh Üniversitesi', N'Devlet', N'Artvin'),
(N'1099', N'Bilecik Þeyh Edebali Üniversitesi', N'Devlet', N'Bilecik'),
(N'1100', N'Karamanoðlu Mehmetbey Üniversitesi', N'Devlet', N'Karaman');

DECLARE @i INT = 1;
WHILE @i <= 100
BEGIN
    DECLARE @kadin_id INT, @erkek_id INT;
    SELECT TOP 1 @kadin_id = cinsiyet_id FROM tbl_Cinsiyetler WHERE cinsiyet_ad = N'Kadýn';
    SELECT TOP 1 @erkek_id = cinsiyet_id FROM tbl_Cinsiyetler WHERE cinsiyet_ad = N'Erkek';

    DECLARE @current_uni_id INT;
    SELECT TOP 1 @current_uni_id = uni_id FROM tbl_Universiteler WHERE uni_kod = CAST((1000 + @i) AS NVARCHAR(10));
    INSERT INTO tbl_Bolumler (blm_kod, uni_id, blm_ad, blm_puan_tur, blm_baraj_sirasi, blm_kampus_sehir, blm_egitim_suresi, blm_hazirlik_durumu)
    VALUES (
        100000 + @i, 
        @current_uni_id,
        CASE WHEN @i % 4 = 0 THEN N'Týp Fakültesi' WHEN @i % 4 = 1 THEN N'Bilgisayar Mühendisliði' WHEN @i % 4 = 2 THEN N'Hukuk Fakültesi' ELSE N'Ýþletme' END,
        CASE WHEN @i % 3 = 0 THEN N'SAY' WHEN @i % 3 = 1 THEN N'EA' ELSE N'SÖZ' END,
        CASE WHEN @i % 2 = 0 THEN 50000 ELSE 100000 END,
        N'Merkez Kampüs',
        CASE WHEN @i % 4 = 0 THEN 6 WHEN @i % 4 = 1 THEN 2 ELSE 4 END,
        CASE WHEN @i % 3 = 0 THEN N'Yok' WHEN @i % 3 = 1 THEN N'Zorunlu' ELSE N'Ýsteðe Baðlý' END
    );
    INSERT INTO tbl_Ogrenciler (ogr_tckn, ogr_ad, ogr_soyad, ogr_dogum_tarihi, ogr_okul_birincisi_mi, cinsiyet_id)
    VALUES (
        N'20000000' + RIGHT('000' + CAST(@i AS NVARCHAR(3)), 3), 
        CASE WHEN @i % 2 = 0 THEN N'Murat' ELSE N'Elif' END,
        CASE WHEN @i % 3 = 0 THEN N'Öztürk' WHEN @i % 3 = 1 THEN N'Arslan' ELSE N'Þahin' END,
        '2006-04-15',
        CASE WHEN @i % 10 = 0 THEN 1 ELSE 0 END,
        CASE WHEN @i % 2 = 0 THEN @erkek_id ELSE @kadin_id END
    );

    SET @i = @i + 1;
END
SET @i = 1;
WHILE @i <= 100
BEGIN
    DECLARE @ogr_id INT, @blm_kod INT;
    SELECT @ogr_id = MIN(ogr_id) FROM (SELECT TOP (@i) ogr_id FROM tbl_Ogrenciler ORDER BY ogr_id ASC) AS T;
    SET @blm_kod = 100000 + @i;
    INSERT INTO tbl_OgrenciPuanlari (ogr_id, puan_tur, yerlestirme_puani, basari_sirasi)
    VALUES (@ogr_id, N'SAY', 320 + (@i * 1.2), 200000 - (@i * 1200));
    INSERT INTO tbl_BolumKontenjanlari (blm_kod, kontenjan_yili, genel_kontenjan, kalan_genel_kontenjan, ob_kontenjan, kalan_ob_kontenjan)
    VALUES (@blm_kod, 2025, 50, 2, 2, 0);
    INSERT INTO tbl_Tercihler (ogr_id, blm_kod, trc_sira, trc_yili, trc_turu)
    VALUES (@ogr_id, @blm_kod, 1, 2025, N'Genel Kontenjan');
    INSERT INTO tbl_YerlestirmeSonuclari (ogr_id, blm_kod, yerlesme_trc_sira, yerlesme_yili)
    VALUES (@ogr_id, @blm_kod, 1, 2025);

    SET @i = @i + 1;
END
GO