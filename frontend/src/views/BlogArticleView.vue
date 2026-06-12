<script setup>
import { useRoute } from 'vue-router'
import { computed } from 'vue'
const route = useRoute()
const articles = {
  1: {
    hero: "/images/compromiso.webp",
    sideImg: "/images/radiantCut.webp",
    title: "Guía definitiva del anillo de compromiso",
    subtitle: "Tu mapa para navegar entre quilates, cortes y estilos sin perder la esencia del amor.",
    type: "compromiso"
  },
  2: {
    hero: "/images/cuidadoJoyas.webp",
    sideImg: "/images/cuidadoJoyas.webp",
    title: "Guía de cuidado de joyas",
    subtitle: "Aprende a mantener el brillo de tus piezas favoritas.",
    type: "cuidado"
  },

  3: {
    hero: "/images/stackOroBlanco.webp",
    sideImg: "/images/stackOroBlanco.webp",
    title: "El arte del ring stacking",
    subtitle: "Tus manos, tus reglas: domina la tendencia que redefine el lujo moderno.",
    type: "stacking"
  },

  4: {
    hero: "/images/boda.webp",
    sideImg: "/images/boda.webp",
    title: "Cómo hacer la pedida perfecta",
    subtitle: "Ideas, emociones y pequeños detalles para crear un momento inolvidable.",
    type: "pedida"
  },

  5: {
    hero: "/images/AguamarinaCompromisoOroAmarillo.webp",
    sideImg: "/images/AguamarinaCompromisoOroAmarillo.webp",
    title: "Topacio vs Aguamarina",
    subtitle: "Dos piedras azules, dos formas distintas de entender la elegancia.",
    type: "gemas"
  },

  6: {
    hero: "/images/colleccionArtic.webp",
    sideImg: "/images/colleccionArtic.webp",
    title: "Guía de regalos según presupuesto",
    subtitle: "Ideas sofisticadas para sorprender sin importar el presupuesto.",
    type: "regalos"
  }
}

const article = computed(() => articles[route.params.id])
</script>

<template>
<section v-if="article" class="article">
    <!-- varios articulos en 1 dinamico -->
    <div class="hero">
        <img :src="article.hero" class="hero-img">
        <div class="hero-overlay">
        <h1>{{ article.title }}</h1>
        <p>{{ article.subtitle }}</p>
        </div>
    </div>
    <div v-if="article.type === 'compromiso'" class="content"> <!-- 1 -->
      <p class="intro">Elegir un anillo de compromiso es una de las decisiones más emocionantes y simbólicas de la vida. No se trata solo de una joya: es la promesa de una historia, el reflejo de una personalidad y el inicio de un nuevo capítulo lleno de significado.</p>
      <p>Durante siglos, los diamantes han representado eternidad, resistencia y amor inquebrantable. 
        Sin embargo, hoy el anillo perfecto no responde a una única fórmula. Cada persona tiene su 
        propio estilo, su forma de entender el lujo y su manera de expresar el compromiso.</p>

      <div class="holis">
        <span>"El mejor anillo de compromiso no es el más grande, sino aquel que sigue emocionando dentro de treinta años."</span>
      </div>

      <p>Por eso, esta guía nace para ayudarte a comprender los aspectos clave que debes tener en cuenta 
        antes de elegir la joya que marcará uno de los momentos más importantes de tu vida.</p>
      <p>Más allá del presupuesto o las tendencias, la elección correcta siempre nace del equilibrio entre emoción, estética y significado.
        Un gran anillo no solo impresiona el día de la pedida; sigue transmitiendo algo especial décadas después.</p>
      <div class="blog-image">
        <img src="/images/compromiso.webp">
      </div>
      <div class="two-cols">
        <img :src="article.sideImg">
        <div>
          <h2>El diamante: el corazón del anillo</h2>
          <p>Cuando hablamos de anillos de compromiso, el diamante suele ser el protagonista absoluto. 
            Su belleza se evalúa mediante las famosas 4C: Cut, Color, Clarity y Carat.</p>

          <p>La talla determina cómo refleja la luz; el color indica su pureza; la claridad analiza sus 
            inclusiones y el quilataje mide su peso. La combinación equilibrada de estos factores crea 
            el brillo perfecto.</p>
        </div>
        
      </div>
      <div class="blog-image">
        <img src="/images/radiantCut.webp">
      </div>

      <!-- seccion 1 -->
      <h2>Los estilos de anillo más icónicos</h2>
      <p>
      Cada estilo de anillo transmite una personalidad distinta.
      Mientras algunas personas buscan líneas clásicas y atemporales,
      otras prefieren diseños con más presencia visual o detalles
      inspirados en épocas históricas.
      </p>

      <p>
      Comprender las diferencias entre los principales estilos
      permite tomar una decisión más consciente y encontrar una pieza
      que siga representándoos dentro de veinte o treinta años.
      </p>

      <!-- bloque 1 -->
      <h2>Solitario</h2>

      <p>
      El solitario es el diseño más icónico de la historia de la joyería.
      Un único diamante ocupa todo el protagonismo, permitiendo que la luz
      se refleje con máxima intensidad.
      </p>

      <p>
      Su estética limpia y elegante lo convierte en una elección segura
      para quienes buscan una pieza verdaderamente atemporal.
      </p>
      <!-- mostrar aqui los solitarios q tengo con boton de ver producto -->

      <!-- bloque 2 -->
      <h2>Pavé</h2>
      <p>
      En los diseños pavé, pequeños diamantes se integran a lo largo del
      brazo del anillo creando una superficie continua de luz.
      </p>

      <p>
      El resultado es una joya elegante, femenina y especialmente luminosa.
      </p>

      <!-- seccion ESTILO -->
      <h2>¿Qué estilo encaja contigo?</h2>

      <p>Si te identificas con la elegancia más clásica, el solitario seguirá
      siendo una apuesta infalible.</p>

      <p>Si buscas una pieza con mayor impacto visual, los diseños halo o pavé
      pueden ofrecer un brillo extraordinario.</p>

      <p>Para quienes valoran la exclusividad y los detalles artesanales,
      los anillos de inspiración vintage aportan una personalidad única.</p>

      <!-- ------------------------------------------------ -->

      <h2>¿Oro amarillo, blanco o rosa?</h2>

      <p>El metal elegido transforma completamente la personalidad del anillo.
      No solo cambia su apariencia visual; también modifica la forma en la que la piedra refleja la luz.</p>

      <p>El oro amarillo aporta calidez clásica y sofisticación atemporal.
      El oro blanco ofrece una estética moderna y luminosa, ideal para resaltar diamantes.
      El oro rosa transmite romanticismo y delicadeza con un carácter más distintivo.</p>

      <h2>Más que un anillo</h2>
      <p>Un anillo de compromiso no se elige únicamente por su diseño.
      Se elige por lo que representa.</p>

      <p>Será la joya que acompañe fotografías, celebraciones, viajes,
      aniversarios y recuerdos durante décadas.</p>

      <p>Por eso la mejor elección no siempre es la más grande ni la más
      llamativa, sino aquella capaz de reflejar vuestra historia de forma
      auténtica.
      </p>

  </div>
  <div v-if="article.type === 'cuidado'" class="content cuidado-content"><!-- 2 -->
    <p class="intro">Cuidar tus joyas es cuidar las historias que representan. Cada pieza acompaña momentos importantes, recuerdos irrepetibles y emociones que merecen conservarse intactas con el paso del tiempo. Pero con el tiempo, residuos invisibles como cremas, jabón, maquillaje o polvo pueden opacar el reflejo natural de una joya.</p>
    <p> Aunque el oro de 18 quilates y los diamantes son materiales extraordinariamente duraderos, el uso diario puede afectar poco a poco su brillo natural. Residuos invisibles como cremas, perfume, maquillaje, jabón o incluso la grasa natural de la piel terminan formando una fina capa que reduce la luminosidad de la pieza. </p>
    <div class="two-cols">
      <img :src="article.sideImg">
      <div>
        <div class="cuidado-quote">
          “Una joya bien cuidada no solo conserva su brillo, también preserva su historia.”
        </div>

        <p>La buena noticia es que mantener una joya en perfecto estado no requiere cuidados complejos. Pequeños hábitos consistentes marcan una enorme diferencia a largo plazo.</p>
      </div>
    </div>

    
    <h2>Limpieza: el secreto del brillo</h2>
    <p>Para una limpieza segura en casa, suele bastar con agua tibia, jabón neutro y un cepillo de cerdas suaves.</p>
    <p>Frota delicadamente las zonas donde se acumula más suciedad, especialmente alrededor de engastes y piedras. Después, aclara con agua limpia y seca con un paño suave de microfibra.</p>
    
    <h2>Hábitos diarios que marcan la diferencia</h2>
    <p>Muchas joyas se deterioran no por el paso del tiempo, sino por pequeños hábitos cotidianos. Aplicar perfume, laca o crema con la joya puesta puede dejar residuos químicos sobre el metal y las piedras.</p>
    <p>También conviene quitarse anillos o pulseras antes de entrenar, ducharse, nadar o manipular productos de limpieza. El cloro, la sal y ciertos químicos pueden afectar al acabado con el tiempo.</p>
    <h2>Cómo guardarlas correctamente</h2>
    <p>Guardar todas las joyas juntas es uno de los errores más comunes. Aunque parezcan resistentes, el roce constante puede provocar microarañazos, especialmente en superficies pulidas.</p>
    <p>Lo ideal es guardar cada pieza por separado, preferiblemente en estuches acolchados, bolsas suaves o compartimentos individuales. Esto ayuda a conservar tanto el brillo como el acabado original.</p>
    <h2>Revisión profesional</h2>
    <p>Incluso con buenos cuidados en casa, es recomendable realizar revisiones profesionales periódicas, especialmente en anillos con diamantes.</p>
    <p>Un joyero puede comprobar si los engastes siguen firmes, detectar desgaste en garras y realizar una limpieza profunda imposible de conseguir en casa.</p>
    <h2>Belleza eterna</h2>
    <p>El verdadero lujo no está solo en poseer una joya extraordinaria, sino en conservarla generación tras generación.</p>
    <p>Con pequeños cuidados y atención regular, tus joyas seguirán brillando con la misma intensidad con la que llegaron a tu vida. </p>


  </div>
  <!-- 33333333333333333 -->
  <div v-if="article.type === 'stacking'" class="content">
    <p class="intro">El ring stacking ha transformado la forma de llevar joyas. Ya no se trata de una sola pieza protagonista, sino de crear una composición personal capaz de reflejar estilo, emociones y momentos distintos.</p>

    <p>La combinación de anillos permite jugar con volúmenes, metales y piedras preciosas para crear un look único. Algunas personas mezclan oro amarillo y blanco; otras prefieren diseños minimalistas acompañados de diamantes delicados.</p>

    <div class="blog-image">
      <img src="/images/stackOroBlanco.webp">
    </div>

    <h2>El equilibrio visual</h2>
    <p>La clave del stacking perfecto está en encontrar armonía entre tamaños y texturas. Un anillo dominante puede equilibrarse con bandas finas o piezas más discretas.</p>

    <p>También es importante dejar espacio visual para que cada joya respire y mantenga protagonismo sin sobrecargar la mano.</p>

    <div class="two-cols">
      <img :src="article.sideImg">
      <div>
        <h2>Minimalismo y lujo</h2>

        <p>El lujo moderno ya no significa exceso. Muchas de las composiciones más elegantes se basan en líneas limpias, diamantes pequeños y detalles cuidadosamente equilibrados.</p>

        <p>El stacking permite evolucionar tu colección con el tiempo, añadiendo nuevas piezas que acompañen momentos importantes de tu vida.
        </p>
      </div>
    </div>
</div>
<!-- 4 -->
<div v-if="article.type === 'pedida'" class="content">
  <p class="intro">Una pedida perfecta no depende del lujo extremo ni de escenarios imposibles. Depende de crear un momento auténtico, íntimo y emocionalmente inolvidable.</p>
  <p>Algunas personas eligen una cena elegante; otras prefieren un viaje, una playa tranquila o incluso el salón de casa. Lo importante es que el momento represente vuestra historia.</p>

  <div class="blog-image">
    <img src="/images/boda.webp">
  </div>
  <h2>El anillo correcto</h2>
  <p>Elegir el anillo adecuado implica entender la personalidad de quien lo llevará cada día. El diseño perfecto no siempre es el más grande, sino el que conecta emocionalmente.</p>

  <p>Muchas parejas priorizan piezas atemporales que puedan conservarse durante generaciones.</p>
  <div class="two-cols">
    <img :src="article.sideImg">
    <div>
      <h2>Crear un recuerdo eterno</h2>

      <p>La música, la iluminación, las palabras y los pequeños detalles construyen una experiencia mucho más poderosa de lo que parece.</p>

      <p>Porque al final, las personas olvidan lugares y fechas… pero nunca olvidan cómo se sintieron en ese instante.</p>
    </div>
  </div>
</div>
<!-- 5 -->
<div v-if="article.type === 'gemas'" class="content">

  <p class="intro">El topacio y la aguamarina comparten tonalidades azules fascinantes, pero transmiten sensaciones completamente distintas.</p>
  
  <p>Mientras la aguamarina suele asociarse con serenidad y sofisticación ligera, el topacio azul ofrece una presencia más intensa y vibrante.</p>

  <div class="blog-image">
    <img src="/images/AguamarinaCompromisoOroAmarillo.webp">
  </div>

  <h2>La delicadeza de la aguamarina</h2>

  <p>Su tono suave recuerda al mar cristalino y combina especialmente bien con oro blanco o platino.</p>

  <p>Muchas personas la eligen por su estética elegante y luminosa.</p>

  <div class="two-cols">

    <img :src="article.sideImg">

    <div>
      <h2>La intensidad del topacio</h2>

      <p>El topacio azul ofrece una personalidad más moderna y llamativa. Dependiendo de su tonalidad, puede transmitir fuerza, frescura o incluso dramatismo.</p>
      <p>Ambas piedras son preciosas. La elección final depende de la emoción que quieras transmitir.</p>
    </div>
  </div>
</div>

<!-- 6 -->
<div v-if="article.type === 'regalos'" class="content">

  <p class="intro">Encontrar el regalo perfecto no depende únicamente del presupuesto. Las joyas más especiales suelen ser aquellas que consiguen transmitir emoción y significado.</p>
  <p>Desde piezas minimalistas hasta diamantes más sofisticados, cada detalle puede convertirse en un recuerdo eterno.</p>
  <div class="blog-image">
    <img src="/images/colleccionArtic.webp">
  </div>

  <h2>Hasta 500€</h2>
  <p>Charms delicados, pendientes minimalistas o charms personalizados son opciones perfectas para sorprender sin necesidad de grandes presupuestos.</p>
  <!-- AÑADIR LINK A LOS CHARMS REALES y el cuidado de tu joya, que salgan 3 productos en fila / boton descubir más -->

  <h2>Más de 500€</h2>
  <p>Cuando el objetivo es marcar una ocasión importante, los diamantes y piezas de alta joyería se convierten en protagonistas absolutos.</p>

  <div class="two-cols">
    <img src="/images/stack.png" alt="">
      <h2>Joyas que cuentan historias</h2>

      <p>Más allá del precio, una joya representa recuerdos, emociones y momentos irrepetibles.</p>
      <p>Ese es el verdadero valor del lujo: crear algo capaz de acompañarte toda la vida.</p>
    </div>
  </div>
</div>


</section>
</template>

<style lang="sass" scoped>
.article
  background: #FAF8F3
  min-height: 100vh
  width: 100%
  overflow-x: hidden

.hero
  position: relative
  height: 75vh
  overflow: hidden

.hero-img
  width: 100%
  height: 100%
  object-fit: cover
  filter: brightness(55%)
  filter: brightness(45%)
  transform: scale(1.03)

.hero-overlay
  z-index: 2 //texto encima del overlay
  position: absolute
  top: 50%
  left: 50%
  transform: translate(-50%, -50%)
  color: white
  text-align: center
  width: 90%
  max-width: 900px

  h1
    font-size: 54px
    font-weight: 300
    letter-spacing: -1px
    line-height: 1.01
    text-shadow: 0 10px 30px rgba(0,0,0,.25)

  p
    font-size: 17px
    max-width: 720px
    margin: 0 auto
    opacity: .95
.hero::after
  z-index: 1
  content: ""
  position: absolute
  inset: 0
  background: linear-gradient(
    to bottom,
    rgba(0,0,0,.15),
    rgba(0,0,0,.45)
  )

.content
  margin: 80px auto
  max-width: 960px
  padding: 0 24px 100px
.content p
  color: #4A4A4A
  font-size: 16px
  line-height: 1.95
  font-weight: 350

.intro
  position: relative
  padding-left: 30px
  font-size: 22px !important
  line-height: 1.7 !important
  color: #111 !important
  font-weight: 300
  max-width: 900px
.intro::before
  content: ""
  position: absolute
  left: 0
  top: 10px
  width: 2px
  height: 85%
  background: #D4AF37

.holis
  text-align: center
  max-width: 760px
  margin: 70px auto
  padding: 40px 30px
  border-top: 1px solid rgba(212,175,55,.35)
  border-bottom: 1px solid rgba(212,175,55,.35)
  span
    font-size: 24px
    line-height: 1.7
    color: #111
    font-weight: 300
    font-style: italic

.content h2
  font-size: 29px
  margin-top: 72px
  margin-bottom: 20px
  font-weight: 400
  letter-spacing: -.3px
  color: #111
  position: relative
  padding-top: 22px
.content h2::before
  content: ""
  position: absolute
  top: 0
  left: 0
  width: 70px
  height: 2px
  background: #D4AF37

.two-cols
  display: grid
  grid-template-columns: 1fr 1fr
  gap: 60px
  align-items: center
  margin: 70px 0

.two-cols img
  box-shadow: 0 20px 60px rgba(0,0,0,.10)
  width: 100%
  height: 420px
  object-fit: cover
  border-radius: 20px

.blog-image
  margin: 60px 0

.blog-image img
  box-shadow: 0 30px 80px rgba(0,0,0,.12)
  width: 100%
  height: 470px
  object-fit: cover
  border-radius: 24px

// imagenes
.blog-image img,
.two-cols img
  transition: .7s ease

.blog-image img:hover,
.two-cols img:hover
  transform: scale(1.02)


// BLOG CUIDADO 2
.cuidado-quote
  margin: 70px auto
  padding: 40px 50px
  max-width: 820px
  text-align: center
  font-size: 30px
  line-height: 1.7
  font-style: italic
  font-weight: 300
  color: #111
  border-top: 1px solid rgba(212,175,55,.35)
  border-bottom: 1px solid rgba(212,175,55,.35)

.cuidado-content
  max-width: 1020px

.cuidado-content p
  font-size: 18px
  line-height: 1.9
  color: #555
  font-weight: 320
  letter-spacing: .15px

.cuidado-content .intro
  font-size: 25px !important
  line-height: 1.8 !important
  max-width: 950px
  color: #151515 !important

.cuidado-content h2
  font-size: 29px //o 28
  margin-top: 75px
  margin-bottom: 22px
  font-weight: 390
  letter-spacing: -.4px

.cuidado-content h2::before
  width: 90px
  height: 2px
  background: linear-gradient(to right, #D4AF37, rgba(212,175,55,.25))

.cuidado-content .two-cols
  gap: 80px
  margin: 90px 0

.cuidado-content .two-cols img
  height: 500px
  border-radius: 26px
  box-shadow: 0 30px 80px rgba(0,0,0,.14)

.cuidado-content .blog-image img
  height: 560px
  border-radius: 30px
  box-shadow: 0 35px 90px rgba(0,0,0,.16)

@media(max-width: 900px)
  .hero
    height: 60vh

  .hero-overlay h1
    font-size: 34px

  .hero-overlay p
    font-size: 17px

  .two-cols
    grid-template-columns: 1fr

  .two-cols img
    height: 350px

  .blog-image img
    height: 350px

  .content h2
    font-size: 28px
</style>