<template>
  <div>
    <navigation-page />
    <router-view />
  </div>
</template>

<script lang="ts">
import NavigationPage from './NavigationPage.vue';

export default {
  components: {
    NavigationPage,
  },
};
</script>
