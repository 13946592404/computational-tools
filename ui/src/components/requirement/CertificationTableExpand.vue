<template>
  <div>
    <el-form-item
      v-for="(course, index) in subClasses"
      :key="course.name"
      :label="course.name"
    >
      <div :style="[spanStyle]">
        <div class="inline-block w-40">
          <div class="course-span">
            <span v-show="!course.is_edit">{{ course.percent }}%</span>
          </div>
          <div class="w-3/5">
            <el-input-number
              v-if="course.is_edit"
              v-model="course.percent"
              size="small"
              :max="100"
              :min="0"
            />
          </div>
        </div>
        <!-- edit & save -->
        <el-button
          v-if="editable"
          @click="onEditChange(index)"
          :icon="editState(index).icon"
          :type="editState(index).type"
          size="mini"
          plain
          circle
          round
        >
          <i slot="suffix" class="el-input__icon el-icon-search"></i>
        </el-button>
        <el-button
          v-if="editable"
          @click="onDelete(index)"
          icon="el-icon-delete"
          type="danger"
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
  // getCurrentInstance,
} from '@vue/composition-api';
import { Notification, Message, MessageBox } from 'element-ui';
import RequirementService from '@/service/requirementService';
import { $t, getLocale } from '@/plugins/i18n';

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
    const state = reactive({
      // data
      editable: true, // ajax - need permission to check
      subClasses: props.subGoal.subClasses,
      addClassesAll: [],
      addState: {
        isAdd: false,
        newClass: {
          course_id: 0,
          name: '',
          percent: 0,
          is_edit: false,
        },
      },
      // css
      spanStyle: {
        marginLeft: getLocale() === 'ch' ? '80px' : '380px',
      },
    });

    // add classes All
    RequirementService.getCourses(getLocale()).then((res) => {
      // @ts-ignore
      state.addClassesAll.push(...res.data);
    });

    // @ts-ignore
    // eslint-disable-next-line
    const subClassesTotal = computed(() => state.subClasses.map((val) => Number.parseInt(val.percent, 10)).reduce((total, value) => total += value));

    const addClasses = computed(() => {
      const ans: any[] = [];
      // delete already classes
      state.addClassesAll.forEach((val) => {
        // @ts-ignore
        const idx = state.subClasses.findIndex((value) => value.course_id === val.id);
        if (idx < 0) {
          ans.push(val);
        }
      });
      return ans;
    });

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

    // methods
    const onEditSubmit = (index: number) => {
      const { percent, course_id } = state.subClasses[index];
      RequirementService.putUpdateCoursesToSubgoals({
        percent,
        course_id,
        subgoal_id: props.subGoal.id,
      }).then((res) => {
        Message({
          message: `${$t('certification.subClasses.edit.success')}`,
          type: 'success',
          showClose: true,
          duration: 4000,
        });
      }).catch((err) => {
        Message({
          message: `${$t('certification.subClasses.edit.error')}`,
          type: 'error',
          showClose: true,
          duration: 4000,
        });
      });
    };

    const onEditChange = (index: number) => {
      const { is_edit } = state.subClasses[index];
      // commit (true to false)
      if (is_edit) {
        onEditSubmit(index);
        subClassesTotalWarnCheck();
      }
      // switch state
      state.subClasses[index].is_edit = !is_edit;
    };

    const editState = (index: number) => {
      const { is_edit } = state.subClasses[index];
      return {
        icon: is_edit ? 'el-icon-check' : 'el-icon-edit',
        type: is_edit ? 'success' : 'primary',
      };
    };

    const onDeleteSubmit = (index: number) => {
      const { percent, course_id } = state.subClasses[index];
      RequirementService.putDeleteCoursesToSubgoals({
        course_id,
        subgoal_id: props.subGoal.id,
      }).then((res) => {
        state.subClasses.splice(index, 1); // delete in vue
        subClassesTotalWarnCheck();
        Message({
          message: `${$t('certification.subClasses.delete.success')}`,
          type: 'success',
          showClose: true,
          duration: 4000,
        });
      }).catch((err) => {
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

    return {
      // data
      ...toRefs(state),

      // computed
      subClassesTotal,
      addClasses,

      // methods
      // check
      subClassesTotalWarnCheck,
      // edit
      onEditChange,
      editState,
      // delete
      onDelete,
    };
  },
});
</script>

<style lang="scss">
.el-form-item__content {
  width: 600px;
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
</style>
