<template>
  <div class="flex flex-row flex-wrap justify-center">
     <el-table
      :data="student"
      style="width: 100%; margin-left: 20%"
    >
      <el-table-column
        prop="id"
        :label="$t('openCourse.view.studentView.no')"
        width="180"
      />
      <el-table-column
        prop="name"
        :label="$t('openCourse.view.studentView.name')"
        width="180"
      />
      <el-table-column
        :label="$t('openCourse.view.studentView.time')"
      >
        <template slot-scope="scope">
          {{ timeFilter(scope.row.time) }}
        </template>
      </el-table-column>
    </el-table>

    <el-button
      class="sdaf"
      type="success"
      round
      @click="drawer = true"
    >
      {{ $t('action.add') }}
    </el-button>

    <el-drawer
      :title="$t('action.add')"
      :visible.sync="drawer"
      direction="rtl"
      append-to-body
      wrapperClosable
      close-on-press-escape
    >
      <el-select v-model="select" placeholder="...">
        <el-option
          v-for="item in allStudent"
          :key="item.id"
          :label="item.name"
          :value="item.id"
          :disabled="item.disabled"
        />
      </el-select>
      <el-button
        type="success"
        plain
        @click="add"
      >
        {{ $t('action.yes') }}
      </el-button>
    </el-drawer>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  reactive,
  toRefs,
  watch,
} from '@vue/composition-api';
import StudyCourseService from '../../service/studyCourseService';
import StudentService from '../../service/studentService';
import timeFilter from '../../utils/TimeFilter';
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
      student: [],
      drawer: false,
      allStudent: [],
      select: null,
    });

    const getStudyCourse = () => {
      // @ts-ignore
      StudyCourseService.getStudyCourse(props.opencourse_id).then((res: any) => {
        state.student = res.data;
      });
    };

    getStudyCourse();

    const getAllStudent = () => {
      // @ts-ignore
      StudentService.getStudent().then((res: any) => {
        state.allStudent = res.data;
      });
    };

    getAllStudent();

    watch(
      () => state.student,
      () => {
        // @ts-ignore
        const stu = state.student.map((val) => val.name);
        // @ts-ignore
        state.allStudent.forEach((val, idx, arr: any) => {
          if (stu.includes(val)) {
            arr.disabled = true;
          }
        });
      },
      { deep: true, immediate: true },
    );

    const add = () => {
      StudyCourseService.addStudyCourse({
        opencourse_id: props.opencourse_id,
        student_id: state.select,
      }).then(
        () => {
          LocalMessage($t('openCourse.view.message.ok'), 'success');
          getStudyCourse();
        },
        () => { LocalMessage($t('openCourse.view.message.no'), 'error'); },
      );
    };

    return {
      ...toRefs(state),
      timeFilter,
      add,
    };
  },
});
</script>

<style lang="scss">
.sdaf {
  position: absolute;
  top: 0%;
  right: 10%;
}
</style>
