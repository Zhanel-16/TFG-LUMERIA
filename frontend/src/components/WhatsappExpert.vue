<template>

<div class="whatsappBox" :class="$attrs.class" @click="openWhatsApp">
  <!-- permite pasarle clases desde fuera -->

  <div class="left">

    <div class="icon">
      <i class="fa-brands fa-whatsapp"></i>
    </div>

    <div>
     <h1>Descubre más</h1>
      <h3>¿Tienes alguna duda o necesitas asesoramiento?</h3>

      <p>Habla directamente con un experto y descubre qué joya se adapta mejor a tu historia.</p>
    </div>

  </div>

  <a
    href="https://wa.me/34633859183"
    target="_blank"
    class="button"
  >
    Hablar ahora
  </a>

</div>

</template>

<script setup>
import { useAttrs } from "vue"

function openWhatsApp() {
  window.open("https://wa.me/34633859183", "_blank")
}
</script>

<style scoped lang="sass">
.whatsappBox
  border: 1px solid rgba(0,0,0,.04)
  margin-top: 60px
  background: white
  border-radius: 18px
  padding: 22px
  // width: 45vw
  display: flex
  justify-content: space-between
  align-items: center
  gap: 20px
  box-shadow: 0 8px 25px rgba(0,0,0,.06)
  font-family: "Outfit", sans-serif
  max-width: 100%
  transition: all .35s ease
  cursor: pointer

  &:hover
    transform: translateY(-4px)
    box-shadow: 0 18px 40px rgba(0,0,0,.12)

.left
  display: flex
  align-items: center
  gap: 16px

.icon
  width: 55px
  height: 55px
  border-radius: 50%
  background: #25D366
  display: flex
  justify-content: center
  align-items: center
  flex-shrink: 0

  i
    color: white
    font-size: 26px

h1
  font-size: 16px
  font-weight: 500
  margin-bottom: 2px
  color: #111

h3
  margin-bottom: 6px
  font-size: 16px
  font-weight: 500
  color: #222

p
  font-size: 14px
  color: #777
  line-height: 1.5

.button
  background: #111
  color: white
  padding: 10px 20px
  border-radius: 25px
  text-decoration: none
  transition: all .3s ease
  white-space: nowrap
  font-size: 14px
  font-weight: 500
  cursor: pointer

  &:hover
    background: #D4AF37
    color: #111
    transform: scale(1.05)

</style>