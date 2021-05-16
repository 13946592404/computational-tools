<template>
  <div class="course-subgoal">
    <h1>
      {{ $t('openCourse.view.subgoal') }}
    </h1>
    <el-divider />
    <div>
      <el-table
        :data="form"
        stripe
        :max-height="372"
      >
        <el-table-column
          width="180"
        >
          <template slot-scope="scope">
            <span v-if="!scope.row.is_edit.value">
              {{ scope.row.target }}
            </span>
            <el-input v-else v-model="scope.row.target" />
          </template>
        </el-table-column>
        <el-table-column
          width="280"
        >
          <template slot-scope="scope">
            <el-button
              type="info"
              round
              @click="modifyRow(scope.row)"
            >
              修改
            </el-button>
            <el-button
              type="danger"
              round
            >
              删除
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </div>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  reactive,
  ref,
  toRefs,
} from '@vue/composition-api';
import OpenCourseFormService from '../../service/openCourseFormService';
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
    });

    // @ts-ignore
    OpenCourseFormService.getOpenCourseForm(props.opencourse_id).then((value: any) => {
      state.form = value.data.map((val: any) => ({
        id: val.id,
        target: val.target,
        is_edit: ref(false),
      }));
    });

    const modifyRow = (row: any) => {
      const { value } = row.is_edit;
      row.is_edit.value = !value;
      if (value) { // edit
        const { id, target } = row;
        OpenCourseFormService.editOpenCourseForm({
          id,
          target,
        }).then(() => {
          LocalMessage('ok', 'success');
        });
      }
    };

    return {
      ...toRefs(state),
      modifyRow,
    };
  },
});
</script>

<style lang="scss">
.course-subgoal {
  display: flex;
  flex-flow: row wrap;
  justify-content: center;
  // align-items: center;
  button {
    outline: none;
  }
}
</style>
