-- 1. SQL Server'ýn þu an sistemde kayýtlý olan ESKÝ adýný görelim
SELECT @@SERVERNAME;
GO

-- 2. Eski sunucu adýný SQL Server kayýtlarýndan silelim
-- (Yukarýdaki sorgudan dönen eski ismi týrnak içine yazýn, örn: 'DESKTOP-NT0ONNL')
EXEC sp_dropserver 'DESKTOP-NT0ONNL';
GO

-- 3. Yeni bilgisayar adýnýzý SQL Server'a tanýmlayalým
EXEC sp_addserver 'CODEWIZARD', 'local';
GO