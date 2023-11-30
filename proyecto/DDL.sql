
/*
Script para la creación de la base del zoológico
*/
DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

--Creación de las tablas de la base de datos

-- Creamos la tabla  y las tablas con las que se relaciona persona
CREATE TABLE persona(
    idPersona SERIAL,
    nombre VARCHAR(50),
    paterno VARCHAR(50),
    materno VARCHAR(50),
    genero VARCHAR (15),
    rfc VARCHAR(13),
    nacimiento DATE,
    calle VARCHAR(80),
    numInterior INT,
    numExterior INT,
    colonia VARCHAR(50),
    estado VARCHAR(50),
    fechaInicio DATE,
    fechaFin DATE,
    especialidad VARCHAR(50),
    salarioVet numeric(10,2),
    frecuencia VARCHAR(20),
    costoServicio numeric(10,2),
    salarioCuid numeric(10,2),
    horario TIME,
    diaTrabajo INT,
    animalACargo VARCHAR(50),
    esVeterinario BOOLEAN,
    esProveedor BOOLEAN,
    esCuidador BOOLEAN,
    esCliente BOOLEAN
);

-- Restricciones Persona
--Dominio
ALTER TABLE persona ALTER COLUMN idPersona SET NOT NULL;
ALTER TABLE persona ADD CONSTRAINT persona_d1 CHECK(nombre <> '');
ALTER TABLE persona ALTER COLUMN nombre SET NOT NULL;
ALTER TABLE persona ADD CONSTRAINT persona_d2 CHECK(paterno <> '');
ALTER TABLE persona ALTER COLUMN paterno SET NOT NULL;
ALTER TABLE persona ADD CONSTRAINT persona_d3 CHECK(materno <> '');
ALTER TABLE persona ALTER COLUMN materno SET NOT NULL;
ALTER TABLE persona ADD CONSTRAINT persona_d4 CHECK(genero <> '');
ALTER TABLE persona ALTER COLUMN genero SET NOT NULL;
ALTER TABLE persona ADD CONSTRAINT persona_d5 CHECK(CHAR_LENGTH(rfc)=13);
ALTER TABLE persona ADD CONSTRAINT persona_d6 CHECK(colonia <> '');
ALTER TABLE persona ADD CONSTRAINT persona_d7 CHECK(estado <> '');
ALTER TABLE persona ADD CONSTRAINT persona_d8 CHECK(salarioVet > 0);
ALTER TABLE persona ADD CONSTRAINT persona_d9 CHECK(costoServicio > 0);
ALTER TABLE persona ADD CONSTRAINT persona_d10 CHECK(salarioCuid > 0);
ALTER TABLE persona ADD CONSTRAINT persona_d11 CHECK(calle <> '');
ALTER TABLE persona ADD CONSTRAINT persona_d12 CHECK(numInterior >= 0);
ALTER TABLE persona ADD CONSTRAINT persona_d13 CHECK(numExterior >= 0);
ALTER TABLE persona ALTER COLUMN esVeterinario SET NOT NULL;
ALTER TABLE persona ALTER COLUMN esProveedor SET NOT NULL;
ALTER TABLE persona ALTER COLUMN esCuidador SET NOT NULL;
ALTER TABLE persona ALTER COLUMN esCliente SET NOT NULL;


--Entidad
ALTER TABLE persona ADD CONSTRAINT persona_pkey PRIMARY KEY(idPersona);

--Comentarios
COMMENT ON TABLE persona IS 'Tabla que contiene los datos de las personas que trabajan en el zoológico y de los clientes';
COMMENT ON COLUMN persona.idPersona IS 'Identificador de la persona';
COMMENT ON COLUMN persona.nombre IS 'Nombre de la persona';
COMMENT ON COLUMN persona.paterno IS 'Apellido paterno de la persona';
COMMENT ON COLUMN persona.materno IS 'Apellido materno de la persona';
COMMENT ON COLUMN persona.genero IS 'Género de la persona';
COMMENT ON COLUMN persona.rfc IS 'Registro Federal de Contribuyentes de la persona';
COMMENT ON COLUMN persona.nacimiento IS 'Fecha de nacimiento de la persona';
COMMENT ON COLUMN persona.calle IS 'Calle de la dirección de la persona';
COMMENT ON COLUMN persona.numInterior IS 'Número interior de la dirección de la persona';
COMMENT ON COLUMN persona.numExterior IS 'Número exterior de la dirección de la persona';
COMMENT ON COLUMN persona.colonia IS 'Colonia de la dirección de la persona';
COMMENT ON COLUMN persona.estado IS 'Estado de la dirección de la persona';
COMMENT ON COLUMN persona.fechaInicio IS 'Fecha de inicio de la persona en el zoológico';
COMMENT ON COLUMN persona.fechaFin IS 'Fecha de fin de la persona en el zoológico';
COMMENT ON COLUMN persona.especialidad IS 'Especialidad de la persona';
COMMENT ON COLUMN persona.salarioVet IS 'Salario del veterinario';
COMMENT ON COLUMN persona.frecuencia IS 'Frecuencia de la persona';
COMMENT ON COLUMN persona.costoServicio IS 'Costo del servicio de la persona';
COMMENT ON COLUMN persona.salarioCuid IS 'Salario del cuidador';
COMMENT ON COLUMN persona.horario IS 'Horario de la persona';
COMMENT ON COLUMN persona.diaTrabajo IS 'Día de trabajo de la persona';
COMMENT ON COLUMN persona.animalACargo IS 'Animal a cargo de la persona';
COMMENT ON COLUMN persona.esVeterinario IS 'Si la persona es veterinario';
COMMENT ON COLUMN persona.esProveedor IS 'Si la persona es proveedor';
COMMENT ON COLUMN persona.esCuidador IS 'Si la persona es cuidador';
COMMENT ON COLUMN persona.esCliente IS 'Si la persona es cliente';
COMMENT ON CONSTRAINT persona_d1 ON persona IS 'Restricción check para nombre para que no sea la cadena vacía';
COMMENT ON CONSTRAINT persona_d2 ON persona IS 'Restricción check para paterno para que no sea la cadena vacía';
COMMENT ON CONSTRAINT persona_d3 ON persona IS 'Restricción check para materno para que no sea la cadena vacía';
COMMENT ON CONSTRAINT persona_d4 ON persona IS 'Restricción check para genero para que no sea la cadena vacía';
COMMENT ON CONSTRAINT persona_d5 ON persona IS 'Restricción check para rfc para que tenga 13 caracteres';
COMMENT ON CONSTRAINT persona_d6 ON persona IS 'Restricción check para colonia para que no sea la cadena vacía';
COMMENT ON CONSTRAINT persona_d7 ON persona IS 'Restricción check para estado para que no sea la cadena vacía';
COMMENT ON CONSTRAINT persona_d8 ON persona IS 'Restricción check para salarioVet para que sea mayor a 0';
COMMENT ON CONSTRAINT persona_d9 ON persona IS 'Restricción check para costoServicio para que sea mayor a 0';
COMMENT ON CONSTRAINT persona_d10 ON persona IS 'Restricción check para salarioCuid para que sea mayor a 0';


-- Creamos la tabla Evento
CREATE TABLE evento(
    idEvento INT,
    fecha DATE,
    tipo VARCHAR(100),
    capacidad INT
);

--Restricciones evento
--Dominio
ALTER TABLE evento ALTER COLUMN idEvento SET NOT NULL;
ALTER TABLE evento ALTER COLUMN fecha SET NOT NULL;
ALTER TABLE evento ADD CONSTRAINT evento_tipo CHECK(tipo <> '');
ALTER TABLE evento ALTER COLUMN tipo SET NOT NULL;
ALTER TABLE evento ALTER COLUMN capacidad SET NOT NULL;
ALTER TABLE evento ADD CONSTRAINT evento_tipo1 CHECK(capacidad > 0);

--Comentarios
COMMENT ON TABLE evento IS 'Tabla que contiene los datos de un evento del zoológico';
COMMENT ON COLUMN evento.idEvento IS 'Identificador del evento';
COMMENT ON COLUMN evento.fecha IS 'Fecha del evento';
COMMENT ON COLUMN evento.tipo IS 'Tipo de evento';
COMMENT ON COLUMN evento.capacidad IS 'Capacidad del evento';
COMMENT ON CONSTRAINT evento_tipo ON evento IS 'Restricción check para que el tipo de evento no sea la cadena vacía';


--Entidad
ALTER TABLE evento ADD CONSTRAINT pk_idEvento PRIMARY KEY (idEvento);

--Tabla asistir
CREATE TABLE asistir(
	idPersona INT,
	idEvento INT
);

--Restricciones
--Referencial
ALTER TABLE asistir ADD CONSTRAINT asistir_fkey1 FOREIGN KEY (idPersona) REFERENCES persona(idPersona) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE asistir ADD CONSTRAINT asistir_fkey2 FOREIGN KEY (idEvento) REFERENCES evento(idEvento) ON UPDATE CASCADE ON DELETE CASCADE;

--Comentarios
COMMENT ON TABLE asistir IS 'Tabla que contiene la asistencia a los eventos del zoologico';
COMMENT ON COLUMN asistir.idPersona IS 'Identificador de la persona';
COMMENT ON COLUMN asistir.idEvento IS 'Identificador del evento';
COMMENT ON CONSTRAINT asistir_fkey1 ON asistir IS 'Llave foránea del identificador de persona';
COMMENT ON CONSTRAINT asistir_fkey2 ON asistir IS 'Llave foránea del identificador del evento';

--Tabla Telefono
CREATE TABLE telefono(
    idPersona INT,
    telefono VARCHAR(10)
);

--Restricciones
--Dominio
ALTER TABLE telefono ALTER COLUMN telefono SET NOT NULL;
--Referencial
ALTER TABLE telefono ADD CONSTRAINT telefono_fkey  FOREIGN KEY(idPersona) REFERENCES persona(idPersona) ON UPDATE CASCADE ON DELETE CASCADE;
--Entidad
ALTER TABLE telefono ADD CONSTRAINT telefono_pkey PRIMARY KEY(idPersona, telefono); 

--Comentarios
COMMENT ON TABLE telefono IS 'Tabla que contiene los datos de los teléfonos de las personas';
COMMENT ON COLUMN telefono.idPersona IS 'Identificador de la persona';
COMMENT ON COLUMN telefono.telefono IS 'Teléfono de la persona';
COMMENT ON CONSTRAINT telefono_fkey ON telefono IS 'Llave foránea del identificador de la persona';
COMMENT ON CONSTRAINT telefono_pkey ON telefono IS 'Llave primaria de la tabla telefono';

--Tabla correo
CREATE TABLE correo(
    idPersona INT,
    correo VARCHAR(50)
);

--Restricciones
--Dominio
ALTER TABLE correo ALTER COLUMN correo SET NOT NULL;
--Referencial
ALTER TABLE correo ADD CONSTRAINT correo_fkey FOREIGN KEY(idPersona) REFERENCES persona(idPersona) ON UPDATE CASCADE ON DELETE CASCADE;
--Entidad
ALTER TABLE correo ADD CONSTRAINT correo_pkey PRIMARY KEY(idPersona, correo); 

--Comentarios
COMMENT ON TABLE correo IS 'Tabla que contiene los datos de los correos de las personas';
COMMENT ON COLUMN correo.idPersona IS 'Identificador de la persona';
COMMENT ON COLUMN correo.correo IS 'Correo de la persona';
COMMENT ON CONSTRAINT correo_fkey ON correo IS 'Llave foránea del identificador de la persona';
COMMENT ON CONSTRAINT correo_pkey ON correo IS 'Llave primaria de la tabla correo';

-- Tabla Ticket
CREATE TABLE ticket(
    folio INT,
    fecha DATE,
    tipo VARCHAR(50),
    descuento NUMERIC(10,2),
    costo NUMERIC(10,2)
);

-- Restricciones
--Dominio
ALTER TABLE ticket ALTER COLUMN folio SET NOT NULL;
ALTER TABLE ticket ALTER COLUMN fecha SET NOT NULL;
ALTER TABLE ticket ADD CONSTRAINT ticket_Tipo CHECK(tipo <> '');
ALTER TABLE ticket ADD CONSTRAINT ticket_Descuento CHECK(descuento >= 0);
ALTER TABLE ticket ALTER COLUMN descuento SET NOT NULL;
ALTER TABLE ticket ADD CONSTRAINT ticket_Costo CHECK(costo >= 0);
ALTER TABLE ticket ALTER COLUMN costo SET NOT NULL;

--Comentarios
COMMENT ON TABLE ticket IS 'Tabla que contiene los datos de los tickets del zoológico';
COMMENT ON COLUMN ticket.Folio IS 'Folio del ticket';
COMMENT ON COLUMN ticket.Fecha IS 'Fecha del ticket';
COMMENT ON COLUMN ticket.Tipo IS 'Tipo de ticket';
COMMENT ON COLUMN ticket.Descuento IS 'Descuento del ticket';
COMMENT ON COLUMN ticket.Costo IS 'Costo del ticket';
COMMENT ON CONSTRAINT ticket_Tipo ON ticket IS 'Restricción check para tipo para que no sea la cadena vacía';
COMMENT ON CONSTRAINT ticket_Descuento ON ticket IS 'Restricción check para descuento para que sea mayor a 0';
COMMENT ON CONSTRAINT ticket_Costo ON ticket IS 'Restricción check para costo para que sea mayor a 0';

--Entidad
ALTER TABLE ticket ADD CONSTRAINT ticket_pkey PRIMARY KEY (Folio);

--Tabla Generar
CREATE TABLE generar(
	idPersona INT,
	folio INT
);

--Restricciones
ALTER TABLE generar ADD CONSTRAINT fk_idPersona FOREIGN KEY (idPersona) REFERENCES persona(idPersona)ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE generar ADD CONSTRAINT fk_folio FOREIGN KEY (folio) REFERENCES ticket(folio)ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE generar ALTER COLUMN idPersona SET NOT NULL;
ALTER TABLE generar ALTER COLUMN folio SET NOT NULL;

--Comentarios
COMMENT ON TABLE generar IS 'Tabla que contiene la información de cada cliente con su ticket que ha generado';
COMMENT ON COLUMN generar.idPersona IS 'Identificador de la persona asociada';
COMMENT ON COLUMN generar.folio IS 'El folio del ticket';
COMMENT ON CONSTRAINT fk_idPersona on generar IS 'La llave foránea que viene de la tabla persona de la tabla generar';
COMMENT ON CONSTRAINT fk_folio ON generar IS 'La llave foránea que viene de la tabla ticket de la tabla generar';

--Tabla medicina
CREATE TABLE medicina(
    idMedicina INT,
    nombre VARCHAR(50),
    proveedor VARCHAR(50),
    caducidad DATE,
    refrigeracion BOOLEAN,
    lote VARCHAR(50),
    labProcedencia VARCHAR(50)
);

--Restricciones medicina
--Dominio
ALTER TABLE medicina ALTER COLUMN idMedicina SET NOT NULL;
ALTER TABLE medicina ADD CONSTRAINT medicina_d1 CHECK(nombre <> '');
ALTER TABLE medicina ALTER COLUMN nombre SET NOT NULL;
ALTER TABLE medicina ADD CONSTRAINT medicina_d3 CHECK(proveedor <> '');
ALTER TABLE medicina ALTER COLUMN proveedor SET NOT NULL;
ALTER TABLE medicina ALTER COLUMN caducidad SET NOT NULL;
ALTER TABLE medicina ADD CONSTRAINT medicina_d4 CHECK(lote <> '');
ALTER TABLE medicina ALTER COLUMN refrigeracion SET NOT NULL;
ALTER TABLE medicina ALTER COLUMN lote SET NOT NULL;
ALTER TABLE medicina ADD CONSTRAINT medicina_d5 CHECK(labProcedencia <> '');
ALTER TABLE medicina ALTER COLUMN labProcedencia SET NOT NULL;

--Entidad
ALTER TABLE medicina ADD CONSTRAINT medicina_pkey PRIMARY KEY (idMedicina);

--Comentarios
COMMENT ON TABLE medicina IS 'Tabla que contiene los datos de las medicinas del zoológico';
COMMENT ON COLUMN medicina.idMedicina IS 'Identificador de la medicina';
COMMENT ON COLUMN medicina.nombre IS 'Nombre de la medicina';
COMMENT ON COLUMN medicina.proveedor IS 'Proveedor de la medicina';
COMMENT ON COLUMN medicina.caducidad IS 'Fecha de caducidad de la medicina';
COMMENT ON COLUMN medicina.refrigeracion IS 'Indica si la medicina requiere refrigeración';
COMMENT ON COLUMN medicina.lote IS 'Lote de la medicina';
COMMENT ON COLUMN medicina.labProcedencia IS 'Laboratorio de procedencia de la medicina';
COMMENT ON CONSTRAINT medicina_d1 ON medicina IS 'Restricción check para el nombre de la medicina para que no sea la cadena vacía';
COMMENT ON CONSTRAINT medicina_d3 ON medicina IS 'Restricción check para el proveedor de la medicina para que no sea la cadena vacía';
COMMENT ON CONSTRAINT medicina_d4 ON medicina IS 'Restricción check para el lote de la medicina para que no sea la cadena vacía';
COMMENT ON CONSTRAINT medicina_d5 ON medicina IS 'Restricción check para el laboratorio de procedencia de la medicina para que no sea la cadena vacía';

--Tabla proveer
CREATE TABLE proveerMedicina(
	idPersona INT,
	idMedicina INT
);

--Restricciones proveerMedicina
--Referencial
ALTER TABLE proveerMedicina ADD CONSTRAINT proveerMedicina_fkey1 
FOREIGN KEY (idPersona) REFERENCES persona(idPersona) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE proveerMedicina ADD CONSTRAINT proveerMedicina_fkey2 
FOREIGN KEY (idMedicina) REFERENCES medicina(idMedicina) ON UPDATE CASCADE ON DELETE CASCADE;

--Comentarios
COMMENT ON TABLE proveerMedicina IS 'Tabla que contiene los datos de la relacion proveer';
COMMENT ON COLUMN proveerMedicina.idPersona IS 'Identificador de la persona';
COMMENT ON COLUMN proveerMedicina.idMedicina IS 'Identificador del medicina';
COMMENT ON CONSTRAINT proveerMedicina_fkey1 ON proveerMedicina IS 'Llave foránea del identificador de la persona';
COMMENT ON CONSTRAINT proveerMedicina_fkey2 ON proveerMedicina IS 'Llave foránea del identificador del medicina';

--Tabla Alimento
CREATE TABLE alimento(
	idAlimento INT NOT NULL,
	nombre varchar(50),
	proveedor varchar(50),
	caducidad date,
	refrigeracion BOOLEAN,
	tipo varchar(50)
);

--Restricciones Alimento
--Dominio
ALTER TABLE alimento ALTER COLUMN idAlimento SET NOT NULL;
ALTER TABLE alimento ADD CONSTRAINT alimento_d1 CHECK(nombre <> '');
ALTER TABLE alimento ALTER COLUMN nombre SET NOT NULL;
ALTER TABLE alimento ADD CONSTRAINT alimento_d3 CHECK(proveedor <> '');
ALTER TABLE alimento ALTER COLUMN proveedor SET NOT NULL;
ALTER TABLE alimento ADD CONSTRAINT alimento_d4 CHECK(CHAR_LENGTH(caducidad::TEXT) = 10);
ALTER TABLE alimento ALTER COLUMN caducidad SET NOT NULL;
ALTER TABLE alimento ADD CONSTRAINT alimento_d5 CHECK(tipo <> '');
ALTER TABLE alimento ALTER COLUMN tipo SET NOT NULL;

--Entidad
ALTER TABLE alimento ADD CONSTRAINT alimento_pkey PRIMARY KEY(idAlimento);

--Comentarios
COMMENT ON TABLE alimento IS 'Tabla que contiene los datos de los alimentos que se le dan a los animales';
COMMENT ON COLUMN alimento.idAlimento IS 'Identificador del alimento';
COMMENT ON COLUMN alimento.nombre IS 'Nombre del alimento';
COMMENT ON COLUMN alimento.proveedor IS 'Proveedor del alimento';
COMMENT ON COLUMN alimento.caducidad IS 'Fecha de caducidad del alimento';
COMMENT ON COLUMN alimento.refrigeracion IS 'Indica si el alimento requiere refrigeración';
COMMENT ON COLUMN alimento.tipo IS 'Tipo de alimento';
COMMENT ON CONSTRAINT alimento_d1 ON alimento IS 'Restricción check para el nombre del alimento para que no sea la cadena vacía';
COMMENT ON CONSTRAINT alimento_d3 ON alimento IS 'Restricción check para el proveedor del alimento para que no sea la cadena vacía';
COMMENT ON CONSTRAINT alimento_d4 ON alimento IS 'Restricción check para la fecha de caducidad del alimento para que no sea la cadena vacía';
COMMENT ON CONSTRAINT alimento_d5 ON alimento IS 'Restricción check para el tipo de alimento para que no sea la cadena vacía';
COMMENT ON CONSTRAINT alimento_pkey ON alimento IS 'Llave primaria de la tabla alimento';

-- Tabla proveerAlimento
CREATE TABLE proveerAlimento(
    idPersona INT,
    idAlimento INT
);

--Restricciones ProveerAlimento
--Referencial
ALTER TABLE proveerAlimento ADD CONSTRAINT proveerAlimento_fkey1 
FOREIGN KEY (idPersona) REFERENCES persona(idPersona) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE proveerAlimento ADD CONSTRAINT proveerAlimento_fkey2 
FOREIGN KEY (idAlimento) REFERENCES alimento(idAlimento) ON UPDATE CASCADE ON DELETE CASCADE;

--Comentarios 
COMMENT ON TABLE proveerAlimento IS 'Tabla que contiene los datos de la relacion proveer que es para los alimentos';
COMMENT ON COLUMN proveerAlimento.idPersona IS 'Identificador de la persona que provee el alimento';
COMMENT ON COLUMN proveerAlimento.idAlimento IS 'Identificador del insumo que es el alimento';
COMMENT ON CONSTRAINT proveerAlimento_fkey1 ON proveerAlimento IS 'Llave foránea del identificador de la persona que provee el alimento';
COMMENT ON CONSTRAINT proveerAlimento_fkey2 ON proveerAlimento IS 'Llave foránea del identificador del insumo que es el alimento';

--Tabla bioma
CREATE TABLE bioma(
    tipoBioma varchar(50)
);
--Restricciones bioma
--Dominio
ALTER TABLE bioma ADD CONSTRAINT uk_TipoBioma UNIQUE (tipoBioma);
ALTER TABLE bioma ADD CONSTRAINT bioma_d1 CHECK(tipoBioma <> '');
ALTER TABLE bioma ALTER COLUMN tipoBioma SET NOT NULL;

--Entidad 
ALTER TABLE bioma ADD CONSTRAINT pk_tipoBioma PRIMARY KEY (tipoBioma);

--Comentarios
COMMENT ON TABLE bioma IS 'Tabla que contiene los datos de los biomas del zoológico';
COMMENT ON COLUMN bioma.tipoBioma IS 'Tipo de bioma';
COMMENT ON CONSTRAINT pk_tipoBioma ON bioma IS 'Llave primaria de la tabla bioma';

--Tabla servicio
CREATE TABLE servicio(
    tipoBioma VARCHAR(50),
    servicio VARCHAR(50)
);

--Restricciones de servicio 
--Dominio
ALTER TABLE servicio ADD CONSTRAINT servicio_d1 CHECK(servicio <> '');
ALTER TABLE servicio ALTER COLUMN servicio SET NOT NULL;

--Entidad
ALTER TABLE servicio ADD CONSTRAINT servicio_fkey1 FOREIGN KEY (tipoBioma) 
REFERENCES bioma(tipoBioma) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE servicio ADD CONSTRAINT pk_servicio PRIMARY KEY (tipoBioma, servicio);

--Comentario
COMMENT ON CONSTRAINT servicio_d1 on servicio IS 'Restricción check para el servicio del bioma para que no sea la cadena vacía';
COMMENT ON CONSTRAINT servicio_fkey1 ON servicio IS 'Llave foránea del identificador del servicio';
COMMENT ON CONSTRAINT pk_servicio ON servicio IS 'Llave primaria de la tabla servicio';

--Tabla distribuir
CREATE TABLE distribuir(
	idAlimento INT,
	tipobioma VARCHAR(50)
);
--Restricciones distribuir
--Referencial
ALTER TABLE distribuir ADD CONSTRAINT distribuir_fkey1 FOREIGN KEY (idAlimento) 
REFERENCES alimento(idAlimento) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE distribuir ADD CONSTRAINT distribuir_fkey2 FOREIGN KEY (tipobioma) 
REFERENCES bioma(tipobioma) ON UPDATE CASCADE ON DELETE CASCADE;

--Comentarios
COMMENT ON TABLE distribuir IS 'Tabla que contiene los datos de la distribución de los alimentos en los biomas';
COMMENT ON COLUMN distribuir.idAlimento IS 'Identificador del alimento';
COMMENT ON COLUMN distribuir.tipoBioma IS 'Tipo de bioma';
COMMENT ON CONSTRAINT distribuir_fkey1 ON distribuir IS 'Llave foránea del identificador del alimento';
COMMENT ON CONSTRAINT distribuir_fkey2 ON distribuir IS 'Llave foránea del tipo de bioma';

-- Tabla Jaula Me quedé aquí
CREATE TABLE jaula (
    numJaula INT,
    tipoBioma VARCHAR(50)
);

--Dominio
ALTER TABLE jaula ALTER COLUMN numJaula SET NOT NULL;
ALTER TABLE jaula ADD CONSTRAINT jaula_d1 CHECK(tipoBioma <> '');
ALTER TABLE jaula ALTER COLUMN tipoBioma SET NOT NULL;

--Entidad 
ALTER TABLE jaula ADD CONSTRAINT pk_numJaula PRIMARY KEY (tipoBioma, numJaula);

--Referencial
ALTER TABLE jaula ADD CONSTRAINT jaula_fkey FOREIGN KEY (tipoBioma) REFERENCES bioma(tipoBioma) ON UPDATE CASCADE ON DELETE CASCADE;

--Comentarios
COMMENT ON TABLE jaula IS 'Tabla que contiene los datos de las jaulas del zoológico';
COMMENT ON COLUMN jaula.numJaula IS 'Número de la jaula';
COMMENT ON COLUMN jaula.tipoBioma IS 'Tipo de bioma de la jaula';
COMMENT ON CONSTRAINT jaula_d1 ON jaula IS 'Restricción check para el tipo de bioma de la jaula para que no sea la cadena vacía';
COMMENT ON CONSTRAINT jaula_fkey ON jaula IS 'Llave foránea del tipo de bioma';
COMMENT ON CONSTRAINT pk_numJaula ON jaula IS 'Llave primaria de la tabla jaula';

-- Tabla Animal
CREATE TABLE animal (
    iDAnimal INT,
    numJaula INT,
    tipoBioma VARCHAR(50) NOT NULL,     
    nombre VARCHAR(50) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    idPersona INT,    
    peso NUMERIC(10,4),
    altura NUMERIC(10,4),
    sexo VARCHAR(10) NOT NULL,
    alimentacion VARCHAR(50),
    indicacionMed VARCHAR(100)
);

--Restricciones Animal
ALTER TABLE animal ADD CONSTRAINT pk_idAnimal PRIMARY KEY (idAnimal);
ALTER TABLE animal ALTER COLUMN iDAnimal SET NOT NULL;
ALTER TABLE animal ADD CONSTRAINT fk_numJaula FOREIGN KEY (numJaula,tipoBioma) REFERENCES jaula(numJaula, tipoBioma) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE animal ADD CONSTRAINT fk_tipoBioma FOREIGN KEY (tipoBioma) REFERENCES bioma(tipoBioma) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE animal ADD CONSTRAINT Animal_d1 CHECK(nombre <> '');
ALTER TABLE animal ALTER COLUMN nombre SET NOT NULL;
ALTER TABLE animal ADD CONSTRAINT Animal_d2 CHECK(especie <> '');
ALTER TABLE animal ALTER COLUMN especie SET NOT NULL;
ALTER TABLE animal ADD CONSTRAINT Animal_d3 CHECK(peso > 0);
ALTER TABLE animal ALTER COLUMN peso SET NOT NULL;
ALTER TABLE animal ADD CONSTRAINT Animal_d4 CHECK(altura > 0);
ALTER TABLE animal ALTER COLUMN altura SET NOT NULL;
ALTER TABLE animal ADD CONSTRAINT Animal_d5 CHECK(sexo <> '');
ALTER TABLE animal ALTER COLUMN sexo SET NOT NULL;
ALTER TABLE animal ADD CONSTRAINT Animal_d6 CHECK(alimentacion <> '');
ALTER TABLE animal ALTER COLUMN alimentacion SET NOT NULL;
ALTER TABLE animal ADD CONSTRAINT Animal_d7 CHECK(indicacionMed <> '');

--Comentarios
COMMENT ON TABLE animal IS 'Tabla que contiene los datos de los animales del zoológico';
COMMENT ON COLUMN animal.iDAnimal IS 'Identificador del animal';
COMMENT ON COLUMN animal.numJaula IS 'Número de la jaula del animal';
COMMENT ON COLUMN animal.tipoBioma IS 'Tipo de bioma del animal';
COMMENT ON COLUMN animal.idPersona IS 'Identificador de la persona que cuida al animal';
COMMENT ON COLUMN animal.nombre IS 'Nombre del animal';
COMMENT ON COLUMN animal.especie IS 'Especie del animal';
COMMENT ON COLUMN animal.peso IS 'Peso del animal';
COMMENT ON COLUMN animal.altura IS 'Altura del animal';
COMMENT ON COLUMN animal.sexo IS 'Sexo del animal';
COMMENT ON COLUMN animal.alimentacion IS 'Alimentación del animal';
COMMENT ON COLUMN animal.indicacionMed IS 'Indicaciones médicas del animal';
COMMENT ON CONSTRAINT Animal_d1 ON animal IS 'Restricción check para el nombre del animal para que no sea la cadena vacía';
COMMENT ON CONSTRAINT Animal_d2 ON animal IS 'Restricción check para la especie del animal para que no sea la cadena vacía';
COMMENT ON CONSTRAINT Animal_d3 ON animal IS 'Restricción check para el peso del animal para que sea mayor a 0';
COMMENT ON CONSTRAINT Animal_d4 ON animal IS 'Restricción check para la altura del animal para que sea mayor a 0';
COMMENT ON CONSTRAINT Animal_d5 ON animal IS 'Restricción check para el sexo del animal para que no sea la cadena vacía';
COMMENT ON CONSTRAINT Animal_d6 ON animal IS 'Restricción check para la alimentación del animal para que no sea la cadena vacía';
COMMENT ON CONSTRAINT Animal_d7 ON animal IS 'Restricción check para las indicaciones médicas del animal para que no sea la cadena vacía';
COMMENT ON CONSTRAINT pk_idAnimal ON animal IS 'Llave primaria de la tabla animal';
COMMENT ON CONSTRAINT fk_numJaula ON animal IS 'Llave foránea del número de la jaula';
COMMENT ON CONSTRAINT fk_tipoBioma ON animal IS 'Llave foránea del tipo de bioma';

--Tabla atender
CREATE TABLE atender(
    idPersona INT,
    idAnimal INT
);

-- Restricciones atender
-- Referencial
ALTER TABLE atender ADD CONSTRAINT atender_fkey1 
FOREIGN KEY(idPersona) REFERENCES persona(idPersona) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE atender ADD CONSTRAINT atender_fkey2
FOREIGN KEY(idAnimal) REFERENCES animal(idAnimal) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE atender ALTER COLUMN idPersona SET NOT NULL;
ALTER TABLE atender ALTER COLUMN idAnimal SET NOT NULL;

--Comentarios
COMMENT ON TABLE atender IS 'Tabla que contiene los datos de la relación antender entre persona y animal';
COMMENT ON COLUMN atender.idPersona IS 'Identificador de la persona que atiende';
COMMENT ON COLUMN atender.idAnimal IS 'Identificador del animal que es atendido';
COMMENT ON CONSTRAINT atender_fkey1 ON atender IS 'Llave foránea de atender que es el animal';
COMMENT ON CONSTRAINT atender_fkey2 ON atender IS 'Llave foránea de atender que es la persona';

--Tabla laborar
CREATE TABLE laborar(
    idPersona INT,
    tipoBioma VARCHAR(50)
);

--Restricciones
--Referencial
ALTER TABLE laborar ADD CONSTRAINT laborar_fkey1 FOREIGN KEY(idPersona) REFERENCES persona(idPersona) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE laborar ADD CONSTRAINT laborar_fkey2 FOREIGN KEY(TipoBioma) REFERENCES bioma(TipoBioma) ON UPDATE CASCADE ON DELETE CASCADE;

--Comentarios
COMMENT ON TABLE laborar IS 'Tabla que contiene los datos de los biomas en los que labora una persona';
COMMENT ON COLUMN laborar.idPersona IS 'Identificador de la persona';
COMMENT ON COLUMN laborar.TipoBioma IS 'Tipo de bioma';
COMMENT ON CONSTRAINT laborar_fkey1 ON laborar IS 'Llave foránea del identificador de la persona';
COMMENT ON CONSTRAINT laborar_fkey2 ON laborar IS 'Llave foránea del tipo de bioma';
