<template>
  <div class="h-full">
    <div class="user-login-bg" />
    <div class="user-login-input">
      <el-input
        class="my-8"
        spellcheck="false"
        v-model="login.username"
      />
      <el-input
        class="mb-8"
        spellcheck="false"
        v-model="login.password"
        show-password
      />
      <div class="flex flex-row">
        <el-button
          @click="onLogin"
          type="success"
        >
          {{ $t('user.action.login') }}
        </el-button>
        <el-button
          @click="onRegister"
          type="primary"
        >
          {{ $t('user.action.register') }}
        </el-button>
      </div>
    </div>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  reactive,
  toRefs,
} from '@vue/composition-api';
import { Message } from 'element-ui';
import { $t } from '../../plugins/i18n';
import UserController from '../../store/userController';

export default defineComponent({
  setup(props, { emit }) {
    const state = reactive({
      login: {
        username: 'admin',
        password: 'changeme',
      },
    });

    const onLoginMessage = (message: any, type: any) => {
      Message({
        message,
        type,
        showClose: true,
        duration: 4000,
      });
    };

    const onLoginHandle = (user: any) => {
      switch (user.statusCode) {
        case 404:
          onLoginMessage($t('user.login.fail.user'), 'error');
          break;
        case 403:
          onLoginMessage($t('user.login.fail.password'), 'warning');
          break;
        case undefined:
          if (user.id) {
            onLoginMessage($t('user.login.success'), 'success');
            emit('user-login', user);
          } else {
            onLoginMessage($t('user.login.fail.others'), 'error');
          }
          break;
        default: break;
      }
    };

    const onLogin = async () => {
      await UserController.loadUser(state.login);

      const user = UserController.user; // eslint-disable-line

      onLoginHandle(user);
    };

    const onRegister = async () => {
      console.log(true);
    };

    return {
      // data
      ...toRefs(state),

      // methods
      onLogin,
      onRegister,
    };
  },
});
</script>

<style lang="scss">
.user-login {
  &-bg {
    height: 100%;
    display: flex;
    flex: 1;
    flex-flow: column wrap;
    justify-content: center;
    align-items: center;
    position: relative;
    background: url('../../assets/login4.jpeg');
    background-repeat: no-repeat;
    background-size: 100% 100%; // 拉伸
    filter: blur(4px);
  }

  &-input {
    position: absolute;
    left: 50%;
    top: 40%;
    width: 20%;
    display: flex;
    flex-flow: column wrap;
    justify-content: center;
    align-items: center;
  }
}
</style>
