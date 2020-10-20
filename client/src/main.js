import Vue from 'vue'
import App from './App.vue'
import VueAxios from 'vue-axios'
import {securedAxiosInstance, plainAxiosInstance } from './assets/backend/axios'
Vue.config.productionTip = false;
Vue.use(VueAxios, {
  secured: securedAxiosInstance,
  plain: plainAxiosInstance
});

new Vue({
  render: h => h(App),
  securedAxiosInstance,
  plainAxiosInstance

}).$mount('#app')




