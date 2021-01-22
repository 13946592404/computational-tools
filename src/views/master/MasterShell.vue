<template>
  <div class="m-8 abc">
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

<style lang="scss">
$re: rgb(255, 0, 0);

.abc {
  background-color: $re;
}
</style>
