<template>
  <div>
    <el-form-item
      v-for="course in courses.subClasses"
      :key="course.name"
      :label="course.name"
    >
      <div :style="spanStyle">
        <span contenteditable>{{ course.percent }}</span>
      </div>
    </el-form-item>
  </div>
</template>

<script lang="ts">
import { defineComponent, reactive, toRefs } from '@vue/composition-api';
import i18n from '@/plugins/i18n';

export default defineComponent({
  props: {
    courses: {
      default: [],
    },
  },
  setup() {
    const state = reactive({
      editable: false,
      name: 'test',
    });

    const spanStyle = {
      marginLeft: i18n.locale === 'ch' ? '80px' : '380px',
    };

    return {
      ...toRefs(state),
      spanStyle,
    };
  },
});
</script>

<style lang="scss">
.el-form-item__label {
  white-space: nowrap;
}
</style>
