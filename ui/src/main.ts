import Vue from 'vue';

import '@/plugins';
import App from './App.vue';
import router from './router';
import store from './store';
import i18n from './plugins/i18n';

import '@/assets/tailwind.css';
// import 'default-passive-events';

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  i18n,
  render: (h) => h(App),
}).$mount('#app');
