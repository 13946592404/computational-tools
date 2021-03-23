<template>
  <div class="h-full">
    <user-info
      v-if="user.id"
      :user="user"
      @user-logout="userLogout"
    />
    <user-login
      v-else
      @user-login="userLogin"
    />
  </div>
</template>

<script lang="ts">
import { defineComponent, reactive, toRefs } from '@vue/composition-api';
import UserLogin from '../../components/user/UserLogin.vue';
import UserInfo from '../../components/user/UserInfo.vue';

export default defineComponent({
  components: {
    UserLogin,
    UserInfo,
  },

  setup() {
    const state = reactive({
      user: {},
    });

    const userLogin = (user: any) => {
      state.user = user;
    };

    const userLogout = () => {
      state.user = {};
    };

    return {
      ...toRefs(state),
      // methods
      userLogin,
      userLogout,
    };
  },
});
</script>
