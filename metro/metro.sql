DROP SCHEMA IF EXISTS public cascade;
CREATE SCHEMA public;

CREATE TABLE conductor(
    curp CHAR(18) CHECK (curp <> '')
    NOT NULL,
    nombre VARCHAR(50) CHECK (nombre <> '') NOT NULL,
    paterno VARCHAR(50) CHECK (paterno <> '') NOT NULL,
    materno VARCHAR(50) CHECK (materno <> '') NOT NULL,
    genero CHAR(1) CHECK (genero <> '') NOT NULL,
    PRIMARY KEY (curp)
);
CREATE TABLE linea(
    numeroLinea INT NOT NULL UNIQUE,
    nombre VARCHAR(50) NOT NULL,
    PRIMARY KEY (numeroLinea)
);

CREATE TABLE tren(
    idTren INT NOT NULL UNIQUE,
    vagones INT CHECK(vagones > 0) NOT NULL,
    estatus BOOLEAN,
    numeroLinea INT,
    PRIMARY KEY (idTren),
    FOREIGN KEY (numeroLinea) REFERENCES linea(numeroLinea)
);
CREATE TABLE conducir(
	idTren INT,
	curp CHAR(18),
	inicio TIME,
	fin TIME,
	fecha DATE,
	FOREIGN KEY (idTren) REFERENCES tren(idTren),
	FOREIGN KEY (curp) REFERENCES conductor(curp)
);
CREATE TABLE telefono(
	curp CHAR(18),
	telefono CHAR(10),
	FOREIGN KEY (curp) REFERENCES conductor(curp),
	PRIMARY KEY (curp, telefono)
);

CREATE TABLE estacion(
	numeroLinea INT,
	idEstacion INT,
	horario TIME,
	telefono char(10),
	nombreEstacion VARCHAR(50),
	nombre VARCHAR(50),
	paterno VARCHAR(50),
	materno VARCHAR(50),
	FOREIGN KEY (numeroLinea) REFERENCES linea(numeroLinea),
	PRIMARY KEY (numeroLinea, idEstacion)
);

CREATE TABLE acceso(
	numeroAcceso INT,
	numeroLinea INT,
	numeroEstacion INT,
	inicio TIME,
	fin TIME,
	PRIMARY KEY (numeroAcceso),
	FOREIGN KEY (numeroLinea, numeroEstacion) REFERENCES estacion(numeroLinea, idEstacion)
);


CREATE TABLE pertenecer(
	numeroLinea INT,
	numeroEstacion INT,
	fechaInicio DATE,	
	fechaFin DATE,
	FOREIGN KEY (numeroEstacion,numeroLinea) REFERENCES estacion(idEstacion, numeroLinea),
	FOREIGN KEY (numeroLinea) REFERENCES linea(numeroLinea)
);

CREATE TABLE reservar(
	idTren INT,
	idHangar INT,
	fechaInicio DATE,
	fechaFin DATE
);

CREATE TABLE hangar(
    idHangar INT,
    numeroLinea INT,
    numeroEstacion INT,
    FOREIGN KEY (numeroLinea, numeroEstacion) REFERENCES estacion(numeroLinea, idEstacion),
	PRIMARY KEY (idHangar)
);
