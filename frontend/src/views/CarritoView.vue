<script setup>
import ReservaCita from '@/components/ReservaCita.vue'
import { obtenerCarrito } from '@/servicios/tarea'
import { estaAutenticado, logOut, usuario } from '@/servicios/autenticacion'
import { ref, onMounted, computed } from 'vue'
import { useRouter } from 'vue-router'
import { useToast } from 'vue-toastification'

import { eliminarCarrito } from '@/servicios/tarea'
const formatPrice = (price) => {
  return new Intl.NumberFormat('en-US', {
    maximumFractionDigits: 0
  }).format(Number(price))
}
const router = useRouter()
const toast = useToast()

const irHome = () => {
  router.push('/')
}
const totalItems = computed(() => carrito.value.length)

const carrito = ref([])

const obtenerDatos = async () => {
  const resultado = await obtenerCarrito()

  if (resultado.ok) {
    carrito.value = resultado.productos
  }
}
onMounted(() => {
  obtenerDatos()
})
const totalPrecio = computed(() => {
  return carrito.value.reduce((acc, prod) => acc + Number(prod.price), 0)
})


const borrar = async (id) => {
  await eliminarCarrito(id)
  obtenerDatos() // recargar
}

const cerrarSesion = async () => {
  const resultado = await logOut()

  if (resultado.ok) {
    toast.success("Cerrando sesión...")
    router.push("/login")
  }
}
</script>

<template>
<section class="carrito">

  <div class="userPanel">
    <div class="userInfo">
      <i class="fa-solid fa-user-circle"></i>
      <div>
        <p class="welcome">Bienvenida</p>
        <h3>{{ usuario?.email }}</h3>
      </div>
    </div>

    <button class="logoutBtn" @click="cerrarSesion">Cerrar sesión</button>
  </div>

  <h1>Tu carrito</h1>

  <div v-if="carrito.length === 0" class="emptyCart">
  <p>Tu carrito está vacío</p>
  <button @click="irHome">Ir a explorar</button>
</div>

<div v-else class="favsGrid">
  <div v-for="(prod, index) in carrito" :key="index" class="favCard">
    <img :src="prod?.image" alt="">
    <h4>{{ prod?.title }}</h4>
    <p class="price">{{ formatPrice(prod?.price) }} €</p>
    <p class="cantidad">Cantidad: {{ prod.rating?.count }}</p>
    <button @click="borrar(prod.idDoc)">Eliminar</button>
  </div>
  <!-- <div>
    <span class="badge">Total productos: {{ totalItems }}</span>
    <h2>Total: {{ totalPrecio.toFixed(2) }} €</h2>
</div> -->

<!-- FORMULARIO -->
  <ReservaCita />
</div>

</section>
</template>

<style lang="sass" scoped>
.carrito
  max-width: 1180px
  margin: 60px auto
  padding: 0 20px

h1
  text-align: center
  font-family: "Outfit", sans-serif
  font-size: 42px
  font-weight: 450
  margin: 50px 0
  color: #111

.userPanel
  background: white
  border-radius: 24px
  padding: 25px 35px
  display: flex
  justify-content: space-between
  align-items: center
  box-shadow: 0 10px 30px rgba(0,0,0,.06)
  border: 1px solid rgba(212,175,55,.12)

.userInfo
  display: flex
  align-items: center
  gap: 16px

  i
    font-size: 42px
    color: #D4AF37

.welcome
  color: #777
  font-size: 13px
  letter-spacing: 2px
  text-transform: uppercase

.userInfo h3
  font-size: 16px
  color: #111
  margin-top: 4px

.logoutBtn
  width: 170px
  height: 48px
  border: none
  border-radius: 40px
  background: #111
  color: white
  cursor: pointer
  transition: .35s ease

  &:hover
    background: #D4AF37

.emptyCart
  text-align: center
  margin-top: 80px

  p
    color: #777
    margin-bottom: 20px
    font-size: 18px

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

.favsGrid
  display: grid
  grid-template-columns: repeat(4, 250px)
  justify-content: center
  gap: 35px
  margin-top: 50px

.favCard
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

  &:hover
    transform: translateY(-10px)
    box-shadow: 0 25px 60px rgba(0,0,0,.12)

  &:hover img
    transform: scale(1.05)

  img
    width: 100%
    height: 250px
    object-fit: cover
    transition: .6s ease
    background: #fafafa

.favCard h4
  font-size: 16px
  font-weight: 600
  line-height: 1.4
  color: #111
  padding: 20px 20px 0
  min-height: 70px

.price
  color: #AA7C11
  font-size: 24px
  font-weight: 650
  margin-top: 8px

.cantidad
  color: #777
  font-size: 13px
  margin-top: 5px

.favCard button
  width: 170px
  height: 48px
  border: none
  border-radius: 40px
  background: #111
  color: white
  cursor: pointer
  margin: 18px auto 25px
  transition: .35s ease

  &:hover
    background: #D4AF37

.resumen
  margin-top: 60px
  background: white
  padding: 30px
  border-radius: 24px
  box-shadow: 0 10px 30px rgba(0,0,0,.06)
  border: 1px solid rgba(212,175,55,.12)
  text-align: center

.badge
  display: inline-block
  background: rgba(212,175,55,.12)
  color: #AA7C11
  padding: 10px 18px
  border-radius: 40px
  margin-bottom: 15px

.resumen h2
  font-size: 32px
  color: #111

@media (max-width: 1200px)

  .favsGrid
    grid-template-columns: repeat(3, minmax(220px,1fr))
    gap: 20px


@media (max-width: 768px)

  h1
    font-size: 34px

  .userPanel
    flex-direction: column
    align-items: flex-start
    gap: 20px

  .logoutBtn
    width: 100%

  .favsGrid
    grid-template-columns: repeat(2, 1fr)
    gap: 18px

  .favCard img
    height: 200px

@media (max-width: 480px)

  .carrito
    margin-top: 30px

  h1
    font-size: 28px

  .favsGrid
    grid-template-columns: repeat(2, 1fr)
    gap: 12px

  .favCard
    border-radius: 18px

  .favCard img
    height: 150px

  .favCard h4
    font-size: 13px
    min-height: 55px
    padding: 14px 12px 0

  .price
    font-size: 17px

  .cantidad
    font-size: 11px

  .favCard button
    width: 90%
    height: 38px
    font-size: 11px
    margin-bottom: 15px

@media (max-width: 360px)

  .favsGrid
    grid-template-columns: 1fr
</style>