// import { db } from '@/firebase/config'
// import { doc, getDocs, setDoc, getDoc, addDoc, collection } from 'firebase/firestore'
// import { auth } from '@/firebase/config'


// // duplic
// import { query, where } from "firebase/firestore"
// import { deleteDoc } from "firebase/firestore"

// //HOW TO USE:
// //  const async guardar()
// // res = await guardar ( user.value , {OBJETO CON DATOS})
// // if(res.ok) ==> se guardó //
// const guardar = async (user, datos) => {
//   try {
//     const docRef = doc(db, 'usuarios', user.uid)
//     await setDoc(docRef, datos)
//     return {
//       ok: true,
//     }
//   } catch (error) {
//     console.log(error)
//     return {
//       ok: false,
//     }
//   }
// }

// //HOW TO USE:
// // const async conseguire()
// // res = await conseguir(user.value) ==> si va todo bien pues ya tienes los datos en
// // res.data
// const conseguir = async (user) => {
//   try {
//     const docRef = doc(db, 'usuarios', user.uid)
//     const snoopDog = await getDoc(docRef)
//     if (snoopDog.exists()) {
//       return {
//         ok: true,
//         data: {
//           id: snoopDog.id,
//           ...snoopDog.data(),
//         },
//       }
//     }
//   } catch (error) {
//     console.log(error)
//     return {
//       ok: false,
//     }
//   }
// }
// //HOW TO USE
// // const async conseguirdocs()
// // res = await conseguirDocs()
// // RES => RES.DATA SERAN LOS OBJETOS DE FAVORITOS
// const conseguirDocs = async () => {
//   try {
//     const docRef = collection(db, 'usuarios')
//     const snoopDog = await getDocs(docRef)

//     const datos = []
//     snoopDog.forEach((dog) => {
//       datos.push(dog.data())
//     })

//     return {
//       ok: true,
//       data: datos,
//     }
//   } catch (error) {
//     console.log(error)
//     return { ok: false }
//   }
// }

// ////HOW TO USE:
// //  const async guardar()
// // res = await guardar ( user.value , {OBJETO CON DATOS})
// // if(res.ok) ==> se guardó // CREA UN NUEVO DOCUMENTO, NO LO ACTUALIZA // favoritos?
// const anadirDoc = async (datos) => {
//   try {
//     const docRef = collection(db, 'culonuevo')
//     const anadir = await addDoc(docRef, datos)
//     return {
//       ok: true,
//     }
//   } catch (error) {
//     console.log(error)
//     return {
//       ok: false,
//     }
//   }
// }



// // AÑADIR SIN DUPLICADOS carrito
// export const anadirFavoritos = async (producto) => {
//   const user = auth.currentUser

//   if (!user) return { ok: false }

//   const cartRef = collection(db, 'carrito', user.uid, 'Productos')

//   // comprobar si ya existe por id
//   const q = query(cartRef, where("id", "==", producto.id))
//   const snap = await getDocs(q)

//   if (!snap.empty) {
//     return { ok: false, msg: "ya existe" }
//   }

//   await addDoc(cartRef, producto)

//   return { ok: true }
// }
// //Asi recupero subcolecciones
// export const obtenerFavoritos = async () => {
//   const user = auth.currentUser

//   const favRef = collection(db, 'carrito', user.uid, 'Productos')
//   const snoopDog = await getDocs(favRef)

//   const favoritos = snoopDog.docs.map(doc => ({
//     ...doc.data(), idDoc: doc.id
//   }))
//   return {
//     ok: true,
//     favs: favoritos,
//   }
// }

// // obtener favoritos (wishlist)
// export const obtenerWishlist = async () => {
//   const user = auth.currentUser

//   const favRef = collection(db, 'favoritos', user.uid, 'Productos')
//   const snap = await getDocs(favRef)

//   const favoritos = snap.docs.map(doc => ({
//     ...doc.data(),
//     idDoc: doc.id
//   }))

//   return {
//     ok: true,
//     favoritos
//   }
// }

// // AÑADIR A WISHLIST (favoritos) sin duplicados
// export const anadirAFavoritos = async (producto) => {
//   const user = auth.currentUser
//   if (!user) return { ok: false }

//   const favRef = collection(db, 'favoritos', user.uid, 'Productos')

//   const q = query(favRef, where("id", "==", producto.id))
//   const snap = await getDocs(q)

//   if (!snap.empty) {
//     return { ok: false, msg: "ya existe" }
//   }

//   await addDoc(favRef, producto)

//   return { ok: true }
// }

// // obtener carrito
// export const obtenerCarrito = async () => {
//   const user = auth.currentUser

//   const cartRef = collection(db, 'carrito', user.uid, 'Productos')
//   const snap = await getDocs(cartRef)

//   const productos = snap.docs.map(doc => ({
//     ...doc.data(),
//     idDoc: doc.id
//   }))

//   return {
//     ok: true,
//     productos
//   }
// }



// export const eliminarCarrito = async (idDoc) => {
//   const user = auth.currentUser

//   const ref = doc(db, 'carrito', user.uid, 'Productos', idDoc)
//   await deleteDoc(ref)

//   return { ok: true }
// }

// export const eliminarFavorito = async (idDoc) => {
//   const user = auth.currentUser

//   const ref = doc(db, 'favoritos', user.uid, 'Productos', idDoc)
//   await deleteDoc(ref)

//   return { ok: true }
// }

// export { guardar, anadirDoc, conseguir, conseguirDocs }






import { db, auth } from '@/firebase/config'

import {
  doc,
  getDocs,
  setDoc,
  getDoc,
  addDoc,
  collection,
  deleteDoc,
  query,
  where
} from 'firebase/firestore'

// ================= USER =================
export const guardar = async (user, datos) => {
  try {
    await setDoc(doc(db, 'usuarios', user.uid), datos)
    return { ok: true }
  } catch (error) {
    console.log(error)
    return { ok: false }
  }
}

// ================= CARRITO =================

// añadir sin duplicados
export const anadirFavoritos = async (producto) => {
  const user = auth.currentUser
  if (!user) return { ok: false }

  const ref = collection(db, 'carrito', user.uid, 'Productos')

  const q = query(ref, where("id", "==", producto.id))
  const snap = await getDocs(q)

  if (!snap.empty) {
    return { ok: false, msg: "ya existe" }
  }

  await addDoc(ref, producto)
  return { ok: true }
}

// obtener carrito
export const obtenerCarrito = async () => {
  const user = auth.currentUser

  const ref = collection(db, 'carrito', user.uid, 'Productos')
  const snap = await getDocs(ref)

  const productos = snap.docs.map(doc => ({
    ...doc.data(),
    idDoc: doc.id
  }))

  return { ok: true, productos }
}

// eliminar carrito
export const eliminarCarrito = async (idDoc) => {
  const user = auth.currentUser
  await deleteDoc(doc(db, 'carrito', user.uid, 'Productos', idDoc))
  return { ok: true }
}

// ================= WISHLIST =================

// añadir sin duplicados
export const anadirAFavoritos = async (producto) => {
  const user = auth.currentUser
  if (!user) return { ok: false }

  const ref = collection(db, 'favoritos', user.uid, 'Productos')

  const q = query(ref, where("id", "==", producto.id))
  const snap = await getDocs(q)

  if (!snap.empty) {
    return { ok: false, msg: "ya existe" }
  }

  await addDoc(ref, producto)
  return { ok: true }
}

// obtener favoritos
export const obtenerWishlist = async () => {
  const user = auth.currentUser

  const ref = collection(db, 'favoritos', user.uid, 'Productos')
  const snap = await getDocs(ref)

  const favoritos = snap.docs.map(doc => ({
    ...doc.data(),
    idDoc: doc.id
  }))

  return { ok: true, favoritos }
}

// eliminar favorito
export const eliminarFavorito = async (idDoc) => {
  const user = auth.currentUser
  await deleteDoc(doc(db, 'favoritos', user.uid, 'Productos', idDoc))
  return { ok: true }
}