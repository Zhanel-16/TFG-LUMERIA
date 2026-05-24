<script setup>
import { ref } from "vue";
import { login } from "@/servicios/autenticacion";
import { useRouter } from "vue-router";
import { useToast } from "vue-toastification";

const email = ref("");
const password = ref("");
const router = useRouter();
const toast = useToast();

const iniciarSesion = async () => {
  const res = await login(email.value, password.value);

  if (!res.ok) {
    toast.error("Credenciales incorrectas");
    return;
  }

  if (!res.usuario.user.emailVerified) {
    toast.error("Por favor, verifica su email");
    return;
  }

  toast.success("Tu brillo empieza aquí... ¡Descubre piezas hechas para ti!");
  router.push("/");
};
</script>

<template>
  <section class="auth">
    <div class="card">
      <h1>Iniciar sesión</h1>

      <form @submit.prevent="iniciarSesion">
        <input v-model="email" type="email" placeholder="Email" />
        <input v-model="password" type="password" placeholder="Contraseña" />
        <button>Iniciar sesión</button>
      </form>

      <router-link to="/" class="back">← Volver a la tienda</router-link>

      <p class="switch">
        ¿Todavía no tiene cuenta?
        <router-link to="/register">Crear una cuenta</router-link>
      </p>
    </div>
  </section>
</template>

<style lang="sass" scoped>
.auth
  height: 100vh
  display: flex
  justify-content: center
  align-items: center
  background: #FAF8F3

.card
  width: 380px
  background: white
  padding: 50px
  text-align: center
  box-shadow: 0 10px 30px rgba(0,0,0,.08)

h1
  font-family: "Times New Roman"
  letter-spacing: 4px
  color: #3A3A38
  margin-bottom: 35px

input
  width: 100%
  padding: 12px
  margin-bottom: 15px
  border: 1px solid #ddd

button
  width: 100%
  padding: 12px
  background: #D4AF37
  color: white
  border: none
  cursor: pointer
  margin-top: 10px

.back
  display: block
  margin-top: 25px
  color: #999

.switch
  margin-top: 20px
</style> 