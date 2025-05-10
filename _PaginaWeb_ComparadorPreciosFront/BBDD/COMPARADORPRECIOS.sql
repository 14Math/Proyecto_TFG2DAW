create database Comparador_Precios;
use Comparador_Precios;

CREATE TABLE CLIENTES
(
ID_CLIENTE INT NOT NULL auto_increment primary KEY,
USERNAME VARCHAR(45) NOT NULL,
PASSWORD VARCHAR(200) NOT NULL,
EMAIL VARCHAR(100) NOT NULL UNIQUE,
FECHA_REGISTRO DATE
);


CREATE TABLE PROVEDORES(
ID_PROVEDOR INT NOT NULL auto_increment primary KEY,
USERNAME VARCHAR(45) NOT NULL ,
PASSWORD VARCHAR(200) NOT NULL,
EMAIL VARCHAR(100) NOT NULL UNIQUE,
EMPRESA VARCHAR(45) NOT NULL UNIQUE,
FECHA_REGISTRO DATE
);


-- Insertar datos en la tabla CLIENTE
INSERT INTO CLIENTES (USERNAME, PASSWORD, EMAIL,   FECHA_REGISTRO)
VALUES
('Matrix', 'Matrix1234', 'mathew@ifp.com', '2023-10-26'),
('Savg', 'Savg1234', 'alejandra@ifp.com',  '2023-10-25'),
('keven100', 'keven1234', 'keven@ifp.com',   '2023-10-24');

-- Insertar datos en la tabla PROVEDOR
INSERT INTO PROVEDORES (USERNAME, PASSWORD, EMAIL, EMPRESA, FECHA_REGISTRO)
VALUES
('Matrix7', 'Matrix1234', 'mathew@prov.com',  'La Fuente, S.A.', '2023-10-23'),
('Savg7', 'Savg1234', 'alejandra@prov.com', 'El Corte Inglés, S.A.', '2023-10-22'),
('keven7', 'keven1234', 'keven@prov.com', 'Almacén General, S.L.', '2023-10-21');


CREATE TABLE CATEGORIAS (
  ID_CATEGORIA INT PRIMARY KEY AUTO_INCREMENT,
  NOMBRE VARCHAR(35) UNIQUE
);
-- Insertar categorías
INSERT INTO CATEGORIAS (NOMBRE) VALUES
('Electronica'),
('Videojuegos'),
('Libros'),
('Perfumeria'),
('Juguetes');
-- PEERFUMERIA,VIDEOJUEGOS,LIBROS,JUGUETES
-- Tabla PRODUCTOS
CREATE TABLE PRODUCTOS (
  ID_PRODUCTO INT NOT NULL PRIMARY KEY,
  NOMBRE VARCHAR(100) NOT NULL,
  MARCA VARCHAR(35) NOT NULL,
  AUTOR VARCHAR(35) NULL,
  DESCRIPCION VARCHAR(200) NOT NULL,
  PRECIO_VENTA DEC(9,2) NULL,
  ID_CATEGORIA INT not null,
  
  FOREIGN KEY (ID_CATEGORIA) REFERENCES CATEGORIAS(ID_CATEGORIA)
);
-- ELECTRONICA
	-- Teléfonos
INSERT INTO PRODUCTOS (ID_PRODUCTO,NOMBRE, MARCA, DESCRIPCION, PRECIO_VENTA,ID_CATEGORIA) VALUES
-- iPhones
(2460,'IPhone 16', 'Apple', 'Teléfono de alta gama con cámara avanzada y diseño elegante', 1099.00,1),
(3088,'IPhone 14', 'Apple', 'Teléfono con chip A15 Bionic y pantalla Super Retina XDR', 1009.00, 1), --
(5791,'IPhone SE (2022)', 'Apple', 'Teléfono compacto con chip A15 Bionic y botón de inicio', 529.00, 1),
(0658,'IPhone 13 mini', 'Apple', 'Teléfono pequeño y potente con chip A15 Bionic', 809.00, 1), --
(2877,'IPhone 16 Plus', 'Apple', 'Teléfono con triple cámara y pantalla Super Retina XDR', 1209.00, 1),
(6095,'IPhone 15 Pro', 'Apple', 'Teléfono de alta gama con cámara mejorada y diseño de titanio', 1329.00, 1), --
(9653,'IPhone 16 Pro Max', 'Apple', 'Teléfono de alta gama con cámara periscópica y diseño de titanio', 1429.00, 1),
(3827,'IPhone 15', 'Apple', 'Teléfono con Dynamic Island y cámara de 48 MP', 959.00, 1), --
(4962,'IPhone 15 Plus', 'Apple', 'Teléfono con Dynamic Island y batería de larga duración', 1059.00, 1),  --
-- iPhones
-- Samsung
(5256,'Galaxy Z Fold5', 'Samsung', 'Teléfono plegable innovador que se transforma en tableta', 1909.00, 1),
(8052,'Galaxy Z Flip5', 'Samsung', 'Teléfono plegable compacto y elegante', 1209.00, 1),
(7531,'Galaxy A54', 'Samsung', 'Teléfono de gama media con buena cámara y batería', 489.00, 1),
(3690,'Galaxy M14', 'Samsung', 'Teléfono con gran batería para una larga duración', 219.00, 1),
(2045,'Galaxy S23 Ultra', 'Samsung', 'Teléfono de alta gama con cámara de 200MP y S Pen', 1209.00, 1),
(3786,'Galaxy S23', 'Samsung', 'Teléfono de gama alta con diseño elegante y rendimiento potente', 859.00, 1),
-- Samsung
-- OPPO
(6304,'Find X6 Pro', 'OPPO', 'Teléfono de alta gama con cámara Hasselblad de segunda generación', 1099.00, 1),
(2789,'Find N2', 'OPPO', 'Teléfono plegable innovador con diseño elegante y compacto', 1499.00, 1),
(1947,'Reno11 Pro', 'OPPO', 'Teléfono con diseño elegante, cámara versátil y rendimiento sólido', 599.00, 1),
(9152,'A98 5G', 'OPPO', 'Teléfono con gran batería, carga rápida y cámara de 64 MP', 399.00, 1),
(0921,'A1 Pro 5G', 'OPPO', 'Teléfono asequible con pantalla de 120 Hz y cámara de 108 MP', 299.00, 1),
(3498,'A57e', 'OPPO', 'Teléfono básico con diseño ligero, batería de 5000 mAh y carga rápida', 199.00, 1),
-- OPPO

-- Xiaomi
(0001,'13 Ultra', 'XIAOMI', 'Teléfono de alta gama con cámara Hasselblad de segunda generación', 1099.00, 1),
(0002,'MIX Fold 3', 'XIAOMI', 'Teléfono plegable innovador con diseño elegante y compacto', 1499.00, 1),
(0003,'POCO X5 Pro 5G', 'XIAOMI', 'Teléfono con diseño elegante, cámara versátil y rendimiento sólido', 599.00, 1),
(0004,'Redmi 12C', 'XIAOMI', 'Teléfono con gran batería, carga rápida y cámara de 64 MP', 399.00, 1),
(0005,'Redmi A2', 'XIAOMI', 'Teléfono asequible con pantalla de 120 Hz y cámara de 108 MP', 299.00, 1),
(0006,'Redmi Note 12 Pro+ 5G', 'XIAOMI', 'Teléfono básico con diseño ligero, batería de 5000 mAh y carga rápida', 199.00, 1);
-- Xiaomi

-- Cascos Apple
INSERT INTO PRODUCTOS (ID_PRODUCTO,NOMBRE, MARCA, DESCRIPCION, PRECIO_VENTA, ID_CATEGORIA) VALUES
(1357,'AirPods (2.ª generación)', 'Apple', 'Auriculares inalámbricos con sonido de alta calidad', 149.00, 1),
(9864,'AirPods (3.ª generación)', 'Apple', 'Auriculares inalámbricos con sonido espacial personalizado', 199.00, 1),
(5296,'AirPods Pro (2.ª generación)', 'Apple', 'Auriculares inalámbricos con cancelación de ruido y audio adaptativo', 299.00, 1),
(6890,'AirPods Max', 'Apple', 'Auriculares circumaurales con audio de alta fidelidad y cancelación de ruido', 629.00, 1),
-- Cascos Sony
(1023,'WH-1000XM5', 'Sony', 'Auriculares inalámbricos con cancelación de ruido', 349.00, 1),
(2345,'WH-1000XM4', 'Sony', 'Auriculares inalámbricos con cancelación de ruido', 279.00, 1),
(7214,'WH-CH720N', 'Sony', 'Auriculares inalámbricos con cancelación de ruido', 149.00, 1),
(8742,'WF-SP800N', 'Sony', 'Auriculares inalámbricos deportivos con cancelación de ruido', 179.00, 1),
(3068,'WF-SP900', 'Sony', 'Auriculares inalámbricos sumergibles para deportes acuáticos', 229.00, 1),
(7140,'WF-1000XM4', 'Sony', 'Auriculares inalámbricos True Wireless con cancelación de ruido', 249.00, 1),
(4952,'WF-C500', 'Sony', 'Auriculares inalámbricos True Wireless', 99.00, 1),
(9012,'INZONE H9', 'Sony', 'Auriculares inalámbricos para juegos con sonido espacial 360', 299.00, 1);

-- Consolas PS5
INSERT INTO PRODUCTOS (ID_PRODUCTO,NOMBRE, MARCA, DESCRIPCION, PRECIO_VENTA,ID_CATEGORIA) VALUES
(6543,'PlayStation 5', 'Sony', 'Consola de sobremesa con gráficos 4K y mando DualSense', 499.00, 2),
(3210,'PlayStation 5 Digital Edition', 'Sony', 'Consola de sobremesa sin lector de discos', 399.00, 2),
(1928,'PlayStation 5 Pro', 'Sony', 'Consola de sobremesa con rendimiento mejorado y gráficos 8K', 799.99, 2),
(2817,'PlayStation 5 Slim', 'Sony', 'Consola de sobremesa más delgada y ligera', 449.99, 2),
(8351,'PlayStation 5 Edición Limitada Marvel\'s Spider-Man 2', 'Sony', 'Consola de sobremesa con diseño exclusivo', 549.00, 2),
(9416,'PlayStation 5 Edición Limitada God of War Ragnarök', 'Sony', 'Consola de sobremesa con diseño exclusivo', 549.00, 2),
(3746,'PlayStation 5 Edición Limitada Horizon Forbidden West', 'Sony', 'Consola de sobremesa con diseño exclusivo', 549.00, 2),
-- Consolas Xbox
(6158,'Xbox Series X', 'Microsoft', 'Consola de sobremesa con gráficos 4K y 120 FPS', 499.00, 2),
(0524,'Xbox Series S', 'Microsoft', 'Consola de sobremesa compacta y económica', 299.00, 2),
(8532,'Xbox One', 'Microsoft', 'Consola de sobremesa con gran variedad de juegos', 249.00, 2),
-- Consolas Nintendo
(1448,'Nintendo Switch', 'Nintendo', 'Consola híbrida con juegos exclusivos como Mario y Zelda', 299.00, 2),
(8526,'Nintendo Switch OLED', 'Nintendo', 'Consola híbrida con pantalla OLED y mejor calidad de imagen', 349.00, 2),
(4712,'Nintendo Switch Lite', 'Nintendo', 'Consola portátil ligera y compacta', 199.00, 2);

-- Juegos PS5
INSERT INTO PRODUCTOS (ID_PRODUCTO,NOMBRE, MARCA, DESCRIPCION, PRECIO_VENTA, ID_CATEGORIA) VALUES
(6087,'Marvel\'s Spider-Man 2', 'Insomniac Games', 'Juego exclusivo de PS5 con acción y aventura', 79.99, 2),
(7194,'God of War Ragnarök', 'Santa Monica Studio', 'Juego exclusivo de PS5 con acción y aventura épica', 79.99, 2),
(6194,'Horizon Forbidden West', 'Guerrilla Games', 'Juego exclusivo de PS5 con aventura y mundo abierto', 79.99, 2),
(9253,'Ratchet & Clank: Una Dimensión Aparte', 'Insomniac Games', 'Juego exclusivo de PS5 con acción y plataformas', 69.99, 2),
(1468,'Returnal', 'Housemarque', 'Juego exclusivo de PS5 con acción y ciencia ficción', 69.99, 2),
(3601,'Demon\'s Souls', 'Bluepoint Games', 'Remake del clásico juego de PS3 con acción y rol', 69.99, 2),
(8238,'Astro\'s Playroom', 'Team Asobi', 'Juego preinstalado en PS5 con plataformas y exploración', 0.00, 2),
(1593,'The Last of Us Parte I', 'Naughty Dog', 'Remake del aclamado juego de PS3 con acción y drama', 79.99, 2),
(8241,'Gran Turismo 7', 'Polyphony Digital', 'Juego de carreras exclusivo de PS5 con simulación', 79.99, 2),
-- Juegos Xbox
(16449,'Halo Infinite', '343 Industries', 'Juego exclusivo de Xbox con acción y ciencia ficción', 69.99, 2),
(8372,'Forza Horizon 5', 'Playground Games', 'Juego exclusivo de Xbox con carreras y mundo abierto', 69.99, 2),
(3105,'Gears 5', 'The Coalition', 'Juego exclusivo de Xbox con acción y disparos', 69.99, 2),
(7584,'Sea of Thieves', 'Rare', 'Juego multijugador de Xbox con piratas y aventuras', 39.99, 2),
(5026,'Fable', 'Playground Games', 'Juego exclusivo de Xbox con rol y aventura', 69.99, 2),



-- Juegos Nintendo Switch
(1295,'The Legend of Zelda Tears of the Kingdom', 'Nintendo', 'Juego exclusivo de Switch con aventura y exploración', 69.99, 2),
(8537,'Super Mario Bros. Wonder', 'Nintendo', 'Juego exclusivo de Switch con plataformas y novedades', 59.99, 2),
(7689,'Pokémon Púrpura', 'Nintendo', 'Juego exclusivo de Switch con rol y mundo abierto', 59.99, 2),
(9860,'Animal Crossing: New Horizons', 'Nintendo', 'Juego exclusivo de Switch con simulación y vida social', 59.99, 2),
(4702,'Mario Kart 8 Deluxe', 'Nintendo', 'Juego exclusivo de Switch con carreras y multijugador', 59.99, 2),
(6318,'Super Smash Bros. Ultimate', 'Nintendo', 'Juego exclusivo de Switch con lucha y multijugador', 69.99, 2);

-- Libros
INSERT INTO PRODUCTOS (ID_PRODUCTO,NOMBRE, MARCA, AUTOR, DESCRIPCION, PRECIO_VENTA, ID_CATEGORIA) VALUES
(2459,'Cien años de soledad', 'Literatura', 'Gabriel García Márquez', 'Novela clásica latinoamericana', 19.99, 3),
(0974,'El Quijote', 'Literatura', 'Miguel de Cervantes', 'Obra cumbre de la literatura española', 24.99, 3),
(1307,'Sapiens: De animales a dioses', 'Ensayo', 'Yuval Noah Harari', 'Historia de la humanidad desde sus orígenes', 29.99, 3),
(9804,'El poder del ahora', 'Autoayuda', 'Eckhart Tolle', 'Libro sobre el presente y la conciencia', 14.99, 3),
(1002,'Cosmos (Planeta)', 'Divulgación científica', 'Carl Sagan', 'Libro que explora el universo y nuestro lugar en él', 34.20, 3),
(1003,'El nombre del viento', 'Fantasía épica', 'Patrick Rothfuss', 'Libro sobre un personaje legendario que se esconde bajo la identidad de un posadero', 12.30, 3),
(1004,'El principito', 'Novela corta', 'Antoine de Saint-Exupéry', 'Libro sobre la pérdida de la inocencia y la capacidad de asombro que sufren los adultos al crecer', 13.20, 3),
(1005,'Harry Potter y la piedra filosofal', 'Literatura juvenil', 'J. K. Rowling', 'Harry es un niño huérfano que descubre en su undécimo cumpleaños que es mago', 12.30, 3),
(1007,'La ciudad de los libros soñadores', 'Fantasía', 'Walter Moers', 'La ciudad de los libros soñadores es un lugar mágico y surrealista, lleno de personajes peculiares y situaciones inesperadas', 48.00, 3),
(1008,'La ladrona de libros', 'Novela histórica', 'Markus Zusak', 'la historia se centra en una niña alemana que vive en la Alemania nazi durante la Segunda Guerra Mundial', 10.40, 3),
(1009,'Los juegos del hambre', 'Ciencia ficción distópica', ' Suzanne Collins', 'En un futuro distópico, la nación de Panem está dividida en doce distritos, gobernados por el Capitolio', 18.95, 3),
(1010,'Los pilares de la Tierra', 'Novela histórica', 'Ken Follett', 'Narra la construcción de una catedral gótica en la ficticia ciudad de Kingsbridge', 14.21, 3),
(1011,'Orgullo y prejuicio', 'Novela romántica', 'Jane Austen', 'La historia se centra en la familia Bennet, compuesta por cinco hijas solteras y una madre cuyo único objetivo en la vida es casarlas con hombres adinerados', 15.15, 3),
(1012,'Una breve historia de casi todo', 'Divulgación científica', 'Bill Bryson', 'Bill Bryson nos lleva en un viaje fascinante a través de la historia del universo, desde el Big Bang hasta la actualidad', 19.85, 3);

-- Perfumes
INSERT INTO PRODUCTOS (ID_PRODUCTO,NOMBRE, MARCA, DESCRIPCION, PRECIO_VENTA, ID_CATEGORIA) VALUES
-- Mujer
(2468,'N°5', 'Chanel', 'Perfume floral aldehído para mujer', 129.99, 4),
(2400,'Sì', 'Giorgio Armani ', 'Perfume floral aldehído para mujer', 54.90, 4),
(2401,'La Vie Est Belle', 'Lancôme', 'Perfume floral aldehído para mujer', 110.00, 4),
(2402,'lady Million', 'Paco Rabanne', 'Perfume floral amaderada y fresca', 66.95, 4),
(2403,'Opium', 'Yves Saint Laurent', 'Perfume del almizcle floral amaderado', 55.89, 4),
(7131,"J'adore", 'Dior', 'Perfume floral y luminoso para mujer', 119.99, 4),

-- Hombre
(3001,'Eau Sauvage', 'Dior', 'Perfume fresco y acuático para hombre', 90.00, 4),
(3002,'Acqua di Giò', 'Giorgio Armani', 'Perfume fresco y acuático para hombre', 61.99, 4),
(3003,"Terre d'Hermès", 'Hermès', 'Perfume fresco y acuático para hombre', 164.95, 4),
(3004,'Le Mâle', 'Jean Paul Gaultier', 'Perfume fresco y acuático para hombre', 73.95, 4),
(3090,'Kouros', 'Yves Saint Laurent', 'Perfume fresco y acuático para hombre', 54.99, 4),
(6925,'1 Million', 'Paco Rabanne', 'Perfume dulce y seductor para hombre', 53.95, 4);

-- Juguetes
INSERT INTO PRODUCTOS (ID_PRODUCTO,NOMBRE, MARCA, DESCRIPCION, PRECIO_VENTA, ID_CATEGORIA) VALUES
(4180,'LEGO City Police Station', 'LEGO', 'Set de construcción de la estación de policía', 99.99, 5),
(4181,'LEGO Friends Mansion moderna de Andrea', 'LEGO', 'Set de construcción de la Mansion moderna de Andrea', 199.99, 5),
(4182,'LEGO Harry Potter Castillo de Hogwarts', 'LEGO', 'Set de construcción de Castillo de Hogwarts', 469.99, 5),
(4184,'LEGO Star Wars Millennium Falcon', 'LEGO', 'Set de construcción de la Milenium Falcon', 849.99, 5),
(8852,'Bratz Alwayz Cloe', 'Bratz', 'Cloe es conocida por su estilo angelical y su pasión por la moda, que cambia según su estado de ánimo', 33.99, 5),
(8853,'Bratz Alwayz Yasmin', 'Bratz', 'Yasmin es conocida por su estilo bohemio y su pasión por la moda, que también cambia según su estado de ánimo', 33.99, 5),
(8854,'Bratz Alwayz Sasha', 'Bratz', 'Sasha es conocida por su estilo deportivo y su pasión por la moda, que también cambia según su estado de ánimo', 33.99, 5),
(8855,'Bratz Alwayz Jade', 'Bratz', 'Jade es conocida por su estilo vanguardista y su pasión por la moda, que también cambia según su estado de ánimo', 33.99, 5),
(8856,'Rainbow High Fantastic Fashion Doll', 'Bratz', 'Cada muñeca representa un color del arcoíris y tiene su propia personalidad y talento', 65.99, 5),
(8857,'Rainbow High Fantastic Fashion Violet', 'Bratz', 'Violet es conocida por su estilo glamuroso y su pasión por la moda', 41.99, 5),
(8858,'Rainbow High Fantastic Muñeca Ruby', 'Bratz', 'Ruby es conocida por su estilo atrevido y su pasión por la moda', 34.99, 5),
(8859,'Rainbow High Fashion Studio', 'Bratz', 'Rainbow High Fashion Studio es un juego que permite a los niños dar rienda suelta a su creatividad y convertirse en diseñadores de moda', 62.99, 5),
(5291,'UNO Attack', 'UNO', 'Juego de cartas Uno Attack lanzador', 49.99, 5),
(5292,'UNO Flip', 'UNO', 'juego de cartas con doble cara', 11.99, 5),
(5293,'UNO Original', 'UNO', 'Juego de cartas del uno original', 9.99, 5);


CREATE TABLE PRODUCTOS_PROVEDORES (
	ID_PRO INT NOT NULL auto_increment UNIQUE primary KEY,
	ID_PRODUCTO INT NOT NULL,
    ID_PROVEDOR INT NOT NULL,
    PRECIO_PROVEDOR DEC(9,2),
  FOREIGN KEY (ID_PROVEDOR) REFERENCES PROVEDORES(ID_PROVEDOR),
  FOREIGN KEY (ID_PRODUCTO) REFERENCES PRODUCTOS(ID_PRODUCTO)
);
-- Insertar datos en la tabla PRODUCTOS_PROVEEDORES
-- PRODUCTOS_PROVEDORES
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(2460, 1, 950.00),  -- IPhone 16
(3088, 2, 880.00),  -- IPhone 14
(5791, 3, 480.00),  -- IPhone SE (2022)
(0658, 2, 750.00),  -- IPhone 13 mini
(2877, 1, 1100.00), -- IPhone 16 Plus
(6095, 1, 1200.00), -- IPhone 15 Pro
(9653, 2, 1300.00), -- IPhone 16 Pro Max
(3827, 3, 900.00),  -- IPhone 15
(4962, 1, 1000.00), -- IPhone 15 Plus
(5256, 3, 1750.00), -- Galaxy Z Fold5
(8052, 1, 1100.00), -- Galaxy Z Flip5
(7531, 2, 450.00),  -- Galaxy A54
(3690, 3, 200.00),  -- Galaxy M14
(2045, 3, 1100.00), -- Galaxy S23 Ultra
(3786, 1, 800.00),  -- Galaxy S23
(6304, 1, 1000.00), -- Find X6 Pro
(2789, 2, 1350.00), -- Find N2
(1947, 3, 550.00),  -- Reno11 Pro
(9152, 2, 370.00),  -- A98 5G
(0921, 1, 280.00),  -- A1 Pro 5G
(3498, 1, 190.00),  -- A57e
(0001, 2, 1000.00), -- 13 Ultra
(0002, 3, 1350.00), -- MIX Fold 3
(0003, 2, 550.00),  -- POCO X5 Pro 5G
(0004, 2, 370.00),  -- Redmi 12C
(0005, 1, 280.00),  -- Redmi A2
(0006, 2, 190.00),  -- Redmi Note 12 Pro+ 5G
(1357, 3, 130.00),  -- AirPods (2.ª generación)
(9864, 2, 180.00),  -- AirPods (3.ª generación)
(5296, 1, 270.00),  -- AirPods Pro (2.ª generación)
(6890, 1, 600.00),  -- AirPods Max
(1023, 2, 320.00),  -- WH-1000XM5
(2345, 3, 260.00),  -- WH-1000XM4
(7214, 1, 140.00),  -- WH-CH720N
(8742, 1, 170.00),  -- WF-SP800N
(3068, 1, 220.00),  -- WF-SP900
(7140, 2, 230.00),  -- WF-1000XM4
(4952, 3, 90.00),   -- WF-C500
(9012, 3, 280.00),  -- INZONE H9
(6543, 2, 450.00),  -- PlayStation 5
(3210, 1, 360.00),  -- PlayStation 5 Digital Edition
(1928, 2, 750.00),  -- PlayStation 5 Pro
(2817, 3, 420.00),  -- PlayStation 5 Slim
(8351, 1, 500.00),  -- PlayStation 5 Edición Limitada Marvel's Spider-Man 2
(9416, 2, 500.00),  -- PlayStation 5 Edición Limitada God of War Ragnarök
(3746, 1, 500.00),  -- PlayStation 5 Edición Limitada Horizon Forbidden West
(6158, 2, 450.00),  -- Xbox Series X
(0524, 3, 270.00),  -- Xbox Series S
(8532, 1, 220.00),  -- Xbox One
(1448, 3, 270.00),  -- Nintendo Switch
(8526, 1, 320.00),  -- Nintendo Switch OLED
(4712, 2, 180.00),  -- Nintendo Switch Lite
(6087, 3, 70.00),   -- Marvel's Spider-Man 2
(7194, 2, 70.00),   -- God of War Ragnarök
(6194, 3, 70.00),   -- Horizon Forbidden West
(9253, 1, 60.00),   -- Ratchet & Clank: Una Dimensión Aparte
(1468, 2, 60.00),   -- Returnal
(3601, 3, 60.00),   -- Demon's Souls
(8238, 3, 0.00),    -- Astro's Playroom
(1593, 1, 70.00),   -- The Last of Us Parte I
(8241, 1, 70.00),   -- Gran Turismo 7
(16449, 2, 60.00),  -- Halo Infinite
(8372, 3, 60.00),   -- Forza Horizon 5
(3105, 3, 60.00),   -- Gears 5
(7584, 1, 35.00),   -- Sea of Thieves
(5026, 1, 60.00),   -- Fable
(1295, 2, 60.00),  -- The Legend of Zelda Tears of the Kingdom
(8537, 3, 50.00),   -- Super Mario Bros. Wonder
(7689, 2, 50.00),   -- Pokémon Púrpura
(9860, 1, 50.00),   -- Animal Crossing: New Horizons
(4702, 1, 50.00),   -- Mario Kart 8 Deluxe
(6318, 2, 60.00),   -- Super Smash Bros. Ultimate
(2459, 3, 18.00),   -- Cien años de soledad
(0974, 2, 23.00),   -- El Quijote
(1307, 1, 28.00);   -- Sapiens

-- iPhone 15 Pro
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(6095, 1, 1050.00), -- Proveedor A
(6095, 2, 1020.00), -- Proveedor B
(6095, 3, 1070.00); -- Proveedor C

-- Samsung Galaxy S23 Ultra
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(2045, 1, 1350.00), -- Proveedor A
(2045, 2, 1380.00); -- Proveedor B

-- AirPods Pro (2.ª generación)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(5296, 1, 280.00), -- Proveedor A
(5296, 3, 290.00); -- Proveedor C

-- Marvel's Spider-Man 2
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(6087, 1, 75.00), -- Proveedor A
(6087, 2, 78.00); -- Proveedor B

-- The Legend of Zelda: Tears of the Kingdom
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1295, 1, 65.00), -- Proveedor A
(1295, 3, 68.00); -- Proveedor C

-- Cien años de soledad
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(2459, 1, 18.00), -- Proveedor A
(2459, 2, 20.00); -- Proveedor B

-- Chanel N°5
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(2468, 1, 120.00), -- Proveedor A
(2468, 3, 125.00); -- Proveedor C

-- LEGO City Police Station
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(4180, 1, 90.00), -- Proveedor A
(4180, 2, 95.00); -- Proveedor B

-- iPhone 13 mini
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(0658, 1, 780.00),
(0658, 2, 800.00),
(0658, 3, 790.00);

-- Samsung Galaxy A54
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(7531, 1, 450.00),
(7531, 2, 460.00);

-- AirPods (2.ª generación)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1357, 1, 140.00),
(1357, 3, 145.00);

-- Sony WH-1000XM5
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1023, 1, 330.00),
(1023, 2, 340.00);

-- PlayStation 5
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(6543, 1, 480.00),
(6543, 3, 500.00);

-- Xbox Series S
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(0524, 1, 280.00),
(0524, 2, 300.00);

-- Nintendo Switch OLED
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8526, 1, 330.00),
(8526, 3, 350.00);

-- God of War Ragnarök (PS5)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(7194, 1, 70.00),
(7194, 2, 75.00);

-- Halo Infinite (Xbox)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(16449, 1, 60.00),
(16449, 3, 65.00);

-- The Legend of Zelda: Tears of the Kingdom (Switch)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1295, 1, 60.00),
(1295, 2, 62.00);

-- El Quijote
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(0974, 1, 22.00),
(0974, 3, 25.00);

-- Dior J'adore
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(7131, 1, 110.00),
(7131, 2, 115.00);


-- iPhone SE (2022)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(5791, 1, 500.00),
(5791, 2, 510.00);

-- Galaxy Z Fold5
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(5256, 1, 1850.00),
(5256, 3, 1900.00);

-- Oppo Find X6 Pro
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(6304, 1, 1050.00),
(6304, 2, 1100.00);

-- AirPods Max
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(6890, 1, 600.00),
(6890, 3, 620.00);

-- Sony WF-1000XM4
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(7140, 1, 230.00),
(7140, 2, 250.00);

-- PlayStation 5 Digital Edition
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(3210, 1, 380.00),
(3210, 3, 400.00);

-- Xbox Series X
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(6158, 1, 480.00),
(6158, 2, 500.00);

-- Nintendo Switch Lite
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(4712, 1, 190.00),
(4712, 3, 200.00);

-- Horizon Forbidden West (PS5)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(6194, 1, 70.00),
(6194, 2, 72.00);

-- Forza Horizon 5 (Xbox)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8372, 1, 60.00),
(8372, 3, 65.00);

-- Super Mario Bros. Wonder (Switch)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8537, 1, 55.00),
(8537, 2, 58.00);

-- Sapiens: De animales a dioses
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1307, 1, 28.00),
(1307, 3, 30.00);

-- Acqua di Giò
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(3090, 1, 90.00),
(3090, 2, 95.00);





CREATE TABLE CLIENTES_PRODUCTOS(
ID_CLIPROD INT NOT NULL auto_increment UNIQUE primary KEY,
ID_CLIENTE INT NOT NULL,
ID_PRODUCTO INT NOT NULL,
OPINION VARCHAR(70) NOT NULL,
VALORACION int NOT NULL,
FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTES(ID_CLIENTE),
FOREIGN KEY(ID_PRODUCTO) REFERENCES PRODUCTOS(ID_PRODUCTO),
check(VALORACION between 1 and 5)
);

-- Tabla CLIENTE_PRODUCTOS
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(1, 1295, 'Excelente teléfono, la cámara es increíble', 5),   
(2, 2468, 'Me encantan estos auriculares, la cancelación de ruido es top', 5), 
(2, 2817, 'Una consola muy potente, los juegos se ven espectaculares', 5), 
(3, 4180, 'Un juego muy divertido para jugar con amigos', 4),
(3, 0974, 'Un libro muy interesante, me ha hecho reflexionar mucho', 4);
