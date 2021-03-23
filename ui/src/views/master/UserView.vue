<template>
  <div>
    <user-info
      v-if="user.id"
      :user="user"
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

    return {
      ...toRefs(state),
      userLogin,
    };
  },
});
</script>
