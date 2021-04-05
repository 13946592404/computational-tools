<template>
  <div>hello</div>
</template>

<script lang="ts">
import {
  defineComponent,
  getCurrentInstance,
  reactive,
  toRefs,
} from '@vue/composition-api';

export default defineComponent({
  setup() {
    const state = reactive({
      course: {},
    });
    // @ts-ignore
    state.course = getCurrentInstance().proxy.$route.params.course;

    return {
      ...toRefs(state),
    };
  },
});
</script>
