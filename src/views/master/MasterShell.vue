<template>
  <div class="m-8">
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
