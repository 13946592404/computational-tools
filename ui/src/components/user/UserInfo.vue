<template>
  <div>
    {{ user }}
    <el-button
      @click="logoutHandle"
      type="info"
    >
      {{ $t('user.action.logout') }}
    </el-button>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
} from '@vue/composition-api';
import UserController from '../../store/userController';

export default defineComponent({
  props: {
    user: {
      type: Object,
      default: () => ({}),
    },
  },

  setup(props, { emit }) {
    const logoutHandle = () => {
      UserController.logoutUser(); // vuex
      emit('user-logout'); // state
    };

    return {
      logoutHandle,
    };
  },
});
</script>
