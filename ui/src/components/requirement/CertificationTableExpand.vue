<template>
  <div>
    <el-form-item
      v-for="course in subClasses"
      :key="course.name"
      :label="course.name"
    >
      <div :style="[spanStyle]">
        <div class="inline-block w-20">
          <span>{{ course.percent }}%</span>
        </div>
        <el-button
          v-if="editable"
          icon="el-icon-edit"
          type="primary"
          size="mini"
          plain
          circle
          round
        />
      </div>
    </el-form-item>
  </div>
</template>

<script lang="ts">
import {
  computed,
  defineComponent,
  reactive,
  toRefs,
  getCurrentInstance,
} from '@vue/composition-api';

export default defineComponent({
  props: {
    subGoals: {
      default: {
        subClasses: [],
      },
    },
  },
  setup(props) {
    const state = reactive({
      editable: true, // ajax
      subClasses: props.subGoals.subClasses,
    });

    // @ts-ignore
    const subClassesTotal = computed(() => state.subClasses.map((val) => val.percent).reduce((total, value) => total += value)); /* eslint-disable-line */

    const spanStyle = {
      // @ts-ignore
      marginLeft: getCurrentInstance()?.proxy.$i18n.locale === 'ch' ? '80px' : '380px',
    };

    return {
      // data
      ...toRefs(state),
      spanStyle,
      // computed
      subClassesTotal,
    };
  },
});
</script>

<style lang="scss">
.el-form-item__label {
  white-space: nowrap;
}
</style>
