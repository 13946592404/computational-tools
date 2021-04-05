<template>
  <el-container>
    <el-header>
      <!-- header & navigation -->
      <master-navigation />
      <!-- noop -->
    </el-header>
    <el-main>
      <!-- main -->
      <div class="el-main-style">
        <router-view />
      </div>
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
    background-image: url('../../../assets/e.jpeg');

    &-style {
      height: 100%;
      width: 100%;
      opacity: 0.9;
    }
  }
  &-menu {
    &-item {
      min-width: 15%;
      text-align: center;
    }
  }
}

</style>
