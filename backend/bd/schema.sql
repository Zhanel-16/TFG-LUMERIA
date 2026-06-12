SET NAMES utf8mb4;
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(120) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description LONGTEXT,
    price DECIMAL(10,2) NOT NULL,
    image VARCHAR(255),
    category VARCHAR(100),
    color_oro VARCHAR(120) NOT NULL
);

CREATE TABLE IF NOT EXISTS cart (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT DEFAULT 1,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


CREATE TABLE IF NOT EXISTS favorites (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);


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
    service VARCHAR(100),
    notes TEXT,
    interest VARCHAR(255),
    proposalDate DATE,
    giftEligible BOOLEAN DEFAULT FALSE,
    giftStatus VARCHAR(30) DEFAULT 'pendiente',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- POSTS (BLOG)
CREATE TABLE IF NOT EXISTS posts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200),
    slug VARCHAR(200) UNIQUE,
    image VARCHAR(255),
    excerpt TEXT,
    content LONGTEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);



INSERT INTO products (name, color_oro, description, price, image, category) VALUES

('Anillo Corazón de Diamantes', 'Oro Amarillo de 18 Kt',
'Fabricado en oro de 18 quilates, este anillo destaca por su elegancia clásica y un brillo que se mantiene con el paso del tiempo. Sus diamantes, cuidadosamente engastados, aportan luminosidad y convierten la pieza en un accesorio sofisticado que realza cualquier estilo.

El corazón, símbolo universal del amor, ha sido durante siglos una representación de las emociones más profundas. Más allá de su significado físico, refleja la conexión, el cariño y los vínculos que nos unen. Integrado en el diseño, este detalle convierte al anillo en una expresión clara del amor en todas sus formas.

La combinación del oro de 18 quilates con la pureza del diamante crea un equilibrio perfecto. La resistencia del diamante contrasta con la delicadeza de su forma, evocando un amor firme, duradero y capaz de perdurar en el tiempo.

Este anillo es mucho más que una joya: es un símbolo de sentimientos, una pieza especial que transmite elegancia, fuerza y la esencia de un amor eterno.',
589.00,
'/images/anillo1.webp',
'anillos'),


('Solitario Always Pavé de Diamantes 3 Ct.', 'Oro Blanco de 18 Kt',
'Elaborado en oro blanco y protagonizado por un impresionante diamante solitario de 3 quilates, este anillo representa la máxima expresión de elegancia y sofisticación. Su diseño tipo Always Pavé realza el brillo de la pieza gracias a una delicada línea de pequeños diamantes que acompañan al diamante central, creando un juego de luz continuo que captura todas las miradas.

El diamante solitario, símbolo de compromiso y eternidad, destaca por su pureza y presencia. Desde hace generaciones, este tipo de anillo ha sido el emblema por excelencia del amor duradero, representando una promesa única e inquebrantable. Su tamaño y luminosidad lo convierten en el verdadero protagonista, transmitiendo fuerza, claridad y perfección.

La técnica pavé, caracterizada por el engaste de múltiples diamantes en la banda, aporta un brillo adicional que potencia la belleza del diamante central. Esta combinación crea una armonía visual donde cada detalle está cuidadosamente pensado para reflejar lujo y delicadeza en cada ángulo.

Este anillo solitario de 3 quilates en oro blanco es mucho más que una joya: es una declaración de amor eterno, una pieza exclusiva que simboliza compromiso, elegancia y la belleza de los momentos más importantes de la vida.',
12990.00,
'/images/anillo2.webp',
'anillosCompromiso'),



('Anillo Art Deco de Diamantes', 'Oro Blanco de 18 Kt',
'Elaborado en oro blanco y coronado por un diamante de 2,3 quilates, este anillo de estilo Art Déco es una auténtica obra de arte que evoca la sofisticación y el glamour de una época inolvidable. Su diseño geométrico, característico de este movimiento artístico, combina líneas precisas y simetría perfecta, dando lugar a una pieza equilibrada y visualmente impactante.

El diamante central, cuidadosamente tallado para maximizar su brillo, se convierte en el alma de la joya. Su claridad y luminosidad capturan la luz desde cualquier ángulo, proyectando destellos que reflejan elegancia, carácter y distinción. Este tipo de diseño no solo resalta la belleza de la piedra, sino que también transmite una sensación de orden, armonía y refinamiento.

Inspirado en el espíritu del Art Déco, este anillo representa la fusión entre modernidad y tradición. Sus formas estructuradas y su estética atemporal lo convierten en una joya única, pensada para quienes valoran el detalle, la arquitectura del diseño y la exclusividad.

En conjunto, este anillo de oro blanco con diamante de 2,3 quilates no es solo un accesorio, sino una declaración de estilo. Una pieza que simboliza elegancia, personalidad y la belleza de lo clásico reinterpretado con un enfoque contemporáneo.',
3995.00,
'/images/anillo3oroBlancoArtDeco.webp',
'anillosCompromiso'),


('Aurora Oval Pavé de Diamantes 2,8 Cts.', 'Oro Amarillo de 18 Kt', 'Elaborado en oro amarillo de 18 quilates, este anillo de compromiso destaca por la elegancia atemporal de su diseño y la sofisticación de cada detalle. Su diamante ovalado de 2,8 quilates ocupa el centro de la pieza con una presencia luminosa y refinada, capturando la luz desde cada ángulo con destellos de gran intensidad.

La talla ovalada, símbolo de delicadeza y distinción, estiliza visualmente la mano y aporta un equilibrio perfecto entre romanticismo y modernidad. Su forma alargada realza la piedra central, ofreciendo una apariencia elegante, armoniosa y llena de brillo.

A ambos lados, un delicado pavé de diamantes recorre el brazo del anillo, añadiendo luminosidad extra y creando un efecto de continuidad brillante que envuelve la joya con un aire aún más exclusivo. Este detalle lateral aporta profundidad, lujo y una sensación de mayor protagonismo a la piedra central.

El oro amarillo de 18 quilates aporta calidez y un contraste clásico que resalta la pureza del diamante y la riqueza de los destellos. La combinación entre la piedra ovalada y el pavé lateral convierte esta pieza en una joya sofisticada, ideal para simbolizar un amor eterno.

En conjunto, este anillo de compromiso de 2,8 quilates es una declaración de elegancia, exclusividad y sentimiento. Una joya única pensada para acompañar uno de los momentos más importantes de la vida.',
10890.00,
'/images/anillo4SolitarioOval.webp',
'anillosCompromiso'),

('Radiant Lumière de Diamantes 1,2 Cts.', 'Oro Amarillo y Oro Blanco',
'Este anillo de compromiso ha sido concebido para quienes buscan una joya con presencia, sofisticación y una luz extraordinaria. Su diamante central de talla radiant de 1,2 quilates destaca por su forma geométrica elegante y por la intensidad de sus reflejos, capaces de capturar la luz con un brillo vibrante y lleno de vida.

La talla radiant combina la pureza de las líneas rectas con el resplandor característico de las facetas brillantes, logrando una piedra de gran impacto visual y una apariencia moderna sin perder la esencia clásica de un anillo de compromiso atemporal.

La piedra central se encuentra delicadamente sostenida por garras en oro blanco, un detalle que realza la claridad del diamante y potencia su luminosidad natural al integrarse de manera sutil con su resplandor. Este contraste refinado permite que toda la atención recaiga en la belleza de la talla radiant.

La banda, elaborada en oro amarillo de 18 quilates, aporta calidez, elegancia y un carácter distintivo a la pieza. La combinación bicolor entre el oro amarillo y las garras en oro blanco crea un equilibrio perfecto entre tradición y diseño contemporáneo, convirtiendo este anillo en una joya exclusiva y llena de personalidad.

Este anillo de compromiso representa la unión entre luz, elegancia y simbolismo. Una pieza sofisticada pensada para acompañar un momento irrepetible y convertirse en un recuerdo eterno.',
6890.00,
'/images/radiantCut.webp',
'anillosCompromiso'),


('Fortuna Diamond 0,30 Cts.', 'Oro Blanco de 18 Kt',
'Inspirado en el símbolo universal de la buena suerte, este anillo de herradura combina significado, elegancia y luminosidad en una joya llena de encanto. Elaborado en oro blanco de 18 quilates, su diseño delicado y sofisticado convierte un emblema atemporal en una pieza refinada para llevar siempre contigo.

La silueta de la herradura se encuentra realzada por un pavé de diamantes con un total de 0,30 quilates, aportando un brillo sutil pero constante que envuelve la pieza con una luz elegante y distinguida. Cada diamante ha sido dispuesto para seguir la curva perfecta del diseño, creando un efecto armonioso y lleno de destellos.

El oro blanco potencia la pureza de los diamantes y resalta la esencia luminosa del anillo, ofreciendo una estética moderna, versátil y sofisticada. Su acabado pulido y su forma estilizada lo convierten en una joya ideal tanto para el día a día como para ocasiones especiales.

Más allá de su belleza, este anillo representa fortuna, protección y nuevos comienzos, convirtiéndose en un detalle cargado de intención y simbolismo. Una pieza única pensada para quienes desean llevar la suerte consigo con la elegancia de la alta joyería.',
1390.00,
'/images/anilloSuerte.webp',
'anillosSimbolicos'),

('Anillo Ojo Turco con Diamantes 0,20 Cts.', 'Oro Amarillo de 18 Kt',
'Inspirado en el antiguo símbolo de protección y buena energía, este anillo del Ojo Turco combina tradición, espiritualidad y alta joyería en una pieza llena de significado.

Fabricado en oro amarillo de 18 quilates, su diseño circular envuelve una piedra turquesa central que simboliza protección, serenidad y equilibrio emocional. Alrededor de ella, un halo de diamantes naturales con un total de 0,20 quilates aporta luminosidad y elegancia, creando un contraste cálido y sofisticado.

La combinación del oro amarillo con la intensidad azul turquesa genera una joya vibrante, moderna y con personalidad propia. Perfecto como amuleto diario o como regalo cargado de simbolismo.

Una pieza pensada para proteger, iluminar y acompañar cada momento importante de la vida.',
1190.00,
'/images/anilloOjoTurco.webp',
'anillosSimbolicos'),




('Anillo Hamsa con Diamantes 0,34 Cts.', 'Oro Blanco de 18 Kt',
'Este anillo Hamsa ha sido creado como un símbolo de protección, luz y elegancia atemporal. La icónica mano de Fátima, reinterpretada en clave de alta joyería, se convierte en una pieza delicada y profundamente significativa, pensada para acompañar a quien lo lleva como un talismán personal lleno de intención y estilo.

El motivo central está pavé engastado con diamantes naturales que suman un total de 0,34 quilates. Cada piedra ha sido cuidadosamente seleccionada y colocada para crear una superficie continua de brillo, aportando una luminosidad suave y sofisticada que realza la silueta del símbolo Hamsa.

La mano protectora, conocida desde la antigüedad por su significado espiritual, representa la protección frente a las energías negativas, la buena fortuna y la conexión con la intuición. En esta pieza, tradición y diseño contemporáneo se fusionan para dar lugar a una joya elegante y llena de simbolismo.

El aro, elaborado en oro blanco de 18 quilates, aporta una estética moderna, refinada y versátil, permitiendo que el anillo pueda lucirse tanto en el día a día como en ocasiones especiales. Su acabado pulido refleja la luz con delicadeza, complementando el resplandor de los diamantes.

Este anillo es mucho más que una joya: es un amuleto contemporáneo pensado para quienes buscan belleza, significado y un brillo que acompañe cada momento.',
1420.00,
'/images/AnilloHamsa.webp',
'anillosSimbolicos'),


('Herradura Diamond Charm 0,11 Cts.', 'Oro Amarillo de 18 Kt',
'Inspirado en los antiguos talismanes de protección y fortuna, este charm en forma de herradura simboliza suerte, prosperidad y nuevos comienzos. Elaborado en oro amarillo de 18 quilates, su diseño delicado está engastado con diamantes naturales que aportan un brillo sutil y elegante. Una pieza pensada para acompañarte como amuleto personal lleno de significado.',
399.00,
'/images/charmHerradura.webp',
'talismanes'),


('Ojo Turco Nácar Diamond Charm 0,052 Cts.', 'Oro Amarillo de 18 Kt',
'Inspirado en el tradicional símbolo protector contra las energías negativas, este charm de ojo turco combina la pureza del nácar con el brillo delicado de diamantes naturales. Elaborado en oro amarillo de 18 quilates, su diseño elegante y luminoso lo convierte en un amuleto moderno de protección, armonía y buena fortuna.',
399.00,
'/images/charmOjoTurcoNacar.webp',
'talismanes'),


('Charm Ancla de Diamantes 0,075 Cts.', 'Oro Amarillo de 18 Kt',
'Diseñado como símbolo de estabilidad y protección, este charm en forma de ancla está elaborado en oro amarillo de 18 quilates y decorado con diamantes naturales de 0,075 quilates. Una pieza elegante que representa la fuerza interior, la seguridad y la conexión con los orígenes.',
469.00,
'/images/charmAnclaDiamantes.webp',
'talismanes'),

('Charm Barco de Diamantes', 'Oro Amarillo de 18 Kt',
'Inspirado en la travesía marítima y el espíritu aventurero, este charm en forma de barco está elaborado en oro amarillo de 18 quilates y adornado con diamantes naturales de 0,086 quilates. Una joya sofisticada que simboliza el viaje, la libertad y la fortuna.',
529.00,
'/images/charmBarcoDiamantes.webp',
'talismanes'),

('Charm Mariquita Ruby Diamond Luck 0,08 Cts.', 'Oro Amarillo de 18 Kt',
'Este delicado charm en forma de mariquita representa la suerte, la alegría y la protección. Fabricado en oro amarillo de 18 quilates, incorpora un rubí central que simboliza la pasión y la vitalidad, acompañado por diamantes naturales con un total de 0,08 quilates que aportan brillo y elegancia. Una joya luminosa pensada como amuleto de buena fortuna para llevar cada día.',
370.00,
'/images/charmMariquitaDiamantes.webp',
'talismanes'),

('Charm Lucky Clover Diamond 0,15 Cts.', 'Oro Amarillo de 18 Kt',
'Inspirado en el icónico trébol de cuatro hojas, símbolo universal de suerte y prosperidad, este charm está elaborado en oro amarillo de 18 quilates y decorado con diamantes naturales de 0,15 quilates. Su diseño delicado y sofisticado lo convierte en un talismán elegante que representa fortuna, esperanza y éxito.',
460.00,
'/images/charmTrebolDiamantes.webp',
'talismanes'),

('Charm Sapphire Evil Eye Diamond 0,19 Cts.', 'Oro Amarillo de 18 Kt',
'Este charm del Ojo Turco reinventa el clásico amuleto protector con un toque de alta joyería. Realizado en oro amarillo de 18 quilates, incorpora un zafiro azul intenso —gema asociada a la sabiduría, la serenidad y la protección espiritual— rodeado de diamantes naturales con un total de 0,19 quilates que realzan su brillo. Una pieza sofisticada diseñada para atraer energía positiva y equilibrio.',
539.00,
'/images/charmOjoTurcoZafiro.webp',
'talismanes'),

('Anillo Esmeraldas Marquise y Diamante 0,20 Cts.', 'Oro Amarillo de 18 Kt',
'Anillo Esmeraldas Marquise y Diamante 0,20 Cts.', 'Oro Amarillo de 18 Kt', 'Fabricado en oro amarillo de 18 quilates, este anillo destaca por la armonía de sus líneas y la delicadeza de sus detalles. Su diseño incorpora dos esmeraldas talla marquise de intenso color verde, acompañadas por un diamante central de 0,20 quilates que aporta luminosidad y equilibrio a la composición.

La talla marquise, reconocida por su elegante forma alargada y sus extremos puntiagudos, realza la belleza natural de las esmeraldas y aporta una sensación de ligereza y sofisticación. Inspirado en formas orgánicas y delicadas, el diseño evoca la belleza de la naturaleza y la frescura de los nuevos comienzos.

El contraste entre el brillo cálido del oro amarillo, la intensidad de las esmeraldas y el resplandor del diamante crea una pieza refinada y atemporal. Cada gema ha sido cuidadosamente seleccionada para ofrecer una combinación de color, brillo y elegancia excepcional.

Este anillo es mucho más que una joya: representa la unión entre la naturaleza, la sofisticación y la exclusividad, convirtiéndose en una pieza única capaz de acompañar los momentos más especiales de toda una vida.',
1590.00,
'/images/esmeraldas.webp',
'anillos');
