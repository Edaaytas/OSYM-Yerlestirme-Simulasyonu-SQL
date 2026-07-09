CREATE PROCEDURE sp_OgrenciYerlestir
AS
BEGIN
    SET NOCOUNT ON;

   
    TRUNCATE TABLE tbl_YerlestirmeSonuclari;
    UPDATE tbl_Bolumler SET blm_kalan_kontenjan = blm_genel_kontenjan;

    
    DECLARE @OgrenciID INT;
    DECLARE @PuanTuru CHAR(3);
    DECLARE @YerlestirmePuani DECIMAL(6,3);
    DECLARE @BolumKod INT;
    DECLARE @TercihSira INT;
    DECLARE @KalanKontenjan INT;

    
    DECLARE YerlestirmeCursor CURSOR FOR
    SELECT 
        t.ogr_id, 
        b.blm_puan_tur, 
        p.yerlestirme_puani, 
        t.blm_kod, 
        t.trc_sira
    FROM tbl_Tercihler t
    INNER JOIN tbl_Bolumler b ON t.blm_kod = b.blm_kod
    INNER JOIN tbl_OgrenciPuanlari p ON t.ogr_id = p.ogr_id AND b.blm_puan_tur = p.puan_tur
    ORDER BY p.yerlestirme_puani DESC, t.ogr_id ASC, t.trc_sira ASC;

    OPEN YerlestirmeCursor;

    FETCH NEXT FROM YerlestirmeCursor INTO @OgrenciID, @PuanTuru, @YerlestirmePuani, @BolumKod, @TercihSira;

    WHILE @@FETCH_STATUS = 0
    BEGIN
        
        IF NOT EXISTS (SELECT 1 FROM tbl_YerlestirmeSonuclari WHERE ogr_id = @OgrenciID)
        BEGIN
            
            SELECT @KalanKontenjan = blm_kalan_kontenjan 
            FROM tbl_Bolumler 
            WHERE blm_kod = @BolumKod;

            
            IF @KalanKontenjan > 0
            BEGIN
               
                INSERT INTO tbl_YerlestirmeSonuclari (ogr_id, blm_kod, yerlesme_trc_sira, yerlesme_puani)
                VALUES (@OgrenciID, @BolumKod, @TercihSira, @YerlestirmePuani);

                
                UPDATE tbl_Bolumler 
                SET blm_kalan_kontenjan = blm_kalan_kontenjan - 1 
                WHERE blm_kod = @BolumKod;
            END
        END

        FETCH NEXT FROM YerlestirmeCursor INTO @OgrenciID, @PuanTuru, @YerlestirmePuani, @BolumKod, @TercihSira;
    END

    CLOSE YerlestirmeCursor;
    DEALLOCATE YerlestirmeCursor;

    PRINT 'Yerleþtirme iþlemi baþarýyla tamamlandý!';
END;
GO

exec sp_OgrenciYerlestir;




