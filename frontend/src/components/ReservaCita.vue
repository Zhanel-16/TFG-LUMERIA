<script setup>
import axios from "axios"
import { ref } from "vue"
import { auth } from "@/firebase/config"
import { useToast } from "vue-toastification"

const toast = useToast()
const fecha = ref("")
const hora = ref("")
const servicio = ref("Private Experience")

const notes = ref("")
const interest = ref("")

// rango fechas
const fechaMin = "2026-06-20"
const fechaMax = "2028-12-31"

const minDate = new Date(fechaMin)
const maxDate = new Date(fechaMax)

const reservar = async () => {
  try {
    // validar fecha
    const fechaSeleccionada = new Date(fecha.value)

    if (fechaSeleccionada < minDate || fechaSeleccionada > maxDate) {
      toast.error("Selecciona una fecha válida")
      return
    }
    const user = auth.currentUser
    if (!user) {
      toast.error("Debes iniciar sesión")
      return
    }
    if(!hora.value){ //pq hay q eligir una hora q pongo yo!!!! si o si con required
      toast.error("Selecciona una hora")
      return
    }
    await axios.post("https://tfg-lumeria.onrender.com/appointments/", {
      user_id: user.uid,
      email: user.email,
      date: fecha.value,
      time: hora.value,
      service: servicio.value,
      notes: notes.value,
      interest: interest.value
    })
    toast.success("¡Reserva realizada correctamente!")
    // limpiar formulario
    fecha.value = ""
    hora.value = ""
    notes.value = ""
    interest.value = ""
  } catch (error) {
    console.log(error)
    toast.error("Error al reservar")
  }
}
</script>

<template>

<div class="box">
  <!-- const fechaMin = "2026-06-20"
const fechaMax = "2028-12-31" -->
  <div class="agenda">Agenda privada abierta desde el 20 junio 2026 hasta el 31 de diciembre de 2028. Las plazas son limitadas para garantizar una experiencia exclusiva y personalizada.</div>
  <!-- FECHA -->
  <input type="date" v-model="fecha" :min="fechaMin" :max="fechaMax">

  <!-- HORAS -->
  <select v-model="hora" required>
    <option disabled value="">
      Selecciona una hora
    </option>
    <option>10:30</option>
    <option>11:30</option>
    <option>12:30</option>
    <option>13:30</option>
    <option>14:30</option>

    <option>17:30</option>
    <option>18:30</option>
  </select>

  <!-- INTERÉS -->
  <select v-model="interest" required>
    <option disabled value="">
      ¿Qué te interesa?
    </option>
    <option>Anillos de compromiso</option>
    <option>Diamantes</option>
    <option>Pulseras</option>
    <option>Pendientes</option>
    <option>Alta joyería</option>
    <option>Lucky Charms</option>
    <option>Otros</option>
  </select>
  <!-- NOTAS -->
  <textarea v-model="notes" placeholder="Cuéntanos qué tipo de experiencia buscas y prepararemos una selección personalizada para tu visita."></textarea>

  <button @click="reservar" :disabled="!auth.currentUser">Reservar asesoramiento</button>
  <!-- para q este en gris si no estas register -->
  <!-- :disabled="!fecha || !hora || !interest" -->
</div>
</template>

<style scoped lang="sass">
.box
  display: flex
  flex-direction: column
  gap: 18px
  margin-top: 30px
  // align-items: center

.agenda
  background: #f5f1e8
  border: 1px solid #D4AF37
  padding: 18px
  border-radius: 14px
  color: #555
  line-height: 1.7
  font-size: .95rem
input,
select,
textarea
  padding: 14px
  border: 1px solid #ddd
  border-radius: 12px
  font-family: inherit
  background: white
  cursor: pointer

select 
  appearance: none

textarea
  min-height: 140px
  resize: vertical

button
  background: black
  color: white
  border: none
  padding: 15px 28px
  border-radius: 40px
  cursor: pointer
  transition: .3s
  font-size: 15px
  width: min(320px, 90%) // PC: 320px, movil: 90%
  align-self: center

  &:hover
    background: #D4AF37

button:disabled
  opacity: .5
  cursor: not-allowed
</style>