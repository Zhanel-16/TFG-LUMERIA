<script setup>
import WhatsappExpert from "@/components/WhatsappExpert.vue" 
import axios from "axios"
import { ref, onMounted } from "vue"
import { useRoute } from "vue-router"
import { estaAutenticado } from '@/servicios/autenticacion'
import { useToast } from 'vue-toastification'
import { anadirAFavoritos, anadirFavoritos } from '@/servicios/tarea' //wish y carrito 

const route = useRoute()
const producto = ref({})
const toast = useToast()

onMounted(async () => {

  let id = route.params.id

  let res = await axios.get(
    `http://localhost:5000/products/${id}`
  )

  producto.value = res.data
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

  <div class="product-wrapper">

    <!-- IZQUIERDA IMAGEN -->
    <div class="image">
      <img :src="producto.image">
    </div>

    <!-- DERECHA INFO -->
    <div class="info">
      <h1>{{ producto.name }}</h1>
      <p class="gold">{{ producto.color_oro }}</p>
      <p class="price">{{ producto.price }} €</p>

      <button class="fav" @click="favClick">❤ Añadir a favoritos</button>

      <p class="desc">{{ producto.description }}</p>

      <button class="cart" @click="cartClick">Añadir al carrito</button>
      
    </div>

  </div>
  <WhatsappExpert />

</section>
</template>

<style lang="sass" scoped>
section
  max-width: 1200px
  margin: 80px auto
  padding: 0 40px

.product-wrapper
  display: grid
  grid-template-columns: 1fr 1fr
  gap: 60px

.image img
  width: 100%
  border-radius: 20px

.info h1
  font-size: 32px

.gold
  color: #777
  margin: 10px 0

.price
  font-size: 26px
  font-weight: bold
  margin: 20px 0

.desc
  line-height: 1.7
  margin-top: 25px

button
  padding: 12px 25px
  border-radius: 30px
  border: none
  margin-top: 15px
  cursor: pointer

.fav
  background: #eee

.cart
  background: #111
  color: white

  &:hover
    background: #D4AF37
</style>