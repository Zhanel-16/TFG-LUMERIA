<template>
  <section class="legal">
    <div class="hero">
      <span>Lumeria Joyería</span>
      <h1>Política de Cookies</h1>
      <p class="intro">En LUMERIA utilizamos cookies para garantizar el correcto funcionamiento del sitio web, mejorar la experiencia de navegación y analizar de forma anónima el uso de nuestra plataforma.
      </p>
    </div>
    <div class="block">
      <h2>¿Qué son las cookies?</h2>

      <p>Las cookies son pequeños archivos de texto que se almacenan en el dispositivo del usuario cuando visita un sitio web. Su finalidad es recordar información sobre la navegación para facilitar el uso del sitio en futuras visitas.</p>
      <p>Estas tecnologías no dañan tu dispositivo y no contienen información personal sensible.</p>
    </div>

    <div class="block">
      <h2>Tipos de cookies que utilizamos</h2>
      <p>Utilizamos cookies técnicas necesarias para el funcionamiento básico del sitio web, así como cookies analíticas que nos permiten entender el comportamiento de los usuarios de forma anónima.</p>
      <p>Estas cookies nos ayudan a mejorar el rendimiento, diseño y experiencia general de navegación.</p>
    </div>

    <div class="block">
      <h2>Gestión de cookies</h2>
      <p>El usuario puede aceptar, rechazar o configurar el uso de cookies no esenciales a través del banner de consentimiento mostrado al acceder al sitio web.</p>
      <p>También puede modificar la configuración de cookies desde su navegador en cualquier momento.</p>
    </div>

    <div class="block">
      <h2>Actualizaciones</h2>
      <p>LUMERIA podrá actualizar esta Política de Cookies en función de cambios legales, técnicos o de funcionamiento del sitio web.</p>
    </div>

    <div class="contact-box">
      <h2>¿Necesitas ayuda?</h2>

      <p>Si tienes dudas sobre el uso de cookies o la configuración de privacidad, <br> nuestro equipo estará encantado de ayudarte.</p>

      <div class="contact-data">
        <a href="mailto:contacto@lumeria.com">Correo electrónico</a>

        <a href="tel:+34633859183">633 85 91 83</a>

        <p>O si lo prefieres, contáctanos directamente:</p>

        <a href="https://wa.me/34633859183" target="_blank">Hablar por WhatsApp</a>
      </div>
    </div>

  </section>
</template>

<style scoped lang="sass">

@import url('https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@300;400;500;600&family=Inter:wght@300;400;500&display=swap')

body
  background: #f8f5ef

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

  h2
    font-family: 'Cormorant Garamond', serif
    font-size: 30px
    margin-bottom: 22px
    color: #181818
  p
    font-family: 'Inter', sans-serif
    font-size: 16px
    line-height: 2
    color: #5f5a52
    margin-bottom: 20px

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


@media (max-width: 768px)
  .legal
    padding: 0 24px
    margin: 80px auto

  .hero
    padding: 40px

  .block
    padding: 25px
</style>
