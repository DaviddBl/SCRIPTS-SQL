/*
Descripcion:
Creacion de base de datos telefónica .
Ultima_revision: 03/11/2022
Autor: DAVID BLAS GARCIA
*/



CREATE SCHEMA `Telefonicav2` ;

USE Telefonicav2;

CREATE TABLE `Filiales` (
  `idFiliales` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Filial` VARCHAR(45) NOT NULL,
  `Num_Trabajadores` INT NULL,
  PRIMARY KEY (`idFiliales`)
  )
   ENGINE=InnoDB;
   
   CREATE TABLE `Marcas_Procesadores` (
  idMarcas_Procesadores INT NOT NULL AUTO_INCREMENT,
  Nombre_Marca VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMarcas_Procesadores`)
  )
  ENGINE=InnoDB;
  
  

CREATE TABLE `Paises` (
  `id_Pais` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Pais` VARCHAR(45) NOT NULL,
  `Abreviatura` VARCHAR(45) NOT NULL,
  `Renta_Per_Capita` DECIMAL NOT NULL,
  `Extension` DECIMAL NOT NULL,
  `Num_Habitantes` INT NOT NULL,
  PRIMARY KEY (`id_Pais`))
  ENGINE=InnoDB;
  
  CREATE TABLE `Poblaciones` (
  `idPoblaciones` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Poblacion` VARCHAR(45) NOT NULL,
  `id_Pais` INT,
  PRIMARY KEY (`idPoblaciones`),
  CONSTRAINT fk_Pais FOREIGN KEY (id_Pais) REFERENCES Paises(`id_Pais`)
  )
  ENGINE=InnoDB;
  
  CREATE TABLE `Procesadores` (
  `idProcesadores` INT NOT NULL AUTO_INCREMENT,
  `Modelo` VARCHAR(45) NOT NULL,
  `Frecuencia` DECIMAL NULL,
  `Num_Nucleos` INT NOT NULL,
  `idMarcas_Procesadores` INT,
  PRIMARY KEY (`idProcesadores`),
  CONSTRAINT fk_MarcaProcesador FOREIGN KEY (idMarcas_Procesadores) REFERENCES Marcas_Procesadores(`idMarcas_Procesadores`)
  )
  ENGINE=InnoDB;
  
  
CREATE TABLE `Sede` (
  `idSede` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Sede` VARCHAR(45) NOT NULL,
  `Direccion` VARCHAR(45) NOT NULL,
  `Coordenadas_X` VARCHAR(45) NOT NULL,
  `Coordenadas_Y` VARCHAR(45) NOT NULL,
  `Telefono_Contacto` VARCHAR(45) NULL,
  `Central` VARCHAR(45) NOT NULL,
  `idFiliales` INT,
  `idPoblaciones` INT,
  PRIMARY KEY (`idSede`),
  CONSTRAINT fk_Filial FOREIGN KEY (idFiliales) REFERENCES Filiales(idFiliales),
  CONSTRAINT fk_Poblaciones FOREIGN KEY (idPoblaciones) REFERENCES Poblaciones(idPoblaciones)
  )
   ENGINE=InnoDB;
  
  
  /* TABLA INTERMEDIA ENTRE SERVIDORES / SEDE / TRABAJADORES*/
  CREATE TABLE `Sede_Servidores`(
  Id_Servidores INT,
  Id_Sede INT,
  Id_Trabajador INT,
  CONSTRAINT FK_Servidores_Sede FOREIGN KEY (Id_Servidores) REFERENCES Servidores (`idServidores`),
  CONSTRAINT FK_Sede FOREIGN KEY (Id_Sede) REFERENCES Sede ( `idSede`),
  CONSTRAINT FK_Trabajador FOREIGN KEY (Id_Trabajador) REFERENCES Trabajadores (`idTrabajadores`),
  PRIMARY KEY (Id_Servidores , Id_Sede)
  )
   ENGINE=InnoDB;
   
   
  
CREATE TABLE `Servidores` (
  `idServidores` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Servidor` VARCHAR(45) NOT NULL,
  `Memoria_Ram` INT NOT NULL,
  `Num_Discos` INT NOT NULL,
  `Capacidad_Memoria` INT NOT NULL,
  PRIMARY KEY (`idServidores`)
  )
  ENGINE=InnoDB;
  
   
CREATE TABLE `Tipo_Trabajador` (
  idTipo_Trabajador INT NOT NULL AUTO_INCREMENT,
  Descripcion VARCHAR(45) NULL,
  PRIMARY KEY (`idTipo_Trabajador`)
  )
  ENGINE=InnoDB;


CREATE TABLE `Trabajadores` (
  idTrabajadores INT NOT NULL AUTO_INCREMENT,
  Nombre_Completo VARCHAR(45) NOT NULL,
  DNI VARCHAR(9) NOT NULL,
  idTipo_Trabajador INT,
  PRIMARY KEY (`idTrabajadores`),
  CONSTRAINT fk_TipoTrabajador FOREIGN KEY (idTipo_Trabajador) REFERENCES Tipo_Trabajador(idTipo_Trabajador)
  )
  ENGINE=InnoDB;
  
CREATE TABLE  Trabajadores_Sede(
Fecha_Incorporacion DATE ,
Fecha_Baja DATE,
Id_Sede INT,
idTrabajadores INT,
CONSTRAINT pk_idSede PRIMARY KEY (Id_Sede, idTrabajadores),
CONSTRAINT fk_idTrabajadores FOREIGN KEY (idTrabajadores) REFERENCES Trabajadores (idTrabajadores),
CONSTRAINT fk_idServidores FOREIGN KEY (idServidores) REFERENCES Servidores (idServidores)
);


  /*TABLA INTERMEDIA ENTRE POCESADORES Y SERVIDORES*/
  CREATE TABLE  `Procesadores_Instalados`(
  idServidores INT,
  idProcesadores INT,
  CONSTRAINT fk_Servidores FOREIGN KEY (idServidores) REFERENCES Servidores ( idServidores),
  CONSTRAINT fk_Procesadores FOREIGN KEY (idProcesadores) REFERENCES Procesadores ( idProcesadores),
  PRIMARY KEY ( idProcesadores, idServidores)
  
  )
   ENGINE=InnoDB;





CREATE TABLE `Trabajadores_Sedes` (
  `idTrabajadores` INT NOT NULL AUTO_INCREMENT,
  `Fecha_Incorporacion` DATE NOT NULL,
  `Fecha_Baja` DATE NULL,
  PRIMARY KEY (`idTrabajadores`)
  )
   ENGINE=InnoDB;


CREATE INDEX INDEX1 ON Trabajadores(DNI);
CREATE INDEX INDEX2 ON Sede(Nombre_Sede);