CREATE DATABASE IF NOT EXISTS db_joyeria;
USE db_joyeria;

CREATE TABLE IF NOT EXISTS users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(120) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    image VARCHAR(255),
    category VARCHAR(100),
    color_oro VARCHAR(120) NOT NULL
);


INSERT INTO products (name, color_oro, description, price, image, category) VALUES

('Anillo Corazón de Diamantes', 'Oro Amarillo de 18 Kt',
'Fabricado en oro de 18 quilates, este anillo destaca por su elegancia clásica y un brillo que se mantiene con el paso del tiempo. Sus diamantes, cuidadosamente engastados, aportan luminosidad y convierten la pieza en un accesorio sofisticado que realza cualquier estilo.

El corazón, símbolo universal del amor, ha sido durante siglos una representación de las emociones más profundas. Más allá de su significado físico, refleja la conexión, el cariño y los vínculos que nos unen.

La combinación del oro de 18 quilates con la pureza del diamante crea un equilibrio perfecto. Este anillo es mucho más que una joya: es un símbolo de amor eterno.',
589.00,
'/images/anillo1.webp',
'anillos'),

('Solitario Always Pavé de Diamantes 3 Ct.', 'Oro Blanco de 18 Kt',
'Elaborado en oro blanco y protagonizado por un impresionante diamante solitario de 3 quilates, este anillo representa la máxima expresión de elegancia.

El diamante solitario simboliza compromiso y eternidad. La técnica pavé aporta brillo continuo alrededor del aro, intensificando su luminosidad.

Este anillo es una declaración de amor eterno y sofisticación.',
12990.00,
'/images/anillo2.webp',
'anillosCompromiso'),

('Anillo Art Deco de Diamantes', 'Oro Blanco de 18 Kt',
'Elaborado en oro blanco y coronado por un diamante de 2,3 quilates, este anillo de estilo Art Déco combina geometría y elegancia.

Su diseño estructurado refleja la sofisticación de una época icónica. El diamante central aporta brillo y carácter.

Una joya que representa elegancia, personalidad y diseño atemporal.',
3995.00,
'/images/anillo3oroBlancoArtDeco.webp',
'anillosCompromiso'),

('Aurora Oval Pavé de Diamantes 2,8 Cts.', 'Oro Amarillo de 18 Kt',
'Este anillo de compromiso destaca por su diamante ovalado de 2,8 quilates.

La talla oval estiliza la mano y aporta elegancia. El pavé lateral añade brillo continuo.

Una joya sofisticada que simboliza amor eterno.',
10890.00,
'/images/anillo4SolitarioOval.webp',
'anillosCompromiso'),

('Radiant Lumière de Diamantes 1,2 Cts.', 'Oro Amarillo y Oro Blanco',
'Este anillo presenta un diamante radiant de 1,2 quilates con brillo intenso.

La combinación de oro amarillo y garras en oro blanco potencia la luz del diamante.

Una pieza moderna y elegante que simboliza unión y amor eterno.',
6890.00,
'/images/radiantCut.webp',
'anillosCompromiso'),

('Fortuna Diamond 0,30 Cts.', 'Oro Blanco de 18 Kt',
'Inspirado en el símbolo de la buena suerte, este anillo de herradura combina elegancia y significado.

Engastado con diamantes, representa fortuna, protección y nuevos comienzos.',
1390.00,
'/images/anilloSuerte.webp',
'anillosSimbolicos'),

('Anillo Hamsa con Diamantes 0,34 Cts.', 'Oro Blanco de 18 Kt',
'El anillo Hamsa es un símbolo de protección y energía positiva.

Engastado con diamantes naturales, representa buena fortuna y espiritualidad.

Una joya con significado profundo y diseño elegante.',
1420.00,
'/images/AnilloHamsa.webp',
'anillosSimbolicos'),

('Anillo Ojo Turco con Diamantes 0,20 Cts.', 'Oro Amarillo de 18 Kt',
'Inspirado en el símbolo del ojo turco, representa protección contra energías negativas.

Elaborado con diamantes y piedra turquesa, combina tradición y lujo.',
1190.00,
'/images/anilloOjoTurco.webp',
'anillosSimbolicos'),

('Charm Herradura Diamond 0,11 Cts.', 'Oro Amarillo de 18 Kt',
'Charm en forma de herradura que simboliza suerte y protección.

Engastado con diamantes naturales para un brillo elegante.',
399.00,
'/images/charmHerradura.webp',
'talismanes'),

('Charm Ojo Turco Nácar Diamond 0,052 Cts.', 'Oro Amarillo de 18 Kt',
'Charm inspirado en el ojo turco protector.

Combina nácar y diamantes para armonía y protección.',
399.00,
'/images/charmOjoTurcoNacar.webp',
'talismanes'),

('Charm Ancla de Diamantes 0,075 Cts.', 'Oro Amarillo de 18 Kt',
'Símbolo de estabilidad y seguridad.

Elaborado con diamantes naturales en oro amarillo.',
469.00,
'/images/charmAnclaDiamantes.webp',
'talismanes'),

('Charm Barco de Diamantes', 'Oro Amarillo de 18 Kt',
'Símbolo de aventura, viaje y libertad.

Engastado con diamantes naturales.',
529.00,
'/images/charmBarcoDiamantes.webp',
'talismanes'),

('Charm Mariquita Ruby Diamond Luck 0,08 Cts.', 'Oro Amarillo de 18 Kt',
'Símbolo de buena suerte y alegría.

Incluye rubí central y diamantes naturales.',
370.00,
'/images/charmMariquitaDiamantes.webp',
'talismanes'),

('Charm Lucky Clover Diamond 0,15 Cts.', 'Oro Amarillo de 18 Kt',
'Trébol de cuatro hojas símbolo de fortuna.

Engastado con diamantes naturales.',
460.00,
'/images/charmTrebolDiamantes.webp',
'talismanes'),

('Charm Sapphire Evil Eye Diamond 0,19 Cts.', 'Oro Amarillo de 18 Kt',
'Ojo turco con zafiro azul protector.

Simboliza sabiduría, protección y equilibrio energético.',
539.00,
'/images/charmOjoTurcoZafiro.webp',
'talismanes'),

('Anillo Esmeraldas Marquise y Diamante 0,20 Cts.', 'Oro Amarillo de 18 Kt',
'Anillo con esmeraldas marquise y diamante central.

Inspirado en la naturaleza y la elegancia orgánica.',
1590.00,
'/images/esmeraldas.webp',
'anillos');


-- CREATE DATABASE IF NOT EXISTS db_joyeria;
-- USE db_joyeria;

-- CREATE TABLE IF NOT EXISTS users(
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     email VARCHAR(120) UNIQUE NOT NULL,
--     password VARCHAR(255) NOT NULL
-- );

-- CREATE TABLE IF NOT EXISTS products(
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     name VARCHAR(120) NOT NULL,
--     description TEXT,
--     price DECIMAL(10,2) NOT NULL,
--     image VARCHAR(255),
--     category VARCHAR(100)
-- );

-- CREATE TABLE IF NOT EXISTS favorites(
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     user_id INT,
--     product_id INT,
--     FOREIGN KEY (user_id) REFERENCES users(id),
--     FOREIGN KEY (product_id) REFERENCES products(id)
-- );

-- CREATE TABLE IF NOT EXISTS cart(
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     user_id INT,
--     product_id INT,
--     quantity INT DEFAULT 1,
--     FOREIGN KEY (user_id) REFERENCES users(id),
--     FOREIGN KEY (product_id) REFERENCES products(id)
-- );

-- CREATE TABLE IF NOT EXISTS appointments(
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     user_id INT,
--     date DATE,
--     time TIME,
--     notes TEXT,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (user_id) REFERENCES users(id)
-- );

-- CREATE TABLE IF NOT EXISTS posts(
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     title VARCHAR(200),
--     slug VARCHAR(200) UNIQUE,
--     image VARCHAR(255),
--     excerpt TEXT,
--     content LONGTEXT,
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
-- );