import Vue from 'vue';
import elementUI, { Message, MessageBox, Notification } from 'element-ui';
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

export const LocalMessageBox = (
  title: any = '',
  message: any = '',
  confirmCallback: any = () => ({}),
  cancelCallback: any = () => ({}),
  confirmButtonText: any = '',
  cancelButtonText: any = '',
) => MessageBox({
  title,
  message,
  callback: (action: string) => {
    if (action === 'confirm') {
      confirmCallback();
    } else {
      cancelCallback();
    }
  },
  confirmButtonText,
  cancelButtonText,
  showCancelButton: true,
  showConfirmButton: true,
  closeOnClickModal: true,
  closeOnPressEscape: true,
});

export const LocalNotification = (
  title: any = '',
  message: any = '',
  type: any = '',
  duration = 8000,
) => Notification({
  title,
  message,
  type,
  duration,
  offset: 100,
  showClose: true,
  dangerouslyUseHTMLString: true,
});
