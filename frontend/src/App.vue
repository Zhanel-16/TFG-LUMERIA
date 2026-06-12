<script setup>
import { estaAutenticado, logOut } from '@/servicios/autenticacion'
import CookieBanner from "@/components/CookieBanner.vue"
import { useToast } from "vue-toastification"
import BusquedaLupa from './components/BusquedaLupa.vue'
// import { useRoute } from "vue-router"
import { provide, ref, watch } from "vue"
// var de vue sobre: footer ya existe en products ya q viene de app, productos sun tardan en cargarse pero en products footer ya se muestra y queda mal --> veo flash blanco + footer
// const contenidoListo = ref(false)

const contenidoListo = ref(true)
// watch(() => route.path, () => {
//   contenidoListo.value = false
// })
// // al navegar: se oculta footer
// // products carga y hace:
// // contenidoListo.value = true --> aparece suave

const abrirBusqueda = ref(false) //variable q se cambia a true cuando le vaya a dar al icono lupa
const toast = useToast() //toast de iniciar sesion para favs

const mostrarToastFav = () => {
  if (!estaAutenticado()) {
    toast.info(
      "Inicia sesión para guardar favoritos")
  }
}
</script>
<template>
  <div id="app-layout">
  <!-- <CookieBanner/> -->
  <header class="header">
    <!-- <div class="logo"><img src="../public/images/Logo.png" alt=""></div> -->

    <router-link to="/" class="logo"> 
      <img src="/images/Logo.png" alt="">
    </router-link>
    <!-- logo que me lleva a la pagina del inicio -->

    <nav class="menu">
      <router-link to="/">Inicio</router-link>
      <router-link to="/compromiso">Compromiso</router-link>
      <router-link to="/experiencia">Private Experience</router-link>
      <router-link to="/faq">FAQ</router-link>
      <router-link to="/blog">Blog</router-link>
    </nav>
    <div class="icons">
      <i class="fa-solid fa-magnifying-glass" @click="abrirBusqueda = true"></i>
      <!-- montar buscar por palabra y luego ya tipo de joya /pendientes/anillos etc   -->
      <router-link :to="estaAutenticado() ? '/carrito' : '/login'">
        <i class="fa-solid fa-bag-shopping"></i>
      </router-link>

      <div class="favIcon" @mouseenter="mostrarToastFav">
        <router-link :to="estaAutenticado() ? '/favoritos' : '/login'">
          <i class="fa-solid fa-heart" :class="{ disabled: !estaAutenticado() }"></i>
        </router-link>
      </div>
      <!-- <router-link to="/carrito"><i class="fa-solid fa-user"></i></router-link> -->
    </div>
  </header>
  <router-view></router-view>
  <BusquedaLupa v-if="abrirBusqueda" @cerrar="abrirBusqueda = false"/>
  <CookieBanner />

  <transition name="fade">  <!-- envolver footer -->
  <footer v-if="contenidoListo" class="footer">
    <div class="footer_container">

      <div class="footer_brand">
        <router-link to="/" class="logo">
          <img src="/images/Logo.png" alt="Logo">
        </router-link>
        <!-- logo que me lleva al inicio -->
        <p>Joyería fina diseñada para brillar toda la vida.</p>
      </div>

      <div class="footer_links">
        <h4>Información</h4>
        <router-link to="/aviso">Aviso legal</router-link>
        <!-- <span>Política de privacidad</span>
        <span>Política de cookies</span> -->
        <router-link to="/cookies">Política de cookies</router-link>

        <router-link to="/privacy">Política de privacidad</router-link>
        <!-- <a href="#">Aviso legal</a>
        <a href="#">Política de privacidad</a>
        <a href="#">Política de cookies</a> -->
      </div>
      <div class="footer_social">
        <h4>Contáctanos</h4>
        <div class="icons">
          <a href="https://wa.me/34633859183" target="_blank" class="whatsapp"><i class="fa-brands fa-whatsapp"></i></a>
          <a href="https://www.instagram.com/lumeriadiamonds?igsh=MTlmYnFya2duNnFvZw=="><i class="fa-brands fa-instagram"></i></a>
        </div>
      </div>

    </div>
    <div class="copyright">© 2026 LUMERIA — Todos los derechos reservados</div>
  </footer>
  </transition>

  </div>
</template>
<!-- para q no haya scroll lateral -->
<style lang="sass">
html, body, #app
  margin: 0
  padding: 0
  width: 100% 
  overflow-x: hidden
*
  box-sizing: border-box
  font-family: "Outfit", sans-serif //UNA UNICA FUENTE PARA TODO
  letter-spacing: 0.2px
body
  background: #FAF8F3
</style>

<style lang="sass" scoped>
.header
  width: 100%
  max-width: 100vw
  height: 110px
  background: #FAF8F3
  display: flex
  justify-content: space-between
  align-items: center
  padding: 0 3rem
  box-shadow: 0 2px 10px rgba(0,0,0,.05)
  img
    width: 13.7rem
    height: 6.2rem

.menu
  display: flex
  gap: 2rem
  a
    text-decoration: none
    color: #333
    font-family: "Nunito"
    transition: .3s
    &:hover
      color: #c9a227

.header .icons i //menu de 3 de arriba
  font-size: 1.7rem
  color: #171717
  transition: all .28s ease
  cursor: pointer
  &:hover
    transform: scale(1.10)
    color: #c9a227

.footer_social .icons
  display: flex
  gap: 1rem
  font-size: 1.6rem
  cursor: pointer
  
.footer
  background: #111
  color: white
  margin-top: 4rem
  img
    width: 13.7rem
    height: 6.2rem
  h4
    font-size: 20px

.footer_container
  grid-template-columns: 2fr 1fr 1fr
  display: grid
  column-gap: 4rem
  padding: 2rem 3rem
  align-items: start
  
.footer_brand
  max-width: 270px
  img
    width: 95%
    height: 95%
  h2
    letter-spacing: 2px
    margin-bottom: .5rem
  p
    font-size: 16.66px
    width: 350px
    
.footer_links, .footer_social
  display: flex
  flex-direction: column
  gap: .5rem
  padding-left: 6rem
  h4
    margin-bottom: .7rem
  a
    color: #ccc
    text-decoration: none
    transition: .3s

    &:hover
      color: #c9a227
.icons
  display: flex
  gap: 1rem
  font-size: 1.6rem
  cursor: pointer
.favIcon
  display: flex
  align-items: center
  
.footer_social i
  font-size: 1.9rem
  transition: .3s
@media (max-width: 768px)
  .footer_container
    grid-template-columns: 1fr
    text-align: center
    gap: 35px
    padding: 2rem 1rem
    justify-items: center
  .footer_links,
  .footer_social
    padding-left: 0
  .footer_brand
    max-width: 100%
    display: flex
    flex-direction: column
    align-items: center
    p
      width: auto 
      max-width: 280px
      margin: 0 auto
      text-align: center

  .footer_social .icons
    justify-content: center

  .footer img
    width: 10rem
    height: auto

  .copyright
    font-size: 12px
    padding: 15px

.disabled
  cursor: not-allowed
  opacity: .55
  transition: .3s
  &:hover
    color: #999
.copyright
  text-align: center
  padding: 1rem
  border-top: 1px solid #333
  font-size: .9rem


.fade-enter-active
  transition: opacity .5s ease

.fade-enter-from
  opacity: 0

.fade-enter-to
  opacity: 1

@media (max-width: 1024px)
  .header
    padding: 0 1.5rem
  .menu
    gap: 1.2rem
    a
      font-size: 14px

  .header img
    width: 11rem
    height: auto
//header respon
@media (max-width: 768px)
  .header
    display: flex
    flex-direction: column
    height: auto
    padding: 10px 16px
    position: relative

  .header .logo
    position: absolute
    top: 10px
    left: 16px

    img
      width: 9rem
      height: auto

  .header .icons
    position: absolute
    top: 14px
    right: 16px
    font-size: 1.2rem
    gap: 14px

  .menu
    margin-top: 70px
    justify-content: center
    flex-wrap: wrap
    gap: 12px

</style>