<template>
<section class="blog">
  <h1>Últimos artículos</h1>

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
    img: "/images/compromiso.jpg",
    description: "Tu mapa para navegar entre quilates, cortes y estilos sin perder la esencia del amor.",
    datee: "18 marzo, 2026"
  },
  {
    id: 2,
    title: "Guía de cuidado de joyas",
    img: "/images/cuidadoJoyas.jpg",
    description: "Aprende a mantener el brillo de tus piezas favoritas.",
    datee: "27 abril, 2026"
  },
  {
    id: 3,
    title: "El arte del ring stacking",
    img: "/images/stackOroBlanco.jpg",
    description: "Tus manos, tus reglas: domina la tendencia.",
    datee: "5 marzo, 2026"
  },
  {
    id: 4,
    title: "Cómo hacer la pedida perfecta",
    img: "/images/boda.jpg",
    description: "Ideas y consejos para dar el paso definitivo.",
    datee: "1 febrero, 2026"
  },
  {
    id: 5,
    title: "Topacio vs Aguamarina",
    img: "/images/AguamarinaCompromisoOroAmarillo.jpg",
    description: "Dos tonos de azul, dos personalidades.",
    datee: "10 enero, 2026"
  },
  {
    id: 6,
    title: "Guía de regalos según presupuesto",
    img: "/images/colleccionArtic.jpg",
    description: "Ideas de joyería según presupuesto: hasta 500€, más de 500€, madre e hija y San Valentín.",
    datee: "17 mayo, 2026"
  }
]

const abrirPost = (id) => {
  router.push(`/blog/${id}`)
}
</script>

<style lang="sass" scoped>
.blog
  max-width: 1300px
  margin: 80px auto
  padding: 0 40px

h1
  text-align: center
  margin-bottom: 60px
  letter-spacing: 3px
  font-weight: 500

.grid
  display: grid
  grid-template-columns: repeat(auto-fit, minmax(300px, 1fr))
  gap: 40px

.card
  cursor: pointer
  transition: .35s
  background: #F9F7F5

  &:hover
    transform: translateY(-8px)

.card_img
  width: 100%
  height: 240px
  object-fit: cover

.card_content
  padding: 25px

.date
  color: #888
  font-size: 14px
  margin-bottom: 10px

.card_content h2
  font-size: 20px
  font-weight: 500
  margin-bottom: 12px

.desc
  color: #555
  font-size: 15px
  line-height: 1.6
  margin-bottom: 20px

button
  background: #4B2745
  color: white
  border: none
  padding: 12px 24px
  cursor: pointer
  transition: .3s

  &:hover
    opacity: .85
</style>

