import './assets/main.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'

import Casdoor from 'casdoor-vue-sdk'

const config = {
  serverUrl: import.meta.env.serverUrl,
  clientId: import.meta.env.clientId,
  organizationName: import.meta.env.organizationName,
  appName: import.meta.env.appName,
  redirectPath: import.meta.env.redirectPath,
};


import App from './App.vue'
import router from './router'

const app = createApp(App)

app.use(createPinia())
app.use(router)
app.use(Casdoor, config)

app.mount('#app')
