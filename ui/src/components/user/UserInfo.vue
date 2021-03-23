<template>
  <div>
    {{ user }}
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
} from '@vue/composition-api';

export default defineComponent({
  props: {
    user: {
      type: Object,
      default: () => ({}),
    },
  },
});
</script>
