<template>
<div class="whatsappBox" :class="$attrs.class" @click="openWhatsApp">
  <!-- permite pasarle clases desde fuera        ????????????????-->
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
  <a href="https://wa.me/34633859183" target="_blank" class="button">Hablar ahora</a>
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
  margin: 60px auto 0 auto
  border: 1px solid rgba(0,0,0,.06)
  background: linear-gradient(145deg, #ffffff, #fafafa)
  border-radius: 20px
  padding: 26px 24px
  width: 45vw
  display: flex
  justify-content: space-between
  align-items: center
  gap: 24px
  box-shadow: 0 10px 30px rgba(0,0,0,.08)
  font-family: "Outfit", sans-serif
  transition: all .35s ease
  cursor: pointer
  &:hover
    transform: translateY(-5px)
    box-shadow: 0 20px 45px rgba(0,0,0,.14)

.left
  display: flex
  align-items: center
  gap: 25px

.icon
  width: 58px
  height: 58px
  border-radius: 50%
  background: linear-gradient(135deg, #25D366, #1faa52)
  display: flex
  justify-content: center
  align-items: center
  flex-shrink: 0
  box-shadow: 0 8px 20px rgba(37,211,102,.25)

  i
    color: white
    font-size: 27px

h1
  font-size: 20px
  font-weight: 600
  margin-bottom: 2px
  color: #111

h3
  margin-bottom: 6px
  font-size: 17px
  font-weight: 520
  color: #222

p
  font-size: 13.5px
  color: #777
  line-height: 1.5

.button
  background: #111
  color: white
  padding: 11px 22px
  border-radius: 30px
  text-decoration: none
  transition: all .3s ease
  white-space: nowrap
  font-size: 14px
  font-weight: 500
  cursor: pointer
  box-shadow: 0 8px 18px rgba(0,0,0,.15)

  &:hover
    background: #D4AF37
    color: #111
    transform: scale(1.05)

@media (max-width: 768px) //responsive movil

  .whatsappBox
    width: 60%
    padding: 18px
    border-radius: 18px
    flex-direction: column
    text-align: center
    gap: 16px

  .left
    flex-direction: column
    gap: 12px
    text-align: center

  .icon
    width: 52px
    height: 52px

    i
      font-size: 24px

  h1
    font-size: 16px
    margin-bottom: 4px

  h3
    font-size: 13px
    line-height: 1.4
    margin-bottom: 0

  p
    display: block
    font-size: 12px
    line-height: 1.5
    margin-top: 6px

  .button
    width: 60%
    max-width: 220px
    text-align: center
    padding: 12px
    font-size: 13px
@media (min-width: 769px) and (max-width: 1024px)
  .whatsappBox
    width: min(900px, 90%)
  h1
    font-size: 18px
  h3
    font-size: 15px
  p
    font-size: 13px
</style>