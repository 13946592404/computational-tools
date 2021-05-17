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
                  <!-- <el-button
                    type="info"
                    round
                  >
                    {{ $t('action.modify') }}
                  </el-button> -->
                  <el-button
                    type="danger"
                    round
                    @click="deleteForm(item.id, scope.row)"
                  >
                    {{ $t('action.delete') }}
                  </el-button>
                </div>
              </el-form-item>
                <el-button
                  type="success"
                  round
                  @click="addForm(scope.row.id)"
                >
                  {{ $t('action.add') }}
                </el-button>
            </el-form>
          </template>
        </el-table-column>
      </el-table>
    </div>

    <el-drawer
      :title="$t('action.add')"
      :visible.sync="drawer"
      @close="select = null"
      direction="rtl"
      append-to-body
      wrapperClosable
      close-on-press-escape
    >
      <div class="p-8">
        <el-select v-model="select" placeholder="...">
          <el-option
            v-for="item in openCourseForm"
            :key="item.value"
            :label="item.target"
            :value="item.id"
            :disabled="item.disabled"
          />
        </el-select>
      </div>
      <div class="p-8">
        <el-input-number
          v-model="ratio"
          :min="1"
          :max="100"
        />
      </div>
      <div class="p-8">
        <el-button
          type="success"
          @click="addFormYes"
          :disabled="!select"
        >
          {{ $t('action.yes') }}
        </el-button>
      </div>
    </el-drawer>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  reactive,
  toRefs,
} from '@vue/composition-api';
import Vue from 'vue';
import { LocalMessage, LocalMessageBox } from '../../plugins/element-ui';
import { $t } from '../../plugins/i18n';
import OpenCourseToSubgoalService from '../../service/openCourseToSubgoalService';
import OpenCourseFormService from '../../service/openCourseFormService';

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
      drawer: false,
      openCourseForm: [],
      select: null,
      ratio: 5,
      idx: -1,
    });

    const getSubgoalList = async () => {
      // @ts-ignore
      await OpenCourseToSubgoalService.getOpenCourseToSubgoal(props.course.course_id).then((res: any) => {
        state.subgoal = res.data;
      });
      state.subgoal.forEach((value, index, arr: any) => {
        arr[index].form = reactive([]);
        // @ts-ignore
        OpenCourseToSubgoalService.getOpenCourseToSubgoalSelect(props.course.opencourse_id, value.subgoal_id).then((res: any) => {
          arr[index].form = res.data;
        });
      });
    };

    getSubgoalList();

    const deleteForm = (id: number, row: any) => {
      LocalMessageBox(
        $t('openCourse.view.message.warn'),
        $t('openCourse.view.message.delete'),
        () => {
          OpenCourseToSubgoalService.deleteOpenCourseToSubgoal(id).then(() => {
            LocalMessage($t('openCourse.view.message.ok'), 'success');
            // getSubgoalList();
            const idx = row.form.findIndex((val: any) => {
              // console.log(`${val.id} - ${id}`);
              return val.id === id;
            });
            // console.log(idx);
            // row.form.splice(idx, 1);
            Vue.set(row.form, idx, {});
          }, () => {
            LocalMessage($t('openCourse.view.message.no'), 'error');
          });
        },
      );
    };

    const addForm = (indx: number) => {
      const idx = state.subgoal.findIndex((value: any) => value.id === indx);
      OpenCourseFormService.getOpenCourseForm(props.course.opencourse_id).then((res: any) => {
        state.openCourseForm = res.data;
        // @ts-ignore
        const exsitArr = state.subgoal[idx].form.map((val: any) => val.target);
        // @ts-ignore
        state.openCourseForm.forEach((val, indxe, arr: any) => {
          // @ts-ignore
          if (exsitArr.includes(val.target)) {
            // @ts-ignore
            arr[indxe].disabled = true;
          }
        });
      });
      state.drawer = true;
      state.idx = idx;
    };

    const addFormYes = () => {
      OpenCourseToSubgoalService.addOpenCourseToSubgoal({
        opencourseform_id: state.select,
        // @ts-ignore
        coursetosubgoal_id: state.subgoal[state.idx].id,
        ratio: state.ratio,
      }).then(
        () => { LocalMessage($t('openCourse.view.message.ok'), 'success'); },
        () => { LocalMessage($t('openCourse.view.message.no'), 'error'); },
      );
    };

    return {
      ...toRefs(state),
      deleteForm,
      addForm,
      addFormYes,
    };
  },
});
</script>
