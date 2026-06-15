<script setup>
import { ref, computed } from "vue";
import { registrar, enviarEmailVerificacion } from "@/servicios/autenticacion";
import { useRouter } from "vue-router";
import { useToast } from "vue-toastification";
const nombre = ref("");
const apellido = ref("");
const email = ref("");
const password = ref("");
const confirmPassword = ref("");
const router = useRouter();
const toast = useToast();

const coinciden = computed(() => password.value === confirmPassword.value);

const registrarse = async () => {
  if (!coinciden.value) {
    toast.error("Las contraseñas no coinciden");
    return;
  }

  if (password.value.length < 6) {
    toast.error("Mínimo 6 caracteres");
    return;
  }

  const res = await registrar(email.value, password.value);
  if (res.ok) {
    await enviarEmailVerificacion(res.usuario.user);

    toast.success("Te hemos enviado un correo de verificación");
    router.push("/login");
  }
};
</script>

<template>
  <section class="auth">
    <div class="card">
      <h1>Crear una cuenta</h1>
      <p class="subtitle">Crea tu cuenta y comienza tu experiencia en alta joyería.</p>

      <form @submit.prevent="registrarse">
        <input v-model="nombre" placeholder="Nombre" />
        <input v-model="apellido" placeholder="Apellido" />
        <input v-model="email" type="email" placeholder="Email" />
        <input v-model="password" type="password" placeholder="Contraseña" />
        <input v-model="confirmPassword" type="password" placeholder="Repetir contraseña"/>
        <button>Registrarse</button>
      </form>

      <router-link to="/" class="back">← Volver a la tienda</router-link>
      <p class="cambio">¿Ya tiene cuenta?
        <router-link to="/login">Iniciar sesión</router-link>
      </p>
    </div>
  </section>
</template>

<style lang="sass" scoped>
.auth
  min-height: 100vh
  // min-height: calc(100vh - 110px)
  display: flex
  justify-content: center
  align-items: center
  padding: 40px 20px
  // background: linear-gradient(to bottom, #faf8f3, #f5f1e8)

.card
  width: 100%
  max-width: 480px
  background: white
  padding: 55px 50px
  border-radius: 24px
  box-shadow: 0 10px 30px rgba(0,0,0,.06)
  border: 1px solid rgba(212,175,55,.12)
  text-align: center

h1
  font-family: "Outfit", sans-serif
  font-size: 34px
  font-weight: 300
  letter-spacing: 2px
  color: #111
  margin-bottom: 10px
.subtitle
  color: #777
  font-size: 15px
  line-height: 1.7
  max-width: 320px
  margin: 0 auto
form
  margin-top: 35px

input
  width: 100%
  height: 58px
  padding: 0 18px
  margin-bottom: 16px
  border-radius: 16px
  border: 1px solid #e6e6e6
  background: #fafafa
  font-size: 15px
  transition: .3s ease
  outline: none

  &:focus
    border-color: #D4AF37
    background: white
    box-shadow: 0 0 0 4px rgba(212,175,55,.12)

button
  width: 45%
  height: 54px
  margin-top: 10px
  border: none
  border-radius: 50px
  background: #111
  color: white
  font-size: 17.3px
  font-weight: 500
  cursor: pointer
  transition: .35s ease
  &:hover
    background: #D4AF37
    color: #111

.back
  display: inline-block
  margin-top: 28px
  color: #777
  text-decoration: none
  transition: .3s

  &:hover
    color: #111

.cambio
  margin-top: 25px
  color: #666
  font-size: 14px

  a
    color: #AA7C11
    text-decoration: none
    font-weight: 600
    margin-left: 4px

    &:hover
      text-decoration: underline

@media (max-width: 768px)
  .card
    max-width: 520px
    padding: 45px 35px

  h1
    font-size: 30px

  input
    height: 54px

  button
    height: 54px

@media (max-width: 480px)

  .auth
    padding: 20px

  .card
    padding: 35px 22px
    border-radius: 24px

  h1
    font-size: 26px
    margin-bottom: 5px

  form
    margin-top: 25px

  input
    height: 50px
    font-size: 14px
    border-radius: 14px

  button
    height: 50px
    font-size: 14px

  .cambio
    font-size: 13px

  .back
    font-size: 13px
</style>          