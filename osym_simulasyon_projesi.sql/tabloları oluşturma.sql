
CREATE TABLE tbl_Universiteler (
    uni_id INT PRIMARY KEY,
    uni_ad VARCHAR(150) NOT NULL,
    uni_tur VARCHAR(10) CHECK (uni_tur IN ('Devlet', 'Vakýf', 'Kýbrýs')),
    uni_sehir VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_Bolumler (
    blm_kod INT PRIMARY KEY,
    uni_id INT,
    blm_ad VARCHAR(100) NOT NULL,
    blm_puan_tur CHAR(3) CHECK (blm_puan_tur IN ('SAY', 'EA', 'SÖZ', 'DÝL')),
    blm_genel_kontenjan INT NOT NULL,
    blm_kalan_kontenjan INT NOT NULL,
    FOREIGN KEY (uni_id) REFERENCES tbl_Universiteler(uni_id)
);
CREATE TABLE tbl_Ogrenciler (
    ogr_id INT IDENTITY(1,1) PRIMARY KEY,
    ogr_tckn CHAR(11) UNIQUE NOT NULL,
    ogr_ad VARCHAR(50) NOT NULL,
    ogr_soyad VARCHAR(50) NOT NULL,
    ogr_dogum_tarihi DATE,
    ogr_cinsiyet CHAR(1) CHECK (ogr_cinsiyet IN ('E', 'K'))
);
CREATE TABLE tbl_OgrenciPuanlari (
    ogr_id INT,
    puan_tur CHAR(3) CHECK (puan_tur IN ('SAY', 'EA', 'SÖZ', 'DÝL')),
    yerlestirme_puani DECIMAL(6,3) NOT NULL,
    basari_sirasi INT NOT NULL,
    PRIMARY KEY (ogr_id, puan_tur),
    FOREIGN KEY (ogr_id) REFERENCES tbl_Ogrenciler(ogr_id)
);
CREATE TABLE tbl_Tercihler (
    trc_id INT IDENTITY(1,1) PRIMARY KEY,
    ogr_id INT,
    blm_kod INT,
    trc_sira INT NOT NULL CHECK (trc_sira BETWEEN 1 AND 24),
    FOREIGN KEY (ogr_id) REFERENCES tbl_Ogrenciler(ogr_id),
    FOREIGN KEY (blm_kod) REFERENCES tbl_Bolumler(blm_kod),
    UNIQUE (ogr_id, trc_sira)
);
CREATE TABLE tbl_YerlestirmeSonuclari (
    snc_id INT IDENTITY(1,1) PRIMARY KEY,
    ogr_id INT UNIQUE,
    blm_kod INT,
    yerlesme_trc_sira INT,
    yerlesme_puani DECIMAL(6,3),
    FOREIGN KEY (ogr_id) REFERENCES tbl_Ogrenciler(ogr_id),
    FOREIGN KEY (blm_kod) REFERENCES tbl_Bolumler(blm_kod)
);

