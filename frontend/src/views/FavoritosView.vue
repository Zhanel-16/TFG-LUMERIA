<script setup>
import { estaAutenticado } from '@/servicios/autenticacion'
import { obtenerWishlist, eliminarFavorito } from '@/servicios/tarea'
import { ref, onMounted, computed } from 'vue'
import { useToast } from "vue-toastification"
const toast = useToast()
const favoritos = ref([])
const totalFavs = computed(() => favoritos.value.length)

const cargarFavoritos = async () => {
  const res = await obtenerWishlist()
  if (res.ok) {
    favoritos.value = res.favoritos
  }
}
const eliminando = ref(null)
const borrarFav = async (id) => {
  eliminando.value = id
  toast.info("Eliminando joya de tu wishlist...")
  await eliminarFavorito(id)
  favoritos.value = favoritos.value.filter(
    fav => fav.idDoc !== id
  )
  eliminando.value = null
  toast.success("Producto eliminado")
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
<!-- habra misma animacion igual q en app con products -->
  <div v-for="(prod,index) in favoritos" :key="index" class="card" :style="{ animationDelay: `${index * 0.08}s` }">

    <img :src="prod?.image" :loading="index < 4 ? 'eager' : 'lazy'" decoding="async" alt="prod?.title">
    <h3>{{ prod?.title }}</h3>

    <p class="price">{{ prod?.price }} €</p>

    <button @click="borrarFav(prod.idDoc)" :disabled="eliminando === prod.idDoc">
  {{
    eliminando === prod.idDoc
    ? 'Eliminando...'
    : 'Eliminar'
  }}</button>

  </div>
</div>
    
    <!-- <div>

    </div> -->
  </div>

</section>
</template>

<style lang="sass" scoped>
.favs
  max-width: 1300px
  margin: 60px auto
  padding: 0 20px

h1
  text-align: center
  font-size: 36px
  font-weight: 400
  margin-bottom: 40px

.notLogged
  background: white
  padding: 50px 20px
  text-align: center
  border-radius: 18px
  box-shadow: 0 8px 25px rgba(0,0,0,.06)

  p
    margin-top: 10px
    color: #666

.loginBtn
  display: inline-block
  margin-top: 20px
  padding: 12px 26px
  border-radius: 30px
  background: #111
  color: white
  text-decoration: none

  &:hover
    background: #D4AF37

.grid
  display: grid
  grid-template-columns: repeat(4, 1fr)
  gap: 25px

.card
  background: white
  border-radius: 18px
  padding: 20px
  text-align: center
  box-shadow: 0 8px 25px rgba(0,0,0,.06)
  transition: .3s
  opacity: 0
  transform: translateY(10px)
  animation: aparecer .4s ease forwards

  &:hover
    transform: translateY(-6px)

img
  width: 100%
  height: 220px
  object-fit: cover
  border-radius: 14px
  margin-bottom: 15px

h3
  font-size: 18px
  margin-top: 10px

.price
  font-weight: bold
  margin-top: 8px

button
  margin-top: 15px
  padding: 10px 20px
  border: none
  border-radius: 30px
  background: #111
  color: white
  cursor: pointer

  &:hover
    background: #D4AF37

button:disabled
  background: #999

/* RESPONSIVE */
@media (max-width: 1200px)
  .grid
    grid-template-columns: repeat(3, 1fr)

@media (max-width: 900px)
  .grid
    grid-template-columns: repeat(2, 1fr)

@media (max-width: 600px)
  .grid
    grid-template-columns: 1fr
</style>
