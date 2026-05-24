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
    <div class="hero">
      <h1>Preguntas Frecuentes</h1>
      <p>
        Descubra todo sobre nuestras joyas, materiales y experiencias privadas.
      </p>
    </div>

    <div class="faqContainer">
      <div class="item">
        <h2>¿De qué están hechas nuestras joyas?</h2>

        <p>
          Todas nuestras piezas están elaboradas en oro sólido de 18 quilates,
          uno de los materiales más valorados en alta joyería por su equilibrio
          perfecto entre belleza, resistencia y durabilidad.
        </p>

        <p>
          El oro de 18K contiene una alta pureza que permite conservar su brillo
          con el paso de los años, manteniendo una apariencia elegante incluso
          con un uso diario. A diferencia de otros materiales bañados o
          chapados, nuestras joyas están pensadas para acompañarle toda la vida.
        </p>

        <p>
          Cada pieza ha sido diseñada no solo como un accesorio, sino como una
          joya atemporal capaz de convertirse en parte de una historia familiar,
          pudiendo incluso pasar de generación en generación.
        </p>
      </div>

      <div class="item">
        <h2>¿Por qué utilizamos diamantes naturales?</h2>

        <p>
          El diamante es considerado la piedra preciosa más resistente del
          mundo. En la escala de Mohs —utilizada para medir la dureza de los
          minerales— el diamante alcanza el nivel 10, la máxima puntuación
          existente.
        </p>

        <p>
          Otras piedras preciosas suelen encontrarse entre los niveles 7 y 9,
          como la amatista, el topacio o incluso el zafiro. Aunque siguen siendo
          gemas valiosas y hermosas, presentan una resistencia inferior frente
          al desgaste cotidiano.
        </p>

        <p>
          Por esta razón, gran parte de nuestras colecciones incorporan
          diamantes naturales cuidadosamente seleccionados, capaces de conservar
          su brillo y perfección durante décadas.
        </p>

        <p>
          Más allá de su belleza, el diamante representa eternidad, fuerza y
          permanencia, valores que forman parte de la esencia de nuestra marca.
        </p>
      </div>

      <div class="item">
        <h2>¿Qué es la experiencia “Private Experience”?</h2>

        <p>
          Private Experience es una experiencia privada y personalizada creada
          para quienes desean descubrir nuestras joyas de una manera exclusiva,
          íntima y completamente diferente a una compra tradicional.
        </p>

        <p>
          Durante la experiencia, el cliente puede probar diferentes anillos,
          diamantes y piezas de alta joyería en un entorno elegante y relajado,
          acompañado de una atención completamente personalizada.
        </p>

        <p>
          Nuestro objetivo es transformar la elección de una joya en un momento
          memorable, emocional y sofisticado, especialmente en ocasiones tan
          importantes como compromisos, aniversarios o regalos únicos.
        </p>

        <button @click="irExperiencia">Descubrir Private Experience</button>
      </div>

      <div class="item">
        <h2>¿Cómo puedo solicitar una reserva?</h2>

        <p>
          Las reservas para la experiencia privada pueden solicitarse a través
          de nuestra plataforma digital.
        </p>

        <p>
          Una vez realizada la solicitud, nuestro equipo contactará de manera
          personalizada para coordinar todos los detalles de la experiencia.
        </p>

        <p>
          Con el objetivo de ofrecer un servicio exclusivo y totalmente
          personalizado, la localización exacta y los detalles de la cita se
          facilitan tras la confirmación de la reserva.
        </p>

        <p>
          Este enfoque permite garantizar privacidad, atención individual y una
          experiencia mucho más cuidada y premium para cada cliente.
        </p>
      </div>

      <div class="item imageCard reverse">
        <div class="image">
          <img src="" alt="" />
        </div>

        <div class="text">
          <h2>¿Cada joya es única?</h2>

          <p>
            Sí. Cada una de nuestras piezas posee detalles únicos que la
            convierten en una joya exclusiva e irrepetible.
          </p>

          <p>
            Trabajamos principalmente con diamantes naturales cuidadosamente
            seleccionados por su brillo, pureza y carácter. Al tratarse de gemas
            creadas por la propia naturaleza a lo largo de millones de años,
            cada diamante presenta matices y reflejos únicos que hacen que no
            existan dos piezas exactamente iguales.
          </p>

          <p>
            Además de la selección de piedras, prestamos especial atención a la
            armonía del diseño, el equilibrio visual y la elegancia de cada
            acabado, creando joyas pensadas para transmitir sofisticación y
            personalidad propia.
          </p>

          <p>
            Nuestro objetivo no es únicamente crear accesorios, sino piezas
            capaces de emocionar, representar momentos importantes y convertirse
            en símbolos eternos que puedan acompañar toda una vida.
          </p>

          <p>
            Esa combinación entre artesanía, materiales nobles y exclusividad es
            lo que transforma cada joya en una experiencia única.
          </p>
        </div>
        <div class="item imageCard">
          <div class="text">
            <h2>¿Cómo cuidar una joya de alta joyería?</h2>

            <p>
              Una joya no solo conserva brillo, también conserva recuerdos,
              emociones y momentos irrepetibles. Por eso, cada una de nuestras
              piezas está diseñada para acompañarle durante toda la vida
              manteniendo su elegancia y esencia intactas con el paso del
              tiempo.
            </p>

            <p>
              Trabajamos con oro sólido de 18 quilates y diamantes naturales de
              alta calidad, materiales reconocidos por su resistencia y
              durabilidad. Aun así, pequeños cuidados diarios ayudan a preservar
              su luminosidad original y proteger cada detalle de la pieza.
            </p>

            <p>
              Guardar las joyas individualmente, evitar el contacto con
              productos químicos agresivos y realizar limpiezas suaves
              periódicas permite mantener intacto el brillo que convierte cada
              joya en algo eterno.
            </p>

            <p>
              Porque una joya de alta joyería no está pensada únicamente para
              hoy, sino para convertirse en parte de una historia que pueda
              acompañar futuras generaciones.
            </p>

            <div class="extraBox">
              <h4>
                ¿Quieres aprender más sobre cómo cuidar tus joyas favoritas?
              </h4>

              <p>
                Descubra consejos exclusivos para conservar el brillo, la
                elegancia y la belleza eterna de sus piezas más especiales.
              </p>

              <router-link to="/blog/2" class="learnBtn">
                Leer artículo completo
              </router-link>
            </div>
          </div>

          <div class="image">
            <img src="" alt="" />
          </div>
        </div>
      </div>
    </div>
    <WhatsappExpert />
  </section>
  
</template>

<style lang="sass" scoped>
.faq
    max-width: 1200px
    margin: auto
    padding: 60px 30px

.hero
    text-align: center
    margin-bottom: 70px

h1
    font-size: 52px
    font-weight: 300
    letter-spacing: 4px
    margin-bottom: 20px
    color: #3A3A38

p
    color: #777
    font-size: 18px

.faqContainer
    display: flex
    flex-direction: column
    gap: 35px

.item
    background: white
    padding: 40px
    border-radius: 18px
    box-shadow: 0 10px 30px rgba(0,0,0,.05)

h2
    margin-bottom: 20px
    color: #3A3A38
    font-weight: 500

p
    line-height: 1.9
    color: #555
    margin-bottom: 18px

button
    margin-top: 20px
    background: #111
    color: white
    border: none
    padding: 14px 28px
    border-radius: 40px
    cursor: pointer
    transition: .3s

    &:hover
        background: #D4AF37

@media(max-width:768px)

.hero h1
    font-size: 36px

.item
    padding: 25px

    .extraBox
        margin-top: 30px
        padding: 25px
        background: #F8F5EF
        border-radius: 16px
        border: 1px solid #eee

    h4
        margin-bottom: 12px
        color: #3A3A38

    p
        margin-bottom: 20px

    .learnBtn
        display: inline-block
        padding: 14px 26px
        border-radius: 40px
        background: #111
        color: white
        text-decoration: none
        transition: .3s

    &:hover
        background: #D4AF37
</style>