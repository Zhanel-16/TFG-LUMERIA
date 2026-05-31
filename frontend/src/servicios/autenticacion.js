import { auth } from "@/firebase/config"
import { ref } from "vue"

import {
  createUserWithEmailAndPassword,
  onAuthStateChanged,
  signInWithEmailAndPassword,
  signOut,
  sendEmailVerification
} from "firebase/auth"

export let usuario = ref(null)

// IMPORTANTE
export let authReady = ref(false)


// FIREBASE ESCUCHA SI HAY SESION
onAuthStateChanged(auth, (userFirebase) => {

  usuario.value = userFirebase

  // IMPORTANTE
  authReady.value = true

  console.log(
    "auth usuario:",
    userFirebase?.email || "ninguno"
  )
})


// REGISTRAR
export let registrar = async (email, password) => {

  try {

    let credencialesUsuario =
      await createUserWithEmailAndPassword(
        auth,
        email,
        password
      )

    return {
      ok: true,
      usuario: credencialesUsuario
    }

  } catch (error) {

    console.log(error)

    return {
      ok: false
    }
  }
}


// LOGIN
export let login = async (email, password) => {

  try {

    let credencialesUsuario =
      await signInWithEmailAndPassword(
        auth,
        email,
        password
      )

    return {
      ok: true,
      usuario: credencialesUsuario
    }

  } catch (error) {

    console.log(error)

    return {
      ok: false
    }
  }
}


// LOGOUT
export let logOut = async () => {

  try {

    await signOut(auth)

    return {
      ok: true
    }

  } catch (error) {

    console.log(error)

    return {
      ok: false
    }
  }
}


// VERIFICAR EMAIL
export let enviarEmailVerificacion =
async (usuarioActual = null) => {

  try {

    let usuarioFirebase =
      usuarioActual || auth.currentUser

    if (usuarioFirebase.emailVerified) {

      return {
        ok: true
      }
    }

    await sendEmailVerification(
      usuarioFirebase,
      {
        url: window.location.origin + "/perfil"
      }
    )

    return {
      ok: true
    }

  } catch (error) {

    console.log(error)

    return {
      ok: false
    }
  }
}


// ESTA AUTENTICADO
export let estaAutenticado = () => {

  return usuario.value !== null
}

// OBTENER USUARIO
export let obtenerUsuario = () => {

  return usuario.value
}