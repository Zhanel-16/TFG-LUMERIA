SET NAMES utf8mb4;
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(120) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

-- =========================
-- PRODUCTS
-- =========================
CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description LONGTEXT,
    price DECIMAL(10,2) NOT NULL,
    image VARCHAR(255),
    category VARCHAR(100),
    color_oro VARCHAR(120) NOT NULL
);

-- =========================
-- CART
-- =========================
CREATE TABLE IF NOT EXISTS cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT DEFAULT 1,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- =========================
-- FAVORITES
-- =========================
CREATE TABLE IF NOT EXISTS favorites (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- =========================
-- APPOINTMENTS
-- =========================
-- CREATE TABLE IF NOT EXISTS appointments (
--     id INT AUTO_INCREMENT PRIMARY KEY,
--     user_id INT,
--     date DATE,
--     time TIME,
--     notes TEXT,
--     interest VARCHAR(255),
--     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (user_id) REFERENCES users(id)
-- );

CREATE TABLE IF NOT EXISTS appointments (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(255) NOT NULL,
    date DATE,
    time TIME,
    notes TEXT,
    interest VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- POSTS (BLOG)
-- =========================
CREATE TABLE IF NOT EXISTS posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    slug VARCHAR(200) UNIQUE,
    image VARCHAR(255),
    excerpt TEXT,
    content LONGTEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================
-- PRODUCTS DATA
-- =========================

INSERT INTO products (name, color_oro, description, price, image, category) VALUES

('Anillo Corazón de Diamantes', 'Oro Amarillo de 18 Kt',
'Fabricado en oro de 18 quilates, este anillo destaca por su elegancia clásica y un brillo que se mantiene con el paso del tiempo. Sus diamantes cuidadosamente engastados aportan luminosidad y convierten la pieza en un accesorio sofisticado.

El corazón, símbolo universal del amor, representa la conexión y los vínculos más profundos.

La combinación del oro de 18 quilates con el diamante crea un equilibrio perfecto entre fuerza y delicadeza.

Este anillo es un símbolo de amor eterno y elegancia.',
589.00,
'/images/anillo1.webp',
'anillos'),

('Solitario Always Pavé de Diamantes 3 Ct.', 'Oro Blanco de 18 Kt',
'Elaborado en oro blanco con un diamante solitario de 3 quilates, representa la máxima expresión de elegancia.

El diamante simboliza compromiso y eternidad.

El pavé añade brillo continuo alrededor del aro.

Una declaración de amor eterno.',
12990.00,
'/images/anillo2.webp',
'anillosCompromiso'),

('Anillo Art Deco de Diamantes', 'Oro Blanco de 18 Kt',
'Inspirado en el Art Déco, combina geometría y elegancia.

El diamante central de 2,3 quilates aporta brillo y carácter.

Una joya de diseño atemporal y sofisticado.',
3995.00,
'/images/anillo3oroBlancoArtDeco.webp',
'anillosCompromiso'),

('Aurora Oval Pavé de Diamantes 2,8 Cts.', 'Oro Amarillo de 18 Kt',
'Diamante ovalado de 2,8 quilates con pavé lateral.

Diseño elegante que estiliza la mano.

Símbolo de amor eterno.',
10890.00,
'/images/anillo4SolitarioOval.webp',
'anillosCompromiso'),

('Radiant Lumière de Diamantes 1,2 Cts.', 'Oro Amarillo y Oro Blanco',
'Diamante radiant de 1,2 quilates con gran brillo.

Garras en oro blanco que realzan la luz.

Diseño moderno y elegante.',
6890.00,
'/images/radiantCut.webp',
'anillosCompromiso'),

('Fortuna Diamond 0,30 Cts.', 'Oro Blanco de 18 Kt',
'Anillo en forma de herradura símbolo de buena suerte.

Engastado con diamantes que aportan brillo sutil.

Representa fortuna y protección.',
1390.00,
'/images/anilloSuerte.webp',
'anillosSimbolicos'),

('Anillo Ojo Turco con Diamantes 0,20 Cts.', 'Oro Amarillo de 18 Kt',
'Símbolo de protección contra energías negativas.

Con diamantes y piedra turquesa.

Joya de tradición y lujo.',
1190.00,
'/images/anilloOjoTurco.webp',
'anillosSimbolicos'),

('Anillo Hamsa con Diamantes 0,34 Cts.', 'Oro Blanco de 18 Kt',
'Símbolo de protección espiritual.

Engastado con diamantes naturales.

Amuleto elegante y moderno.',
1420.00,
'/images/AnilloHamsa.webp',
'anillosSimbolicos'),

('Herradura Diamond Charm 0,11 Cts.', 'Oro Amarillo de 18 Kt',
'Símbolo de suerte y protección.

Engastado con diamantes naturales.',
399.00,
'/images/charmHerradura.webp',
'talismanes'),

('Ojo Turco Nácar Diamond Charm 0,052 Cts.', 'Oro Amarillo de 18 Kt',
'Amuleto protector con nácar y diamantes.

Simboliza armonía y buena fortuna.',
399.00,
'/images/charmOjoTurcoNacar.webp',
'talismanes'),

('Charm Ancla de Diamantes 0,075 Cts.', 'Oro Amarillo de 18 Kt',
'Símbolo de estabilidad y seguridad.

Engastado con diamantes.',
469.00,
'/images/charmAnclaDiamantes.webp',
'talismanes'),

('Charm Barco de Diamantes', 'Oro Amarillo de 18 Kt',
'Símbolo de viaje y libertad.

Engastado con diamantes.',
529.00,
'/images/charmBarcoDiamantes.webp',
'talismanes'),

('Charm Mariquita Ruby Diamond Luck 0,08 Cts.', 'Oro Amarillo de 18 Kt',
'Símbolo de suerte y alegría.

Incluye rubí central y diamantes.',
370.00,
'/images/charmMariquitaDiamantes.webp',
'talismanes'),

('Charm Lucky Clover Diamond 0,15 Cts.', 'Oro Amarillo de 18 Kt',
'Trébol de la suerte.

Engastado con diamantes naturales.',
460.00,
'/images/charmTrebolDiamantes.webp',
'talismanes'),

('Charm Sapphire Evil Eye Diamond 0,19 Cts.', 'Oro Amarillo de 18 Kt',
'Ojo turco con zafiro azul.

Protección y equilibrio energético.',
539.00,
'/images/charmOjoTurcoZafiro.webp',
'talismanes'),

('Anillo Esmeraldas Marquise y Diamante 0,20 Cts.', 'Oro Amarillo de 18 Kt',
'Esmeraldas marquise con diamante central.

Inspirado en la naturaleza.

Joya elegante y exclusiva.',
1590.00,
'/images/esmeraldas.webp',
'anillos');
