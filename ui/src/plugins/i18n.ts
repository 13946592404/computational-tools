import Vue from 'vue';
import VueI18n from 'vue-i18n';

import ch from '@/locales/ch/config';
import en from '@/locales/en/config';

Vue.use(VueI18n);

const langMap = new Map([
  ['zh-CN', 'ch'],
  ['en-US', 'en'],
]);

const i18n: VueI18n = new VueI18n({
  locale: langMap.get(navigator.language),
  // locale: 'en' || langMap.get(navigator.language),
  fallbackLocale: 'ch',
  messages: {
    ch,
    en,
  },
});

export default i18n;

export function $t(key: VueI18n.Path, values?: VueI18n.Values) {
  return i18n.t(key, values);
}
