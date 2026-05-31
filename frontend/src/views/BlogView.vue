<template>
<section class="blog">
  <h1 class="title-anim">Últimos artículos del Universo Lumeria</h1>
  <div class="grid">
    <div v-for="post in posts" :key="post.id" class="card" @click="abrirPost(post.id)">

      <img :src="post.img" class="card_img">

      <div class="card_content">
        <p class="date">{{ post.datee }}</p>
        <h2>{{ post.title }}</h2>
        <p class="desc">{{ post.description }}</p>
        <button>Leer más</button>
      </div>
    </div>
  </div>
  <WhatsappExpert />
</section>
</template>

<script setup>
import WhatsappExpert from "@/components/WhatsappExpert.vue";
import { useRouter } from 'vue-router'
const router = useRouter()
const posts = [
  {
    id: 1,
    title: "Guía definitiva del anillo de compromiso",
    img: "/images/compromiso.webp",
    description: "Tu guía experta para decidir entre quilates, gemas y monturas, manteniendo el foco en la magia de vuestro romance.",
    datee: "18 marzo, 2026"
  },
  {
    id: 2,
    title: "Guía de cuidado de joyas",
    img: "/images/cuidadoJoyas.webp",
    description: "Descubre cómo cuidar tus joyas favoritas, protegiendo sus materiales y manteniendo su brillo intacto para siempre.",
    datee: "27 abril, 2026"
  },
  {
    id: 3,
    title: "El arte del ring stacking",
    img: "/images/stackOroBlanco.webp",
    description: "Tus manos, tus reglas: diseña, combina y redefine tu look diario que transformará por completo tu estilo.",
    datee: "5 marzo, 2026"
  },
  {
    id: 4,
    title: "Cómo hacer la pedida perfecta",
    img: "/images/boda.webp",
    description: "Ideas y consejos expertos para dar el paso definitivo y organizar un momento que recordaréis toda la vida.",
    datee: "1 febrero, 2026"
  },
  {
    id: 5,
    title: "Topacio vs Aguamarina",
    img: "/images/AguamarinaCompromisoOroAmarillo.webp",
    description: "Dos tonos de azul, dos personalidades: la brújula perfecta para elegir la piedra preciosa que mejor te define.",
    datee: "10 enero, 2026"
  },
  {
    id: 6,
    title: "Guía de regalos según presupuesto",
    img: "/images/colleccionArtic.webp",
    description: "Joyas por presupuesto y ocasión: opciones premium, menos de 500€ y ediciones para San Valentín o Madre e Hija.",
    datee: "17 mayo, 2026"
  }
]

const abrirPost = (id) => {
  router.push(`/blog/${id}`)
}
</script>

<style lang="sass" scoped>
.blog
  max-width: 1150px
  margin: 34px auto
  padding: 0 30px
.title-anim
  opacity: 0
  transform: translateY(20px) rotate(-1deg)
  animation: rotateIn 1s ease forwards

@keyframes rotateIn
  to
    opacity: 1
    transform: translateY(0) rotate(0)

@keyframes blink
  50%
    border-color: transparent
h1
  text-align: center
  margin-bottom: 44px
  font-size: 40px
  font-weight: 300
  letter-spacing: 1px
  color: #111
  font-family: "Bonheur Royale", cursive;

.grid
  display: grid
  grid-template-columns: repeat(auto-fit, minmax(320px, 1fr))
  gap: 35px

.card
  display: flex
  cursor: pointer
  background: white
  border-radius: 24px
  overflow: hidden
  border: 1px solid rgba(0,0,0,.06)
  box-shadow: 0 10px 30px rgba(0,0,0,.04)
  display: flex
  flex-direction: column
  transition: all .35s ease
  &:hover
    transform: translateY(-8px)
    box-shadow: 0 20px 50px rgba(0,0,0,.10)

.card_img
  width: 100%
  height: 260px
  object-fit: cover

.card_content
  padding: 28px
  display: flex
  flex-direction: column
  flex: 1
// datos fijos por la altura 
.date
  color: #888
  font-size: 13px
  margin-bottom: 14px

.card_content h2
  font-size: 22px
  line-height: 1.4
  height: 3.2em
  overflow: hidden
  margin-bottom: 15px
  font-weight: 500

.desc
  height: 4.8em
  overflow: hidden
  color: #666
  font-size: 14.65px
  line-height: 1.7
  margin-bottom: 25px

button
  margin-top: auto
  width: 120px
  align-self: center
  background: #111
  color: white
  font-size: 15px
  border: none
  padding: 14px 0
  border-radius: 55px
  transition: .3s
  cursor: pointer

  &:hover
    background: #D4AF37
</style>

