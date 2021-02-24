import Vue from 'vue';
import elementUI from 'element-ui';
import VueCompositionAPI from '@vue/composition-api';

import App from './App.vue';
import router from './router';
import store from './store';
import i18n from './plugins/i18n';

import '@/assets/tailwind.css';
import 'element-ui/lib/theme-chalk/index.css';

import '@/service/axios'; // test

Vue.use(elementUI);
Vue.use(VueCompositionAPI);

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  i18n,
  render: (h) => h(App),
}).$mount('#app');
