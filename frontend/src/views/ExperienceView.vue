<script setup>
import ReservaCita from "@/components/ReservaCita.vue";
import WhatsappExpert from "@/components/WhatsappExpert.vue";
</script>

<template>
  <section class="hero">
    <div class="hero-text">
      <h1>La experiencia comienza antes del anillo</h1>
      <p>En nuestra casa de joyería creemos que una joya importante no se compra,
        se vive. Cada pieza está pensada para acompañar momentos únicos,
        irrepetibles y profundamente personales.
      </p>
    </div>
  </section>

  <section class="story">
    <div class="container">
      <h2>Nuestra filosofía</h2>
      <p>Aunque puedas descubrir nuestras colecciones online, nuestras joyas
        están diseñadas para ser vistas, sentidas y probadas en persona. La
        elección de un anillo de compromiso o una joya especial es un momento
        íntimo que merece tiempo, calma y asesoramiento experto.
      </p>

      <p>Por eso, nuestra tienda online funciona como escaparate digital. Un
        espacio donde inspirarte, descubrir diseños y crear tu lista de deseos.
        La compra final siempre sucede en nuestro atelier mediante cita privada.
      </p>
    </div>
  </section>

  <section class="experience">
    <div class="container grid">
      <div>
        <h2>La cita privada</h2>
        <p>
          Cada cita está pensada como una experiencia exclusiva y personalizada.
          Durante tu visita podrás probar anillos, comparar diamantes, descubrir
          tamaños reales y entender cómo cada pieza se adapta a ti.
        </p>

        <p>
          Nuestro equipo te acompaña en todo el proceso: desde la elección del
          diseño hasta los detalles técnicos del diamante, el oro y el ajuste
          perfecto.
        </p>
      </div>

      <div>
        <h2>Un momento único</h2>
        <p>
          Muchas personas llegan con ideas, dudas o incluso nervios. Y salen con
          una historia, una emoción y la joya perfecta.
        </p>

        <p>
          Elegir una joya importante es un recuerdo que dura toda la vida. Por
          eso cuidamos cada detalle de la experiencia.
        </p>
      </div>
    </div>
  </section>

  <section class="cta">
    <div class="luxury-container">
      <h2>Reserva tu cita privada</h2>

      <p>
        Agenda una visita en nuestro atelier y vive la experiencia completa. Sin
        compromiso, sin prisa y con asesoramiento personalizado.
      </p>

      <!-- FORMULARIO -->
<ReservaCita />

<div class="luxury-row">
  <div class="luxury-note">
    <h3>Una experiencia preparada exclusivamente para ti</h3>

    <p>Antes de cada visita, nuestro equipo prepara cuidadosamente una
      selección personalizada según tus intereses y preferencias.</p>

    <p>
      Algunas personas buscan anillos de compromiso, otras desean descubrir
      diamantes excepcionales o piezas para celebrar momentos únicos.
    </p>
  </div>

  <div class="whatsapp-box">
    <WhatsappExpert class="compact" />
    <!-- sobrescribir  + añadir estilos desde fuera -->
  </div>
</div>
    </div>
  </section>
</template>

<style lang="sass" scoped>
section
  padding: 80px 20px

.container
  max-width: 1100px
  margin: auto

.hero
  background: #111
  color: white
  text-align: center
  padding: 120px 20px

.hero-text
  max-width: 700px
  margin: auto

.hero h1
  font-size: 40px
  margin-bottom: 20px

.story p
  line-height: 1.8
  margin-top: 15px
  color: #555

.grid
  display: grid
  grid-template-columns: 1fr 1fr
  gap: 60px

.experience p
  margin-top: 15px
  color: #555
  line-height: 1.8

.cta
  background: #FAF8F3
  text-align: center

.cta h2
  margin-bottom: 15px

.cta p
  margin-bottom: 25px
  color: #666


.luxury-row
  display: flex
  gap: 30px
  margin-top: 40px
  align-items: stretch

  @media (max-width: 768px)
    flex-direction: column

.luxury-note
  flex: 2
  background: white
  padding: 40px
  border-radius: 20px
  box-shadow: 0 15px 40px rgba(0,0,0,.08)
  text-align: left

  h3
    margin-bottom: 20px
    color: #111
    font-size: 24px

  p
    color: #666
    line-height: 1.8
    margin-bottom: 15px
.whatsapp-box
  background: linear-gradient(to bottom, #ffffff, #f9f7f2)
  flex: 1
  border-radius: 20px
  box-shadow: 0 15px 40px rgba(0,0,0,.08)
  display: flex
  align-items: center
  justify-content: center
  padding: 20px


.luxury-note, .whatsapp-box
  transition: all .3s ease

  &:hover
    transform: translateY(-5px)
    box-shadow: 0 20px 50px rgba(0,0,0,.12)

// AJUSTE SOLO PARA WHATSAPP EN ESTA VIEW 
.whatsapp-box :deep(.whatsappBox.compact)
  margin-top: 0
  flex-direction: column
  justify-content: center
  text-align: center
  height: 100%

.whatsapp-box :deep(.compact .left)
  flex-direction: column
  align-items: center
  text-align: center
  gap: 15px

.whatsapp-box :deep(.compact .button)
  margin-top: 10px
</style>