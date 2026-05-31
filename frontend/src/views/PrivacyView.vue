<template>
<section class="legal">
  <div class="hero">
    <span>Lumeria Joyería</span>
    <h1>Política de Privacidad</h1>

    <p class="intro">La privacidad y protección de los datos personales forman parte de nuestro compromiso con la excelencia. En LUMERIA tratamos toda la información proporcionada por nuestros clientes con la máxima confidencialidad, transparencia y seguridad.</p>
  </div>
  <div class="block">
    <h2>Recopilación de datos</h2>
    <p>Los datos personales proporcionados a través de formularios de contacto, solicitudes de información, reservas o cualquier otro medio disponible en este sitio web serán tratados exclusivamente para gestionar la relación con el usuario y ofrecer los servicios solicitados.</p>

    <p>Únicamente se solicitarán aquellos datos estrictamente necesarios para cada finalidad.</p>
  </div>

  <div class="block">
    <h2>Uso de la información</h2>
    <p>La información facilitada será utilizada para responder consultas, gestionar solicitudes, mejorar la experiencia del usuario y garantizar el correcto funcionamiento de nuestros servicios.</p>
    <p>LUMERIA no utilizará los datos personales para finalidades distintas a las expresamente indicadas sin el consentimiento previo del usuario.</p>
  </div>

  <div class="block">
    <h2>Confidencialidad y seguridad</h2>
    <p>Aplicamos medidas técnicas y organizativas adecuadas para proteger los datos personales frente a accesos no autorizados, pérdida, alteración o divulgación indebida.</p>
    <p>Nuestro compromiso es mantener los más altos estándares de seguridad para preservar la confianza de nuestros clientes.</p>
  </div>

  <div class="block">
    <h2>Comunicación a terceros</h2>
    <p>Los datos personales no serán cedidos a terceros salvo cuando exista una obligación legal o sea necesario para la correcta prestación de los servicios contratados.</p>
  </div>

  <div class="block">
    <h2>Derechos del usuario</h2>
    <p>El usuario podrá solicitar en cualquier momento el acceso, rectificación, actualización o eliminación de sus datos personales, así como ejercer cualquier otro derecho reconocido por la normativa vigente.</p>
  </div>
  <div class="block">
    <h2>Conservación de los datos</h2>
    <p>Los datos personales serán conservados únicamente durante el tiempo necesario para cumplir con la finalidad para la que fueron recopilados o mientras exista una obligación legal que así lo requiera.</p>

    <p>Una vez finalizado dicho periodo, la información será eliminada o anonimizada aplicando las medidas de seguridad correspondientes.</p>
</div>

<div class="block">
  <h2>Cookies y tecnologías similares</h2>

  <p>Este sitio web puede utilizar cookies y tecnologías similares con la finalidad de mejorar la experiencia de navegación, analizar el uso del sitio y ofrecer contenidos adaptados a las preferencias del usuario.</p>

  <p>Para obtener información detallada sobre su funcionamiento, configuración y gestión, puede consultar nuestra Política de Cookies.</p>
</div>
<div class="block">
  <h2>Actualización de la política</h2>

  <p>LUMERIA podrá actualizar la presente Política de Privacidad cuando resulte necesario para adaptarse a cambios normativos, tecnológicos o de funcionamiento de nuestros servicios.</p>

  <p>Cualquier modificación relevante será publicada en esta misma página para garantizar la máxima transparencia con nuestros usuarios.</p>
</div>

  <div class="contact-box">
    <h2>Protección de tus datos</h2>
    <p>Si tienes cualquier consulta relacionada con el tratamiento de tus datos personales o deseas ejercer alguno de tus derechos de acceso, rectificación, eliminación o actualización de información, nuestro equipo estará encantado de ayudarte.</p>
    <div class="contact-data">
      <a href="mailto:contacto@lumeria.com">Correo electrónico</a>

      <a href="tel:+34633859183">633 85 91 83</a>

      <p>También puedes contactar directamente con nuestro equipo a través de WhatsApp.</p>

      <a href="https://wa.me/34633859183" target="_blank">Hablar por WhatsApp</a>
    </div>
  </div>

</section>

</template>

<style scoped lang="sass">
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

