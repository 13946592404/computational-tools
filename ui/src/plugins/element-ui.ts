import Vue from 'vue';
import elementUI, { Message } from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

Vue.use(elementUI);

export const LocalMessage = (
  message: any,
  type: any,
) => Message({
  message: message.toString(),
  type,
  offset: 100,
  showClose: true,
  duration: 4000,
});
