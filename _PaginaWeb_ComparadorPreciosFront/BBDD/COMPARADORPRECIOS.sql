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

-- Inserts para nuevos clientes
INSERT INTO CLIENTES (USERNAME, PASSWORD, EMAIL, FECHA_REGISTRO) VALUES
('AlexGamer', 'AlexGamer1234', 'alexgamer@gmail.com', '2021-03-15'),
('TechLover', 'TechLover1234', 'techlover@gmail.com', '2022-05-22'),
('BookWorm', 'BookWorm1234', 'bookworm@gmail.com', '2020-11-30'),
('GadgetFan', 'GadgetFan1234', 'gadgetfan@gmail.com', '2023-01-10'),
('MusicAddict', 'MusicAddict1234', 'musicaddict@gmail.com', '2021-07-18'),
('GameMaster', 'GameMaster1234', 'gamemaster@gmail.com', '2022-09-05'),
('ShopAholic', 'ShopAholic1234', 'shopaholic@gmail.com', '2020-12-25'),
('TechGeek', 'TechGeek1234', 'techgeek@gmail.com', '2023-02-14'),
('ReadMore', 'ReadMore1234', 'readmore@gmail.com', '2021-04-01'),
('Fashionista', 'Fashionista1234', 'fashionista@gmail.com', '2022-06-30'),
('MovieBuff', 'MovieBuff1234', 'moviebuff@gmail.com', '2020-10-15'),
('SportsFan', 'SportsFan1234', 'sportsfan@gmail.com', '2023-03-22'),
('TravelBug', 'TravelBug1234', 'travelbug@gmail.com', '2021-05-11'),
('Foodie', 'Foodie1234', 'foodie@gmail.com', '2022-07-19'),
('PhotoPro', 'PhotoPro1234', 'photopro@gmail.com', '2020-09-28'),
('ArtLover', 'ArtLover1234', 'artlover@gmail.com', '2023-04-17'),
('FitnessGuru', 'FitnessGuru1234', 'fitnessguru@gmail.com', '2021-06-03'),
('PetLover', 'PetLover1234', 'petlover@gmail.com', '2022-08-21'),
('DIYQueen', 'DIYQueen1234', 'diyqueen@gmail.com', '2020-08-12'),
('GardenMaster', 'GardenMaster1234', 'gardenmaster@gmail.com', '2023-05-09'),
('CoffeeSnob', 'CoffeeSnob1234', 'coffeesnob@gmail.com', '2021-09-27'),
('WineConnoisseur', 'WineConnoisseur1234', 'wineconnoisseur@gmail.com', '2022-10-14'),
('AdventureSeeker', 'AdventureSeeker1234', 'adventureseeker@gmail.com', '2020-07-23'),
('NightOwl', 'NightOwl1234', 'nightowl@gmail.com', '2023-06-08'),
('EarlyBird', 'EarlyBird1234', 'earlybird@gmail.com', '2021-10-31'),
('TechSavvy', 'TechSavvy1234', 'techsavvy@gmail.com', '2022-11-25'),
('GamingPro', 'GamingPro1234', 'gamingpro@gmail.com', '2020-06-19'),
('BookDragon', 'BookDragon1234', 'bookdragon@gmail.com', '2023-07-12'),
('MusicMaestro', 'MusicMaestro1234', 'musicmaestro@gmail.com', '2021-11-28'),
('FilmCritic', 'FilmCritic1234', 'filmcritic@gmail.com', '2022-12-15'),
('FitnessFreak', 'FitnessFreak1234', 'fitnessfreak@gmail.com', '2020-05-21'),
('NatureLover', 'NatureLover1234', 'naturelover@gmail.com', '2023-08-03'),
('CarEnthusiast', 'CarEnthusiast1234', 'carenthusiast@gmail.com', '2021-12-30'),
('BikeRider', 'BikeRider1234', 'bikerider@gmail.com', '2023-01-18'),
('YogaMaster', 'YogaMaster1234', 'yogamaster@gmail.com', '2020-04-17'),
('ChefExtraordinaire', 'ChefExtraordinaire1234', 'chefextraordinaire@gmail.com', '2023-09-22'),
('BakingQueen', 'BakingQueen1234', 'bakingqueen@gmail.com', '2022-02-11'),
('CraftyCreator', 'CraftyCreator1234', 'craftycreator@gmail.com', '2020-03-09'),
('TechWizard', 'TechWizard1234', 'techwizard@gmail.com', '2023-10-14'),
('GamingLegend', 'GamingLegend1234', 'gaminglegend@gmail.com', '2022-03-28'),
('BookishBelle', 'BookishBelle1234', 'bookishbelle@gmail.com', '2020-02-15'),
('MusicMaven', 'MusicMaven1234', 'musicmaven@gmail.com', '2023-11-05'),
('FilmFanatic', 'FilmFanatic1234', 'filmfanatic@gmail.com', '2022-04-19'),
('FitnessJunkie', 'FitnessJunkie1234', 'fitnessjunkie@gmail.com', '2020-01-12'),
('OutdoorExplorer', 'OutdoorExplorer1234', 'outdoorexplorer@gmail.com', '2023-12-08'),
('AutoExpert', 'AutoExpert1234', 'autoexpert@gmail.com', '2022-05-30'),
('CyclingPro', 'CyclingPro1234', 'cyclingpro@gmail.com', '2021-01-25'),
('MeditationGuru', 'MeditationGuru1234', 'meditationguru@gmail.com', '2024-01-15'),
('CulinaryArtist', 'CulinaryArtist1234', 'culinaryartist@gmail.com', '2022-06-22'),
('PastryChef', 'PastryChef1234', 'pastrychef@gmail.com', '2021-02-14'),
('CreativeMind', 'CreativeMind1234', 'creativemind@gmail.com', '2024-02-28');

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
-- Xiaomi 13 Ultra
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(0001, 1, 980.00),
(0001, 2, 995.00),
(0001, 3, 970.00);

-- Xiaomi MIX Fold 3
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(0002, 1, 1350.00),
(0002, 2, 1370.00),
(0002, 3, 1330.00);

-- POCO X5 Pro 5G
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(0003, 1, 550.00),
(0003, 2, 565.00),
(0003, 3, 540.00);

-- Redmi 12C
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(0004, 1, 370.00),
(0004, 2, 380.00),
(0004, 3, 360.00);

-- Redmi A2
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(0005, 1, 280.00),
(0005, 2, 290.00),
(0005, 3, 270.00);

-- Redmi Note 12 Pro+ 5G
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(0006, 1, 190.00),
(0006, 2, 200.00),
(0006, 3, 185.00);

-- AirPods Max
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(6890, 1, 600.00),
(6890, 2, 615.00),
(6890, 3, 590.00);

-- WH-1000XM4
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(2345, 1, 260.00),
(2345, 2, 270.00),
(2345, 3, 250.00);

-- WH-CH720N
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(7214, 1, 140.00),
(7214, 2, 145.00),
(7214, 3, 135.00);

-- WF-SP800N
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8742, 1, 170.00),
(8742, 2, 175.00),
(8742, 3, 165.00);

-- WF-SP900
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(3068, 1, 220.00),
(3068, 2, 230.00),
(3068, 3, 210.00);

-- WF-1000XM4
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(7140, 1, 230.00),
(7140, 2, 240.00),
(7140, 3, 220.00);

-- WF-C500
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(4952, 1, 90.00),
(4952, 2, 95.00),
(4952, 3, 85.00);

-- INZONE H9
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(9012, 1, 280.00),
(9012, 2, 290.00),
(9012, 3, 270.00);

-- PlayStation 5 Digital Edition
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(3210, 1, 360.00),
(3210, 2, 370.00),
(3210, 3, 350.00);

-- PlayStation 5 Pro
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1928, 1, 750.00),
(1928, 2, 770.00),
(1928, 3, 730.00);

-- PlayStation 5 Slim
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(2817, 1, 420.00),
(2817, 2, 430.00),
(2817, 3, 410.00);

-- PS5 Edición Limitada Marvel's Spider-Man 2
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8351, 1, 500.00),
(8351, 2, 510.00),
(8351, 3, 490.00);

-- PS5 Edición Limitada God of War Ragnarök
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(9416, 1, 500.00),
(9416, 2, 510.00),
(9416, 3, 490.00);

-- PS5 Edición Limitada Horizon Forbidden West
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(3746, 1, 500.00),
(3746, 2, 510.00),
(3746, 3, 490.00);

-- Xbox Series S
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(0524, 1, 270.00),
(0524, 2, 280.00),
(0524, 3, 260.00);

-- Xbox One
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8532, 1, 220.00),
(8532, 2, 230.00),
(8532, 3, 210.00);

-- Nintendo Switch OLED
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8526, 1, 320.00),
(8526, 2, 330.00),
(8526, 3, 310.00);

-- Nintendo Switch Lite
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(4712, 1, 180.00),
(4712, 2, 190.00),
(4712, 3, 170.00);

-- God of War Ragnarök (PS5)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(7194, 1, 70.00),
(7194, 2, 72.00),
(7194, 3, 68.00);

-- Horizon Forbidden West (PS5)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(6194, 1, 70.00),
(6194, 2, 72.00),
(6194, 3, 68.00);

-- Ratchet & Clank: Una Dimensión Aparte
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(9253, 1, 60.00),
(9253, 2, 62.00),
(9253, 3, 58.00);

-- Returnal
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1468, 1, 60.00),
(1468, 2, 62.00),
(1468, 3, 58.00);

-- Demon's Souls
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(3601, 1, 60.00),
(3601, 2, 62.00),
(3601, 3, 58.00);

-- Astro's Playroom
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8238, 1, 0.00),
(8238, 2, 0.00),
(8238, 3, 0.00);

-- The Last of Us Parte I
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1593, 1, 70.00),
(1593, 2, 72.00),
(1593, 3, 68.00);

-- Gran Turismo 7
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8241, 1, 70.00),
(8241, 2, 72.00),
(8241, 3, 68.00);

-- Forza Horizon 5 (Xbox)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8372, 1, 60.00),
(8372, 2, 62.00),
(8372, 3, 58.00);

-- Gears 5 (Xbox)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(3105, 1, 60.00),
(3105, 2, 62.00),
(3105, 3, 58.00);

-- Sea of Thieves (Xbox)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(7584, 1, 35.00),
(7584, 2, 37.00),
(7584, 3, 33.00);

-- Fable (Xbox)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(5026, 1, 60.00),
(5026, 2, 62.00),
(5026, 3, 58.00);

-- Super Mario Bros. Wonder (Switch)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8537, 1, 50.00),
(8537, 2, 52.00),
(8537, 3, 48.00);

-- Pokémon Púrpura (Switch)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(7689, 1, 50.00),
(7689, 2, 52.00),
(7689, 3, 48.00);

-- Animal Crossing: New Horizons (Switch)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(9860, 1, 50.00),
(9860, 2, 52.00),
(9860, 3, 48.00);

-- Mario Kart 8 Deluxe (Switch)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(4702, 1, 50.00),
(4702, 2, 52.00),
(4702, 3, 48.00);

-- Super Smash Bros. Ultimate (Switch)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(6318, 1, 60.00),
(6318, 2, 62.00),
(6318, 3, 58.00);

-- El Quijote
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(0974, 1, 23.00),
(0974, 2, 24.00),
(0974, 3, 22.00);

-- Sapiens: De animales a dioses
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1307, 1, 28.00),
(1307, 2, 29.00),
(1307, 3, 27.00);

-- El poder del ahora
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(9804, 1, 14.00),
(9804, 2, 15.00),
(9804, 3, 13.00);

-- Cosmos (Planeta)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1002, 1, 34.00),
(1002, 2, 35.00),
(1002, 3, 33.00);

-- El nombre del viento
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1003, 1, 12.00),
(1003, 2, 13.00),
(1003, 3, 11.00);

-- El principito
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1004, 1, 13.00),
(1004, 2, 14.00),
(1004, 3, 12.00);

-- Harry Potter y la piedra filosofal
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1005, 1, 12.00),
(1005, 2, 13.00),
(1005, 3, 11.00);

-- La ciudad de los libros soñadores
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1007, 1, 48.00),
(1007, 2, 49.00),
(1007, 3, 47.00);

-- La ladrona de libros
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1008, 1, 10.00),
(1008, 2, 11.00),
(1008, 3, 9.00);

-- Los juegos del hambre
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1009, 1, 18.00),
(1009, 2, 19.00),
(1009, 3, 17.00);

-- Los pilares de la Tierra
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1010, 1, 14.00),
(1010, 2, 15.00),
(1010, 3, 13.00);

-- Orgullo y prejuicio
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1011, 1, 15.00),
(1011, 2, 16.00),
(1011, 3, 14.00);

-- Una breve historia de casi todo
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1012, 1, 19.00),
(1012, 2, 20.00),
(1012, 3, 18.00);

-- Sì (Giorgio Armani)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(2400, 1, 54.00),
(2400, 2, 55.00),
(2400, 3, 53.00);

-- La Vie Est Belle (Lancôme)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(2401, 1, 110.00),
(2401, 2, 112.00),
(2401, 3, 108.00);

-- lady Million (Paco Rabanne)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(2402, 1, 66.00),
(2402, 2, 67.00),
(2402, 3, 65.00);

-- Opium (Yves Saint Laurent)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(2403, 1, 55.00),
(2403, 2, 56.00),
(2403, 3, 54.00);

-- J'adore (Dior)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(7131, 1, 119.00),
(7131, 2, 120.00),
(7131, 3, 118.00);

-- Eau Sauvage (Dior)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(3001, 1, 90.00),
(3001, 2, 92.00),
(3001, 3, 88.00);

-- Acqua di Giò (Giorgio Armani)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(3002, 1, 61.00),
(3002, 2, 62.00),
(3002, 3, 60.00);

-- Terre d'Hermès (Hermès)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(3003, 1, 164.00),
(3003, 2, 165.00),
(3003, 3, 163.00);

-- Le Mâle (Jean Paul Gaultier)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(3004, 1, 73.00),
(3004, 2, 74.00),
(3004, 3, 72.00);

-- Kouros (Yves Saint Laurent)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(3090, 1, 54.00),
(3090, 2, 55.00),
(3090, 3, 53.00);

-- 1 Million (Paco Rabanne)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(6925, 1, 53.00),
(6925, 2, 54.00),
(6925, 3, 52.00);

-- LEGO Friends Mansion moderna de Andrea
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(4181, 1, 199.00),
(4181, 2, 200.00),
(4181, 3, 198.00);

-- LEGO Harry Potter Castillo de Hogwarts
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(4182, 1, 469.00),
(4182, 2, 470.00),
(4182, 3, 468.00);

-- LEGO Star Wars Millennium Falcon
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(4184, 1, 849.00),
(4184, 2, 850.00),
(4184, 3, 848.00);

-- Bratz Alwayz Cloe
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8852, 1, 33.00),
(8852, 2, 34.00),
(8852, 3, 32.00);

-- Bratz Alwayz Yasmin
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8853, 1, 33.00),
(8853, 2, 34.00),
(8853, 3, 32.00);

-- Bratz Alwayz Sasha
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8854, 1, 33.00),
(8854, 2, 34.00),
(8854, 3, 32.00);

-- Bratz Alwayz Jade
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8855, 1, 33.00),
(8855, 2, 34.00),
(8855, 3, 32.00);

-- Rainbow High Fantastic Fashion Doll
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8856, 1, 65.00),
(8856, 2, 66.00),
(8856, 3, 64.00);

-- Rainbow High Fantastic Fashion Violet
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8857, 1, 41.00),
(8857, 2, 42.00),
(8857, 3, 40.00);

-- Rainbow High Fantastic Muñeca Ruby
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8858, 1, 34.00),
(8858, 2, 35.00),
(8858, 3, 33.00);

-- Rainbow High Fashion Studio
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8859, 1, 62.00),
(8859, 2, 63.00),
(8859, 3, 61.00);

-- UNO Attack
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(5291, 1, 49.00),
(5291, 2, 50.00),
(5291, 3, 48.00);

-- UNO Flip
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(5292, 1, 11.00),
(5292, 2, 12.00),
(5292, 3, 10.00);

-- UNO Original
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(5293, 1, 9.00),
(5293, 2, 10.00),
(5293, 3, 8.00);

-- Sony WH-1000XM5 (ID 1023)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1023, 1, 320.00),
(1023, 2, 330.00),
(1023, 3, 310.00);

-- Find N2 (OPPO) (ID 2789)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(2789, 1, 1350.00),
(2789, 2, 1370.00),
(2789, 3, 1330.00);

-- Reno11 Pro (OPPO) (ID 1947)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1947, 1, 550.00),
(1947, 2, 560.00),
(1947, 3, 540.00);

-- A98 5G (OPPO) (ID 9152)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(9152, 1, 370.00),
(9152, 2, 380.00),
(9152, 3, 360.00);

-- A1 Pro 5G (OPPO) (ID 0921)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(0921, 1, 280.00),
(0921, 2, 290.00),
(0921, 3, 270.00);

-- A57e (OPPO) (ID 3498)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(3498, 1, 190.00),
(3498, 2, 200.00),
(3498, 3, 185.00);

-- The Legend of Zelda Tears of the Kingdom
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1295, 1, 60.00),
(1295, 2, 59.00),
(1295, 3, 65.00);

-- Chanel N°5 (Perfume - ID 2468)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(2468, 1, 115.00),
(2468, 2, 120.00),
(2468, 3, 110.00);

-- LEGO City Police Station (Juguete - ID 4180)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(4180, 1, 85.00),
(4180, 2, 90.00),
(4180, 3, 80.00);

-- iPhone 13 mini (ID 0658)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(0658, 1, 720.00),
(0658, 2, 740.00),
(0658, 3, 700.00);

-- iPhone 15 Plus (ID 4962)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(4962, 1, 950.00),
(4962, 2, 970.00),
(4962, 3, 930.00);

-- iPhone 15 (ID 3827)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(3827, 1, 850.00),
(3827, 2, 870.00),
(3827, 3, 830.00);

-- iPhone 15 Pro (ID 6095)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(6095, 1, 1150.00),
(6095, 2, 1170.00),
(6095, 3, 1130.00);

-- Galaxy S23 Ultra (ID 2045)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(2045, 1, 1050.00),
(2045, 2, 1070.00),
(2045, 3, 1030.00);

-- AirPods Pro (2.ª generación) (ID 5296)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(5296, 1, 250.00),
(5296, 2, 260.00),
(5296, 3, 240.00);

-- iPhone 14 (ID 3088)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(3088, 1, 899.00),
(3088, 2, 919.00),
(3088, 3, 879.00);

-- iPhone 16 (ID 2460)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(2460, 1, 999.00),
(2460, 2, 1019.00),
(2460, 3, 979.00);

-- Galaxy S23 (ID 3786)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(3786, 1, 799.00),
(3786, 2, 819.00),
(3786, 3, 779.00);

-- Galaxy M14 (ID 3690)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(3690, 1, 189.00),
(3690, 2, 199.00),
(3690, 3, 179.00);

-- Galaxy Z Fold5 (ID 5256)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(5256, 1, 1699.00),
(5256, 2, 1719.00),
(5256, 3, 1679.00);

-- AirPods (2.ª generación) (ID 1357)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1357, 1, 129.00),
(1357, 2, 139.00),
(1357, 3, 119.00);

-- iPhone SE (2022) (ID 5791)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(5791, 1, 469.00),
(5791, 2, 489.00),
(5791, 3, 449.00);

-- Find X6 Pro (ID 6304)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(6304, 1, 949.00),
(6304, 2, 969.00),
(6304, 3, 929.00);
--
-- AirPods (3.ª generación) (ID 9864)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(9864, 1, 179.00),
(9864, 2, 189.00),
(9864, 3, 169.00);

-- iPhone 16 Pro Max (ID 9653)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(9653, 1, 1249.00),
(9653, 2, 1279.00),
(9653, 3, 1229.00);

-- Galaxy Z Flip5 (ID 8052)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(8052, 1, 999.00),
(8052, 2, 1029.00),
(8052, 3, 979.00);

-- Galaxy A54 (ID 7531)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(7531, 1, 429.00),
(7531, 2, 449.00),
(7531, 3, 419.00);

-- iPhone 16 Plus (ID 2877)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(2877, 1, 1099.00),
(2877, 2, 1129.00),
(2877, 3, 1079.00);
--
-- Halo Infinite (Xbox - ID 16449)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(16449, 1, 59.00),
(16449, 2, 62.00),
(16449, 3, 57.00);

-- Xbox Series X (ID 6158)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(6158, 1, 449.00),
(6158, 2, 469.00),
(6158, 3, 439.00);
--
-- Nintendo Switch (ID 1448)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(1448, 1, 250.00),  -- Proveedor 1 (La Fuente)
(1448, 2, 265.00),  -- Proveedor 2 (El Corte Inglés)
(1448, 3, 245.00);  -- Proveedor 3 (Almacén General)

-- Cien años de soledad (ID 2459)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(2459, 1, 16.50),  -- Proveedor 1
(2459, 2, 17.75),  -- Proveedor 2
(2459, 3, 15.99);  -- Proveedor 3

-- Marvel's Spider-Man 2 (ID 6087)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(6087, 1, 65.00),  -- Proveedor 1
(6087, 2, 69.00),  -- Proveedor 2
(6087, 3, 63.50);  -- Proveedor 3

-- PlayStation 5 (ID 6543)
INSERT INTO PRODUCTOS_PROVEDORES (ID_PRODUCTO, ID_PROVEDOR, PRECIO_PROVEDOR) VALUES
(6543, 1, 430.00),  -- Proveedor 1
(6543, 2, 450.00),  -- Proveedor 2
(6543, 3, 425.00);  -- Proveedor 3


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

-- Tabla CLIENTE_PRODUCTOS ( Valoraciones )

-- The Legend of Zelda Tears of the Kingdom
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(1, 1295, 'Excelente juego, los gráficos son increíble', 5);

-- N°5
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES   
(2, 2468, 'Me encantan estos auriculares, la cancelación de ruido es top', 5);

-- PlayStation 5 Slim
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES 
(2, 2817, 'Una consola muy potente, los juegos se ven espectaculares', 5); 

-- LEGO City Police Station
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(3, 4180, 'Un juego muy divertido para jugar con amigos', 4);

-- El Quijote
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(3, 0974, 'Un libro muy interesante, me ha hecho reflexionar mucho', 4);

-- iPhone 16
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(4, 2460, 'El diseño es espectacular y la cámara supera todas mis expectativas', 5);

-- iPhone 14
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(5, 3088, 'Buen rendimiento pero la batería podría durar más', 4);

-- iPhone SE (2022)
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(6, 5791, 'Perfecto tamaño para mi, muy cómodo de usar', 5);

-- iPhone 13 mini
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(7, 0658, 'Me encanta el tamaño compacto, ideal para mis manos pequeñas', 4);

-- iPhone 16 Plus
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(8, 2877, 'Pantalla enorme y brillante, perfecta para multimedia', 5);

-- iPhone 15 Pro
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(9, 6095, 'El titanio hace que se sienta premium, cámara profesional', 5);

-- iPhone 16 Pro Max
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(10, 9653, 'Demasiado grande para mi gusto, aunque potente', 3);

-- iPhone 15
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(11, 3827, 'Excelente equilibrio entre precio y características', 4);

-- iPhone 15 Plus
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(12, 4962, 'Batería que dura todo el día con uso intensivo', 5);

-- Galaxy Z Fold5
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(13, 5256, 'Innovador pero la bisagra me da miedo que se rompa', 4);

-- Galaxy Z Flip5
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(14, 8052, 'Tan compacto cuando está plegado, me encanta', 5);

-- Galaxy A54
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(15, 7531, 'Buena relación calidad-precio en gama media', 4);

-- Galaxy M14
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(16, 3690, 'Batería increíble pero rendimiento justito', 3);

-- Galaxy S23 Ultra
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(17, 2045, 'La cámara de 200MP es simplemente alucinante', 5);

-- Galaxy S23
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(18, 3786, 'Diseño elegante y potente, muy satisfecho', 5);

-- Find X6 Pro
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(19, 6304, 'OPPO ha creado un auténtico flagship', 5);

-- Find N2
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(20, 2789, 'Plegable premium con cámara Hasselblad', 4);

-- Reno11 Pro
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(21, 1947, 'Sorprende por su rendimiento a este precio', 4);

-- A98 5G
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(22, 9152, 'Batería de larga duración y carga rápida', 4);

-- A1 Pro 5G
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(23, 0921, 'Pantalla fluida y cámara decente por el precio', 3);

-- A57e
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(24, 3498, 'Básico pero cumple para uso diario', 3);

-- Xiaomi 13 Ultra
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(25, 0001, 'Cámara profesional en un smartphone', 5);

-- Xiaomi MIX Fold 3
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(26, 0002, 'Tecnología plegable muy bien implementada', 4);

-- POCO X5 Pro 5G
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(27, 0003, 'Rendimiento flagship a precio de gama media', 5);

-- Redmi 12C
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(28, 0004, 'Buen teléfono para regalar a adolescentes', 3);

-- Redmi A2
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(29, 0005, 'Demasiado básico para mis necesidades', 2);

-- Redmi Note 12 Pro+ 5G
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(30, 0006, 'Excelente relación calidad-precio', 4);

-- AirPods (2.ª generación)
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(31, 1357, 'Sonido decente pero falta cancelación de ruido', 3);

-- AirPods (3.ª generación)
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(32, 9864, 'Sonido espacial impresionante', 5);

-- AirPods Pro (2.ª generación)
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(33, 5296, 'Cancelación de ruido que cambia la experiencia', 5);

-- AirPods Max
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(34, 6890, 'Demasiado pesados para uso prolongado', 3);

-- WH-1000XM5
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(35, 1023, 'Los reyes de la cancelación de ruido', 5);

-- WH-1000XM4
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(36, 2345, 'Versión anterior pero casi igual de buena', 4);

-- WH-CH720N
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(37, 7214, 'Buenos para el precio pero hay mejores', 3);

-- WF-SP800N
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(38, 8742, 'Perfectos para correr, no se caen', 4);

-- WF-SP900
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(39, 3068, 'Resistentes al agua, ideales para natación', 5);

-- WF-1000XM4
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(40, 7140, 'Pequeños pero con gran sonido y ANC', 4);

-- WF-C500
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(41, 4952, 'Económicos y con buen sonido', 3);

-- INZONE H9
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(42, 9012, 'Immersión total en los juegos', 5);

-- PlayStation 5
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(43, 6543, 'La mejor consola que he tenido', 5);

-- PlayStation 5 Digital Edition
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(44, 3210, 'Echo de menos el lector de discos', 3);

-- PlayStation 5 Pro
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(45, 1928, 'Potencia bruta para jugar en 8K', 5);

-- PlayStation 5 Slim
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(46, 2817, 'Más compacta pero igual de potente', 4);

-- PS5 Edición Limitada Marvel's Spider-Man 2
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(47, 8351, 'Diseño espectacular para fans', 5);

-- PS5 Edición Limitada God of War Ragnarök
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(48, 9416, 'La consola más bonita que he visto', 5);

-- PS5 Edición Limitada Horizon Forbidden West
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(49, 3746, 'Para fans de Horizon es imprescindible', 5);

-- Xbox Series X
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(50, 6158, 'Potencia pura para jugar en 4K', 5);

-- Xbox Series S
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(4, 0524, 'Buena opción económica para entrar en nueva generación', 4);

-- Xbox One
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(5, 8532, 'Se está quedando obsoleta pero buen catálogo', 3);

-- Nintendo Switch
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(6, 1448, 'La versatilidad de jugar donde quieras es increíble', 5);

-- Nintendo Switch OLED
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(7, 8526, 'La pantalla OLED marca la diferencia', 4);

-- Nintendo Switch Lite
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(8, 4712, 'Perfecta para viajes, muy portable', 4);

-- Marvel's Spider-Man 2
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(9, 6087, 'El mejor juego de Spider-Man hasta la fecha', 5);

-- God of War Ragnarök
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(10, 7194, 'Kratos nunca defrauda, obra maestra', 5);

-- Horizon Forbidden West
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(11, 6194, 'Mundo abierto espectacular y gráficos impresionantes', 5);

-- Ratchet & Clank: Una Dimensión Aparte
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(12, 9253, 'Divertido y colorido, ideal para jugar en familia', 4);

-- Returnal
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(13, 1468, 'Dificultad desafiante pero muy satisfactorio', 4);

-- Demon's Souls
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(14, 3601, 'Remake espectacular de un clásico', 5);

-- Astro's Playroom
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(15, 8238, 'Demostración perfecta del DualSense', 4);

-- The Last of Us Parte I
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(16, 1593, 'Remake fiel al original con gráficos impresionantes', 5);

-- Gran Turismo 7
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(17, 8241, 'El mejor simulador de conducción', 5);

-- Halo Infinite
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(18, 16449, 'Halo vuelve a sus raíces con éxito', 4);

-- Forza Horizon 5
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(19, 8372, 'Diversión asegurada al volante', 5);

-- Gears 5
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(20, 3105, 'Buena entrega de la saga Gears', 4);

-- Sea of Thieves
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(21, 7584, 'Divertido con amigos, solo se queda corto', 3);

-- Fable
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(22, 5026, 'Esperando con ansias el nuevo Fable', 4);

-- The Legend of Zelda Tears of the Kingdom
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(1, 1295, 'Zelda en su máxima expresión, juego imprescindible', 5);

-- Super Mario Bros. Wonder
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(23, 8537, 'Mario como siempre, diversión garantizada', 5);

-- Pokémon Púrpura
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(24, 7689, 'Pokémon en mundo abierto funciona mejor de lo esperado', 4);

-- Animal Crossing: New Horizons
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(25, 9860, 'Relajante y adictivo, perfecto para desconectar', 5);

-- Mario Kart 8 Deluxe
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(26, 4702, 'El mejor Mario Kart de la historia', 5);

-- Super Smash Bros. Ultimate
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(27, 6318, 'El crossover definitivo con todos los personajes', 5);

-- Cien años de soledad
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(28, 2459, 'Obra maestra de la literatura universal', 5);

-- El Quijote
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(29, 0974, 'Un clásico que todo el mundo debería leer', 4);

-- Sapiens: De animales a dioses
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(30, 1307, 'Libro que cambia tu perspectiva de la humanidad', 5);

-- El poder del ahora
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(31, 9804, 'Enseñanzas valiosas sobre el presente', 4);

-- Cosmos (Planeta)
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(32, 1002, 'Carl Sagan explica el universo como nadie', 5);

-- El nombre del viento
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(33, 1003, 'Fantasía épica de la mejor calidad', 5);

-- El principito
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(34, 1004, 'Atemporal, lo releo cada año', 5);

-- Harry Potter y la piedra filosofal
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(35, 1005, 'El libro que inició la magia', 5);

-- La ciudad de los libros soñadores
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(36, 1007, 'Imaginación desbordante, muy original', 4);

-- La ladrona de libros
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(37, 1008, 'Historia conmovedora y bien escrita', 4);

-- Los juegos del hambre
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(38, 1009, 'Adictiva trilogía, este es el mejor', 5);

-- Los pilares de la Tierra
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(39, 1010, 'Novela histórica magistral', 5);

-- Orgullo y prejuicio
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(40, 1011, 'Romance clásico que sigue siendo relevante', 4);

-- Una breve historia de casi todo
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(41, 1012, 'Divulgación científica accesible y entretenida', 5);

-- Chanel N°5
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(2, 2468, 'Fragancia icónica, elegante y sofisticada', 5);

-- Sì (Giorgio Armani)
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(42, 2400, 'Olor fresco y duradero, muy recomendable', 4);

-- La Vie Est Belle (Lancôme)
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(43, 2401, 'Dulce pero no empalagoso, perfecto para el día a día', 4);

-- lady Million (Paco Rabanne)
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(44, 2402, 'Fragancia potente para noches especiales', 5);

-- Opium (Yves Saint Laurent)
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(45, 2403, 'Olor intenso y sensual, muy personal', 4);

-- J'adore (Dior)
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(46, 7131, 'Elegancia en botella, mi favorito', 5);

-- Eau Sauvage (Dior)
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(47, 3001, 'Frescura que perdura, ideal para verano', 4);

-- Acqua di Giò (Giorgio Armani)
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(48, 3002, 'Clásico que nunca pasa de moda', 5);

-- Terre d'Hermès (Hermès)
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(49, 3003, 'Sofisticación en estado puro', 5);

-- Le Mâle (Jean Paul Gaultier)
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(50, 3004, 'Diseño icónico y fragancia memorable', 4);

-- Kouros (Yves Saint Laurent)
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(3, 3090, 'Demasiado intenso para mi gusto', 2);

-- 1 Million (Paco Rabanne)
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(4, 6925, 'Dulce y juvenil, perfecto para salir', 4);

-- LEGO City Police Station
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(5, 4180, 'Divertido set para construir con niños', 4);

-- LEGO Friends Mansion moderna de Andrea
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(6, 4181, 'Detalles increíbles, a mi hija le encantó', 5);

-- LEGO Harry Potter Castillo de Hogwarts
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(7, 4182, 'Para fans de Harry Potter, es impresionante', 5);

-- LEGO Star Wars Millennium Falcon
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(8, 4184, 'El set definitivo para fans de Star Wars', 5);

-- Bratz Alwayz Cloe
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(9, 8852, 'Muñeca con mucho estilo y accesorios', 4);

-- Bratz Alwayz Yasmin
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(10, 8853, 'A mi niña le encanta el estilo bohemio', 4);

-- Bratz Alwayz Sasha
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(11, 8854, 'Representación diversa muy necesaria', 5);

-- Bratz Alwayz Jade
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(12, 8855, 'Diseño moderno y atrevido', 4);

-- Rainbow High Fantastic Fashion Doll
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(13, 8856, 'Calidad premium en las muñecas', 5);

-- Rainbow High Fantastic Fashion Violet
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(14, 8857, 'El pelo es suave y se puede peinar fácilmente', 4);

-- Rainbow High Fantastic Muñeca Ruby
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(15, 8858, 'Colorido y divertido', 4);

-- Rainbow High Fashion Studio
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(16, 8859, 'Perfecto para desarrollar la creatividad', 5);

-- UNO Attack
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(17, 5291, 'Versión más divertida del UNO clásico', 4);

-- UNO Flip
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(18, 5292, 'Giro interesante al juego tradicional', 3);

-- UNO Original
INSERT INTO CLIENTES_PRODUCTOS (ID_CLIENTE, ID_PRODUCTO, OPINION, VALORACION) VALUES
(19, 5293, 'El clásico que nunca falla', 5);
