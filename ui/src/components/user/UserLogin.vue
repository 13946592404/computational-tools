<template>
  <div class="h-full user-login-bg">
    <div class="user-login-form animate__animated animate__fadeIn">
      <ValidationObserver v-slot="v" tag="article" class="validation-div">
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
                @keyup.enter="onLogin(false)"
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
              @click="onLogin(false)"
              type="success"
              :disabled="v.invalid"
            >
              {{ $t('user.action.login') }}
            </el-button>
            <el-button
              @click="onLogin(true)"
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
import { LocalMessage } from '../../plugins/element-ui';
import { $t } from '../../plugins/i18n';
import UserController from '../../store/userController';

export default defineComponent({
  setup(props, { emit }) {
    const state = reactive({
      login: {
        username: localStorage.getItem('username') || '',
        password: localStorage.getItem('password') || '',
      },
    });

    const onLoginSuccess = (user: any) => {
      emit('user-login', user);
      if (localStorage.getItem('savePassword') === 'yes') {
        const { username, password } = state.login;
        localStorage.setItem('username', username);
        localStorage.setItem('password', password);
      }
    };

    const onMessage = (message: any, type: any) => {
      LocalMessage(
        message,
        type,
        1500,
      );
    };

    const onHandle = (user: any, register = false) => {
      switch (user.statusCode) {
        case 404:
          onMessage($t('user.login.fail.user'), 'error');
          break;
        case 403:
          onMessage($t('user.login.fail.password'), 'warning');
          break;
        case 400:
          if (register) {
            onMessage($t('user.register.fail.exist'), 'error');
          }
          break;
        case undefined:
          if (user.id) {
            if (register) {
              onMessage($t('user.register.success'), 'success');
            } else {
              onMessage($t('user.login.success'), 'success');
            }
            onLoginSuccess(user);
          } else {
            onMessage($t('user.login.fail.others'), 'error');
          }
          break;
        default: break;
      }
    };

    const onLogin = async (register = false) => {
      if (register) {
        await UserController.registerUser(state.login);
      } else {
        await UserController.loadUser(state.login);
      }

      const user = UserController.user; // eslint-disable-line

      onHandle(user, register);
    };

    if (UserController.user.id) {
      emit('user-login', UserController.user);
    }

    return {
      // data
      ...toRefs(state),

      // methods
      onLogin,
    };
  },
});
</script>

<style lang="scss">
.el-form-item__content {
  width: auto !important;
}
.validation {
  &-text {
    font-size: 14px;
    color: red;
    text-align: left;
  }
  &-div {
    position: absolute;
    height: 100%;
    padding-top: 20%;
    text-align: center;
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
    background: url('../../assets/d.jpeg');
    background-repeat: no-repeat;
    background-size: 100% 100%; // 拉伸
    // filter: blur(5px);
  }
  &-form {
    position: absolute;
    left: 70%;
    right: 5%;
    width: 25%;
    top: 15%;
    bottom: 20%;
    height: 75%;
    overflow: hidden;
    background-color: white;
    box-shadow: darkgray 2px 2px 2px 2px;
    border-radius: 5%;
    display: flex;
    flex-flow: column wrap;
    justify-content: flex-end;
    align-items: center;
  }
  &-text {
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
