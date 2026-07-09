ALTER PROCEDURE sp_OgrenciYerlestir
AS
BEGIN
    SET NOCOUNT ON;

    TRUNCATE TABLE tbl_YerlestirmeSonuclari;
    UPDATE tbl_Bolumler SET 
        blm_kalan_kontenjan = blm_genel_kontenjan,
        blm_kalan_ob_kontenjan = blm_okul_birincisi_kontenjan;

    DECLARE @OgrenciID INT;
    DECLARE @PuanTuru CHAR(3);
    DECLARE @YerlestirmePuani DECIMAL(6,3);
    DECLARE @BasariSirasi INT;
    DECLARE @BolumKod INT;
    DECLARE @TercihSira INT;
    DECLARE @OkulBirincisiMi BIT;
    DECLARE @KalanGenelKontenjan INT;
    DECLARE @KalanObKontenjan INT;
    DECLARE @BarajSirasi INT;
    
    DECLARE @BarajPuani DECIMAL(6,3) = 300.000;

   
    DECLARE YerlestirmeCursor CURSOR FOR
    SELECT 
        t.ogr_id, 
        b.blm_puan_tur, 
        p.yerlestirme_puani, 
        p.basari_sirasi,
        t.blm_kod, 
        t.trc_sira,
        o.ogr_okul_birincisi_mi
    FROM tbl_Tercihler t
    INNER JOIN tbl_Bolumler b ON t.blm_kod = b.blm_kod
    INNER JOIN tbl_Ogrenciler o ON t.ogr_id = o.ogr_id
    INNER JOIN tbl_OgrenciPuanlari p ON t.ogr_id = p.ogr_id AND b.blm_puan_tur = p.puan_tur
    ORDER BY p.yerlestirme_puani DESC, t.ogr_id ASC, t.trc_sira ASC;

    OPEN YerlestirmeCursor;
    FETCH NEXT FROM YerlestirmeCursor INTO @OgrenciID, @PuanTuru, @YerlestirmePuani, @BasariSirasi, @BolumKod, @TercihSira, @OkulBirincisiMi;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        
        IF @YerlestirmePuani >= @BarajPuani
        BEGIN
            
            IF NOT EXISTS (SELECT 1 FROM tbl_YerlestirmeSonuclari WHERE ogr_id = @OgrenciID)
            BEGIN
              
                SELECT 
                    @KalanGenelKontenjan = blm_kalan_kontenjan,
                    @KalanObKontenjan = blm_kalan_ob_kontenjan,
                    @BarajSirasi = blm_baraj_sirasi
                FROM tbl_Bolumler 
                WHERE blm_kod = @BolumKod;

                
                IF @BarajSirasi IS NULL OR @BasariSirasi <= @BarajSirasi
                BEGIN
                    
                    
                    IF @KalanGenelKontenjan > 0
                    BEGIN
                        INSERT INTO tbl_YerlestirmeSonuclari (ogr_id, blm_kod, yerlesme_trc_sira, yerlesme_puani)
                        VALUES (@OgrenciID, @BolumKod, @TercihSira, @YerlestirmePuani);

                        UPDATE tbl_Bolumler SET blm_kalan_kontenjan = blm_kalan_kontenjan - 1 WHERE blm_kod = @BolumKod;
                    END
                    
                    
                    ELSE IF @OkulBirincisiMi = 1 AND @KalanObKontenjan > 0
                    BEGIN
                        INSERT INTO tbl_YerlestirmeSonuclari (ogr_id, blm_kod, yerlesme_trc_sira, yerlesme_puani)
                        VALUES (@OgrenciID, @BolumKod, @TercihSira, @YerlestirmePuani);

                        UPDATE tbl_Bolumler SET blm_kalan_ob_kontenjan = blm_kalan_ob_kontenjan - 1 WHERE blm_kod = @BolumKod;
                    END

                END
                ELSE 
                BEGIN
                    
                    PRINT 'Baraj Engeli: Öðrenci ID ' + CAST(@OgrenciID AS VARCHAR) + ', Sýralamasý (' + CAST(@BasariSirasi AS VARCHAR) + ') nedeniyle Bölüm ' + CAST(@BolumKod AS VARCHAR) + ' barajýna takýldý.';
                END
            END
        END

        FETCH NEXT FROM YerlestirmeCursor INTO @OgrenciID, @PuanTuru, @YerlestirmePuani, @BasariSirasi, @BolumKod, @TercihSira, @OkulBirincisiMi;
    END

    CLOSE YerlestirmeCursor;
    DEALLOCATE YerlestirmeCursor;

    PRINT 'Sýralama Barajlý yerleþtirme iþlemi baþarýyla tamamlandý!';
END;
GO


EXEC sp_OgrenciYerlestir;