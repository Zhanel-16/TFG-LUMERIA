import ProductsView from '@/views/ProductsView.vue'
import LoginView from '@/views/LoginView.vue'
import RegisterView from '@/views/RegisterView.vue'
import BlogView from '@/views/BlogView.vue'
import CompromisoView from '@/views/CompromisoView.vue'
import CarritoView from '@/views/CarritoView.vue'
import FavoritosView from '@/views/FavoritosView.vue'
import BlogArticleView from '@/views/BlogArticleView.vue'
import ProductDetailView from '@/views/ProductDetailView.vue'
import ExperienceView from '@/views/ExperienceView.vue'
import FaqView from '@/views/FaqView.vue'
import PrivacyView from '@/views/PrivacyView.vue'
import AvisoView from '@/views/AvisoView.vue'
import { createRouter, createWebHistory } from 'vue-router'
import { estaAutenticado, authReady } from '@/servicios/autenticacion' //carga mas rap
import CookiesView from '@/views/CookiesView.vue'

const router = createRouter({
  history: createWebHistory(),
  scrollBehavior() {
    return { top: 0 }
  },
  routes: [
    { path: "/aviso", component: AvisoView},
    { path: "/cookies", component: CookiesView },
    { path: "/privacy", component: PrivacyView },
    { path: "/", component: ProductsView },
    //SI ESTA LOGUEADO NO SE PUEDE!! 
    { path: "/login", component: LoginView, meta:{ guestOnly:true }},
    { path: "/register", component: RegisterView, meta:{ guestOnly:true }},

    { path: "/blog", component: BlogView },
    { path: "/compromiso", component: CompromisoView },
    { path: "/carrito", component: CarritoView, meta:{ requiresAuth:true }},
    { path: "/favoritos", component: FavoritosView, meta:{ requiresAuth:true }},
    
    { path: "/blog/:id", component: BlogArticleView },
    { path: "/products/:id", component: ProductDetailView },
    { path: "/experiencia", component: ExperienceView },
    { path: "/faq", component: FaqView },
  ]
})

// router.beforeEach((to,from,next)=>{ //este fue mi router normal pero cuando estaba registrada y tal le daba al carrito/favoritos y me tiraba al login + le tenía q dar de nuevo a los iconos de arriba, mas abajo la version mejorada donde con WHILE espera firebasae
//   
//   if(to.meta.requiresAuth && !estaAutenticado()){ // si necesita login
//     return next("/login")
//   }

//   // si ya esta logueado no puede ir a login/register
//   if(to.meta.guestOnly && estaAutenticado()){
//     return next("/")
//   }

//   next() //deja pasar sin problema
// })

//carga rapida para q cuando una vez usuario esté auth, q lea --> hay usuario y no me mande a login aunque ya estoy con sesión iniciada
router.beforeEach(async (to, from, next) => {
  // esperar firebase
  while (!authReady.value) {

    await new Promise(resolve =>
      setTimeout(resolve, 50)
    )
  }
  // rutas protegidas
  if (
    to.meta.requiresAuth &&
    !estaAutenticado()
  ) {
    return next("/login")
  }
  // login/register bloqueados
  if (
    to.meta.guestOnly && estaAutenticado()
  ) {
    return next("/")
  }
  next()
})

export default router