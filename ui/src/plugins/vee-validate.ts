import Vue from 'vue';
import { ValidationObserver, ValidationProvider, extend } from 'vee-validate';
import { required } from 'vee-validate/dist/rules';

import { $t } from './i18n';

extend('usernameValidation', {
  ...required,
  message: $t('user.hint.username.required').toString(),
});
extend('passwordValidation', {
  ...required,
  message: $t('user.hint.password.required').toString(),
});

Vue.component('ValidationProvider', ValidationProvider);
Vue.component('ValidationObserver', ValidationObserver);
