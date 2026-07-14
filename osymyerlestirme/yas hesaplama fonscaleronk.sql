USE OSYMYerlestirme2;
GO

DROP FUNCTION IF EXISTS fn_YasHesapla;
GO

CREATE FUNCTION fn_YasHesapla (
    @DogumTarihi DATE
)
RETURNS INT 
AS
BEGIN
    DECLARE @Yas INT;

    SET @Yas = DATEDIFF(YEAR, @DogumTarihi, GETDATE());
    IF (DATEADD(YEAR, @Yas, @DogumTarihi) > GETDATE())
    BEGIN
        SET @Yas = @Yas - 1;
    END

    RETURN @Yas;
END
GO


SELECT 
    ogr_id, 
    ogr_ad + ' ' + o.ogr_soyad AS [Öðrenci], 
    ogr_dogum_tarihi AS [Doðum Tarihi],
    dbo.fn_YasHesapla(ogr_dogum_tarihi) AS [Anlýk Yaþ] 
FROM tbl_Ogrenciler o;