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
        <el-footer>
          <!-- footer -->
          <!-- noop -->
        </el-footer>
      </el-container>
    </el-container>
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
