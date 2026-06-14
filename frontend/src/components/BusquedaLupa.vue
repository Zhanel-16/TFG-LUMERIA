<script setup>
import { ref } from "vue"
import axios from "axios"
import { useRouter } from "vue-router"
const emit = defineEmits(["cerrar"])
const router = useRouter()
const busqueda = ref("")
const resultados = ref([])
const formatPrice = (price) => {
  const num = typeof price === 'number'
    ? price
    : parseFloat(String(price).replace(',', '.'))

  return new Intl.NumberFormat('en-US', {
    maximumFractionDigits: 0
  }).format(num)
}
const buscarProductos = async () => {
  if (!busqueda.value.trim()) {
    resultados.value = []
    return
  }
  const res = await axios.get(
    `https://tfg-lumeria.onrender.com/products/search?q=${busqueda.value}`
  )
  resultados.value = res.data
}

const abrirProducto = (id) => {
  emit("cerrar")
  router.push(`/products/${id}`)
}
</script>
<template>
<div class="fondo_busqueda" @click.self="emit('cerrar')">
  <div class="modal_busqueda">
    <div class="cabecera">
      <div>
        <p class="subtitulo">ENCUENTRA TU PIEZA PERFECTA</p>
        <h2>Descubre tu próxima joya</h2>
      </div>
      <button @click="emit('cerrar')">✕</button>
    </div>
    <div class="input_container">
      <i class="fa-solid fa-magnifying-glass"></i>
      <input v-model="busqueda" @input="buscarProductos" placeholder="Diamantes, oro blanco, anillos, charms...">
    </div>
    <div class="resultados">
      <div v-for="prod in resultados" :key="prod.id" class="card_producto" @click="abrirProducto(prod.id)">
        <img :src="prod.image">
        <div class="info">
          <h3>{{ prod.name }}</h3>
          <p class="oro">{{ prod.color_oro }}</p>

          <p class="price">{{ formatPrice(prod.price) }} €</p>
        </div>
      </div>
      <div v-if="busqueda && resultados.length === 0" class="sin_resultados">
        No hemos encontrado piezas para esa búsqueda.
      </div>
    </div>
  </div>
</div>
</template>

<style scoped lang="sass">
.fondo_busqueda
  position: fixed
  inset: 0
  background: rgba(10,10,10,.55)
  backdrop-filter: blur(8px)
  z-index: 99999
  display: flex
  justify-content: center
  align-items: center
  padding: 20px
  animation: aparecer .35s ease

.modal_busqueda
  display: flex
  flex-direction: column
  width: 760px
  max-width: 95vw // móviles
  max-height: 80vh    
  overflow: hidden
  background: rgba(255,255,255,.92)
  backdrop-filter: blur(18px)
  border-radius: 34px
  padding: 28px
  box-shadow: 0 25px 80px rgba(0,0,0,.25)
  border: 1px solid rgba(255,255,255,.4)
  animation: subir .35s ease

.cabecera
  display: flex
  justify-content: space-between
  align-items: center
  margin-bottom: 28px

  button
    width: 45px
    height: 45px
    border-radius: 50%
    border: none
    background: #f3f3f3
    cursor: pointer
    transition: .3s
    font-size: 18px
    &:hover
      background: #111
      color: white
      transform: rotate(90deg)

.subtitulo
  letter-spacing: 4.8px
  font-size: 14px
  margin-bottom: 18px
  font-weight: 670
  color: #D4AF37

h2
  font-size: 34px
  font-weight: 400
  color: #111
  margin: 0

.input_container
  position: relative
  margin-bottom: 30px

  i
    position: absolute
    left: 20px
    top: 50%
    transform: translateY(-50%)
    color: #777
    font-size: 15px

input
  width: 100%
  padding: 20px 20px 20px 52px
  border-radius: 20px
  border: 1px solid #e5e5e5
  font-size: 15px
  background: white
  transition: .3s
  outline: none

  &:focus
    border: 1px solid #D4AF37
    box-shadow: 0 0 0 4px rgba(212,175,55,.12)

.resultados
  display: flex
  flex-direction: column
  gap: 18px
  flex: 1              
  overflow-y: auto
  padding-right: 8px
  max-height: none

.resultados::-webkit-scrollbar
  width: 8px

.resultados::-webkit-scrollbar-thumb
  background: #ddd
  border-radius: 20px

.card_producto
  display: flex
  gap: 20px
  padding: 18px
  border-radius: 24px
  background: rgba(255,255,255,.75)
  cursor: pointer
  transition: .35s
  border: 1px solid transparent

  &:hover
    transform: translateY(-3px)
    border: 1px solid rgba(212,175,55,.35)
    box-shadow: 0 10px 30px rgba(0,0,0,.08)

  img
    width: 115px
    height: 115px
    object-fit: cover
    border-radius: 18px

.info
  display: flex
  flex-direction: column
  justify-content: center

  h3
    font-size: 18px
    font-weight: 500
    color: #111
    margin-bottom: 10px
    line-height: 1.5

.oro
  color: #8b7355
  font-size: 14px
  margin-bottom: 10px

.precio
  font-size: 17px
  color: #111
  font-weight: 600

.sin_resultados
  text-align: center
  padding: 50px
  color: #777
  font-size: 15px

@keyframes aparecer
  from
    opacity: 0

  to
    opacity: 1

@keyframes subir
  from
    opacity: 0
    transform: translateY(30px) scale(.97)

  to
    opacity: 1
    transform: translateY(0) scale(1)
</style>