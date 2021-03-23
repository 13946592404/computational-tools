<template>
  <el-container>
    <el-header>
      <!-- header -->
      <!-- noop -->
    </el-header>
    <el-container>
      <el-aside>
        <!-- navigation -->
        <master-navigation />
      </el-aside>
      <el-container>
        <el-main>
          <!-- main -->
          <router-view />
        </el-main>
      </el-container>
    </el-container>
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
  overflow: scroll;
  height: 90vh;
  padding: 0;
}
</style>
