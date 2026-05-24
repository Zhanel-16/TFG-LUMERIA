<script setup>
import { estaAutenticado } from '@/servicios/autenticacion'
import { obtenerWishlist, eliminarFavorito } from '@/servicios/tarea'
import { ref, onMounted, computed } from 'vue'

const favoritos = ref([])

const totalFavs = computed(() => favoritos.value.length)

const cargarFavoritos = async () => {
  const res = await obtenerWishlist()
  if (res.ok) {
    favoritos.value = res.favoritos
  }
}

const borrarFav = async (id) => {
  await eliminarFavorito(id)
  cargarFavoritos()
}

onMounted(async () => {
  if (estaAutenticado()) {
    cargarFavoritos()
  }
})
</script>

<template>
<section class="favs">

  <div v-if="!estaAutenticado()" class="notLogged">
    <h1>Wishlist</h1>
    <p>Inicia sesión para guardar tu wishlist en todos los dispositivos</p>
    <router-link to="/login" class="loginBtn">Iniciar sesión</router-link>
  </div>

  <div v-else>
    <h1>Mis favoritos ❤</h1>

    <div class="grid">
      <div v-for="(prod,index) in favoritos" :key="index" class="card">
        <img :src="prod?.image">
        <h3>{{ prod?.title }}</h3>
        <p>{{ prod?.price }} €</p>
        <button @click="borrarFav(prod.idDoc)">Eliminar</button>
        
      </div>
    </div>
    
    <!-- <div>

    </div> -->
  </div>

</section>
</template>

<style lang="sass" scoped>
.favs
  max-width: 1200px
  margin: 60px auto
  text-align: center

.notLogged
  background: white
  padding: 60px
  box-shadow: 0 10px 30px rgba(0,0,0,.08)

.loginBtn
  display: inline-block
  margin-top: 20px
  padding: 12px 25px
  background: #D4AF37
  color: white
  border-radius: 30px
  text-decoration: none

.grid
  display: grid
  grid-template-columns: repeat(4,1fr)
  gap: 30px
  margin-top: 40px

.card
  background: white
  padding: 20px
  border-radius: 14px
  box-shadow: 0 5px 18px rgba(0,0,0,.05)

  img
    width: 100%
    height: 180px
    object-fit: contain
</style>
