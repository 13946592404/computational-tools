<template>
  <el-col :span="12">
    <el-menu class="el-menu-vertical-demo ct-sidebar" router>
      <aside
        v-for="(value, index) in masterRouters"
        :key="index"
      >
        <router-link :to=" { name: value.path }">
          <el-menu-item :index="index">
            <i :class="value.meta.icon" />
            <span slot="title">
              {{ value.meta.name }}
            </span>
          </el-menu-item>
        </router-link>
      </aside>
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
