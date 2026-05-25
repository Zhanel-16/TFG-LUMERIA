<script setup>
import { ref, onMounted } from "vue"
import { auth } from "@/firebase/config"

const visible = ref(false)

onMounted(() => {

  const cookies = localStorage.getItem("cookiesAccepted")

  // usuario logeado
  const user = auth.currentUser

  // si ya aceptó/está logeado → no mostrar
  if (cookies || user) return

  // mostrar banner
  visible.value = true

})

const aceptar = () => {

  localStorage.setItem("cookiesAccepted", "true")
  visible.value = false

}

const necesarias = () => {

  localStorage.setItem("cookiesAccepted", "necessary")
  visible.value = false

}
</script>

<template>

<transition name="slide">

  <div v-if="visible" class="cookies">

    <div class="content">

      <div class="text">

        <h3>Este sitio utiliza cookies</h3>

        <p>Utilizamos cookies técnicas necesarias para el funcionamiento del sitio
          y cookies analíticas para mejorar la experiencia de usuario.</p>

      </div>

      <div class="buttons">

        <button @click="aceptar">
          Aceptar todas
        </button>

        <button class="secondary" @click="necesarias">Solo necesarias</button>

      </div>

    </div>

  </div>

</transition>

</template>

<style scoped lang="sass">

.cookies
  position: fixed
  bottom: 30px
  left: 50%
  transform: translateX(-50%)
  width: 92%
  max-width: 760px
  background: rgba(255,255,255,.95)
  backdrop-filter: blur(10px)
  border-radius: 24px
  box-shadow: 0 10px 40px rgba(0,0,0,.15)
  padding: 28px
  z-index: 9999

.content
  display: flex
  justify-content: space-between
  align-items: center
  gap: 30px

.text
  flex: 1

h3
  margin-bottom: 10px
  color: #111

p
  color: #666
  line-height: 1.7

.buttons
  display: flex
  gap: 14px

button
  border: none
  padding: 13px 22px
  border-radius: 40px
  cursor: pointer
  transition: .3s
  background: black
  color: white
  white-space: nowrap

  &:hover
    background: #D4AF37

.secondary
  background: #eee
  color: #111

.slide-enter-active,
.slide-leave-active
  transition: all .45s ease

.slide-enter-from,
.slide-leave-to
  opacity: 0
  transform: translate(-50%, 50px)

@media(max-width: 700px)

  .content
    flex-direction: column
    align-items: flex-start

  .buttons
    width: 100%
    flex-direction: column

  button
    width: 100%

</style>