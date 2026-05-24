<script setup>
import { useRoute } from 'vue-router'
import { computed } from 'vue'

const route = useRoute()

const articles = {
  1: {
    hero: "/images/compromiso.jpg",
    sideImg: "/images/radiantCut.jpg",
    title: "Guía definitiva del anillo de compromiso",
    subtitle: "Tu mapa para navegar entre quilates, cortes y estilos sin perder la esencia del amor.",
    type: "compromiso"
  },

  2: {
    hero: "/images/cuidadoJoyas.jpg",
    sideImg: "/images/cuidadoJoyas.jpg",
    title: "Guía de cuidado de joyas",
    subtitle: "Aprende a mantener el brillo de tus piezas favoritas.",
    type: "cuidado"
  },

  3: {
    hero: "/images/stackOroBlanco.jpg",
    sideImg: "/images/stackOroBlanco.jpg",
    title: "El arte del ring stacking",
    subtitle: "Tus manos, tus reglas: domina la tendencia que redefine el lujo moderno.",
    type: "stacking"
  },

  4: {
    hero: "/images/boda.jpg",
    sideImg: "/images/boda.jpg",
    title: "Cómo hacer la pedida perfecta",
    subtitle: "Ideas, emociones y pequeños detalles para crear un momento inolvidable.",
    type: "pedida"
  },

  5: {
    hero: "/images/AguamarinaCompromisoOroAmarillo.jpg",
    sideImg: "/images/AguamarinaCompromisoOroAmarillo.jpg",
    title: "Topacio vs Aguamarina",
    subtitle: "Dos piedras azules, dos formas distintas de entender la elegancia.",
    type: "gemas"
  },

  6: {
    hero: "/images/colleccionArtic.jpg",
    sideImg: "/images/colleccionArtic.jpg",
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

    <p>Por eso, esta guía nace para ayudarte a comprender los aspectos clave que debes tener en cuenta 
      antes de elegir la joya que marcará uno de los momentos más importantes de tu vida.</p>
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

    <h2>Elegir el estilo adecuado</h2>
    <p>Existen múltiples estilos de anillos de compromiso, desde el clásico solitario hasta diseños pavé, 
      halo o vintage. Cada uno transmite una personalidad distinta.</p>

    <h2>¿Oro amarillo, blanco o rosa?</h2>
    <p>El metal elegido influye tanto en la estética como en la personalidad del anillo.</p>

    <h2>Una joya para toda la vida...</h2>
    <p>Más allá de tendencias y estilos, un anillo de compromiso representa una promesa eterna.</p>

  </div>
  <div v-if="article.type === 'cuidado'" class="content"><!-- 2 -->
    <p class="intro">Cuidar tus joyas es cuidar las historias que representan. Cada pieza acompaña momentos importantes, recuerdos irrepetibles y emociones que merecen conservarse intactas con el paso del tiempo.</p>
    <p>Aunque el oro y los diamantes son materiales duraderos, el uso diario puede afectar poco a poco su brillo.</p>
    <div class="two-cols">
      <img :src="article.sideImg">
      <div>
        <h2>Limpieza: el secreto del brillo</h2>

        <p>Agua tibia, jabón neutro y un cepillo suave bastan para eliminar residuos sin dañar la pieza.</p>
      </div>
    </div>

    <h2>Hábitos diarios</h2>
    <p>Perfumes, cremas o productos de limpieza pueden afectar al oro con el tiempo.</p>

    <h2>Guardarlas correctamente</h2>
    <p>Guardar cada joya por separado evita arañazos.</p>

    <h2>Belleza eterna</h2>
    <p>Con pequeños cuidados, tus joyas brillarán durante generaciones.</p>
  </div>
  <!-- 33333333333333333 -->
  <div v-if="article.type === 'stacking'" class="content">
  <p class="intro">El ring stacking ha transformado la forma de llevar joyas. Ya no se trata de una sola pieza protagonista, sino de crear una composición personal capaz de reflejar estilo, emociones y momentos distintos.</p>

  <p>La combinación de anillos permite jugar con volúmenes, metales y piedras preciosas para crear un look único. Algunas personas mezclan oro amarillo y blanco; otras prefieren diseños minimalistas acompañados de diamantes delicados.</p>

  <div class="blog-image">
    <img src="/images/stackOroBlanco.jpg">
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
    <img src="/images/boda.jpg">
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
    <img src="/images/AguamarinaCompromisoOroAmarillo.jpg">
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
    <img src="/images/colleccionArtic.jpg">
  </div>

  <h2>Hasta 500€</h2>
  <p>Charms delicados, pendientes minimalistas o charms personalizados son opciones perfectas para sorprender sin necesidad de grandes presupuestos.</p>
  <!-- AÑADIR LINK A LOS CHARMS REALES y el cuidado de tu joya, que salgan 3 productos en fila / boton descubir más -->

  <h2>Más de 500€</h2>

  <p>Cuando el objetivo es marcar una ocasión importante, los diamantes y piezas de alta joyería se convierten en protagonistas absolutos.</p>

  <div class="two-cols">
    <img :src="article.sideImg">
    <div>
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

.hero-overlay
  position: absolute
  top: 50%
  left: 50%
  transform: translate(-50%, -50%)
  color: white
  text-align: center
  width: 90%
  max-width: 900px

  h1
    font-size: 52px
    margin-bottom: 20px
    line-height: 1.2

  p
    font-size: 20px
    line-height: 1.7

.content
  max-width: 950px
  margin: 90px auto
  padding: 0 25px 120px

.content p
  color: #555
  line-height: 2
  margin-bottom: 28px
  font-size: 17px

.intro
  font-size: 22px !important
  line-height: 1.9 !important
  color: #222 !important
  margin-bottom: 45px !important

.content h2
  font-size: 34px
  margin: 70px 0 25px
  color: #111
  font-weight: 500

.two-cols
  display: grid
  grid-template-columns: 1fr 1fr
  gap: 60px
  align-items: center
  margin: 70px 0

.two-cols img
  width: 100%
  height: 500px
  object-fit: cover
  border-radius: 20px

.blog-image
  margin: 60px 0

.blog-image img
  width: 100%
  height: 550px
  object-fit: cover
  border-radius: 24px

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