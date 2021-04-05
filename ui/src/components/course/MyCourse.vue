<template>
  <el-table
    :data="myCourses"
    style="width: 60%"
    height="400"
  >
    <el-table-column
      prop="name"
      label="名称"
      width="180">
    </el-table-column>
    <el-table-column
      prop="time"
      label="时间"
      width="280">
    </el-table-column>
  </el-table>
</template>

<script lang="ts">
import { defineComponent, reactive, toRefs } from '@vue/composition-api';
// import OpenCourseService from '../../service/openCourseService';
import UserController from '../../store/userController';
import CourseController from '../../store/courseController';

export default defineComponent({
  setup() {
    const state = reactive({
      myCourses: [],
    });

    const getMyCourses = async () => {
      state.myCourses = await CourseController.loadMyCourses(UserController.user.id);
    };

    getMyCourses();

    return {
      ...toRefs(state),
    };
  },
});
</script>
