<template>
  <div class="h-full bg-white animate__animated animate__fadeIn">
    <my-course />
  </div>
</template>

<script lang="ts">
import { defineComponent } from '@vue/composition-api';
import MyCourse from '../../components/course/MyCourse.vue';

export default defineComponent({
  components: {
    MyCourse,
  },
});
</script>
