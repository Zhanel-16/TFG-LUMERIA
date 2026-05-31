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
  margin: 80px auto
  padding: 0 40px

  h1
    text-align: center
    font-size: 42px
    font-weight: 400
    margin-bottom: 50px

.notLogged
  background: white
  padding: 60px
  text-align: center
  border-radius: 18px
  box-shadow: 0 8px 25px rgba(0,0,0,.06)

  p
    margin-top: 15px
    color: #666

.loginBtn
  display: inline-block
  margin-top: 25px
  padding: 12px 28px
  border-radius: 30px
  background: #111
  color: white
  text-decoration: none
  transition: .3s

  &:hover
    background: #D4AF37

.grid
  display: grid
  grid-template-columns: repeat(4, 260px)
  justify-content: center
  gap: 45px

.card
  border: 1px solid rgba(0,0,0,.04)
  background: white
  display: flex
  flex-direction: column
  justify-content: space-between
  border-radius: 18px
  padding: 25px
  text-align: center
  box-shadow: 0 8px 25px rgba(0,0,0,.06)
  position: relative
  overflow: hidden
  transition: transform .35s ease, box-shadow .35s ease
  opacity: 0
  transform: translateY(10px)
  animation: aparecer .45s ease forwards

  &:hover
    transform: translateY(-8px) scale(1.01)
    box-shadow: 0 20px 45px rgba(0,0,0,.10)

button:disabled
  background: #999
  cursor: wait
  opacity: .8
  position: relative
  overflow: hidden
  
  &::after
    content: ""
    position: absolute
    top: 0
    left: -100%
    width: 100%
    height: 100%
    background: linear-gradient(
  90deg,
  transparent,
  rgba(255,255,255,.35),
  transparent
)

  animation: shimmer 1s infinite

img
  width: 100%
  height: 260px
  object-fit: cover
  border-radius: 14px
  margin-bottom: 15px

h3
  font-size: 20px
  font-weight: 400
  margin-top: 10px
  color: #111

.price
  font-weight: bold
  color: #111
  margin-top: 8px
  font-size: 18px

button
  margin-top: 18px
  padding: 10px 20px
  border: none
  border-radius: 30px
  background: #111
  min-height: 42px
  color: white
  cursor: pointer
  transition: .3s

  &:hover
    background: #D4AF37
@keyframes shimmer

  100%
    left: 100%

@keyframes aparecer

  from
    opacity: 0
    transform: translateY(10px)

  to
    opacity: 1
    transform: translateY(0)

@media (max-width: 1200px)

  .grid
    grid-template-columns: repeat(3, 260px)

@media (max-width: 900px)

  .grid
    grid-template-columns: repeat(2, 260px)

@media (max-width: 600px)

  .grid
    grid-template-columns: 1fr

  .card
    width: 100%
</style>
