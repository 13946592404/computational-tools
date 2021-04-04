<template>
  <div class="h-full">
    <div class="user-login-bg" />
    <div class="user-login-form">
      <ValidationObserver v-slot="v" tag="div" class="validation-div">
        <el-form
          class="flex flex-col"
          inline
        >
          <!-- text -->
          <el-form-item>
            <p class="text-2xl user-login-text">
              {{ $t('user.label.login') }}
            </p>
          </el-form-item>

          <!-- input -->
          <el-form-item
            :label="$t('user.label.username')"
            required
          >
            <ValidationProvider rules="usernameValidation" v-slot="{ errors }">
              <el-input
                class="user-login-input"
                spellcheck="false"
                v-model="login.username"
                :placeholder="$t('user.hint.username.text')"
              />
              <p class="validation-text">{{ errors[0] }}</p>
            </ValidationProvider>
          </el-form-item>
          <el-form-item
            :label="$t('user.label.password')"
            required
          >
            <ValidationProvider rules="passwordValidation" v-slot="{ errors }">
              <el-input
                class="user-login-input"
                spellcheck="false"
                v-model="login.password"
                :placeholder="$t('user.hint.password.text')"
                show-password
              />
              <p class="validation-text">{{ errors[0] }}</p>
            </ValidationProvider>
          </el-form-item>

          <!-- button -->
          <el-form-item
            class="flex flex-row user-login-button"
          >
            <el-button
              @click="onLogin"
              type="success"
              :disabled="v.invalid"
            >
              {{ $t('user.action.login') }}
            </el-button>
            <el-button
              @click="onRegister"
              type="primary"
              :disabled="v.invalid"
            >
              {{ $t('user.action.register') }}
            </el-button>
          </el-form-item>
        </el-form>
      </ValidationObserver>
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
.validation {
  &-text {
    font-size: 14px;
    color: red;
  }
  &-div {
    position: absolute;
    top: 20%;
  }
}
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
    left: 70%;
    right: 5%;
    top: 20%;
    bottom: 5%;
    overflow: hidden;
    // width: 40%;
    // min-width: 20%;
    // max-width: 40%;
    // min-height: 35%;
    // max-height: 70%;
    padding: 0 40px 20px 50px;
    background-color: white;
    box-shadow: darkgray 3px 3px 3px 3px;
    border-radius: 5%;
    display: flex;
    flex-flow: column wrap;
    justify-content: flex-end;
    align-items: center;
  }

  &-text {
    margin-left: 50%;
    min-width: 150px;
  }

  &-input {
    width: 200px;
  }

  &-button {
    position: relative;
    top: 5%;
    width: 200px;
    margin: 0 auto;
  }
}
</style>
