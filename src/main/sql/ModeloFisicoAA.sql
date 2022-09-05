-- CREATE tablas

CREATE TABLE USUARIOS(
    id_usuario INT,
    nombre VARCHAR2(50),
    contrasena VARCHAR2(25),
    email VARCHAR2(25),
    direccion VARCHAR2(75),
    CONSTRAINT PK_id_usuario PRIMARY KEY(id_usuario)
);

CREATE TABLE MARCAS(
    id_marca INT,
    nombre VARCHAR2(50),
    descripcion VARCHAR(200),
    logo VARCHAR2(150),
    direccion VARCHAR2(75),
    CONSTRAINT PK_id_marca PRIMARY KEY(id_marca)
);

CREATE TABLE COCHES(
    id_coche INT,
    modelo VARCHAR2(30),
    potencia NUMBER,
    color VARCHAR2(20),
    descripcion VARCHAR2(200),
    precio INT,
    id_marca INT,   
    CONSTRAINT PK_id_coche PRIMARY KEY(id_coche)
);

ALTER TABLE COCHES ADD CONSTRAINT FK_id_marca_coche FOREIGN KEY(id_marca) REFERENCES MARCAS(id_marca);

CREATE TABLE VALORACIONES(
    fecha_valoracion DATE,
    cantidad_estrellas INT,
    descripcion VARCHAR(150),
    id_coche INT,
    id_usuario INT
);

ALTER TABLE VALORACIONES ADD CONSTRAINT FK_id_coche_valoracion FOREIGN KEY(id_coche) REFERENCES COCHES(id_coche);
ALTER TABLE VALORACIONES ADD CONSTRAINT FK_id_usuario_valoracion FOREIGN KEY(id_usuario) REFERENCES USUARIOS(id_usuario);

--SEQUSUARIOS
CREATE SEQUENCE SEQ_USUARIOS
START WITH 1
INCREMENT BY 1
minvalue 1;

CREATE OR REPLACE TRIGGER usuario_on_insert
  BEFORE INSERT ON USUARIOS 
  REFERENCING NEW AS New OLD AS Old
  FOR EACH ROW
DECLARE
   tmpVar   NUMBER; 
BEGIN
  tmpVar := 0;
  SELECT SEQ_USUARIOS.nextval INTO tmpVar FROM DUAL;
  :new.id_usuario:=tmpVar;
END;

--SEQMARCAS
CREATE SEQUENCE SEQ_MARCAS
START WITH 1
INCREMENT BY 1
minvalue 1;

CREATE OR REPLACE TRIGGER marca_on_insert
  BEFORE INSERT ON MARCAS 
  REFERENCING NEW AS New OLD AS Old
  FOR EACH ROW
DECLARE
   tmpVar   NUMBER; 
BEGIN
  tmpVar := 0;
  SELECT SEQ_MARCAS.nextval INTO tmpVar FROM DUAL;
  :new.id_marca:=tmpVar;
END;

--SEQCOCHES
CREATE SEQUENCE SEQ_COCHES
START WITH 1
INCREMENT BY 1
minvalue 1;

CREATE OR REPLACE TRIGGER coche_on_insert
  BEFORE INSERT ON COCHES
  REFERENCING NEW AS New OLD AS Old
  FOR EACH ROW
DECLARE
   tmpVar   NUMBER; 
BEGIN
  tmpVar := 0;
  SELECT SEQ_COCHES.nextval INTO tmpVar FROM DUAL;
  :new.id_coche:=tmpVar;
END;