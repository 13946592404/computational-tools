<template>
  <div class="w-1/5">
    <el-input
      v-model="login.username"
    />
    <el-input
      v-model="login.password"
    />
    <el-button @click="loginHandle">
      登录
    </el-button>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  reactive,
  toRefs,
  watch,
} from '@vue/composition-api';
import { Message } from 'element-ui';
import UserController from '@/store/userController';

export default defineComponent({
  setup() {
    const state = reactive({
      login: {
        username: 'admin',
        password: 'changeme',
      },
      user: {},
    });

    const loginHandle = async () => {
      UserController.setLogin(state.login); // 将账号密码传递给vuex
      await UserController.loadUser(); // vuex根据账号密码去后端判断并拿字段
      state.user = UserController.user; // 根据vuex获取数据
    };

    watch(
      () => state.user,
      (val: any) => {
        switch (val.statusCode) {
          case 404:
            Message({
              message: '没有此用户',
              type: 'error',
              showClose: true,
              duration: 4000,
            });
            break;
          case 403:
            Message({
              message: '密码错误',
              type: 'warning',
              showClose: true,
              duration: 4000,
            });
            break;
          case undefined:
            if (val.id) {
              Message({
                message: `登陆成功！${val.name}, 你好！`,
                type: 'success',
                showClose: true,
                duration: 4000,
              });
            } else {
              Message({
                message: '未知错误',
                type: 'error',
                showClose: true,
                duration: 4000,
              });
            }
            break;
          default: break;
        }
      },
      { deep: true },
    );

    return {
      ...toRefs(state),
      loginHandle,
    };
  },
});
</script>
