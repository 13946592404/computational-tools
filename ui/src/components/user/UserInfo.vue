<template>
  <div class="user-info-panel">
    <el-card class="user-info-card animate__animated animate__zoomInDown">
      <!-- name -->
      <div slot="header" class="clearfix">
        <span style="margin-left: 40%">
          {{ $t('user.label.info') }}
        </span>
        <!-- button -->
        <el-button
          style="float: right; padding: 3px 0"
          type="text"
          class="outline-none"
          @click="logoutHandle"
        >
          {{ $t('user.action.logout') }}
        </el-button>
      </div>
      <!-- item -->
      <el-form
        class="user-info-form"
        label-width="100px"
        inline
      >
        <el-form-item
          class="user-info-form-item"
          :label="$t('user.label.id_teacher')"
        >
          <span v-if="!edit"> {{ userInfo.id_teacher }} </span>
          <el-input v-else v-model="userInfo.id_teacher" />
        </el-form-item>
        <el-form-item
          class="user-info-form-item"
          :label="$t('user.label.name')"
        >
          <span v-if="!edit"> {{ userInfo.name }} </span>
          <el-input v-else v-model="userInfo.name" />
        </el-form-item>
        <el-form-item
          class="user-info-form-item"
          :label="$t('user.label.tel')"
        >
          <span v-if="!edit"> {{ userInfo.TEL }} </span>
          <el-input v-else v-model="userInfo.TEL" />
        </el-form-item>
        <el-form-item
          class="user-info-form-item"
          :label="$t('user.label.email')"
        >
          <span v-if="!edit"> {{ userInfo.email }} </span>
          <el-input v-else v-model="userInfo.email" />
        </el-form-item>
        <el-form-item
          class="user-info-form-item"
          :label="$t('user.label.department')"
        >
          <span v-if="!edit"> {{ userInfo.department }} </span>
          <el-input v-else v-model="userInfo.department" />
        </el-form-item>
      </el-form>
      <el-button
        :type="edit ? 'success' : 'primary'"
        class="outline-none"
        style="margin-left: 40%"
        @click="onModifyUserInfo()"
      >
        {{ $t(`user.action.modify${ edit ? 'Check' : 'Info' }`) }}
      </el-button>
    </el-card>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  reactive,
  toRefs,
} from '@vue/composition-api';
import { cloneDeep } from 'lodash';
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
      userInfo: cloneDeep(props.user),
      edit: false,
    });

    const logoutHandle = () => {
      UserController.logoutUser(); // vuex
      emit('user-logout'); // state
      LocalMessage(
        $t('user.logout.success'),
        'success',
        1500,
      );
    };

    const onModifyUserInfo = async () => {
      const { edit } = state;
      state.edit = !edit;
      if (edit) {
        await UserController.modifyUserInfo(state.userInfo);
        LocalMessage(
          $t('user.modify.success'),
          'success',
          1500,
        );
        emit('user-modify', state.userInfo); // v-model
      }
    };

    return {
      ...toRefs(state),
      logoutHandle,
      onModifyUserInfo,
    };
  },
});
</script>

<style lang="scss">
.user-info {
  &-panel {
    padding: 20px;
    display: flex;
    flex-flow: row nowrap;
    justify-content: center;
    align-items: center;
  }
  &-card {
    width: 35%;
  }
  &-form {
    display: flex;
    justify-content: center;
    flex-flow: column wrap;
    position: relative;
    left: 15%;

    &-item {
      display: block !important;
    }
  }
}
</style>
