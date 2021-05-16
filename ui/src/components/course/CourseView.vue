<template>
  <div class="h-full bg-white animate__animated animate__fadeIn">
    <el-tabs tab-position="left" class="h-full py-4">
      <el-tab-pane
        :label="$t('openCourse.view.subgoal')"
        class="animate__animated animate__fadeIn"
      >
        配置管理
      </el-tab-pane>
      <el-tab-pane
        :label="$t('openCourse.view.requirement')"
        class="animate__animated animate__fadeIn"
      >
        角色管理
      </el-tab-pane>
      <el-tab-pane
        :label="$t('openCourse.view.grade')"
        class="animate__animated animate__fadeIn"
      >
        定时任务补偿
      </el-tab-pane>
      <el-tab-pane
        :label="$t('openCourse.view.student')"
        class="animate__animated animate__fadeIn"
      >
        定时任务补偿
      </el-tab-pane>
    </el-tabs>
    <div class="course-info">
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item :label="$t('openCourse.view.info.name')">
          {{ course.name }}
        </el-form-item>
        <el-form-item :label="$t('openCourse.view.info.time')">
          {{ timeFilter(course.time) }}
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
import timeFilter from '../../utils/TimeFilter';

export default defineComponent({
  setup() {
    const state = reactive({
      course: {},
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
  right: 2%;
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
