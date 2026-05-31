<script setup>
import ReservaCita from '@/components/ReservaCita.vue'
import { obtenerCarrito } from '@/servicios/tarea'
import { estaAutenticado, logOut, usuario } from '@/servicios/autenticacion'
import { ref, onMounted, computed } from 'vue'
import { useRouter } from 'vue-router'
import { useToast } from 'vue-toastification'

import { eliminarCarrito } from '@/servicios/tarea'

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
    <p class="price">{{ prod?.price }} €</p>
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
  max-width: 1200px
  margin: 40px auto
  padding: 0 30px

h1
  text-align: center
  margin: 40px 0
  font-weight: 300
  letter-spacing: 3px
  color: #3A3A38

.userPanel
  background: white
  padding: 25px 35px
  border-radius: 14px
  display: flex
  justify-content: space-between
  align-items: center
  box-shadow: 0 8px 25px rgba(0,0,0,.07)

.userInfo
  display: flex
  align-items: center
  gap: 15px

  i
    font-size: 2.5rem
    color: #D4AF37

.welcome
  font-size: 13px
  color: #888

.logoutBtn
  background: transparent
  border: 1px solid #D4AF37
  padding: 10px 22px
  border-radius: 30px
  cursor: pointer
  transition: .3s
  font-family: "Nunito"

  &:hover
    background: #D4AF37
    color: white

.loadFavs
  display: block
  margin: 30px auto
  background: #3A3A38
  color: white
  border: none
  padding: 12px 26px
  border-radius: 30px
  cursor: pointer
  transition: .3s

  &:hover
    background: #D4AF37
.favsGrid
  margin-top: 40px
  display: grid
  grid-template-columns: repeat(4,1fr)
  gap: 30px

.favCard
  background: white
  padding: 20px
  border-radius: 14px
  text-align: center
  box-shadow: 0 5px 18px rgba(0,0,0,.05)
  transition: .3s

  &:hover
    transform: translateY(-6px)
    box-shadow: 0 12px 30px rgba(0,0,0,.12)

  img
    width: 100%
    height: 180px
    object-fit: contain
    margin-bottom: 15px

.price
  color: #D4AF37
  font-weight: bold
  margin-top: 5px

.cantidad
  font-size: 13px
  color: #888
</style>