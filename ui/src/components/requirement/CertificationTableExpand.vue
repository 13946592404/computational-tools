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
    subGoal: {
      default: {
        id: '',
        subClasses: [
          {
            name: '',
            percent: 0,
            is_edit: false,
          },
        ],
      },
    },
  },
  setup(props) {
    const vm = getCurrentInstance()?.proxy;

    const state = reactive({
      // data
      subClasses: props.subGoal.subClasses,
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
    const subClassesTotal = computed(() => state.subClasses.map((val) => Number.parseInt(val.percent, 10)).reduce((total, value) => total += value));

    const subClassesTotalWarnCheck = () => {
      if (subClassesTotal.value !== 100) {
        // @ts-ignore
        // eslint-disable-next-line
        const msg = `<h1>${vm.$t('certification.subClasses.hint.total')}</h1></br><h2>${vm.$t('certification.subClasses.hint.subGoal')}${props.subGoal.id}</h2></br><h2>${vm.$t('certification.subClasses.hint.value')}${subClassesTotal.value}%</h2>`
        // @ts-ignore
        vm.$message({
          message: msg,
          dangerouslyUseHTMLString: true,
          type: 'warning',
          showClose: true,
          duration: 8000,
        });
      }
    };

    // methods
    const submitChange = (index: number) => {
      console.log(`subGoal: ${props.subGoal.id}, class: ${state.subClasses[index].name}, percent: ${state.subClasses[index].percent}% !`);
    };

    const buttonChange = (index: number) => {
      const { is_edit } = state.subClasses[index];
      // commit (true to false)
      if (is_edit) {
        submitChange(index);
        subClassesTotalWarnCheck();
      }
      // switch state
      state.subClasses[index].is_edit = !is_edit;
    };

    const buttonState = (index: number) => {
      const { is_edit } = state.subClasses[index];
      return {
        icon: is_edit ? 'el-icon-check' : 'el-icon-edit',
        type: is_edit ? 'success' : 'primary',
      };
    };

    return {
      // data
      ...toRefs(state),

      // computed
      subClassesTotal,

      // methods
      subClassesTotalWarnCheck,
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
