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

  <div class="luxuryHeader">

  <div class="luxuryText">

    <p class="mini">
      LUMERIA PRIVATE COLLECTION
    </p>

    <h1>
      Selección Exclusiva
    </h1>

    <p class="subtitle">
      Tus piezas seleccionadas para una experiencia de compra personalizada.
    </p>

  </div>

  <div class="clientPanel">

    <div class="clientInfo">

      <i class="fa-solid fa-user"></i>

      <div>
        <span>CLIENTE LUMERIA</span>
        <h3>{{ usuario?.email }}</h3>
      </div>

    </div>

    <button
      class="logoutBtn"
      @click="cerrarSesion"
    >
      Cerrar sesión
    </button>

  </div>

</div>

  

  <div v-if="carrito.length === 0" class="emptyCart">
  <p>Tu carrito está vacío</p>
  <button @click="irHome">Ir a explorar</button>
</div>

<div v-else>

  <div class="favsGrid">

    <div
      v-for="(prod, index) in carrito"
      :key="index"
      class="favCard"
    >

      <img :src="prod?.image" alt="">

      <div class="contenido">

        <h4>{{ prod?.title }}</h4>

        <p class="oro">
          {{ prod?.color_oro }}
        </p>

        <p class="price">
          {{ formatPrice(prod?.price) }} €
        </p>

        <button @click="borrar(prod.idDoc)">
          Eliminar
        </button>

      </div>

    </div>

  </div>

  <section class="appointmentSection">

    <div class="appointmentBox">

      <p class="mini">
        EXPERIENCIA PRIVADA
      </p>

      <h2>
        Reserva una cita personalizada
      </h2>

      <p>
        Descubre nuestras colecciones junto a un especialista y encuentra la joya perfecta.
      </p>

      <ReservaCita />

    </div>

  </section>

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

.luxuryHeader
  margin-bottom: 70px

.luxuryText
  text-align: center

.luxuryText h1
  font-size: 48px
  font-weight: 450
  margin-bottom: 15px
  color: #111

.subtitle
  max-width: 700px
  margin: auto
  color: #666
  line-height: 1.8

.mini
  letter-spacing: 5px
  color: #D4AF37
  font-size: 12px
  font-weight: 600
  margin-bottom: 18px

.clientPanel
  margin-top: 40px
  background: white
  border-radius: 24px
  padding: 25px 35px
  display: flex
  justify-content: space-between
  align-items: center
  border: 1px solid rgba(212,175,55,.12)
  box-shadow: 0 10px 30px rgba(0,0,0,.06)

.clientInfo
  display: flex
  align-items: center
  gap: 16px

.clientInfo i
  width: 60px
  height: 60px
  border-radius: 50%
  background: rgba(212,175,55,.12)
  display: flex
  justify-content: center
  align-items: center
  color: #D4AF37
  font-size: 22px

.clientInfo span
  font-size: 12px
  letter-spacing: 2px
  color: #888

.clientInfo h3
  margin-top: 5px

.contenido
  padding: 20px 22px 30px

.oro
  color: #777
  font-size: 13px
  margin-top: 8px
  min-height: 40px

.appointmentSection
  margin-top: 90px

.appointmentBox
  background: white
  border-radius: 24px
  padding: 60px
  text-align: center
  border: 1px solid rgba(212,175,55,.12)
  box-shadow: 0 10px 30px rgba(0,0,0,.06)

.appointmentBox h2
  font-size: 34px
  margin: 15px 0

.appointmentBox p
  color: #666
  line-height: 1.8
  max-width: 650px
  margin: auto auto 35px

@media (max-width: 1200px)

  .favsGrid
    grid-template-columns: repeat(3, minmax(220px,1fr))
    gap: 20px


@media (max-width: 768px)

  h1
    font-size: 34px

  .logoutBtn
    width: 100%

  .favsGrid
    grid-template-columns: repeat(2, 1fr)
    gap: 18px

  .favCard img
    height: 200px
  .luxuryText h1
    font-size: 34px

  .clientPanel
    flex-direction: column
    gap: 20px

  .logoutBtn
    width: 100%

  .appointmentBox
    padding: 35px 25px

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
  .luxuryText h1
    font-size: 28px

  .subtitle
    font-size: 14px

  .appointmentBox h2
    font-size: 24px

@media (max-width: 360px)
  .favsGrid
    grid-template-columns: 1fr
</style>