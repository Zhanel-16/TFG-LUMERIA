<script setup>
import WhatsappExpert from "@/components/WhatsappExpert.vue" 
import axios from "axios"
import { ref, onMounted } from "vue"
import { useRoute } from "vue-router"
import { estaAutenticado } from '@/servicios/autenticacion'
import { useToast } from 'vue-toastification'
import { anadirAFavoritos, anadirFavoritos } from '@/servicios/tarea' //wish y carrito 
const route = useRoute()
const producto = ref(null)
const toast = useToast()

const formatPrice = (price) => {
  const num = typeof price === 'number'
    ? price
    : parseFloat(String(price).replace(',', '.'))

  return new Intl.NumberFormat('en-US', {
    maximumFractionDigits: 0
  }).format(num)
}

// onMounted(async () => {
//   let id = route.params.id
//   let res = await axios.get(
//     `https://tfg-lumeria.onrender.com/products/${id}`
//   )

//   producto.value = res.data
// })
onMounted(async () => {
  try {
    let id = route.params.id
    console.log("ID:", id)

    let res = await axios.get(
      `https://tfg-lumeria.onrender.com/products/${id}`
    )

    console.log("PRODUCTO:", res.data)

    producto.value = res.data
  } catch (error) {
    console.log("ERROR PRODUCT DETAIL:", error)
  }
})
const favClick = async () => { //wishlist
  if(!estaAutenticado()){
    toast.info("Inicia sesión para guardar tu wishlist.")
    return
  }
  const res = await anadirAFavoritos(producto.value)

  if(res.ok){
    toast.success("¡Añadido a tu wishlist!")
  }else{
    toast.info("¡Ups! Ya está en tu wishlist...")
  }
}
const cartClick = async () => {
  if(!estaAutenticado()){
    toast.info("Inicia sesión para añadir al carrito.")
    return
  }
  const res = await anadirFavoritos(producto.value)

  if(res.ok){
    toast.success("¡Añadido al carrito!")
  }
  else{
    toast.info("¡Ups! Ya está en tu carrito...")
  }
}
</script>
<template>
<section v-if="producto">
  <div class="productGeneral">
    <!-- IZQUIERDA info -->
    <div class="info">
      <h1>{{ producto.name }}</h1>
      <p class="price">{{ formatPrice(producto.price) }} €</p>
      <p class="gold">{{ producto.color_oro }}</p>

      <p class="desc">{{ producto.description }}</p>

      <div class="botones2">
        <button class="cart" @click="cartClick">Añadir al carrito</button>
        <button class="fav" @click="favClick">Añadir a favoritos ❤</button>
      </div>
    </div>
    <!-- DERECHA img -->
    <div class="image">
      <img :src="producto.image">
    </div>
  </div>

  <WhatsappExpert />

</section>
</template>

<style lang="sass" scoped>
section
  max-width: 1100px
  margin: 42px auto
  padding: 0 30px

.productGeneral
  display: grid
  grid-template-columns: 1.1fr 0.9fr
  gap: 60px
  align-items: center

.image img
  width: 100%
  border-radius: 18px
  object-fit: cover
  max-height: 520px
  box-shadow: 0 20px 50px rgba(0,0,0,.08)

.info h1
  font-size: 24px
  font-weight: 500
  letter-spacing: 0.3px
  margin-bottom: 10px

.price
  color: #AA7C11
  font-size: 20px
  font-weight: 650
  margin: 6px 0 12px

.gold
  color: #777
  font-size: 13px
  letter-spacing: 1px
  margin-bottom: 20px

.desc //SCROLL, le doy altura maxima + q se vea scroll barra
  font-size: 15px
  line-height: 1.7
  color: #444
  margin-bottom: 30px
  overflow: hidden
  position: relative
  max-height: 310px
  overflow-y: auto
  padding-right: 6px
  cursor: pointer

.desc::-webkit-scrollbar //estilos scroll cute
  width: 4px

.desc::-webkit-scrollbar-thumb
  background: #ccc
  border-radius: 10px

.botones2
  display: flex
  flex-direction: row
  gap: 12px

button
  padding: 14px 20px
  border-radius: 40px
  border: none
  cursor: pointer
  font-size: 14px
  transition: .3s ease
  width: 35%

.fav
  background: #f3f3f3
  color: #111

  &:hover
    background: #e8e8e8

.cart
  background: #111
  color: white

  &:hover
    background: #D4AF37

@media (max-width: 1024px)
  .productGeneral
    grid-template-columns: 1fr
    gap: 30px

  .image
    order: 1

  .info
    order: 2

  .image img
    max-height: 420px
    object-fit: cover
    border-radius: 16px
  .botones2 button
    flex: 1

@media (max-width: 768px)
  section
    margin: 20px auto
    padding: 0 16px

  .productGeneral
    gap: 20px

  .info h1
    font-size: 20px

  .price
    font-size: 18px

  .gold
    font-size: 12px
  .desc
    max-height: none
    overflow: visible
    font-size: 14px

  .botones2 button
    flex: 1
    width: auto
</style>