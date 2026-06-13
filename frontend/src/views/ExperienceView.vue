<script setup>
import ReservaCita from "@/components/ReservaCita.vue";
import WhatsappExpert from "@/components/WhatsappExpert.vue";
</script>
<template>
  <div id="app-layout">
  <section class="hero_experience">
  <div class="overlay">
    <p class="mini">PRIVATE EXPERIENCE</p>
    <h1>El verdadero lujo de la alta joyería comienza mucho antes de lucir la pieza</h1>
    <p class="desc">En nuestra casa de joyería creemos que una joya importante no se compra, se vive... <br> Cada pieza está pensada para acompañar momentos únicos y profundamente personales.</p>
  </div>
</section>
  <section class="story">
    <div class="container">
      <h2>Nuestra filosofía</h2>
      <p>Aunque puedas descubrir nuestras colecciones online, nuestras joyas están diseñadas para ser vistas, sentidas y probadas en persona. La elección de un anillo de compromiso o una joya especial es un momento íntimo que merece tiempo, calma y asesoramiento experto.</p>
      <p>Por eso, nuestra tienda online funciona como escaparate digital. Un
        espacio donde inspirarte, descubrir diseños y crear tu lista de deseos.
        La compra final siempre sucede en nuestro atelier mediante cita privada.</p>
    </div>
  </section>

  <section class="experience">
    <div class="container grid">
      <div>
        <h2>La cita privada</h2>
        <p>Cada cita está pensada como una experiencia exclusiva y personalizada.
          Durante tu visita podrás probar anillos, comparar diamantes, descubrir
          tamaños reales y entender cómo cada pieza se adapta a ti.</p>
        <p>Nuestro equipo te acompaña en todo el proceso: desde la elección del
          diseño hasta los detalles técnicos del diamante, el oro y el ajuste
          perfecto.</p>
      </div>
      <div>
        <h2>Un momento único</h2>
        <p>Muchas personas llegan con ideas, dudas o incluso nervios. Y salen con
          una historia, una emoción y la joya perfecta.</p>

        <p>Elegir una joya importante es un recuerdo que dura toda la vida. Por
          eso cuidamos cada detalle de la experiencia.</p>
      </div>
    </div>
  </section>

  <section class="cta">
    <div class="luxury-container">
      <h2>Reserva tu cita privada</h2>
      <p>Te invitamos a descubrir nuestro atelier y disfrutar de una auténtica experiencia de lujo a tu medida. Déjate mimar con un asesoramiento personalizado y relajado, donde cada detalle importa.</p>
<!-- FORMULARIO -->
<div class="formReserva">
  <ReservaCita />
</div>

<div class="luxury-row">
  <div class="luxury-note">
    <h3>Una experiencia preparada exclusivamente para ti</h3>
    <p>Antes de cada visita, nuestro equipo prepara cuidadosamente una
      selección personalizada según tus intereses y preferencias.</p>
    <p>Algunas personas buscan anillos de compromiso, otras desean descubrir
      diamantes excepcionales o piezas para celebrar momentos únicos.</p>
  </div>
  <div class="whatsapp-box">
    <WhatsappExpert class="compact" />
    <!-- sobrescribir  + añadir estilos desde fuera -->
  </div>
</div>
    </div>
  </section>
  </div>
</template>
<style lang="sass" scoped>
section
  padding: 80px 20px
.container
  max-width: 1100px
  margin: auto
.hero_experience
  height: 75vh
  background: url('/images/faq13.webp') center/cover
  position: relative
.overlay
  position: absolute
  inset: 0
  background: rgba(0,0,0,.35)
  display: flex
  flex-direction: column
  justify-content: center
  align-items: center
  text-align: center
  color: white
  padding: 30px
  h1 //titulo
    font-size: 38px
    font-family: "Outfit", sans-serif;
    max-width: 800px
    font-weight: 460
    line-height: 1.1
.desc //titulo chico
  max-width: 750px
  margin-top: 24px
  line-height: 1.8
  font-size: 18px

.mini
  letter-spacing: 5.8px
  font-size: 14px
  margin-bottom: 18px
  font-weight: 630
  color: #D4AF37

.story p
  line-height: 1.75
  margin-top: 10px
  color: #555
.grid
  display: grid
  grid-template-columns: 1fr 1fr
  gap: 60px
.experience p
  color: #555
  line-height: 1.75
  margin-top: 10px
.formReserva
  max-width: 550px
  margin: 30px auto 0
  background: white
  padding: 40px
  border-radius: 30px
  box-shadow: 0 20px 50px rgba(0,0,0,.05)
.cta
  background: #FAF8F3
  text-align: center

.cta h2
  margin: 0 auto 14px
  max-width: 500px

.cta p
  max-width: 620px
  margin: 0 auto 22px
  color: #666
  line-height: 1.7

// INFO + WHATSAPP
.luxury-row
  display: grid
  grid-template-columns: 1.05fr .75fr
  gap: 28px
  margin-top: 40px
  max-width: 950px
  margin-left: auto
  margin-right: auto

.luxury-note
  background: white
  padding: 34px
  border-radius: 32px
  border: 1px solid rgba(212,175,55,.12)
  box-shadow: 0 15px 45px rgba(0,0,0,.06)
  transition: .35s
  &:hover
    transform: translateY(-6px)
    box-shadow: 0 25px 60px rgba(0,0,0,.10)
  h3
    font-size: 22px
    font-weight: 400
    line-height: 1.2
    margin-bottom: 25px
  p
    font-size: 16px
    line-height: 1.9
    color: #666
.whatsapp-box
  background: linear-gradient(to bottom, #ffffff, #f9f7f2)
  border-radius: 32px
  padding: 24px
  min-height: 280px
  border: 1px solid rgba(212,175,55,.12)
  box-shadow: 0 15px 45px rgba(0,0,0,.06)
  display: flex
  align-items: center
  justify-content: center
  transition: .35s
  &:hover
    transform: translateY(-6px)
    box-shadow: 0 25px 60px rgba(0,0,0,.10)

// FORZAR ESTILOS WHATSAPP q ocupe toda la altura
.whatsapp-box :deep(.whatsappBox)
  width: 100% !important
  height: 100%
  margin: 0
  box-shadow: none
  border: none
  background: transparent

.whatsapp-box :deep(.whatsappBox.compact)
  display: flex
  flex-direction: column
  justify-content: center
  text-align: center
  gap: 20px
.whatsapp-box :deep(.compact .left)
  flex-direction: column
  align-items: center
  text-align: center
  gap: 18px
.whatsapp-box :deep(.compact .button)
  margin-top: 15px

@media (max-width: 992px)
  .grid
    grid-template-columns: 1fr
    gap: 50px
  .luxury-row
    grid-template-columns: 1fr
  .hero_experience h1
    font-size: 52px

@media (max-width: 768px)
  .hero_experience
    height: 60vh

  .overlay h1
    font-size: 30px

  .desc
    font-size: 16px
  .luxury-row
    grid-template-columns: 1fr
    gap: 20px
  .luxury-note
    padding: 30px
    h3
      font-size: 26px
  .whatsapp-box
    padding: 20px
  .hero_experience
    height: 65vh
  .overlay h1
    font-size: 32px
  .desc
    font-size: 15px
  .formReserva
    padding: 25px

@media (max-width: 480px) //móvil pequeño
  h1
    min-height: 48px
  .hero_experience
    height: 50vh

  .overlay h1
    font-size: 24px
    max-width: 340px

  .desc
    font-size: 14px
    line-height: 1.6
    max-width: 320px

  .mini
    font-size: 14px
    letter-spacing: 5.8px
    margin-bottom: 18px
  .luxury-note
    padding: 24px
  .luxury-note h3
    font-size: 22px
</style>    
