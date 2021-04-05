import Vue from 'vue';
import elementUI, { Message } from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';

Vue.use(elementUI);

export const LocalMessage = (
  message: any,
  type: any,
  duration = 0,
) => Message({
  message: message.toString(),
  type,
  duration: duration || 4000,
  offset: 100,
  showClose: true,
});
