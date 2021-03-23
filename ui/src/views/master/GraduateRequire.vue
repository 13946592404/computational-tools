<template>
  <div class="p-8">
    <engineer-certification />
  </div>
</template>

<script lang="ts">
import { defineComponent } from '@vue/composition-api';
import EngineerCertification from '@/components/requirement/EngineerCertification.vue';

export default defineComponent({
  components: {
    EngineerCertification,
  },
});
</script>
