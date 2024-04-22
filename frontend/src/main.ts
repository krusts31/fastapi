import './assets/main.css'

import { createApp } from 'vue'
import { createPinia } from 'pinia'

import Casdoor from 'casdoor-vue-sdk'

const config = {
  serverUrl: process.env.serverUrl,
  clientId: process.env.clientId,
  organizationName: process.env.organizationName,
  appName: process.env.appName,
  redirectPath: process.env.redirectPath,
};


import App from './App.vue'
import router from './router'

const app = createApp(App)

app.use(createPinia())
app.use(router)
app.use(Casdoor, config)

app.mount('#app')
