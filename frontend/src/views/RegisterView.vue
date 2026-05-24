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
    toast.success(
      "¡Qué alegría verte! ¿Es momento de añadir algo de brillo a tu día?"
    );
    router.push("/login");
  }
};
</script>

<template>
  <section class="auth">
    <div class="card">
      <h1>Crear una cuenta</h1>

      <form @submit.prevent="registrarse">
        <input v-model="nombre" placeholder="Nombre" />
        <input v-model="apellido" placeholder="Apellido" />
        <input v-model="email" type="email" placeholder="Email" />
        <input v-model="password" type="password" placeholder="Contraseña" />
        <input
          v-model="confirmPassword"
          type="password"
          placeholder="Repetir contraseña"
        />
        <button>Registrarse</button>
      </form>

      <router-link to="/" class="back">← Volver a la tienda</router-link>

      <p class="switch">
        ¿Ya tiene cuenta?
        <router-link to="/login">Iniciar sesión</router-link>
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