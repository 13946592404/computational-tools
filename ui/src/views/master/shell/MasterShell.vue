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
html{
  touch-action: none;
}
.el-container {
  &.is-vertical {
    height: 100vh;
  }
}
.el-header {
  height: 10vh !important;
}
.el-aside {
  display: flex;
  width: 15vw !important;
}
.el-main {
  overflow: auto;
  height: 90vh;
  // padding: 0;
}
</style>
