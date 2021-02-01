import Vue from 'vue';
import VueI18n from 'vue-i18n';

import ch from '@/locales/ch/config';
import en from '@/locales/en/config';

Vue.use(VueI18n);

const i18n: VueI18n = new VueI18n({
  locale: navigator.language,
  // fallbackLocale: 'ch',
  fallbackLocale: 'en',
  messages: {
    ch,
    en,
  },
});

export default i18n;
