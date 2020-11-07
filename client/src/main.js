import Vue from 'vue'
import App from './App.vue'
import VueAxios from 'vue-axios'
import {securedAxiosInstance, plainAxiosInstance } from './assets/backend/axios'
import * as VueGoogleMaps from 'vue2-google-maps'
import {KEY} from '.././fakeENV.js'

Vue.config.productionTip = false;
Vue.use(VueAxios, {
  secured: securedAxiosInstance,
  plain: plainAxiosInstance
});
Vue.use(VueGoogleMaps, {
  load: {
    key: KEY,
    // libraries: 'places', // This is required if you use the Autocomplete plugin
    // OR: libraries: 'places,drawing'
    // OR: libraries: 'places,drawing,visualization'
    // (as you require)
  },
  //// If you want to set the version, you can do so:
  // v: '3.26',
})


new Vue({
  render: h => h(App),
  securedAxiosInstance,
  plainAxiosInstance
  
}).$mount('#app')




