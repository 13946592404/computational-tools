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
            v-if="!course.is_edit.value"
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
        <template v-if="globalEditable" >
          <el-button
            @click="onEditButtonChange(index)"
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
            @click="onDeleteMessageBox(index)"
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
    <template v-if="globalEditable">
      <el-button
        v-if="!addState.isAdd"
        @click="onAddButtonChange()"
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
            <!-- <span style="float: right; color: #8492a6; font-size: 13px">
              {{ item.teacher }}
            </span> -->
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
          @click="onAddCommit()"
          icon="el-icon-plus"
          type="success"
          size="mini"
          plain
          circle
          round
        />
        <el-button
          @click="onAddButtonChange()"
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
  ref,
} from '@vue/composition-api';
import { LocalMessage, LocalMessageBox, LocalNotification } from '../../plugins/element-ui';
import { $t, getLocale } from '../../plugins/i18n';
import RequirementController from '../../store/requirementController';
import courseToSubgoalService from '../../service/courseToSubgoalService';
import CourseController from '../../store/courseController';

export default defineComponent({
  props: {
    subgoal: {
      default: '',
    },
  },
  setup(props) {
    /* state & radio - watch */
    const radioCoursePermission: any = inject('radioCoursePermission');

    const percentBase = 5;

    const state = reactive({
      // permission global
      globalEditable: true,
      // data - base
      subClasses: [ /* reactive data */
        {
          subgoal_id: props.subgoal,
          course_id: 0,
          name: '',
          percent: 0,
          is_edit: ref(),
        },
      ],
      // edit
      editValueMap: new Map(),
      // add
      addClasses: [], /* filter data - reactive data */
      addState: {
        isAdd: false, // v-if
        newClass: {
          course_id: null,
          percent: percentBase,
        },
      },
      // css
      spanStyle: {
        marginLeft: getLocale() === 'ch' ? '80px' : '320px',
      },
    });

    // hide all globalEditable buttons
    watch(
      () => radioCoursePermission,
      (val) => {
        state.globalEditable = val.value;
        // if not close some edit button
        state.subClasses.forEach((value, index, arr) => {
          arr[index].is_edit = ref(false);
        });
      },
      { deep: true, immediate: true },
    );

    /* check */
    // @ts-ignore
    // eslint-disable-next-line
    const subClassesTotal = computed(() => state.subClasses.map((val) => Number.parseInt(val.percent, 10)).reduce((total, value) => total += value));

    const subClassesTotalWarnCheck = () => {
      if (subClassesTotal.value !== 100) {
        const msg = `
        <h2>${$t('certification.subClasses.subGoal.target')}${props.subgoal}</h2>
        <h2>${$t('certification.subClasses.subGoal.value')}${subClassesTotal.value}%</h2>
        `;
        LocalNotification(
          $t('certification.subClasses.subGoal.total'),
          msg,
          'warning',
        );
      }
    };

    /* get subClasses */
    const getSubClasses = async (force = true) => {
      const courseViewTemp = await RequirementController.loadCoursesToSubgoalsViews(force); // forcely update vuex
      // copy old edit state
      const stateMap = state.subClasses.map((val) => val.is_edit.value);
      // get subClasses
      state.subClasses = courseViewTemp.filter((val: any) => val.subgoal_id === props.subgoal);
      state.subClasses.forEach((value, index, arr) => {
        // add is_edit
        arr[index].is_edit = ref(stateMap[index] ?? false);
      });
      subClassesTotalWarnCheck(); // onCreated / onUpdated check
    };

    getSubClasses(false); // init not need to update forcely

    /* add classes optional */
    const alterAddClasses = async () => {
      // clear
      state.addClasses.splice(0, state.addClasses.length);
      const coursesTemp = await CourseController.loadCourses();
      // @ts-ignore
      state.addClasses = coursesTemp.filter((val) => !state.subClasses.find((value) => value.course_id === val.id));
    };

    /* updated check */
    const subClassesUpdated = async (isAddOrDelete = false) => {
      await getSubClasses(); // get subclasses again
      if (isAddOrDelete && state.addClasses.length) {
        alterAddClasses();
      }
    };

    /* edit */
    const onEditSubmit = (index: number) => {
      const { percent, course_id, subgoal_id } = state.subClasses[index];
      if (state.editValueMap.get(index) === percent) {
        return;
      }
      courseToSubgoalService.updateCourseToSubgoal({
        percent,
        course_id,
        subgoal_id,
      }).then(() => {
        subClassesUpdated();
        LocalMessage(
          $t('certification.subClasses.edit.success'),
          'success',
        );
      }).catch(() => {
        state.subClasses[index].percent = state.editValueMap.get(index); // reset
        LocalMessage(
          $t('certification.subClasses.edit.error'),
          'error',
        );
      });
    };

    const onEditButtonChange = (index: number) => {
      const { is_edit: { value }, percent } = state.subClasses[index];
      // commit (true to false)
      if (value) {
        onEditSubmit(index);
      } else { // click edit (false to true)
        // @ts-ignore
        state.editValueMap.set(index, Number.parseInt(percent, 10));
      }
      // switch state
      state.subClasses[index].is_edit.value = !value;
    };

    const getEditCss = (index: number) => {
      const { is_edit: { value } } = state.subClasses[index];
      return {
        icon: value ? 'el-icon-check' : 'el-icon-edit',
        type: value ? 'success' : 'primary',
      };
    };

    /* delete */
    const onDeleteSubmit = (index: number) => {
      const { course_id, subgoal_id } = state.subClasses[index];
      courseToSubgoalService.deleteCourseToSubgoal({
        course_id,
        subgoal_id,
      }).then(() => {
        subClassesUpdated(true);
        LocalMessage(
          $t('certification.subClasses.delete.success'),
          'success',
        );
      }).catch(() => {
        LocalMessage(
          $t('certification.subClasses.delete.error'),
          'error',
        );
      });
    };

    const onDeleteMessageBox = (index: number) => {
      LocalMessageBox(
        $t('certification.subClasses.delete.message'),
        $t('certification.subClasses.delete.hint'),
        () => onDeleteSubmit(index),
      );
    };

    /* add */
    const onAddButtonChange = async () => {
      const { isAdd } = state.addState;
      if (!isAdd && !state.addClasses.length) {
        await alterAddClasses();
      }
      state.addState.isAdd = !isAdd;
    };

    const resetSelection = () => {
      state.addState.newClass.course_id = null;
      state.addState.newClass.percent = percentBase;
    };

    const onAddUpdated = () => {
      subClassesUpdated(true); // check
      onAddButtonChange(); // button state
      resetSelection(); // reset selection to default place holder
    };

    const onAddCommit = () => {
      const { course_id, percent } = state.addState.newClass;
      courseToSubgoalService.addCourseToSubgoal({
        subgoal_id: props.subgoal,
        course_id,
        percent,
      }).then(() => {
        onAddUpdated();
        LocalMessage(
          $t('certification.subClasses.add.success'),
          'success',
        );
      }).catch(() => {
        LocalMessage(
          $t('certification.subClasses.add.error'),
          'error',
        );
      });
    };

    return {
      // data
      ...toRefs(state),

      // check
      // subClassesTotalWarnCheck,
      // edit
      onEditButtonChange,
      getEditCss,
      // delete
      onDeleteMessageBox,
      // add,
      onAddButtonChange,
      onAddCommit,
    };
  },
});
</script>

<style lang="scss">
.demo-table-expand {
  padding-left: 15%;
}
.el-form {
  &-item {
    white-space: nowrap;
    &__content {
      width: 800px;
    }
    &__label {
      white-space: nowrap;
    }
  }
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
