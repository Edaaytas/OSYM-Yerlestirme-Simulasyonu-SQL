-- 1. Cinsiyet Tablosu
CREATE TABLE tbl_Cinsiyetler (
    cinsiyet_id INT IDENTITY(1,1) PRIMARY KEY,
    cinsiyet_ad NVARCHAR(10) NOT NULL
);

-- 2. Üniversiteler Tablosu
CREATE TABLE tbl_Universiteler (
    uni_id INT IDENTITY(1,1) PRIMARY KEY,
    uni_kod NVARCHAR(10) UNIQUE NOT NULL, -- Benzersiz üniversite kodu (Örn: ÖSYM Kodu)
    uni_ad NVARCHAR(150) NOT NULL,
    uni_tur NVARCHAR(20),
    uni_sehir NVARCHAR(50)
);

-- 3. Bölümler Tablosu
CREATE TABLE tbl_Bolumler (
    blm_kod INT PRIMARY KEY, -- ÖSYM Bölüm Kodu (Genelde benzersiz 9 haneli sayýdýr)
    uni_id INT,
    blm_ad NVARCHAR(150) NOT NULL,
    blm_puan_tur NVARCHAR(10),
    blm_baraj_sirasi INT,
    blm_kampus_sehir NVARCHAR(50),
    blm_egitim_suresi INT NOT NULL, -- Týp için 6, Mühendislik için 4 vb.
    blm_hazirlik_durumu NVARCHAR(30), -- 'Yok', 'Zorunlu', 'Ýsteðe Baðlý'
    FOREIGN KEY (uni_id) REFERENCES tbl_Universiteler(uni_id)
);

-- 4. Öðrenciler Tablosu
CREATE TABLE tbl_Ogrenciler (
    ogr_id INT IDENTITY(1,1) PRIMARY KEY,
    ogr_tckn NVARCHAR(11) UNIQUE NOT NULL,
    ogr_ad NVARCHAR(50) NOT NULL,
    ogr_soyad NVARCHAR(50) NOT NULL,
    ogr_dogum_tarihi DATE,
    ogr_okul_birincisi_mi BIT DEFAULT 0, -- SQL Server'da BOOLEAN yerine BIT kullanýlýr (0 veya 1)
    cinsiyet_id INT,
    FOREIGN KEY (cinsiyet_id) REFERENCES tbl_Cinsiyetler(cinsiyet_id)
);

-- 5. Öðrenci Puanlarý Tablosu
CREATE TABLE tbl_OgrenciPuanlari (
    ogr_id INT,
    puan_tur NVARCHAR(10),
    yerlestirme_puani DECIMAL(6,2),
    basari_sirasi INT,
    PRIMARY KEY (ogr_id, puan_tur),
    FOREIGN KEY (ogr_id) REFERENCES tbl_Ogrenciler(ogr_id)
);

-- 6. Tercihler Tablosu
CREATE TABLE tbl_Tercihler (
    trc_id INT IDENTITY(1,1) PRIMARY KEY,
    ogr_id INT,
    blm_kod INT,
    trc_sira INT NOT NULL,
    trc_yili INT NOT NULL, -- Farklý yýllardaki tercihleri ayýrt etmek için
    trc_turu NVARCHAR(50),  -- 'Genel Kontenjan', 'Okul Birincisi', 'Þehit Yakýný' vb.
    FOREIGN KEY (ogr_id) REFERENCES tbl_Ogrenciler(ogr_id),
    FOREIGN KEY (blm_kod) REFERENCES tbl_Bolumler(blm_kod)
);

-- 7. Yerleþtirme Sonuçlarý Tablosu
CREATE TABLE tbl_YerlestirmeSonuclari (
    snc_id INT IDENTITY(1,1) PRIMARY KEY,
    ogr_id INT,
    blm_kod INT,
    yerlesme_trc_sira INT,
    yerlesme_yili INT NOT NULL, -- Üniversiteye kesin giriþ yýlý
    FOREIGN KEY (ogr_id) REFERENCES tbl_Ogrenciler(ogr_id),
    FOREIGN KEY (blm_kod) REFERENCES tbl_Bolumler(blm_kod)
);

-- 8. Bölüm Kontenjanlarý Tablosu
CREATE TABLE tbl_BolumKontenjanlari (
    kontenjan_id INT IDENTITY(1,1) PRIMARY KEY,
    blm_kod INT,
    kontenjan_yili INT NOT NULL,
    genel_kontenjan INT,
    kalan_genel_kontenjan INT,
    ob_kontenjan INT,
    kalan_ob_kontenjan INT,
    FOREIGN KEY (blm_kod) REFERENCES tbl_Bolumler(blm_kod)
);