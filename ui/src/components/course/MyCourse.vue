<template>
  <article>
    <p class="my-course-label">
      {{ $t('openCourse.table.label') }}
      <el-button
        class="ml-64"
        type="success"
        @click="onAddMyCourseButton"
      >
        {{ $t('openCourse.table.open') }}
      </el-button>
    </p>
    <el-table
      :data="myCourses"
      border
      height="385"
      class="my-course-table"
    >
      <!-- index -->
      <el-table-column
        type="index"
        width="50">
      </el-table-column>
      <!-- name -->
      <el-table-column
        :label="$t('openCourse.table.name')"
        width="180"
      >
        <template slot-scope="scope">
          <router-link
            :to="{
              name: 'course-view',
              params: {
                course: scope.row,
              },
            }"
            class="text-blue-400"
          >
            <i class="el-icon-notebook-1" />
            {{ scope.row.name}}
          </router-link>
        </template>
      </el-table-column>
      <!-- time -->
      <el-table-column
        :label="$t('openCourse.table.time')"
        width="280"
      >
        <template slot-scope="scope">
          <i class="el-icon-time" />
          <span>
            {{ timeFilter(scope.row.time) }}
          </span>
        </template>
      </el-table-column>
      <!-- action -->
      <el-table-column
        :label="$t('openCourse.table.action')"
        width="100"
      >
        <template slot-scope="scope">
          <!-- inspect -->
          <router-link
            :to="{
              name: 'course-view',
              params: {
                course: scope.row,
              },
            }"
            class="text-blue-400"
          >
            {{ $t('openCourse.table.click') }}
          </router-link>
          <!-- delete -->
          <span
            class="text-blue-400 cursor-pointer"
            @click="onDeleteMyCourse(scope.row)"
          >
            {{ $t('openCourse.table.delete') }}
          </span>
        </template>
      </el-table-column>
    </el-table>

    <!-- add -->
    <el-drawer
      :title="$t('openCourse.table.addList')"
      :visible.sync="drawer"
      direction="rtl"
      size="25%"
      append-to-body
      wrapperClosable
      close-on-press-escape
    >
      <el-table
        :data="courses"
        border
        height="385"
        class="pl-4"
      >
        <el-table-column
          :label="$t('openCourse.table.name')"
          prop="name"
          width="200"
        >
        </el-table-column>
        <el-table-column>
          <template slot-scope="scope">
            <el-button
              type="primary"
              @click="onAddMyCourse(scope.row)"
            >
              {{ $t('openCourse.table.add') }}
            </el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-drawer>
  </article>
</template>

<script lang="ts">
import { defineComponent, reactive, toRefs } from '@vue/composition-api';
import { LocalMessage, LocalMessageBox } from '../../plugins/element-ui';
import { $t } from '../../plugins/i18n';
import UserController from '../../store/userController';
import CourseController from '../../store/courseController';
import OpenCourseService from '../../service/openCourseService';

export default defineComponent({
  setup() {
    const state = reactive({
      myCourses: [],
      drawer: false,
      courses: [],
    });

    const getMyCourses = async (force = false) => {
      state.myCourses = await CourseController.loadMyCourses({
        teacher_id: UserController.user.id,
        force,
      });
    };
    // onCreated
    getMyCourses();

    const timeFilter = (str: string) => str.replace('T', ' ').replace('.000Z', ' ');

    const onDeleteMyCourse = async (row: any) => {
      LocalMessageBox(
        $t('openCourse.delete.title'),
        $t('openCourse.delete.message', { course: row.name }),
        async () => {
          await OpenCourseService.deleteCourse(row.opencourse_id);
          await getMyCourses(true); // load forcely
          LocalMessage(
            $t('openCourse.delete.success'),
            'success',
          );
        },
      );
    };

    const onAddMyCourseButton = async () => {
      state.courses = await CourseController.loadCourses();
      state.drawer = true;
    };

    const onAddMyCourse = async (row: any) => {
      LocalMessageBox(
        $t('openCourse.add.title'),
        $t('openCourse.add.message'),
        () => {
          console.log('right!');
        },
        () => {
          console.log('on cancel!');
        },
      );
      getMyCourses(true); // forcely
    };

    return {
      ...toRefs(state),
      timeFilter,
      onDeleteMyCourse,
      onAddMyCourseButton,
      onAddMyCourse,
    };
  },
});
</script>

<style lang="scss">
.my-course {
  &-table {
    position: relative;
    width: 50%;
    margin: auto;
  }
  &-label {
    padding: 20px 0;
    margin-left: 25%;
    font-size: 2em;
    font-weight: 500;
  }
}
.el-drawer__container {
  top: 10vh;
}
</style>
