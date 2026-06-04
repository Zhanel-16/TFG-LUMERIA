<script setup>
import WhatsappExpert from "@/components/WhatsappExpert.vue";
import axios from "axios"
import { ref, onMounted } from "vue"
import { useRouter } from "vue-router"

import { inject } from "vue"
let productos = ref([])

import { productosCache } from "@/cache/productosCache"
const contenidoListo = inject("contenidoListo")

// let cacheProductos = null //1ra carga normal pero tarda, 2nda tira de una   NO VA
const cargando = ref(true) //para q aparezcan productos poco a poco
const router = useRouter()
// onmounted anterior simple, cambiado ahora a por el de abajo
// onMounted(async () => {
//   try {
//     let res = await axios.get("")
//     productos.value = res.data
//   } catch (error) {
//     console.error(error)
//   }
// })

// ------------------------
// onMounted(async () => {
//   try {
//     let res = await axios.get(
//       "http://localhost:5000/products/"
//     )
//     productos.value = res.data
//   } catch (error) {
//     console.error(error)
//   } finally {

//     cargando.value = false
//   }
// })
onMounted(async () => {
  if (productosCache.data) { // CACHE
    productos.value = productosCache.data
    cargando.value = false
    contenidoListo.value = true
    return
  }try {
    let res = await axios.get(
      "https://tfg-lumeria.onrender.com/products/"
    )
    productos.value = res.data
    productosCache.data = res.data // GUARDAR

  } catch (error) {
    console.error(error)
  } finally { //se ejecuta si o si 
    contenidoListo.value = true
    cargando.value = false
  }
})
const formatPrice = (price) => {
  const num = typeof price === 'number'
    ? price
    : parseFloat(String(price).replace(',', '.'))

  return new Intl.NumberFormat('en-US', {
    maximumFractionDigits: 0
  }).format(num)
}
const irProducto = (id) => {
    router.push(`/products/${id}`)
}
</script>
<template>
<div>
  <section class="hero_products">
    <div class="overlay">
      <p class="mini">CRAFTED TO LAST FOREVER</p>
      <h1>Alta joyería creada en España con oro de 18 quilates y diamantes naturales</h1>
      <p class="desc">Joyas excepcionales diseñadas para acompañarte toda la vida...</p>
    </div>
</section>
<div class="products-container">
  <div class="product-grid"> <!-- productos de bd -->
    <!-- <div v-for="prod in productos" :key="prod.id" class="card"> -->
    <div v-for="(prod,index) in productos" :key="prod.id" class="card" :style="{ animationDelay: `${index * 0.08}s` }">
      <div class="img-wrap">
        <img :src="prod.image" :loading="index < 4 ? 'eager' : 'lazy'" decoding="async" :alt="prod.name">
      </div>
      <div class="contenido">
        <h3>{{ prod.name }}</h3>
        <p class="oro">{{ prod.color_oro }}</p>
        <p class="price">{{ formatPrice(prod.price) }} €</p>
        <button @click="irProducto(prod.id)">Ver producto</button>
      </div>
    </div>
  </div>
</div>
  <transition name="fade">
    <WhatsappExpert v-if="productos.length" />
  </transition>
  <!-- aparece cuando productos ya cargaron -->
</div>
</template>

<style lang="sass" scoped>
.hero_products
  width: 100%
  height: 75vh
  background: url('/images/main.webp') center/cover
  position: relative

.overlay
  position: absolute
  inset: 0
  background: rgba(0,0,0,.35)
  display: flex
  flex-direction: column
  justify-content: center
  align-items: center
  text-align: center
  color: white
  padding: 30px

  h1
    font-size: 38px
    font-family: "Outfit", sans-serif
    max-width: 800px
    font-weight: 460
    line-height: 1.1

.desc
  max-width: 750px
  margin-top: 24px
  line-height: 1.8
  font-size: 18px

.mini
  letter-spacing: 5.8px
  font-size: 14px
  margin-bottom: 18px
  font-weight: 630
  color: #D4AF37
.products-container
  max-width: 1180px
  margin: 80px auto
  padding: 0 20px
.product-grid
  display: grid
  grid-template-columns: repeat(4, 250px)
  justify-content: center
  gap: 45px

.card
  background: white
  border-radius: 24px
  overflow: hidden
  cursor: pointer
  position: relative
  transition: .45s ease
  box-shadow: 0 10px 30px rgba(0,0,0,.06)
  border: 1px solid rgba(212,175,55,.12)
  display: flex
  flex-direction: column
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

img
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
  min-height: 54px // 2 líneas aprox
  display: flex
  align-items: center
  justify-content: center
  text-align: center
  margin: 7px 0 //espacio entre h3 y color oro

.price
  color: #AA7C11
  font-size: 20px
  font-weight: 650
  margin: 6px 0 12px

button
  display: block
  width: 160px
  height: 48px
  border: none
  border-radius: 40px
  background: #111
  color: white
  margin-top: 12px
  margin-left: auto
  margin-right: auto
  cursor: pointer
  transition: .35s ease

  &:hover
    background: #D4AF37

@keyframes aparecer
  from
    opacity: 0
    transform: translateY(20px)

  to
    opacity: 1
    transform: translateY(0)

.fade-enter-active,
.fade-leave-active
  transition: opacity .5s ease

.fade-enter-from,
.fade-leave-to
  opacity: 0
@media (max-width: 1200px)

  .product-grid
    grid-template-columns: repeat(4, minmax(180px, 1fr))
    gap: 20px

  .img-wrap
    height: 220px

  .contenido
    min-height: auto

  h3
    font-size: 15px

  .price
    font-size: 18px

@media (max-width: 768px)
  .hero_products
    height: 60vh

  .overlay h1
    font-size: 30px

  .desc
    font-size: 16px

@media (max-width: 480px)
  .hero_products
    height: 50vh

  .overlay h1
    font-size: 24px

  .desc
    font-size: 14px
    line-height: 1.6

@media (max-width: 480px)
  .product-grid
    grid-template-columns: repeat(2, 1fr)
    gap: 12px

  .img-wrap
    height: 150px
  .contenido
    padding: 12px 20px 30px

  h3
    font-size: 13px

  .oro
    font-size: 11px

  .price
    font-size: 14px

  button
    height: 36px
    font-size: 11px
</style>