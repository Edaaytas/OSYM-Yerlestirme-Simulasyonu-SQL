USE OSYMYerlestirme2;
GO

ALTER TRIGGER trg_KontenjanAzalt
ON tbl_YerlestirmeSonuclari
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

  
    UPDATE BK
    SET BK.kalan_genel_kontenjan = BK.kalan_genel_kontenjan - 1
    FROM tbl_BolumKontenjanlari BK
    INNER JOIN inserted i ON BK.blm_kod = i.blm_kod
    WHERE BK.kalan_genel_kontenjan > 0; 
END
GO