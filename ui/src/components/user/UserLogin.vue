<template>
  <div
    class="h-full flex flex-1 flex-col justify-center items-center user-login"
  >
    <div class="w-1/5 user-login-input">
      <el-input
        v-model="login.username"
        class="-mt-48"
        spellcheck="false"
      />
      <el-input
        v-model="login.password"
        class="my-4"
        spellcheck="false"
      />
    </div>
    <el-button
      @click="loginHandle"
      type="success"
    >
      {{ $t('user.action.login') }}
    </el-button>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  reactive,
  toRefs,
} from '@vue/composition-api';
import { Message } from 'element-ui';
import UserController from '../../store/userController';

export default defineComponent({
  setup(props, { emit }) {
    const state = reactive({
      login: {
        username: 'admin',
        password: 'changeme',
      },
    });

    const loginHandle = async () => {
      await UserController.loadUser(state.login); // vuex根据账号密码去后端判断并拿字段

      const user = UserController.user; // eslint-disable-line

      switch (user.statusCode) { // 如果登录失败，返回数据只有statusCode，否则有id、name等
        case 404:
          Message({
            message: '没有此用户',
            type: 'error',
            showClose: true,
            duration: 4000,
          });
          break;
        case 403:
          Message({
            message: '密码错误',
            type: 'warning',
            showClose: true,
            duration: 4000,
          });
          break;
        case undefined:
          if (user.id) {
            Message({
              message: `登陆成功！${user.name}, 你好！`,
              type: 'success',
              showClose: true,
              duration: 4000,
            });
            emit('user-login', user);
          } else {
            Message({
              message: '未知错误',
              type: 'error',
              showClose: true,
              duration: 4000,
            });
          }
          break;
        default: break;
      }
    };

    return {
      // data
      ...toRefs(state),

      // methods
      loginHandle,
    };
  },
});
</script>

<style lang="scss">
.user-login {
  background: url('../../assets/login.png');
  background-repeat: repeat;
  background-size: auto 110%;
  // filter: blur(10px);

  // &-input {
  //   filter: none !important;
  // }
}
</style>
