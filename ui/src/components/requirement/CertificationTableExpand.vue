<template>
  <div>
    <el-form-item
      v-for="(course, index) in subClasses"
      :key="course.name"
      :label="course.name"
    >
      <div :style="[spanStyle]">
        <!-- percent | edit percent view -->
        <div class="inline-block w-40">
          <div
            v-if="!course.is_edit"
            class="course-span"
          >
            <span >{{ course.percent }}%</span>
          </div>
          <div
            v-else
            class="w-3/5"
          >
            <el-input-number
              v-model="course.percent"
              size="small"
              :max="100"
              :min="0"
            />
          </div>
        </div>

        <!-- edit & delete -->
        <template v-if="editable" >
          <el-button
            @click="onEditChange(index)"
            :icon="getEditCss(index).icon"
            :type="getEditCss(index).type"
            size="mini"
            plain
            circle
            round
          >
            <i slot="suffix" class="el-input__icon el-icon-search"></i>
          </el-button>
          <el-button
            @click="onDelete(index)"
            icon="el-icon-delete"
            type="danger"
            size="mini"
            plain
            circle
            round
          />
        </template>
      </div>
    </el-form-item>

    <!-- add & selection -->
    <template v-if="editable">
      <el-button
        v-if="!addState.isAdd"
        @click="onAddButton()"
        class="new-course"
        icon="el-icon-plus"
        type="info"
        size="mini"
        plain
        circle
        round
      />

      <div v-if="addState.isAdd" class="new-course-field">
        <el-select
          v-model="addState.newClass.course_id"
          placeholder="..."
          class="mr-4"
          size="small"
        >
          <el-option
            v-for="item in addClasses"
            :key="item.id"
            :label="item.name"
            :value="item.id"
          >
            <span style="float: left">
              {{ item.name }}
            </span>
            <span style="float: right; color: #8492a6; font-size: 13px">
              {{ item.teacher }}
            </span>
          </el-option>
        </el-select>
        <el-input-number
          v-model="addState.newClass.percent"
          class="mr-4"
          size="small"
          :max="100"
          :min="0"
        />
        <el-button
          :disabled="!addState.newClass.course_id"
          @click="onAdd()"
          icon="el-icon-plus"
          type="success"
          size="mini"
          plain
          circle
          round
        />
        <el-button
          @click="onAddButton()"
          icon="el-icon-close"
          type="danger"
          size="mini"
          plain
          circle
          round
        />
      </div>
    </template>
  </div>
</template>

<script lang="ts">
import {
  computed,
  defineComponent,
  inject,
  reactive,
  toRefs,
  watch,
} from '@vue/composition-api';
import { Notification, Message, MessageBox } from 'element-ui';
import { cloneDeep } from 'lodash';
import { $t, getLocale } from '@/plugins/i18n';
import courseToSubgoalService from '@/service/courseToSubgoalService';
import CourseController from '@/store/courseController';

export default defineComponent({
  props: {
    subGoal: {
      default: {
        id: '',
        subClasses: [
          {
            course_id: 0,
            name: '',
            percent: 0,
            is_edit: false,
          },
        ],
      },
    },
  },
  setup(props) {
    const radioPermission: any = inject('radioPermission');

    const percentBase = 5;

    const state = reactive({
      // permission global
      editable: true,
      // edit
      editStateArray: [], // local data - because lazy for ajax
      // add
      subClasses: cloneDeep(props.subGoal.subClasses), // props copy
      addClassesAll: [], // all
      addClasses: [], // filter
      addState: {
        isAdd: false, // v-if
        newClass: {
          course_id: null,
          percent: percentBase,
        },
      },
      // css
      spanStyle: {
        marginLeft: getLocale() === 'ch' ? '80px' : '380px',
      },
    });

    watch(
      () => radioPermission,
      (val) => { state.editable = val.value; },
      { deep: true },
    );

    // @ts-ignore
    // eslint-disable-next-line
    const subClassesTotal = computed(() => state.subClasses.map((val) => Number.parseInt(val.percent, 10)).reduce((total, value) => total += value));

    const subClassesTotalWarnCheck = () => {
      if (subClassesTotal.value !== 100) {
        const msg = `
        <h2>${$t('certification.subClasses.subGoal.target')}${props.subGoal.id}</h2>
        <h2>${$t('certification.subClasses.subGoal.value')}${subClassesTotal.value}%</h2>
        `;
        Notification({
          title: `${$t('certification.subClasses.subGoal.total')}`,
          message: msg,
          dangerouslyUseHTMLString: true,
          type: 'warning',
          showClose: true,
          duration: 8000,
        });
      }
    };

    // onCreated check
    subClassesTotalWarnCheck();

    const onEditSubmit = (index: number) => {
      const { percent, course_id } = state.subClasses[index];
      if (Number.parseInt(state.editStateArray[index], 10) === percent) {
        return;
      }
      courseToSubgoalService.putUpdateCoursesToSubgoals({
        percent,
        course_id,
        subgoal_id: props.subGoal.id,
      }).then(() => {
        subClassesTotalWarnCheck();
        Message({
          message: `${$t('certification.subClasses.edit.success')}`,
          type: 'success',
          showClose: true,
          duration: 4000,
        });
      }).catch(() => {
        state.subClasses[index].percent = props.subGoal.subClasses[index].percent; // reset
        Message({
          message: `${$t('certification.subClasses.edit.error')}`,
          type: 'error',
          showClose: true,
          duration: 4000,
        });
      });
    };

    const onEditChange = (index: number) => {
      const { is_edit, percent } = state.subClasses[index];
      // commit (true to false)
      if (is_edit) {
        onEditSubmit(index);
      } else { // click edit (false to true)
        // @ts-ignore
        state.editStateArray[index] = percent;
      }
      // switch state
      state.subClasses[index].is_edit = !is_edit;
    };

    const getEditCss = (index: number) => {
      const { is_edit } = state.subClasses[index];
      return {
        icon: is_edit ? 'el-icon-check' : 'el-icon-edit',
        type: is_edit ? 'success' : 'primary',
      };
    };

    const onDeleteSubmit = (index: number) => {
      const { course_id } = state.subClasses[index];
      courseToSubgoalService.putDeleteCoursesToSubgoals({
        course_id,
        subgoal_id: props.subGoal.id,
      }).then(() => {
        state.subClasses.splice(index, 1); // delete in vue
        subClassesTotalWarnCheck();
        Message({
          message: `${$t('certification.subClasses.delete.success')}`,
          type: 'success',
          showClose: true,
          duration: 4000,
        });
      }).catch(() => {
        Message({
          message: `${$t('certification.subClasses.delete.error')}`,
          type: 'error',
          showClose: true,
          duration: 4000,
        });
      });
    };

    const onDelete = (index: number) => {
      MessageBox({
        title: `${$t('certification.subClasses.delete.message')}`,
        message: `${$t('certification.subClasses.delete.hint')}`,
        // center: true,
        showCancelButton: true,
        showConfirmButton: true,
        closeOnClickModal: true,
        closeOnPressEscape: true,
        callback: (action: string) => {
          if (action === 'confirm') {
            onDeleteSubmit(index);
          }
        },
      });
    };

    const alterAddClasses = () => {
      // clear
      state.addClasses.splice(0, state.addClasses.length);
      // @ts-ignore
      state.addClasses.push(...state.addClassesAll.filter((val) => !state.subClasses.find((value) => value.course_id === val.id)));
    };

    watch(
      () => [state.addClassesAll, state.subClasses],
      () => alterAddClasses(),
      { deep: true, immediate: true },
    );

    const onAddButton = async () => {
      const { isAdd } = state.addState;
      if (!isAdd) {
        await CourseController.loadCourses();
        state.addClassesAll = CourseController.courses;
      }
      state.addState.isAdd = !isAdd;
    };

    const addNewClass = () => {
      // @ts-ignore
      const { name } = state.addClasses.find((val) => val.id === state.addState.newClass.course_id);
      const { course_id, percent } = state.addState.newClass; // remove reactive
      const newObj = {
        course_id,
        percent: percent.toFixed(0), // maybe int, double; cannot be other type
        name,
        is_edit: false,
        subgoal_id: props.subGoal.id,
      };
      // @ts-ignore
      state.subClasses.push(newObj); // push new
    };

    const resetSelection = () => {
      state.addState.newClass.course_id = null;
      state.addState.newClass.percent = percentBase;
    };

    const onAddCommit = () => {
      addNewClass(); // add
      resetSelection(); // reset
      subClassesTotalWarnCheck(); // check
      onAddButton(); // button state
    };

    const onAdd = () => {
      const { course_id, percent } = state.addState.newClass;
      courseToSubgoalService.putAddCoursesToSubgoals({
        subgoal_id: props.subGoal.id,
        course_id,
        percent,
      }).then(() => {
        onAddCommit();
        Message({
          message: `${$t('certification.subClasses.add.success')}`,
          type: 'success',
          showClose: true,
          duration: 4000,
        });
      }).catch(() => {
        Message({
          message: `${$t('certification.subClasses.add.error')}`,
          type: 'error',
          showClose: true,
          duration: 4000,
        });
      });
    };

    return {
      // data
      ...toRefs(state),

      // computed
      subClassesTotal,
      // check
      subClassesTotalWarnCheck,
      // edit
      onEditChange,
      getEditCss,
      // delete
      onDelete,
      // add,
      onAddButton,
      onAdd,
    };
  },
});
</script>

<style lang="scss">
.el-form-item__content {
  width: 800px;
}
.el-form-item__label {
  white-space: nowrap;
}
.el-button {
  outline: 0 white !important;
}
.course-span {
  margin-left: 15px;
}
.new-course {
  margin: 8px 0 0 15px;
}
.new-course-field {
  margin-top: 8px;
}
.el-message-box__headerbtn {
  &:visited {
    border: none !important;
  }
}
</style>
