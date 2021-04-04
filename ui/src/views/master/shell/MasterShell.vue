<template>
  <el-container>
    <el-header>
      <!-- header & navigation -->
      <master-navigation />
      <!-- noop -->
    </el-header>
    <el-main>
      <!-- main -->
      <router-view />
    </el-main>
  </el-container>
</template>

<script lang="ts">
import { defineComponent } from '@vue/composition-api';
import MasterNavigation from './MasterNavigation.vue';

export default defineComponent({
  components: {
    MasterNavigation,
  },
});
</script>

<style lang="scss">
html {
  touch-action: none;
}

.el {
  &-header {
    height: 10vh !important;
    padding: 0 !important;
    z-index: 999;
  }
  &-main {
    overflow: auto;
    height: 90vh;
    padding: 0 !important;
  }
  &-menu {
    &-item {
      min-width: 15%;
      text-align: center;
    }
  }
}

</style>
