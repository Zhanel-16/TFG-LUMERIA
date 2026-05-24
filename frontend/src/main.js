import { createApp } from 'vue'
import { createPinia } from 'pinia'

import App from './App.vue'
import router from './router'

const app = createApp(App)

import Toast from "vue-toastification";
// Import the CSS or use your own!
import "vue-toastification/dist/index.css";
import "@/assets/toast.sass" //toast bonito importacion de mi archivo creado
app.use(Toast);

app.use(createPinia())
app.use(router)
app.use(Toast, { //toast bonito
  position: "top-right",
  timeout: 3500,
  hideProgressBar: false,
  closeOnClick: true,
  pauseOnHover: true,
})

app.mount('#app')
