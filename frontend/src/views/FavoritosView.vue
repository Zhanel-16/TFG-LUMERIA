<script setup>
import { estaAutenticado } from '@/servicios/autenticacion'
import { obtenerWishlist, eliminarFavorito } from '@/servicios/tarea'
import { ref, onMounted, computed } from 'vue'
import { useToast } from "vue-toastification"
import { useRouter } from 'vue-router'
const toast = useToast()
const favoritos = ref([])
const totalFavs = computed(() => favoritos.value.length)
const formatPrice = (price) => {
  return new Intl.NumberFormat('en-US', {
    maximumFractionDigits: 0
  }).format(Number(price))
}
const router = useRouter()

const irHome = () => {
  router.push('/')
}
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

  <div class="luxuryHeader">

    <div class="luxuryText">

      <p class="mini">
        CURATED SELECTION
      </p>

      <h1>
        Wishlist
      </h1>

      <p class="subtitle">
        Guarda tus piezas favoritas y accede a ellas desde cualquier dispositivo.
      </p>

    </div>

  </div>
  
  <div v-if="favoritos.length === 0" class="emptyFavs">
    <p>Tu wishlist está vacía</p>
    <button @click="irHome">Ir a explorar</button>
</div>

<div v-else>

  <div class="grid">

    <div
      v-for="(prod,index) in favoritos"
      :key="index"
      class="card"
      :style="{ animationDelay: `${index * 0.08}s` }"
    >

      <div class="img-wrap">
        <img
          :src="prod?.image"
          :loading="index < 4 ? 'eager' : 'lazy'"
          decoding="async"
          :alt="prod.name">

      </div>

      <div class="contenido">

        <h3>{{ prod.name }}</h3>

        <p class="oro">
          {{ prod?.color_oro }}
        </p>

        <p class="price">
          {{ formatPrice(prod?.price) }} €
        </p>

        <button
          @click="borrarFav(prod.idDoc)"
          :disabled="eliminando === prod.idDoc"
        >
          {{
            eliminando === prod.idDoc
              ? 'Eliminando...'
              : 'Eliminar'
          }}
        </button>

      </div>

    </div>

  </div>

</div>
</div>

</section>
</template>

<style lang="sass" scoped>
.emptyFavs
  background: white
  padding: 50px
  border-radius: 24px
  text-align: center
  box-shadow: 0 10px 30px rgba(0,0,0,.06)
  border: 1px solid rgba(212,175,55,.12)
  max-width: 500px
  margin: 80px auto 0

  p
    color: #777
    margin-bottom: 20px
    font-size: 20px

  button
    width: 180px
    height: 50px
    border: none
    border-radius: 40px
    background: #111
    color: white
    cursor: pointer
    transition: .35s ease

    &:hover
      background: #D4AF37
.favs
  max-width: 1180px
  margin: 60px auto
  padding: 0 20px

.luxuryHeader
  margin-bottom: 60px

.luxuryText
  text-align: center

.luxuryText h1
  font-size: 48px
  font-weight: 450
  color: #111
  margin-bottom: 15px

.subtitle
  max-width: 700px
  margin: auto
  color: #666
  line-height: 1.8

.mini
  color: #D4AF37
  letter-spacing: 5px
  font-size: 12px
  font-weight: 600
  margin-bottom: 18px

.notLogged
  background: white
  padding: 50px
  border-radius: 24px
  text-align: center
  box-shadow: 0 10px 30px rgba(0,0,0,.06)

.loginBtn
  display: inline-block
  margin-top: 20px
  width: 180px
  height: 48px
  line-height: 48px
  border-radius: 40px
  background: #111
  color: white
  text-decoration: none
  transition: .35s

  &:hover
    background: #D4AF37

.grid
  display: grid
  grid-template-columns: repeat(4, 250px)
  justify-content: center
  gap: 35px

.card
  background: white
  border-radius: 24px
  overflow: hidden
  position: relative
  transition: .45s ease
  box-shadow: 0 10px 30px rgba(0,0,0,.06)
  border: 1px solid rgba(212,175,55,.12)
  display: flex
  flex-direction: column
  text-align: center

  opacity: 0
  animation: aparecer .5s ease forwards

  &:hover
    transform: translateY(-10px)
    box-shadow: 0 25px 60px rgba(0,0,0,.12)

  &:hover img
    transform: scale(1.05)
    filter: brightness(.75)

.img-wrap
  position: relative
  height: 250px
  overflow: hidden

.img-wrap img
  width: 100%
  height: 100%
  object-fit: cover
  transition: .6s ease

.contenido
  padding: 12px 25px 35px
  text-align: center
  display: flex
  flex-direction: column
  flex: 1

h3
  font-size: 17px
  font-weight: 600
  line-height: 1.4
  color: #111
  text-align: center
  min-height: 20px
  margin-bottom: 6px
.oro
  color: #777
  font-size: 13px
  line-height: 1.4
  min-height: 54px
  display: flex
  align-items: center
  justify-content: center
  text-align: center
  margin: 7px 0

.price
  color: #AA7C11
  font-size: 22px
  font-weight: 650
  margin-top: 10px

button
  width: 170px
  height: 48px
  border: none
  border-radius: 40px
  background: #111
  color: white
  cursor: pointer
  margin-top: 18px
  transition: .35s ease
  margin-left: auto
  margin-right: auto
  display: block

  &:hover
    background: #D4AF37

button:disabled
  opacity: .7

@keyframes aparecer
  from
    opacity: 0
    transform: translateY(20px)

  to
    opacity: 1
    transform: translateY(0)

@media (max-width: 1200px)

  .grid
    grid-template-columns: repeat(3, minmax(220px,1fr))
    gap: 20px

@media (max-width: 768px)

  .luxuryText h1
    font-size: 34px

  .grid
    grid-template-columns: repeat(2,1fr)

  .img-wrap
    height: 200px

@media (max-width: 480px)

  .luxuryText h1
    font-size: 28px

  .subtitle
    font-size: 14px

  .grid
    grid-template-columns: repeat(2,1fr)
    gap: 12px

  .img-wrap
    height: 150px

  h3
    font-size: 13px

  .oro
    font-size: 11px

  .price
    font-size: 16px

  button
    width: 100%
    height: 38px
    font-size: 11px

@media (max-width: 360px)

  .grid
    grid-template-columns: 1fr
</style>
