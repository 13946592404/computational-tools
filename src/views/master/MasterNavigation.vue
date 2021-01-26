<template>
  <el-col :span="12">
    <el-menu class="el-menu-vertical-demo ct-sidebar" router>
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

const { children: masterRouters } = master;

export default {
  data() {
    return {
      masterRouters,
    };
  },
};
</script>
