<template>
  <div class="h-full">
    <div class="user-login-bg" />
    <div class="user-login-form">
      <!-- text -->
      <div>
        <span class="text-2xl">
          {{ $t('user.label.login') }}
        </span>
      </div>
      <!-- input -->
      <el-form
        class="mt-8 mb-4 flex flex-col"
        :rules="rules"
        inline
      >
        <el-form-item
          :label="$t('user.label.username')"
          prop="username"
        >
          <el-input
            class="user-login-input"
            spellcheck="false"
            v-model="login.username"
            :placeholder="$t('user.hint.username.text')"
          />
        </el-form-item>
        <el-form-item
          :label="$t('user.label.password')"
          prop="password"
        >
          <el-input
            class="user-login-input"
            spellcheck="false"
            v-model="login.password"
            :placeholder="$t('user.hint.password.text')"
            show-password
          />
        </el-form-item>
      </el-form>
      <!-- button -->
      <div class="flex flex-row ml-6">
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
      rules: {
        username: [
          {
            required: true,
            triggered: 'blur',
            message: $t('user.hint.username.required'),
          },
          {
            min: 3,
            max: 16,
            triggered: 'blur',
            message: $t('user.hint.username.length'),
          },
        ],
        password: [
          {
            required: true,
            triggered: 'blur',
            message: $t('user.hint.password.required'),
          },
          {
            min: 3,
            max: 16,
            triggered: 'blur',
            message: $t('user.hint.password.length'),
          },
        ],
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

  &-form {
    position: absolute;
    right: 5%;
    top: 20%;
    // width: 40%;
    // min-width: 20%;
    // max-width: 40%;
    // min-height: 35%;
    // max-height: 70%;
    padding: 70px 40px;
    background-color: white;
    box-shadow: darkgray 3px 3px 3px 3px;
    border-radius: 5%;
    display: flex;
    flex-flow: column wrap;
    justify-content: center;
    align-items: center;
  }

  &-input {
    width: 200px;
  }
}
</style>
