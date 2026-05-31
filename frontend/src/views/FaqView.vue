<script setup>
import WhatsappExpert from "@/components/WhatsappExpert.vue";
import { useRouter } from "vue-router";
const router = useRouter();
const irExperiencia = () => {
  router.push("/experiencia");
};
</script>
<template>
  <section class="faq">
    <section class="hero_faq">
      <div class="overlay">
        <h1>Preguntas Frecuentes</h1>
        <p class="desc">Conoce la historia detrás de nuestras joyas, la procedencia de nuestros materiales exclusivos y la magia de nuestras experiencias privadas. Aquí encontrarás las respuestas a las dudas más habituales para que tu elección sea perfecta.</p>
      </div>
  </section>

    <div class="faqContainer">
      <div class="item">
        <h2>¿De qué están hechas nuestras joyas?</h2>
        <p>Todas nuestras piezas están elaboradas en oro sólido de 18 quilates, uno de los materiales más valorados en alta joyería por su equilibrio perfecto entre belleza, resistencia y durabilidad.</p>
        <p>El oro de 18K contiene una alta pureza que permite conservar su brillo con el paso de los años, manteniendo una apariencia elegante incluso con un uso diario. A diferencia de otros materiales bañados o chapados, nuestras joyas están pensadas para acompañarle toda la vida.</p>
        <p>Cada pieza ha sido diseñada no solo como un accesorio, sino como una
          joya atemporal capaz de convertirse en parte de una historia familiar,
          pudiendo incluso pasar de generación en generación.</p>
      </div>
      <div class="item">
        <h2>¿Por qué utilizamos diamantes naturales?</h2>
        <p>El diamante es considerado la piedra preciosa más resistente del
          mundo. En la escala de Mohs —utilizada para medir la dureza de los
          minerales— el diamante alcanza el nivel 10, la máxima puntuación
          existente.</p>
        <p>Otras piedras preciosas suelen encontrarse entre los niveles 7 y 9,
          como la amatista, el topacio o incluso el zafiro. Aunque siguen siendo
          gemas valiosas y hermosas, presentan una resistencia inferior frente
          al desgaste cotidiano.</p>
        <p>Por esta razón, gran parte de nuestras colecciones incorporan
          diamantes naturales cuidadosamente seleccionados, capaces de conservar
          su brillo y perfección durante décadas.</p>
        <p>Más allá de su belleza, el diamante representa eternidad, fuerza y
          permanencia, valores que forman parte de la esencia de nuestra marca.</p>
      </div>
      <div class="item">
        <h2>¿Qué es la experiencia “Private Experience”?</h2>
        <p>Private Experience es una experiencia privada y personalizada creada
          para quienes desean descubrir nuestras joyas de una manera exclusiva,
          íntima y completamente diferente a una compra tradicional.</p>
        <p>Durante la experiencia, el cliente puede probar diferentes anillos,
          diamantes y piezas de alta joyería en un entorno elegante y relajado,
          acompañado de una atención completamente personalizada.</p>
        <p>Nuestro objetivo es transformar la elección de una joya en un momento
          memorable, emocional y sofisticado, especialmente en ocasiones tan
          importantes como compromisos, aniversarios o regalos únicos.</p>
      </div>

      <div class="item">
        <h2>¿Cómo puedo solicitar una reserva?</h2>
        <p>Las reservas para la experiencia privada pueden solicitarse a través
          de nuestra plataforma digital.</p>
        <p>Una vez realizada la solicitud, nuestro equipo contactará de manera
          personalizada para coordinar todos los detalles de la experiencia.</p>
        <p>Con el objetivo de ofrecer un servicio exclusivo y totalmente
          personalizado, la localización exacta y los detalles de la cita se
          facilitan tras la confirmación de la reserva.</p>
        <p>Este enfoque permite garantizar privacidad, atención individual y una
          experiencia mucho más cuidada y premium para cada cliente.</p>
        <button @click="irExperiencia">Descubrir Private Experience</button>
      </div>

      <div class="item imageCard reverse">
        <div class="image">
          <img src="" alt="" />
        </div>

        <div class="text">
          <h2>¿Cada joya es única?</h2>

          <p>Sí. Cada una de nuestras piezas posee detalles únicos que la
            convierten en una joya exclusiva e irrepetible.</p>

          <p>Trabajamos principalmente con diamantes naturales cuidadosamente
            seleccionados por su brillo, pureza y carácter. Al tratarse de gemas
            creadas por la propia naturaleza a lo largo de millones de años,
            cada diamante presenta matices y reflejos únicos que hacen que no
            existan dos piezas exactamente iguales.</p>

          <p>Además de la selección de piedras, prestamos especial atención a la
            armonía del diseño, el equilibrio visual y la elegancia de cada
            acabado, creando joyas pensadas para transmitir sofisticación y
            personalidad propia.</p>

          <p>Nuestro objetivo no es únicamente crear accesorios, sino piezas
            capaces de emocionar, representar momentos importantes y convertirse
            en símbolos eternos que puedan acompañar toda una vida.</p>
          <p>Esa combinación entre artesanía, materiales nobles y exclusividad es
            lo que transforma cada joya en una experiencia única.</p>
        </div>
        
      </div>
      <div class="item imageCard">
        <div class="text">
          <h2>¿Cómo cuidar una joya de alta joyería?</h2>

          <p>Una joya no solo conserva brillo, también conserva recuerdos,
              emociones y momentos irrepetibles. Por eso, cada una de nuestras
              piezas está diseñada para acompañarle durante toda la vida
              manteniendo su elegancia y esencia intactas con el paso del
              tiempo.</p>

          <p>Trabajamos con oro sólido de 18 quilates y diamantes naturales de
              alta calidad, materiales reconocidos por su resistencia y
              durabilidad. Aun así, pequeños cuidados diarios ayudan a preservar
              su luminosidad original y proteger cada detalle de la pieza.</p>

          <p>Guardar las joyas individualmente, evitar el contacto con
              productos químicos agresivos y realizar limpiezas suaves
              periódicas permite mantener intacto el brillo que convierte cada
              joya en algo eterno.</p>
          <p>Porque una joya de alta joyería no está pensada únicamente para
              hoy, sino para convertirse en parte de una historia que pueda
              acompañar futuras generaciones.</p>

          <div class="extraBox">
            <h4>¿Quieres aprender más sobre cómo cuidar tus joyas favoritas?</h4>

            <p>Descubra consejos exclusivos para conservar el brillo, la
                elegancia y la belleza eterna de sus piezas más especiales.</p>

            <router-link to="/blog/2" class="learnBtn">Leer artículo completo</router-link>
          </div>
        </div>

        <div class="image">
          <img src="" alt="" />
        </div>
      </div>
    </div>
    <WhatsappExpert />
  </section>
  
</template>

<style lang="sass" scoped>
.faq
  width: 100%
  .hero_faq
    height: 75vh
    min-height: 75vh
    // max-height: 75vh
    background: url('/images/ringAqua.webp') center/cover
    position: relative

  .overlay
    position: absolute
    inset: 0
    background: rgba(0,0,0,.45)
    display: flex
    flex-direction: column
    justify-content: center
    align-items: center
    text-align: center
    // padding: 30px
    
    h1 //titulo
      font-size: 38px
      font-family: "Outfit", sans-serif;
      max-width: 800px
      font-weight: 460
      line-height: 1.1
      color: white
    .desc //titulo chico
      max-width: 750px
      margin-top: 24px
      line-height: 1.8
      font-size: 18px
      color: white


.faqContainer
    max-width: 1100px
    margin: 100px auto
    display: flex
    flex-direction: column
    gap: 40px
    padding: 0 30px

.item
  cursor: pointer
  background: white
  padding: 50px
  border-radius: 28px
  border: 1px solid rgba(0,0,0,.06)
  box-shadow: 0 12px 40px rgba(0,0,0,.04)
  transition: all .45s ease
  position: relative
  overflow: hidden //línea dorada sale tal q asi recta pero con esta propiedad sale de la nada
  
  &:hover
    transform: translateY(-8px)
    box-shadow: 0 25px 60px rgba(0,0,0,.12)
    border-color: rgba(212,175,55,.4)

// línea dorada al hacer hover !!!!!!!!!!!!!!!!!!!!!!1
.item::before
    content: ""
    position: absolute
    left: 0
    top: 0
    width: 0
    height: 4px
    background: #D4AF37
    transition: .4s
.item:hover::before
    width: 100%

h2
  margin-bottom: 22px
  color: #222
  font-size: 28px
  font-weight: 500
  transition: .3s
p
  line-height: 2
  color: #2F2F2F
  font-size: 17px
  margin-bottom: 20px

button
  margin-top: 8px
  background: #111
  color: white
  border: none
  padding: 16px 30px
  border-radius: 55px
  font-size: 15px
  transition: all .35s ease
  &:hover
    background: #D4AF37
    transform: translateY(-3px)

@media(max-width:768px)
.hero_faq
  height: 60vh
.overlay h1
  font-size: 36px

.overlay .desc
  font-size: 16px

.item
  padding: 25px
  .extraBox
    margin-top: 30px
    padding: 25px
    background: #F8F5EF
    border-radius: 16px
    border: 1px solid #eee
  h4
    margin-bottom: 3px
    color: #3A3A38
  p
    margin-bottom: 20px //espacio entre p y boton
  .learnBtn
    display: inline-block
    padding: 14px 26px
    border-radius: 55px
    background: #111
    color: white
    text-decoration: none
    transition: .3s
    &:hover
      background: #D4AF37
      transform: translateY(-3px)

@media (max-width: 480px)
  .hero_faq
    height: 50vh
    min-height: 48px //así queda igual q la de compromiso y private

  .overlay h1
    font-size: 24px

  .overlay .desc
    font-size: 14px
    line-height: 1.6

</style>