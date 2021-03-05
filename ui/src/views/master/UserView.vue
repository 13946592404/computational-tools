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
import { defineComponent, reactive, toRefs } from '@vue/composition-api';
import UserController from '@/store/userController.ts';

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

    return {
      ...toRefs(state),
      loginHandle,
    };
  },
});
</script>
