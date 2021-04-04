<template>
  <div>
    <el-switch
      v-model="lang"
      active-color="#13ce66"
      inactive-color="#ff4949">
    </el-switch>
  </div>
</template>

<script lang="ts">
import { defineComponent, reactive } from '@vue/composition-api';

export default defineComponent({
  setup() {
    const state = reactive({
      lang: true,
    });
  },
});
</script>
