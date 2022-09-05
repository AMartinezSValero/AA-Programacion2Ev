-- INSERTS USUARIOS

INSERT INTO USUARIOS (nombre, contrasena, email, direccion) VALUES ('Andres', 'andres1234', 'andres@cars.com', 'Calle San Benito');
INSERT INTO USUARIOS (nombre, contrasena, email, direccion) VALUES ('Prueba1', 'prueba1', 'p1@cars.com', 'Calle Pedro Primero');
INSERT INTO USUARIOS (nombre, contrasena, email, direccion) VALUES ('Prueba2', 'prueba2', 'p2@cars.com', 'Calle Los Rosales');
INSERT INTO USUARIOS (nombre, contrasena, email, direccion) VALUES ('Prueba3', 'prueba3', 'p3@cars.com', 'Calle Prueba');

-- INSERTS MARCAS

INSERT INTO MARCAS (nombre, descripcion, logo, direccion) VALUES ('Mercedes', 'Marca del grupo Daimler AG', 'mercedes.png', 'Calle San Mercedes');
INSERT INTO MARCAS (nombre, descripcion, logo, direccion) VALUES ('Audi', 'Marca del grupo VAG', 'audi.png', 'Calle San Audi');
INSERT INTO MARCAS (nombre, descripcion, logo, direccion) VALUES ('Cupra', 'Marca premium de Seat', 'cupra.png', 'Calle San Cupra');
INSERT INTO MARCAS (nombre, descripcion, logo, direccion) VALUES ('BMW', 'Marca de coches sin intermitentes', 'bmw.png', 'Calle San BMW');
INSERT INTO MARCAS (nombre, descripcion, logo, direccion) VALUES ('Ferrari', 'Marca de coches de lujo', 'ferrari.jpg', 'Calle San Ferrari');

-- INSERTS COCHES

INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('Clase C', 163, 'Blanco', 'Berlina alemana dinamico y lujoso', 48000, 1);
INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('Clase G', 288, 'Cromado', 'Todoterreno emblematico y robusto', 138000, 1);
INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('Vito', 114, 'Negro', 'Furgoneta de gran capacidad', 35000, 1);
INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('CLA Coupe', 198, 'Gris', 'Diseño novedoso y dinamismo avanzado', 34000, 1);

INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('A3', 113, 'Gris', 'Coche compacto', 30000, 2);
INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('A4', 136, 'Blanco', 'Berlina alemana', 46000, 2);
INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('Q5', 163, 'Negro', 'SUV innovador', 55000, 2);
INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('TT', 197, 'Rojo', 'Deportivo coupe', 57000, 2);

INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('Formentor', 150, 'Negro', 'Crossover deportivo', 35000, 3);
INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('Leon', 204, 'Azul', 'Compacto deportivo', 44000, 3);
INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('Born', 231, 'Amarillo', 'Compacto electrico', 41000, 3);
INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('Ateca', 300, 'Gris', 'SUV Deportivo', 53000, 3);

INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('Serie 3', 150, 'Blanco', 'Berlina deportiva', 45000, 4);
INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('X5', 231, 'Negro', 'SUV Premium', 75000, 4);
INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('Serie 5', 184, 'Azul', 'Berlina de elevada calidad', 57000, 4);
INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('Serie 7', 286, 'Gris', 'Berlina de lujo', 106000, 4);

INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('812 GTS', 800, 'Rojo', 'Superdeportivo descapotable', 340000, 5);
INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('Roma', 1000, 'Azul', 'Deportivo de motor V8 Biturbo', 210000, 5);
INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('SF90 Spider', 163, 'Amarillo', 'Variante cabrio del Ferrari SF90 Stradale', 550000, 5);
INSERT INTO COCHES (modelo, potencia, color, descripcion, precio, id_marca) VALUES ('F8 Tributo', 720, 'Rojo', 'Ferrari 488 Pista con mejoras en la carrocería', 238000, 5);