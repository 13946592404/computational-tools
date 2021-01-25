<template>
  <el-container>
    <el-header />
    <el-aside>
      <master-navigation />
    </el-aside>
    <el-main>
      <router-view />
    </el-main>
    <el-footer />
  </el-container>
</template>

<script lang="ts">
import MasterNavigation from './MasterNavigation.vue';

export default {
  components: {
    MasterNavigation,
  },
};
</script>

<style lang="scss">
.ct-master {

}
</style>
