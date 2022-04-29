Create DataBase Lab3;
use Lab3;

select * From sys.database_principals

Create SCHEMA LabUMG;

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

Create View LabUMG.ReporteUsuario
as
Select idDB_Usuario as id, Nombre1 as Nombre, Apellido1 as Apellido
From LabUMG.DB_Usuario

insert into LabUMG.DB_Usuario
		(Nombre1,Nombre2,Nombre3, Apellido1, Apellido2, Edad, FechaNac,Pass)
Values 
		('Lilian','Lorena', ' ','Garcia', 'Mancilla',37, '1984-07-27','1315lg'),
		('Silvian','Lorena', ' ' ,'Almedares', 'Garcia',31, '1987-08-27','1315lg');

Select * From LabUMG.ReporteUsuario;

Create login PreubasDesarrollo
With Password = 'PD1315';

Use Lab3;

Create User Test For Login PreubasDesarrollo
With Default_Schema = LabUMG;

Grant Select
On Schema:: LabUMG
To Test
With Grant Option
Go

Grant insert On Object:: LabUMG.DB_Usuario
To Test