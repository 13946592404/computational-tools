<template>
  <div class="h-full bg-white animate__animated animate__fadeIn">
    <el-tabs tab-position="left" class="h-full py-4">
      <el-tab-pane
        :label="$t('openCourse.view.subgoal')"
        class="animate__animated animate__fadeIn"
      >
        <course-subgoal :opencourse_id="course.opencourse_id" />
      </el-tab-pane>
      <el-tab-pane
        :label="$t('openCourse.view.requirement')"
        class="animate__animated animate__fadeIn"
      >
        <course-requirement :course="course" />
      </el-tab-pane>
      <el-tab-pane
        :label="$t('openCourse.view.student')"
        class="animate__animated animate__fadeIn"
      >
        <course-student :opencourse_id="course.opencourse_id" />
      </el-tab-pane>
      <el-tab-pane
        :label="$t('openCourse.view.grade')"
        class="animate__animated animate__fadeIn"
      >
        <course-grade :opencourse_id="course.opencourse_id" />
      </el-tab-pane>
    </el-tabs>
    <div class="course-info">
      <el-form label-width="60px">
        <el-form-item :label="$t('openCourse.view.info.name')">
          {{ course.name }}
        </el-form-item>
        <el-form-item :label="$t('openCourse.view.info.time')">
          {{ timeFilter(course.time, false) }}
        </el-form-item>
        <el-form-item :label="$t('openCourse.view.info.username')">
          {{ user.name }}
        </el-form-item>
        <el-form-item :label="$t('openCourse.view.info.department')">
          {{ user.department }}
        </el-form-item>
      </el-form>
    </div>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  getCurrentInstance,
  reactive,
  toRefs,
} from '@vue/composition-api';
import UserController from '../../store/userController';
import timeFilter from '../../utils/TimeFilter';
import CourseSubgoal from './CourseSubgoal.vue';
import CourseRequirement from './CourseRequirement.vue';
import CourseStudent from './CourseStudent.vue';
import CourseGrade from './CourseGrade.vue';

export default defineComponent({
  components: {
    CourseSubgoal,
    CourseRequirement,
    CourseStudent,
    CourseGrade,
  },
  setup() {
    const state = reactive({
      course: {},
      user: UserController.user,
    });
    // @ts-ignore
    state.course = getCurrentInstance().proxy.$route.params.course;

    return {
      ...toRefs(state),
      timeFilter,
    };
  },
});
</script>

<style lang="scss">
.course-info {
  position: fixed;
  right: 7%;
  bottom: 7%;
  display: flex;
  flex-flow: column wrap;
  text-align: center;
  background: whitesmoke;
  border: 1px dotted #999999;
  z-index: 1;
  padding: 10px 10px 0 0;
}
</style>
