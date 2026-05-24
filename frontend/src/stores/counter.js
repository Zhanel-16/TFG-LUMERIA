import { ref, computed } from 'vue'
import { defineStore } from 'pinia'
import axios from 'axios'

export let api = defineStore('counter', () => {
    let lista_favoritos = ref([])
    let getData = async() =>{
    let peticion = await axios.get("https://fakestoreapi.com/products")
    lista_favoritos.value = peticion.data
    }
    
    return {getData, lista_favoritos}
})
