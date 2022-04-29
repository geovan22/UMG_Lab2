--* INCISO  1
CREATE DATABASE Lab3;
USE Lab3;

select * From sys.database_principals;

--* INCISO  2
CREATE SCHEMA LabUMG;

--* INCISO  3
CREATE TABLE LabUMG.DB_Usuario (
  idDB_Usuario int IDENTITY (1,1) NOT NULL,
  Nombre1 VARCHAR(50) NULL,
  Nombre2 VARCHAR(50) NULL,
  Nombre3 VARCHAR(50) NULL,
  Apellido1 VARCHAR(50) NULL,
  Apellido2 VARCHAR(50) NULL,
  Edad int NOT NULL,
  FechaNac DATE NULL,
  Pass VARCHAR(100) NULL,
  PRIMARY KEY(idDB_Usuario)
);

CREATE VIEW LabUMG.ReporteUsuario
AS
SELECT idDB_Usuario as id, Nombre1 as Nombre, Apellido1 as Apellido
FROM LabUMG.DB_Usuario

--* INCISO  4
INSERT INTO LabUMG.DB_Usuario
		(Nombre1,Nombre2,Nombre3, Apellido1, Apellido2, Edad, FechaNac,Pass)
VALUES 
		('Lilian','Lorena', ' ','Garcia', 'Mancilla',37, '1984-07-27','1315lg'),
		('Silvian','Lorena', ' ' ,'Almedares', 'Garcia',31, '1987-08-27','1315lg');

EXECUTE AS USER = 'Test';
SELECT * FROM LabUMG.ReporteUsuario;

--* INCISO  5
CREATE LOGIN PreubasDesarrollo
WITH PASSWORD = 'PD1315';

USE Lab3;

--* CREACIÓN DE USER PARA DARLE PERMISOS
CREATE USER Test FOR LOGIN PreubasDesarrollo
WITH Default_Schema = LabUMG;

--* INCISO  6
GRANT SELECT
ON SCHEMA:: LabUMG
TO Test
WITH GRANT OPTION
GO

--* INCISO  7
GRANT INSERT ON OBJECT:: LabUMG.DB_Usuario
TO Test

--* INCISO  8
REVOKE INSERT ON OBJECT:: LabUMG.DB_Usuario
TO Test

--* INCISO  9
REVOKE SELECT ON SCHEMA:: LabUMG
TO Test
CASCADE

--* INCISO  10
DROP TABLE LabUMG.DB_Usuario;
DROP VIEW LabUMG.ReporteUsuario;
DROP SCHEMA LabUMG;

--* INCISO  11
DROP DATABASE Lab3;

--* INCISO  12
CREATE TABLE LabUMG.Bitacora_Logon (
  ID_Bitacora_Logon int IDENTITY (1,1) NOT NULL,
  EventData xml,
  PostDtm datetime
  PRIMARY KEY(ID_Bitacora_Logon)
)

CREATE TRIGGER LogonEvents
ON ALL SERVER
FOR LOGON
AS
BEGIN
	INSERT INTO LabUMG.Bitacora_Logon
	SELECT EVENTDATA(),GETDATE();
END
GO

SELECT * FROM LabUMG.Bitacora_Logon;