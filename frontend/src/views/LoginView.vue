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
  // if (!res.usuario.user.emailVerified) {
  //   toast.error("Por favor, verifica su email");
  //   return;
  // }
  await res.usuario.user.reload();

  if (!res.usuario.user.emailVerified) {
    toast.error("Debes verificar tu email antes de iniciar sesión");
    return;
  }
  // toast.success(
  //     "¡Qué alegría verte! ¿Es momento de añadir algo de brillo a tu día?"
  //   );
  //   router.push("/login");
  toast.success("¡Qué alegría verte! ¿Es momento de añadir algo de brillo a tu día?");
  router.push("/");
};
</script>

<template>
  <section class="auth">
    <div class="card">
      <h1>Iniciar sesión</h1>
      <p class="subtitle">Accede a tu cuenta y descubre nuestras colecciones exclusivas.</p>

      <form @submit.prevent="iniciarSesion">
        <input v-model="email" type="email" placeholder="Email" />
        <input v-model="password" type="password" placeholder="Contraseña" />
        <button>Iniciar sesión</button>
      </form>
      <router-link to="/" class="back">← Volver a la tienda</router-link>
      <p class="cambio">¿Todavía no tiene cuenta?
        <router-link to="/register">Crear una cuenta</router-link>
      </p>
    </div>
  </section>
</template>

<style lang="sass" scoped>
.auth
  min-height: 100vh
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

@media (max-width: 768px) // TABLET
  .card
    max-width: 520px
    padding: 45px 35px

  h1
    font-size: 30px

  input
    height: 54px

  button
    height: 54px

@media (max-width: 480px) // MÓVIL
  .auth
    min-height: auto
    align-items: flex-start
    padding-top: 28px

  .card
    max-width: 360px
    padding: 24px 16px
    border-radius: 18px
    box-shadow: 0 6px 18px rgba(0,0,0,.05)

  h1
    font-size: 22px
    margin-bottom: 5px

  .subtitle
    font-size: 13px
    line-height: 1.4

  form
    margin-top: 18px

  input
    height: 44px
    font-size: 13px
    margin-bottom: 10px
    border-radius: 12px

  button
    width: 46%
    min-width: 130px
    height: 44px
    font-size: 13px
    margin-top: 6px

  .cambio
    margin-top: 18px
    font-size: 12px

  .back
    margin-top: 20px
    font-size: 12px    
</style>          