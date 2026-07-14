USE OSYMYerlestirme2;
GO

CREATE FUNCTION fn_SehreGoreUniversiteler (
    @SehirAdi NVARCHAR(50)
)
RETURNS TABLE 
AS
RETURN (

    SELECT 
        u.uni_ad AS [UniversiteAdi],
        u.uni_tur AS [Tur],
        b.blm_ad AS [BolumAdi],
        b.blm_puan_tur AS [PuanTuru]
    FROM tbl_Universiteler u
    INNER JOIN tbl_Bolumler b ON u.uni_id = b.uni_id
    WHERE u.uni_sehir = @SehirAdi
);
GO


-- Sadece Ýstanbul'daki yerleri getir
SELECT * FROM dbo.fn_SehreGoreUniversiteler(N'Ýstanbul');

-- Sadece Ankara'dakileri getir
SELECT * FROM dbo.fn_SehreGoreUniversiteler(N'Ankara');