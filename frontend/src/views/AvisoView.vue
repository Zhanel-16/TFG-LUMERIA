<template>
  <section class="legal">

    <div class="hero">
      <span>Lumeria Joyería</span>
      <h1>Aviso Legal</h1>
      <p class="intro">En LUMERIA entendemos que la confianza es tan valiosa como cada una de nuestras creaciones. Por ello, ponemos a disposición de nuestros clientes y visitantes toda la información necesaria relativa al uso de este sitio web, garantizando una experiencia transparente, segura y acorde con los más altos estándares de calidad.</p>
    </div>

    <div class="block">
      <h2>Información general</h2>
      <p>LUMERIA es una firma dedicada al diseño y comercialización de joyería fina,
        piezas exclusivas y colecciones de alta gama inspiradas en la elegancia atemporal.
        El acceso y navegación por este sitio web atribuye la condición de usuario e implica
        la aceptación plena de las disposiciones incluidas en el presente Aviso Legal.</p>
      <p>La marca LUMERIA opera bajo los principios de excelencia, autenticidad y atención
        personalizada, ofreciendo una experiencia digital alineada con los estándares del lujo contemporáneo.</p>
    </div>
    <div class="block">
      <h2>Propiedad intelectual e industrial</h2>

      <p>Todos los contenidos presentes en este sitio web, incluyendo textos, fotografías, vídeos, diseños, logotipos, nombres comerciales, elementos gráficos y composiciones visuales, son propiedad exclusiva de LUMERIA o de terceros autorizados, y se encuentran protegidos por la normativa vigente en materia de propiedad intelectual e industrial.</p>

      <p>Queda expresamente prohibida la reproducción, distribución, transformación, comunicación pública o utilización de cualquier contenido sin autorización previa y por escrito.</p>
    </div>

    <div class="block">
      <h2>Condiciones de uso</h2>
      <p>El usuario se compromete a utilizar este sitio web de forma diligente, lícita y respetuosa con la legislación vigente, la buena fe y el orden público. Asimismo, se abstendrá de realizar cualquier actuación que pudiera dañar la imagen, los intereses o el funcionamiento de LUMERIA.</p>
    </div>

    <div class="block">
      <h2>Limitación de responsabilidad</h2>
      <p>LUMERIA no garantiza la disponibilidad permanente del sitio web ni la ausencia de errores técnicos, interrupciones o incidencias ajenas a su control. No obstante, la firma realizará todos los esfuerzos razonables para asegurar una experiencia digital fluida, segura y de máxima calidad.</p>
    </div>

    <div class="block">
      <h2>Protección de datos</h2>
      <p>El tratamiento de los datos personales del usuario se realizará conforme a la normativa aplicable en materia de protección de datos y privacidad. Para más información, el usuario podrá consultar la Política de Privacidad correspondiente.</p>
    </div>

    <div class="block">
      <h2>Legislación aplicable</h2>
      <p>El presente Aviso Legal se rige por la legislación española.
        Cualquier controversia derivada del acceso o uso del sitio web será sometida
        a los juzgados y tribunales competentes conforme a la normativa aplicable.</p>
    </div>
    <div class="contact-box">
      <h2>Contacto</h2>

      <p>Para resolver cualquier pregunta relacionada con este Aviso Legal, <br> nuestra plataforma o servicios, el equipo de LUMERIA <br> está a tu total disposición para ayudarte.</p>
      <div class="contact-data">
        <a href="mailto:zhanelya.rrr@gmail.com">Correo electrónico</a>

        <a href="tel:+34633859183">633 85 91 83</a>

        <p>O, si lo prefieres, habla directamente con nuestro equipo a través de WhatsApp:</p>
        <a href="https://wa.me/34633859183" target="_blank" class="whatsapp">Hablar por WhatsApp</a>
      </div>
    </div>
  </section>
</template>

<script setup>
</script>

<style lang="sass" scoped>
@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;500;600&family=Inter:wght@300;400;500&display=swap')
// Separador decorativo entre secciones
// .block:not(:last-child)
//   border-bottom: 1px solid rgba(201,162,39,.15)
//   padding-bottom: 50px
.contact-box
  margin: 50px auto 0
  max-width: 700px
  padding: 35px
  text-align: center
  border-radius: 24px
  background: linear-gradient(135deg, #f5f0e7, #e7ddd0)
  border: 1px solid rgba(212,175,55,.15)
  box-shadow: 0 8px 30px rgba(0,0,0,.04)
  transition: .3s
  &:hover
    transform: translateY(-3px)
  h2
    font-family: 'Cormorant Garamond', serif
    font-size: 35px
    margin-bottom: 15px
    color: #181818
  p
    max-width: 600px
    margin: 0 auto 25px
    line-height: 1.8
    color: #5f5a52

  .contact-data
    display: flex
    justify-content: center
    gap: 15px
    flex-wrap: wrap
    p
      width: 100%
      margin: 10px 0 0
      font-size: 15px
      color: #5f5a52
    a
      text-decoration: none
      color: #333
      background: rgba(255,255,255,.6)
      padding: 12px 20px
      border-radius: 999px
      transition: .3s
      font-size: 15px
      border: 1px solid rgba(212,175,55,.12)

      &:hover
        color: #D4AF37
        transform: translateY(-2px)
        background: rgba(255,255,255,.85)
        box-shadow: 0 4px 15px rgba(0,0,0,.05)
.legal
  max-width: 980px
  margin: 60px auto
  padding: 0 50px
  color: #1c1c1c

.hero
  margin-bottom: 90px
  padding: 60px
  background: linear-gradient(135deg, #faf7f0, #eae2d5)
  border-radius: 24px
  border: 1px solid rgba(0,0,0,.06)
  box-shadow: 0 8px 30px rgba(0,0,0,.04)
  transition: .3s
  &:hover
    transform: translateY(-3px)
  span
    font-family: 'Inter', sans-serif
    text-transform: uppercase
    letter-spacing: 4px
    font-size: 15px
    color: #D4AF37
    font-weight: 550
  h1
    font-family: 'Cormorant Garamond', serif
    font-weight: 500
    line-height: 0.80
    margin-bottom: 30px
    color: #111
    font-size: 37px
    letter-spacing: 1px
  .intro
    max-width: 700px
    font-size: 17px
    line-height: 1.9
    color: #5f5a52
    font-weight: 300

.block
  margin-bottom: 35px
  padding: 35px 40px
  background: white
  border-radius: 24px
  border: 1px solid rgba(0,0,0,.06)
  box-shadow: 0 8px 30px rgba(0,0,0,.04)
  transition: .3s

  &:hover
    transform: translateY(-3px)

  &::before
    display: none

  h2
    font-family: 'Cormorant Garamond', serif
    font-size: 30px
    font-weight: 500
    margin-bottom: 22px
    color: #181818
  p
    font-family: 'Inter', sans-serif
    font-size: 16px
    line-height: 2
    color: #5f5a52
    margin-bottom: 20px
    font-weight: 300

@media (max-width: 768px)
  .legal
    padding: 0 24px
    margin: 80px auto
  h1
    font-size: 56px
  .intro
    font-size: 17px
  .block
    h2
      font-size: 30px
</style>