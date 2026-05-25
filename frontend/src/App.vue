<script setup>
import { estaAutenticado, logOut } from '@/servicios/autenticacion'
import { useRouter } from 'vue-router'
import CookieBanner from "@/components/CookieBanner.vue"
import { useToast } from "vue-toastification"

const toast = useToast() //toast de iniciar sesion para favs
const router = useRouter()
const logout = async () => {
  await logOut()
  router.push("/login")
}
const mostrarToastFav = () => {
  if (!estaAutenticado()) {
    toast.info(
      "Inicia sesión para guardar favoritos")
  }
}
</script>
<template>

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
      <i class="fa-solid fa-magnifying-glass"></i>
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
  <CookieBanner />

  <footer class="footer">
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
        <span>Aviso legal</span>
        <!-- <span>Política de privacidad</span>
        <span>Política de cookies</span> -->
        <router-link to="/cookies">
          Política de cookies
        </router-link>

        <router-link to="/privacy">
          Política de privacidad
        </router-link>
        <!-- <a href="#">Aviso legal</a>
        <a href="#">Política de privacidad</a>
        <a href="#">Política de cookies</a> -->
      </div>

      <div class="footer_social">
        <h4>Síguenos</h4>
        <div class="icons">

          <a href="https://wa.me/34633859183" target="_blank" class="whatsapp"><i class="fa-brands fa-whatsapp"></i></a>
          
          <a href="https://www.instagram.com/lumeriadiamonds?igsh=MTlmYnFya2duNnFvZw=="><i class="fa-brands fa-instagram"></i></a>
          
          
        </div>
      </div>

    </div>

    <div class="copyright">
      © 2026 LUMERIA — Todos los derechos reservados
    </div>
  </footer>
  
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

.icons
  display: flex
  gap: 1.2rem
  font-size: 1.2rem
  cursor: pointer
  
.footer
  background: #111
  color: white
  margin-top: 4rem
  img
    width: 13.7rem
    height: 6.2rem

.footer_container
  display: flex
  justify-content: space-between
  padding: 3rem
  flex-wrap: wrap

.footer_brand
  max-width: 250px

  h2
    letter-spacing: 2px
    margin-bottom: .5rem

.footer_links, .footer_social
  display: flex
  flex-direction: column
  gap: .5rem

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
</style>