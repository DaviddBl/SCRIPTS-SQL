/*SENTENCIA SELECT DE DOS TABLAS CON METODO INNER JOIN*/
USE Telefonicav2;
SELECT * FROM Tipo_Trabajador;
/* La combinacion de dos tablas, tiene coincidir la pk y la fk.*/ 
SELECT * FROM Tipo_Trabajador INNER JOIN Trabajadores
ON Tipo_Trabajador.idTipo_Trabajador=Trabajadores.idTipo_Trabajador;


SELECT * FROM Trabajadores INNER JOIN Tipo_Trabajador
ON Tipo_Trabajador =  idTipo_Trabajador;

/*Sentencia (OUTER JOIN) RIGH/LEFT*/
SELECT * FROM Trabajadores RIGHT JOIN Tipo_Trabajador
ON Tipo_Trabajador.idTipo_Trabajador =  Trabajadores.idTipo_Trabajador;