<template>
  <div>
    <el-form-item
      v-for="(course, index) in subClasses"
      :key="course.name"
      :label="course.name"
    >
      <div :style="[spanStyle]">
        <div class="inline-block w-32">
          <div class="course-span">
            <span v-show="!course.is_edit">{{ course.percent }}%</span>
          </div>
          <div class="w-3/5">
            <el-input
              v-if="course.is_edit"
              v-model="course.percent"
            />
          </div>
        </div>
        <!-- edit & save -->
        <el-button
          v-if="editable"
          @click="buttonChange(index)"
          :icon="buttonState(index).icon"
          :type="buttonState(index).type"
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
    const vm = getCurrentInstance()?.proxy;

    const state = reactive({
      // data
      subClasses: props.subGoals.subClasses,
      editable: true, // ajax - need permission to check
      // css
      spanStyle: {
        // @ts-ignore
        marginLeft: vm.$i18n.locale === 'ch' ? '80px' : '380px',
      },
    });

    // computed
    // @ts-ignore
    // eslint-disable-next-line
    const subClassesTotal = computed(() => state.subClasses.map((val) => val.percent).reduce((total, value) => total += value));

    // methods
    // @ts-ignore
    // eslint-disable-next-line
    const buttonChange = (index: number) => state.subClasses[index].is_edit = !state.subClasses[index].is_edit;

    const buttonState = (index: number) => {
      // @ts-ignore
      const { is_edit } = state.subClasses[index];
      return {
        icon: is_edit ? 'el-icon-check' : 'el-icon-edit',
        type: is_edit ? 'success' : 'primary',
      };
    };

    const subClassesTotalWarn = () => {
      if (subClassesTotal.value !== 100) {
        // TODO
        // @ts-ignore
        vm.$message('warn');
      }
    };

    setInterval(() => subClassesTotalWarn(), 3000);

    return {
      // data
      ...toRefs(state),
      // computed
      subClassesTotal,
      // methods
      subClassesTotalWarn,
      buttonChange,
      buttonState,
    };
  },
});
</script>

<style lang="scss">
.el-form-item__label {
  white-space: nowrap;
}
.el-button {
  outline: 0 white !important;
}
.course-span {
  margin-left: 15px;
}
</style>
