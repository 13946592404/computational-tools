<template>
  <div class="flex justify-center items-center h-full">
    <el-card class="local-setting-card animate__animated animate__zoomInDown">
      <div slot="header" class="clearfix">
        <span style="margin-left: 40%">
          {{ $t('setting.label') }}
        </span>
      </div>
      <div class="flex justify-center items-center" style="margin-left: -25%">
        <el-form label-width="120px">
          <el-form-item
            class="local-setting-card-form"
            :label="$t('setting.lang.label')"
          >
            <el-switch
              v-model="lang"
              :active-text="$t('setting.lang.en')"
              :inactive-text="$t('setting.lang.ch')"
              @change="onLangChange"
            >
            </el-switch>
          </el-form-item>
          <el-form-item
            class="local-setting-card-form"
            :label="$t('setting.password.label')"
          >
            <el-switch
              v-model="savePassword"
              :active-text="$t('setting.password.ok')"
              :inactive-text="$t('setting.password.nop')"
              @change="onSavepasswordChange"
            >
            </el-switch>
          </el-form-item>
        </el-form>
      </div>
    </el-card>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  reactive,
  toRefs,
} from '@vue/composition-api';
import { LocalMessageBox } from '../../plugins/element-ui';
import { $t } from '../../plugins/i18n';
import UserController from '../../store/userController';

export default defineComponent({
  setup() {
    const state = reactive({
      lang: false,
      savePassword: false,
    });

    const lang = localStorage.getItem('lang');
    const savePassword = localStorage.getItem('savePassword');

    if (lang === null || lang === undefined) { // init
      localStorage.setItem('lang', 'ch');
      localStorage.setItem('savePassword', 'no');
    } else { // init
      state.lang = lang === 'en';
      state.savePassword = savePassword === 'yes';
    }

    const onLangChange = (val: boolean) => {
      localStorage.setItem('lang', val ? 'en' : 'ch');
      // message box
      LocalMessageBox(
        $t('setting.lang.title'),
        $t('setting.lang.message'),
        () => window.location.reload(),
      );
    };

    const passwordSave = () => {
      const { username, password, id } = UserController;
      localStorage.setItem('username', id ? username : '');
      localStorage.setItem('password', id ? password : '');
      localStorage.setItem('savePassword', 'yes');
    };
    const passwordDelete = () => {
      localStorage.setItem('username', '');
      localStorage.setItem('password', '');
      localStorage.setItem('savePassword', 'no');
    };

    const onSavepasswordChange = (val: boolean) => {
      if (val) { // to yes
        // message box
        LocalMessageBox(
          $t('setting.password.title'),
          $t('setting.password.message'),
          () => passwordSave(),
          () => {
            state.savePassword = false;
            passwordDelete();
          },
        );
      } else { // to no
        passwordDelete();
      }
    };

    return {
      ...toRefs(state),
      onLangChange,
      onSavepasswordChange,
    };
  },
});
</script>

<style lang="scss">
.local-setting {
  &-card {
    width: 30%;

    .el-form-item__label {
      padding-top: 1.5px !important;
    }

    &-form {
      white-space: nowrap;
    }
  }
}
</style>
