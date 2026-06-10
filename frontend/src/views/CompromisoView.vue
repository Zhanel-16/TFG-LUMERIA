<template>
  <div id="app-layout">
  <section class="hero_compromiso">
  <div class="overlay">
    <p class="mini">ENGAGEMENT CONCIERGE</p>
    <h1>Descubre el anillo ideal que sellará vuestro compromiso para siempre</h1>
    <p class="desc">Nuestro equipo elegirá personalmente piezas exclusivas y a medida según <br> vuestras preferencias estéticas y presupuesto.</p>
  </div>
</section>
<!-- card 4 anillos Compromiso de bd -->
<section class="coleccion">
  <div v-for="prod in productos" :key="prod.id" class="card">
    <div class="img-wrap">
      <img :src="prod.image" />
    </div>
    <div class="contenido">
      <h2>{{ prod.name }}</h2>
      <p class="oro">{{ prod.color_oro }}</p>
      <p class="precio">{{ formatPrice(prod.price) }} €</p>
      <button @click="goToProducto(prod.id)">Ver producto</button>
    </div>
  </div>
</section>
<section class="vip">
  <div class="left">
    <p class="mini">PRIVATE EXPERIENCE</p>

    <h2>Reserva una asesoría privada</h2>
    <p>Si reservas vuestra experiencia antes de la pedida, recibiréis una pulsera de diamantes en plata valorada en 499€</p>
    <p class="reglas">Para garantizar una experiencia totalmente personalizada, las reservas deben realizarse con un mínimo de 3 días de antelación. La fecha prevista para la pedida deberá ser posterior a la fecha de vuestra cita privada.</p>

    <p class="info-fecha">Las citas privadas requieren un mínimo de 3 días de antelación. Próxima fecha disponible:<strong>{{ fechaMinimaFormateada }}</strong></p>
    <p v-if="fechaCita" class="info-reserva">La fecha de la pedida debe ser posterior a la cita privada. Primera fecha posible para la pedida: <strong>{{ fechaPedidaMinFormateada }}</strong>
    </p>

    <img src="/images/hola.jpg">
  </div>
  
  <!-- block si no estas log + si paso el ratón not allowed cursor -->
  <div class="right" :class="{ bloqueado: !auth.currentUser }" @mouseenter="mostrarToastLogin">
    <span>Nombre de tu prometida o prometido</span>
    <input type="text" v-model="nombrePareja" placeholder="Nombre de tu pareja" :disabled="!auth.currentUser">
    
    <!-- TODOS LO SINPUTS + BUTTON + SELECTS EN GRIS = BLOQUEADOS SI NO ESTÁS LOGIN -->
    <span>Fecha de la pedida</span>
    <input type="date" v-model="fechaPedida" :min="fechaPedidaMin" :disabled="!fechaCita"/>
    <!-- no se puede elegir una fecha de pedida antes de seleccionar cita privada -->
    <!-- <input type="date" v-model="pedida" :min="fechaMin" :max="fechaMax" :disabled="!auth.currentUser"> fecha pedida -->
    <span>Fecha de la cita privada</span>
    <input type="date" v-model="fechaCita" :min="fechaMinima"/>
    <!-- <input type="date" v-model="fecha" :min="fechaMin" :max="fechaMax" :disabled="!auth.currentUser"> fecha de la cita privada -->
    
    <span>Hora de la experiencia</span>
    
    <select v-model="hora" :disabled="!auth.currentUser">
      <option disabled value="">
        Selecciona una hora
      </option>
      <option>10:30</option>
      <option>11:30</option>
      <option>12:30</option>
      <option>17:30</option>
      <option>18:30</option>
    </select>

    <span>Presupuesto aproximado</span>
    <select v-model="presupuesto" :disabled="!auth.currentUser">
      <option disabled value="">
        Selecciona un presupuesto aproximado
      </option>

      <option>Menos de 1.000€</option>
      <option>1.000€ - 3.000€</option>
      <option>3.000€ - 6.000€</option>
      <option>Más de 6.000€</option>

    </select>

    <button @click="reservar" :disabled="!auth.currentUser">Reservar experiencia privada</button>

  </div>
</section>
<WhatsappExpert/>
</div>
</template>

<script setup>
import WhatsappExpert from "@/components/WhatsappExpert.vue"
import { useRouter } from "vue-router"
import { computed } from "vue"
const router = useRouter()

const goToProducto = (id) => {
  router.push(`/products/${id}`)
}
import axios from "axios"
import { ref, onMounted } from "vue"
import { auth } from "@/firebase/config"
import { useToast } from "vue-toastification"
const fechaMinima = computed(() => {
  const fecha = new Date()
  fecha.setDate(fecha.getDate() + 3)

  return fecha.toISOString().split("T")[0]
}) 

const fechaPedidaMin = computed(() => {
  if (!fechaCita.value) return ""
  const fecha = new Date(fechaCita.value)
  fecha.setDate(fecha.getDate() + 1)
  return fecha.toISOString().split("T")[0]
})

const fechaMinimaFormateada = computed(() => {
  return new Date(fechaMinima.value)
    .toLocaleDateString("es-ES")
})

const fechaPedidaMinFormateada = computed(() => {
  if (!fechaPedidaMin.value) return ""

  return new Date(fechaPedidaMin.value)
    .toLocaleDateString("es-ES")
})
const toast = useToast()
const productos = ref([])

const nombrePareja = ref("")
const presupuesto = ref("")

const fechaCita = ref("")
const fechaPedida = ref("")

const hora = ref("")
const interest = ref("Anillos de compromiso")

// const fechaMin = "2026-01-01"
// const fechaMax = "2028-12-31"

const formatPrice = (price) => {
  const num = typeof price === 'number'
    ? price
    : parseFloat(String(price).replace(',', '.'))

  return new Intl.NumberFormat('en-US', {
    maximumFractionDigits: 0
  }).format(num)
}
const mostrarToastLogin = () => {
  if (!auth.currentUser) {
    toast.info(
      "Inicia sesión para reservar vuestra experiencia privada")
  }
}
// peticion a los q tienen de category = anilloCompromiso
const cargarProductos = async () => {
  const res = await axios.get(
    "https://tfg-lumeria.onrender.com/products/search?q=anillosCompromiso"
  )
  productos.value = (res.data.products || res.data).slice(0, 4)
}

const reservar = async () => {
  try {
    const user = auth.currentUser
    
    if (!user) { // si no esta logueado
      toast.error(
        "Debes iniciar sesión para reservar"
      )
      return
    }    
    if ( // VALIDACIONES
      !fechaCita.value ||
      !hora.value ||
      !presupuesto.value
    ) {
      toast.error(
        "Completa todos los campos")
      return
    }
    // TEXTO EXTRA al form principal
    const notasVip =
  `Nombre pareja: ${nombrePareja.value}\n` +
  `Fecha pedida: ${fechaPedida.value}\n` +
  `Presupuesto: ${presupuesto.value}`

    // 
    const hoyMas3 = new Date()
    hoyMas3.setDate(hoyMas3.getDate() + 3)

    const cita = new Date(fechaCita.value)
    const pedida = new Date(fechaPedida.value)

    if (cita < hoyMas3) {
      toast.error(
        `Las reservas requieren un mínimo de 3 días de antelación. La primera fecha disponible es ${fechaMinimaFormateada.value}`
      )
      return
    }

    if (pedida <= cita) {
      toast.error("La fecha de la pedida debe ser posterior a la cita privada.")
      return
    }
    // 

    await axios.post(
      "https://tfg-lumeria.onrender.com/appointments/",
      {
        user_id: user.uid,
        email: user.email,
        date: fechaCita.value,
        time: hora.value,
        service: "Engagement Concierge",
        interest: interest.value,

        notes: notasVip
      }
    )
    toast.success(
      "¡Reserva realizada correctamente!"
    )
    // limpiar
    nombrePareja.value = ""
    fechaPedida.value = ""
    presupuesto.value = ""
    fechaCita.value = ""
    hora.value = ""

  } catch (error) {

    console.log(error)

    toast.error(
      "Error al reservar"
    )
  }
}
onMounted(() => {
  cargarProductos()
})
</script>

<style lang="sass" scoped>
.reglas
  margin-top: 14px
  padding: 16px 20px
  background: rgba(212,175,55,.05)
  border: 1px solid rgba(212,175,55,.18)
  border-radius: 14px

  font-size: 14px
  color: #666
  line-height: 1.8

.info-fecha
  margin-top: 14px
  padding: 14px 18px

  background: rgba(212,175,55,.06)
  border-left: 4px solid #D4AF37
  border-radius: 12px

  font-size: 14px
  color: #555

  strong
    color: #AA7C11

.info-reserva
  margin-top: 12px
  padding: 14px 18px
  background: rgba(212,175,55,.06)
  border: 1px solid rgba(212,175,55,.25)
  border-left: 4px solid #D4AF37
  border-radius: 12px

  color: #555
  font-size: 14px
  line-height: 1.7

  strong
    color: #AA7C11
    font-weight: 650

.coleccion
  max-width: 1180px
  margin: 80px auto
  padding: 0 20px
  display: grid
  grid-template-columns: repeat(4, 250px)
  justify-content: center
  gap: 45px

.hero_compromiso
  height: 75vh
  background: url('/images/compromiso.webp') center/cover
  position: relative

.card
  height: 520px
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

  &:hover
    transform: translateY(-10px)
    box-shadow: 0 25px 60px rgba(0,0,0,.12)

    img
      transform: scale(1.05)
      filter: brightness(.75)

.img-wrap
  height: 300px
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
  justify-content: space-between
  text-align: center

h2
  min-height: 44px
  font-size: 17px
  font-weight: 600
  color: #111
  margin-bottom: 6px

.oro
  color: #777
  font-size: 13px
  min-height: 36px
  display: flex
  align-items: center
  min-height: 53px
  justify-content: center
  text-align: center
  margin: 7px 0
.precio
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
  margin: 12px auto 10px
  cursor: pointer
  transition: .35s ease
  &:hover
    background: #D4AF37

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
  h1 //titulo
    font-size: 38px
    font-family: "Outfit", sans-serif;
    max-width: 800px
    font-weight: 460
    line-height: 1.1

.desc //titulo chico
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

.categoria
  font-size: 10px
  letter-spacing: 4px
  color: #b08d57
  margin-bottom: 10px

.vip
  max-width: 1150px
  margin: 5px auto
  padding: 0 40px
  display: grid
  grid-template-columns: 1fr 1fr
  gap: 80px
  align-items: center
  .left
    h2
      font-size: 26px
    p
      font-size: 17px
    .mini
      font-size: 18px
      font-weight: 700
  
  .left img
    width: 100%
    border-radius: 30px
    margin-top: 30px

  .right
    display: flex
    flex-direction: column
    gap: 10px
    position: relative
    cursor: pointer
    span
      font-size: 12px
      color: #777
      margin-left: 6px
      margin-top: 4px
      letter-spacing: 0.8px

  .right input,
  .right select
    padding: 20px
    border-radius: 18px
    border: 1px solid #ddd
    background: white
    font-size: 15px

  .right button
    
    background: black
    color: white
    border: none
    width: 52%
    align-items: center
    text-align: center
    padding: 20px
    margin: 0 auto
    justify-content: center
    display: flex
    border-radius: 50px
    cursor: pointer
    transition: .3s
    font-size: 16px
    &:hover
      background: #D4AF37

  .bloqueado
    opacity: .6
    position: relative
    &::after
      // \A --> salto de linea
      content: "Inicia sesión o regístrate para desbloquear\Ala experiencia privada"
      white-space: pre-line
      position: absolute
      inset: 0
      background: rgba(255,255,255,.45)
      backdrop-filter: blur(1.5px)
      display: flex
      justify-content: center
      align-items: center
      font-size: 21.6px
      text-align: center
      font-weight: 600
      // text-transform: uppercase
      letter-spacing: 1.2px
      // letter-spacing: 0.8px
      color: #111
      border-radius: 30px

  .right input:disabled,
  .right select:disabled,
  .right button:disabled
    cursor: not-allowed

@media (max-width: 1024px)
  .coleccion
    grid-template-columns: repeat(2, 1fr)
    gap: 25px
  .card
    height: 480px
  .img-wrap
    height: 280px

@media (max-width: 768px)
  .hero_compromiso
    height: 60vh
  .overlay h1
    font-size: 30px
  .desc
    font-size: 16px
  .coleccion
    grid-template-columns: repeat(2, 1fr)
    gap: 16px
    padding: 0 15px
  .card
    height: auto

  .img-wrap
    height: 220px

  .vip
    grid-template-columns: 1fr
    gap: 40px

  .vip .right button
    width: 74%

@media (max-width: 480px)
  h1
    min-height: 48px
  .hero_compromiso
    height: 50vh
  .overlay h1
    font-size: 24px
  .desc
    font-size: 14px
    line-height: 1.6
  .coleccion
    grid-template-columns: repeat(2, minmax(140px, 1fr))
    gap: 12px

  .img-wrap
    height: 200px
  h2
    font-size: 13px
  .oro
    font-size: 11px
    min-height: 42px

  .precio
    font-size: 15px

  .card
    max-width: 360px
    // margin: 0 auto
    height: auto
  .img-wrap
    height: 180px

  .vip
    padding: 0 20px

  button
    width: 100%
    height: 40px
    font-size: 12px

</style>