<template>
  <div>
    <master-navigation />
    <router-view />
  </div>
</template>

<script lang="ts">
import MasterNavigation from './MasterNavigation.vue';

export default {
  components: {
    MasterNavigation,
  },
};
</script>
