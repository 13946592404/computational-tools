<template>
  <engineer-certification
    class="p-8"
  />
</template>

<script lang="ts">
import { defineComponent } from '@vue/composition-api';
import EngineerCertification from '../../components/requirement/EngineerCertification.vue';

export default defineComponent({
  components: {
    EngineerCertification,
  },
});
</script>
