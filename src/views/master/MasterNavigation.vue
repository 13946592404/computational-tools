<template>
  <el-col
    class="flex-1"
    style="background:#545c64"
    :span="12"
  >
    <el-menu
      class="el-menu-vertical-demo ct-sidebar"
      background-color="#545c64"
      text-color="#ffffff"
      active-text-color="#ffd04b"
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
  </el-col>
</template>

<script lang="ts">
import { master } from '@/router/config';

export default {
  data() {
    const { children: masterRouters } = master;

    return {
      masterRouters,
    };
  },
};
</script>

<style lang="scss">
.el-menu {
  border-right: none;

  .el-menu-item {
    padding-left: 20% !important;
    font-size: 15px;
  }
}
</style>
