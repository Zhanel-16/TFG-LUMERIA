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
  padding: 0 20px

h1
  text-align: center
  margin: 30px 0
  font-weight: 300
  letter-spacing: 2px
  color: #3A3A38

.userPanel
  background: white
  padding: 20px 25px
  border-radius: 14px
  display: flex
  justify-content: space-between
  align-items: center
  flex-wrap: wrap
  gap: 15px
  box-shadow: 0 8px 25px rgba(0,0,0,.07)

.userInfo
  display: flex
  align-items: center
  gap: 12px

  i
    font-size: 2.2rem
    color: #D4AF37

.logoutBtn
  background: transparent
  border: 1px solid #D4AF37
  padding: 10px 18px
  border-radius: 30px
  cursor: pointer
  transition: .3s

  &:hover
    background: #D4AF37
    color: white

.emptyCart
  text-align: center
  margin-top: 60px

  p
    color: #666
    margin-bottom: 20px

  button
    padding: 12px 24px
    border: none
    border-radius: 30px
    background: #111
    color: white
    cursor: pointer

    &:hover
      background: #D4AF37

.favsGrid
  margin-top: 40px
  display: grid
  grid-template-columns: repeat(4, 1fr)
  gap: 25px

.favCard
  background: white
  padding: 20px
  border-radius: 16px
  text-align: center
  box-shadow: 0 6px 18px rgba(0,0,0,.05)
  transition: .3s
  display: flex
  flex-direction: column
  gap: 10px

  &:hover
    transform: translateY(-6px)
    box-shadow: 0 15px 35px rgba(0,0,0,.12)

  img
    width: 100%
    height: 180px
    object-fit: contain

.price
  color: #D4AF37
  font-weight: bold

.cantidad
  font-size: 13px
  color: #777

button
  margin-top: 10px
  padding: 10px
  border-radius: 30px
  border: none
  cursor: pointer
  background: #111
  color: white

  &:hover
    background: #D4AF37

/* RESPONSIVE */
@media (max-width: 1024px)
  .favsGrid
    grid-template-columns: repeat(3, 1fr)

@media (max-width: 768px)
  .favsGrid
    grid-template-columns: repeat(2, 1fr)

  .userPanel
    flex-direction: column
    align-items: flex-start

@media (max-width: 480px)
  .favsGrid
    grid-template-columns: 1fr
</style>