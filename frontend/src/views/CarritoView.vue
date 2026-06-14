<script setup>
import ReservaCita from '@/components/ReservaCita.vue'
import { obtenerCarrito } from '@/servicios/tarea'
import { estaAutenticado, logOut, usuario } from '@/servicios/autenticacion'
import { ref, onMounted, computed, watch } from 'vue'
import { useRouter } from 'vue-router'
import { useToast } from 'vue-toastification'
import axios from 'axios'

import { eliminarCarrito } from '@/servicios/tarea'
const formatPrice = (price) => {
  return new Intl.NumberFormat('en-US', {
    maximumFractionDigits: 0
  }).format(Number(price))
}

const irProducto = (id) => {
  router.push(`/products/${id}`)
}

const router = useRouter()
const toast = useToast()
const yaTienePulsera = ref(false)
const irHome = () => {
  router.push('/')
}
const totalItems = computed(() => carrito.value.length)

const carrito = ref([])
const reservaVip = ref(null) //lo q aparecerá en carrito
const eliminando = ref(null)

const obtenerReservaVip = async () => {
  try {
    if (!usuario.value) return
    const res = await axios.get(
      `https://tfg-lumeria.onrender.com/appointments/user/${usuario.value.uid}`
    )
    reservaVip.value = res.data
    yaTienePulsera.value = !!res.data?.giftEligible
  } catch (error) {
    console.log("Error reserva VIP:", error.response?.data || error)
  }
}
// q me muestre las fechas cuando se solicito la cita + fecha pedida 
const fechaCitaFormateada = computed(() => {
  if (!reservaVip.value?.date) return ""

  return new Date(reservaVip.value.date)
    .toLocaleDateString("es-ES", {
      day: "numeric",
      month: "long",
      year: "numeric"
    })
})

const fechaPedidaFormateada = computed(() => {
  if (!reservaVip.value?.proposalDate) return ""

  return new Date(reservaVip.value.proposalDate)
    .toLocaleDateString("es-ES", {
      day: "numeric",
      month: "long",
      year: "numeric"
    })
})
// CUANDO SE HA CREADO!!!!!!!!!!!!!!!!!!!
const fechaReservaFormateada = computed(() => {
  if (!reservaVip.value?.created_at) return ""

  return new Date(reservaVip.value.created_at)
    .toLocaleDateString("es-ES", {
      day: "numeric",
      month: "long",
      year: "numeric"
    })
})

const diasParaPedida = computed(() => { //dias rest
  if (!reservaVip.value?.proposalDate) return null

  const hoy = new Date(now.value)
  const pedida = new Date(reservaVip.value.proposalDate)

  hoy.setHours(0,0,0,0)
  pedida.setHours(0,0,0,0)

  const diff = pedida - hoy
  return Math.ceil(diff / (1000 * 60 * 60 * 24))
})



// prueba watch 
watch(usuario, (nuevoUsuario) => {
  console.log("usuario watch:", nuevoUsuario)
  console.log("uid frontend:", nuevoUsuario?.uid)
  if (nuevoUsuario) {
    obtenerReservaVip()
  }
}, { immediate: true })


const obtenerDatos = async () => {
  const resultado = await obtenerCarrito()

  if (resultado.ok) {
    carrito.value = resultado.productos
  }
}
onMounted(() => {
  obtenerDatos()
  // obtenerReservaVip()
})
const totalPrecio = computed(() => {
  return carrito.value.reduce((acc, prod) => acc + Number(prod.price), 0)
})


const borrar = async (id) => {
  eliminando.value = id
  toast.info("Eliminando joya de tu wishlist...")

  await eliminarCarrito(id)
  await obtenerDatos()
  eliminando.value = null
  toast.success("Producto eliminado")
}

const cerrarSesion = async () => {
  const resultado = await logOut()

  if (resultado.ok) {
    toast.success("Cerrando sesión...")
    router.push("/login")
  }
}
const now = ref(Date.now())

onMounted(() => {   // que mañana cambie automáticamente sin recargar
  setInterval(() => {
    now.value = Date.now()
  }, 60000)
})
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
      Tus piezas seleccionadas ya están preparadas para ti. Cada artículo forma parte de una selección exclusiva pensada para reflejar tu estilo y tu identidad. Te invitamos a descubrir esta experiencia de lujo en persona en nuestra tienda física Joeyria, donde podrás disfrutar de una atención privada y un entorno diseñado para que vivas el lujo con calma y exclusividad.
    </p>
    <div v-if="reservaVip?.giftStatus === 'pendiente'" class="giftStatusMessage">
      Pendiente de recoger: un regalo especial reservado para ti | Lumeria Exclusive Gifts
    </div>

    <div v-if="reservaVip?.giftStatus === 'entregado'">
      Regalo entregado
    </div>
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
  <div v-if="reservaVip?.giftEligible" class="vipGiftCard">
    <p class="mini">ENGAGEMENT CONCIERGE BENEFIT</p>

    <h2>Regalo exclusivo desbloqueado</h2>

    <p>Tu pulsera exclusiva está reservada para vuestra visita privada.</p>

    <div class="timeline">

      <p><strong>Reserva realizada:</strong>{{ fechaReservaFormateada }}</p>
      <p><strong>Cita privada:</strong>{{ fechaCitaFormateada }}</p>

      <p><strong>Pedida prevista:</strong>{{ fechaPedidaFormateada }}</p>

      <p v-if="diasParaPedida > 0">
        Faltan <strong>{{ diasParaPedida }}</strong> días para vuestro gran momento...
      </p>
      <p v-else>La fecha prevista ya ha llegado 💍</p>
    </div>

    <div class="giftValue">
      Valor exclusivo · 499€
    </div>

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
      class="favCard" @click="irProducto(prod.id || prod.productId)"
    >

      <div class="img-wrap">
        <img :src="prod?.image" :loading="index < 4 ? 'eager' : 'lazy'" decoding="async"
          :alt="prod?.title">
      </div>

      <div class="contenido">
        <h3>{{ prod.name }}</h3>
        <p class="oro">
          {{ prod?.color_oro }}
        </p>

        <p class="price">
          {{ formatPrice(prod?.price) }} €
        </p>

        <button @click.stop="borrar(prod.idDoc)" :disabled="eliminando === prod.idDoc">
          {{eliminando === prod.idDoc ? 'Eliminando...' : 'Eliminar'}}
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

      <div class="formWrap">
        <ReservaCita />
      </div>

    </div>

  </section>

</div>

</section>
</template>

<style lang="sass" scoped>
.timeline
  max-width: 520px
  margin: 30px auto
  padding: 25px
  background: rgba(212,175,55,.06)
  border-radius: 18px
  p
    margin: 12px 0
    font-size: 16px

.giftStatusMessage
  margin-top: 32px

.vipGiftCard
  margin: 50px auto
  max-width: 850px
  background: linear-gradient(135deg, #fff, #faf8f1)
  border: 1px solid rgba(212,175,55,.25)
  border-radius: 30px
  padding: 45px
  text-align: center
  box-shadow: 0 20px 60px rgba(0,0,0,.08)

.vipGiftCard h2
  font-size: 34px
  font-weight: 450
  margin: 15px 0

.vipGiftCard p
  max-width: 650px
  margin: auto
  color: #666
  line-height: 1.9

.giftValue
  margin-top: 30px
  display: inline-flex
  padding: 12px 24px
  border-radius: 40px
  background: rgba(212,175,55,.12)
  color: #AA7C11
  font-weight: 600

.carrito
  max-width: 1180px
  margin: 60px auto
  padding: 0 20px
.luxuryText
  text-align: center

.luxuryText h1
  text-align: center
  font-family: "Outfit", sans-serif
  font-size: 39px
  font-weight: 450
  margin: 50px 0
  color: #111
.logoutBtn
  width: 400px
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
  background: white
  padding: 50px
  border-radius: 24px
  text-align: center
  box-shadow: 0 10px 30px rgba(0,0,0,.06)
  border: 1px solid rgba(212,175,55,.12)
  max-width: 480px
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
    font-size: 18.2px

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
  cursor: pointer
  // opacity: 0
  // animation: aparecer .5s ease forwards


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

h3
  font-size: 17px
  font-weight: 600
  line-height: 1.4
  color: #111
  text-align: center
  min-height: 20px
  margin-bottom: 6px

.price
  color: #AA7C11
  font-size: 20px
  font-weight: 650
  margin: 6px 0 12px

.cantidad
  color: #777
  font-size: 13px
  margin-top: 5px

.favCard button
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

.resumen
  margin-top: 60px
  background: white
  padding: 30px
  border-radius: 24px
  box-shadow: 0 10px 30px rgba(0,0,0,.06)
  border: 1px solid rgba(212,175,55,.12)
  text-align: center
.formWrap
  max-width: 500px
  margin: 0 auto
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
  margin: 40px auto 0 auto
  width: 100%
  max-width: 520px
  min-width: 320px
  background: white
  border-radius: 24px
  padding: 22px 37px
  display: flex
  gap: 20px
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
  padding: 12px 25px 35px
  text-align: center
  display: flex
  flex-direction: column
  flex: 1

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

.appointmentSection
  margin-top: 90px

.appointmentBox
  background: white
  border-radius: 24px
  padding: 50px 30px
  text-align: center
  border: 1px solid rgba(212,175,55,.12)
  box-shadow: 0 10px 30px rgba(0,0,0,.06)
  max-width: 700px
  margin: 0 auto

.appointmentBox h2
  font-size: 34px
  margin: 15px 0

.appointmentBox p
  color: #666
  line-height: 1.8
  max-width: 650px
  margin: auto auto 35px
@keyframes aparecer
  from
    opacity: 0
    transform: translateY(20px)

  to
    opacity: 1
    transform: translateY(0)
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