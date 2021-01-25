import Vue from 'vue';
import elementUI from 'element-ui';

import App from './App.vue';
import router from './router';
import store from './store';
import i18n from './plugins/i18n';

import '@/assets/tailwind.css';
import 'element-ui/lib/theme-chalk/index.css';

Vue.use(elementUI);

Vue.config.productionTip = false;

new Vue({
  router,
  store,
  i18n,
  render: (h) => h(App),
}).$mount('#app');
