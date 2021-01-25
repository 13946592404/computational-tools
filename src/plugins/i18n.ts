import Vue from 'vue';
import VueI18n from 'vue-i18n';

import ch from '@/locale/zh-CN.json';
import en from '@/locale/en-US.json';

Vue.use(VueI18n);

const i18n = new VueI18n({
  locale: navigator.language,
  fallbackLocale: 'ch',
  messages: {
    ch,
    en,
  },
});

export default i18n;
