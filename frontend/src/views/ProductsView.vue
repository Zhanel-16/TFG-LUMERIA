<script setup>
import WhatsappExpert from "@/components/WhatsappExpert.vue";
import axios from "axios"
import { ref, onMounted } from "vue"
import { useRouter } from "vue-router"

let productos = ref([])
const router = useRouter()

onMounted(async () => {
  try {
    let res = await axios.get("http://localhost:5000/products/")
    productos.value = res.data
  } catch (error) {
    console.error(error)
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
<section>
  <div class="product-grid">
    <div v-for="prod in productos" :key="prod.id" class="card">

      <img :src="prod.image">
      <h3>{{ prod.name }}</h3>
      <p>{{ prod.color_oro }}</p>
      <p class="price">
  {{ formatPrice(prod.price) }} €
</p>

      <button @click="irProducto(prod.id)">Ver producto</button>

    </div>
  </div>
  <WhatsappExpert />
</section>
</template>

<style lang="sass" scoped>
section
  max-width: 1300px
  margin: 80px auto
  padding: 0 40px

.product-grid
  display: grid
  grid-template-columns: repeat(auto-fit, minmax(260px, 1fr))
  gap: 45px

.card
  background: white
  border-radius: 18px
  padding: 25px
  text-align: center
  box-shadow: 0 8px 25px rgba(0,0,0,.06)
  transition: .3s

  &:hover
    transform: translateY(-6px)

img
  width: 100%
  height: 260px
  object-fit: cover
  border-radius: 14px
  margin-bottom: 15px

.price
  font-weight: bold
  color: #111
  margin-top: 5px

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
</style>