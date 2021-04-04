<template>
  <el-menu
    class="ct-sidebar"
    background-color="#545c64"
    text-color="#ffffff"
    active-text-color="#ffd04b"
    mode="horizontal"
    router
  >
    <el-menu-item
      v-for="(value, index) in masterRouters"
      :key="index"
      :index="value.path"
    >
      <i :class="value.meta.icon" />
      <span slot="title">
        {{ value.meta.name }}
      </span>
    </el-menu-item>
  </el-menu>
</template>

<script lang="ts">
import { defineComponent } from '@vue/composition-api';
import { master } from '../../../router/config';

export default defineComponent({
  setup() {
    const { children: masterRouters } = master;

    return {
      masterRouters,
    };
  },
});
</script>

<style lang="scss">
.el-menu {
  &-item {
    font-size: 15px;
  }
}
</style>
