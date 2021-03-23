<template>
  <div>
    {{ user }}
    <el-button @click="logoutHandle">
      注销
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
      UserController.logoutUser();
      emit('user-logout');
    };

    return {
      logoutHandle,
    };
  },
});
</script>
