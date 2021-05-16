<template>
  <div class="flex flex-row flex-wrap justify-center">
    <h1>
      {{ $t('openCourse.view.requirement') }}
    </h1>
    <el-divider />
    <div class="text-center">
      <el-table
        :data="subgoal"
        stripe
        :max-height="372"
      >
        <el-table-column
          prop="subgoal_id"
          :label="$t('openCourse.view.require.subgoal')"
          width="100"
        />
        <el-table-column
          prop="percent"
          :label="$t('openCourse.view.require.ratio')"
          width="100"
        />
        <el-table-column
          width="350"
          :label="$t('openCourse.view.require.course')"
        >
          <template slot-scope="scope">
            <el-form>
              <el-form-item
                v-for="(item, idx) in scope.row.form"
                :key="idx"
                :label="item.target"
              >
                {{ item.percent }}
                <div class="inline-block ml-8">
                  <el-button
                    type="info"
                    round
                  >
                    {{ $t('action.modify') }}
                  </el-button>
                  <el-button
                    type="danger"
                    round
                  >
                    {{ $t('action.delete') }}
                  </el-button>
                </div>
              </el-form-item>
                <el-button
                  type="success"
                  round
                >
                  {{ $t('action.add') }}
                </el-button>
            </el-form>
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
  toRefs,
} from '@vue/composition-api';
import OpenCourseToSubgoalService from '../../service/openCourseToSubgoalService';

export default defineComponent({
  props: {
    course: {
      type: Object,
      default: () => ({}),
    },
  },
  setup(props) {
    const state = reactive({
      subgoal: [],
    });

    const getSubgoalList = async () => {
      // @ts-ignore
      await OpenCourseToSubgoalService.getOpenCourseToSubgoal(props.course.course_id).then((res: any) => {
        state.subgoal = res.data;
      });
      state.subgoal.forEach((value, index, arr) => {
        arr[index].form = reactive([]);
        OpenCourseToSubgoalService.getOpenCourseToSubgoalSelect(props.course.opencourse_id, value.subgoal_id).then((res) => {
          arr[index].form = res.data;
        });
      });
    };

    getSubgoalList();

    return {
      ...toRefs(state),
    };
  },
});
</script>
