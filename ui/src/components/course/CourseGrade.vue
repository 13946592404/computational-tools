<template>
  <div>
    <el-form label-width="120px">
      <el-form-item
        v-for="(item, idx) in form"
        :key="idx"
        :label="item.target"
      >
        <el-input
          v-model="grade[idx]"
          style="width: 30%"
        />
      </el-form-item>
    </el-form>
    <div class="flex flex-row flex-wrap">
      <el-select v-model="select" placeholder="...">
        <el-option
          v-for="item in student"
          :key="item.id"
          :label="item.name"
          :value="item.id"
        />
      </el-select>
      <el-button
        @click="modify"
        type="primary"
      >
        {{ $t('action.modify') }}
      </el-button>
    </div>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  reactive,
  toRefs,
  watch,
} from '@vue/composition-api';
import OpenCourseFormService from '../../service/openCourseFormService';
import StudyCourseService from '../../service/studyCourseService';
import { $t } from '../../plugins/i18n';
import { LocalMessage } from '../../plugins/element-ui';

export default defineComponent({
  props: {
    opencourse_id: {
      type: Number,
      require: true,
    },
  },
  setup(props) {
    const state = reactive({
      form: [],
      student: [],
      grade: [],
      select: null,
    });

    const refreshForm = () => {
      // @ts-ignore
      OpenCourseFormService.getOpenCourseForm(props.opencourse_id).then((value: any) => {
        state.form = value.data;
      });
    };

    refreshForm();

    const randomMap = () => {
      state.grade = state.form.map(() => 60 + Number((40 * Math.random()).toFixed(0)));
    };

    watch(
      () => [state.form, state.select],
      () => randomMap(),
      { deep: true },
    );

    const getStudyCourse = () => {
      // @ts-ignore
      StudyCourseService.getStudyCourse(props.opencourse_id).then((res: any) => {
        state.student = res.data;
      });
    };

    getStudyCourse();

    const modify = () => {
      LocalMessage($t('openCourse.view.message.ok'), 'success');
    };

    return {
      ...toRefs(state),
      modify,
    };
  },
});
</script>
