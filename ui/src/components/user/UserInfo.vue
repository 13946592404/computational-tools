<template>
  <div>
    {{ user }}
    <el-button
      @click="logoutHandle"
      type="info"
    >
      {{ $t('user.action.logout') }}
    </el-button>
    <el-calendar v-model="date" />
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
  props: {
    user: {
      type: Object,
      default: () => ({}),
    },
  },

  setup(props, { emit }) {
    const state = reactive({
      date: new Date(),
    });

    const logoutHandle = () => {
      UserController.logoutUser(); // vuex
      emit('user-logout'); // state
      LocalMessage(
        $t('user.logout.success'),
        'success',
      );
    };

    return {
      ...toRefs(state),
      logoutHandle,
    };
  },
});
</script>
