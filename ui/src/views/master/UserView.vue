<template>
  <div>
    <user-login />
  </div>
</template>

<script lang="ts">
import { defineComponent } from '@vue/composition-api';
import UserLogin from '../../components/user/UserLogin.vue';

export default defineComponent({
  components: {
    UserLogin,
  },
});
</script>
