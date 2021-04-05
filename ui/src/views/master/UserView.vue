<template>
  <div class="h-full">
    <user-info
      v-if="user.id"
      :user="user"
      @user-logout="onUserLogout"
      @user-modify="onUserLogin"
    />
    <user-login
      v-else
      @user-login="onUserLogin"
    />
  </div>
</template>

<script lang="ts">
import { defineComponent, reactive, toRefs } from '@vue/composition-api';
import UserLogin from '../../components/user/UserLogin.vue';
import UserInfo from '../../components/user/UserInfo.vue';
import UserController from '../../store/userController';

export default defineComponent({
  components: {
    UserLogin,
    UserInfo,
  },

  setup() {
    const state = reactive({
      user: {},
    });

    const onUserLogin = (user: any) => {
      state.user = user;
    };

    const onUserLogout = () => {
      state.user = {};
    };

    return {
      ...toRefs(state),
      // methods
      onUserLogin,
      onUserLogout,
    };
  },
});
</script>
