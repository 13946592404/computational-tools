<template>
  <div class="user-info-panel">
    <el-form class="user-info-form">
      <el-form-item
        :label="$t('user.label.id_teacher')"
      >
        <span> {{ user.id_teacher }} </span>
      </el-form-item>
      <el-form-item
        :label="$t('user.label.name')"
      >
        <span> {{ user.name }} </span>
      </el-form-item>
      <el-form-item
        :label="$t('user.label.tel')"
      >
        <span> {{ user.tel }} </span>
      </el-form-item>
      <el-form-item
        :label="$t('user.label.email')"
      >
        <span> {{ user.email }} </span>
      </el-form-item>
      <el-form-item
        :label="$t('user.label.department')"
      >
        <span> {{ user.department }} </span>
      </el-form-item>
    </el-form>
    <!-- <el-button
      @click="logoutHandle"
      type="info"
    >
      {{ $t('user.action.logout') }}
    </el-button> -->
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
      edit: false,
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

<style lang="scss">
.user-info {
  &-panel {
    padding: 20px;
    display: flex;
    justify-content: center;
  }
  &-form {
    white-space: nowrap;
  }
}
</style>
