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

export const guardar = async (user, datos) => {
  try {
    await setDoc(doc(db, 'usuarios', user.uid), datos)
    return { ok: true }
  } catch (error) {
    console.log(error)
    return { ok: false }
  }
}

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
// añadir sin duplicados ?
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

// favoritos
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