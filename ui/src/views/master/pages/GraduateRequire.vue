<template>
  <engineer-certification />
</template>

<script>
import { defineComponent } from '@vue/composition-api';
import EngineerCertification from '@/components/requirement/EngineerCertification.vue';

export default defineComponent({
  components: { EngineerCertification },

  setup() {
    return {
      EngineerCertification,
    };
  },
});
</script>
