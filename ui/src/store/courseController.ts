import { useModule } from '@/store/helper';
import { reactive } from '@vue/composition-api';
import { createModule, mutation, action } from 'vuex-class-component';
import CourseService from '@/service/courseService';
import OpenCourseService from '@/service/openCourseService';
import { getLocale } from '@/plugins/i18n';

const MODULE_NAME = 'CourseModule';

export class CourseModule extends createModule({ namespaced: MODULE_NAME }) {
  state = reactive({
    courses: [],
    myCourses: [],
  });

  get courses() {
    return this.state.courses;
  }

  @mutation setCourses(courses: any) {
    this.state.courses = courses;
  }

  @action async loadCourses(force = false) {
    if (!this.state.courses.length || force) {
      await CourseService.getCourses(getLocale()).then((res) => {
        this.setCourses(res.data);
      });
    }
    return this.courses;
  }

  // init
  @action async init(force = false) {
    this.loadCourses(force);
  }

  /* my course */
  get myCourses() {
    return this.state.myCourses;
  }

  @mutation setMyCourses(myCourses: any) {
    this.state.myCourses = myCourses;
  }

  @action async loadMyCourses(opt: any) {
    const { teacher_id, force } = opt;
    if (force || !this.myCourses.length) {
      await OpenCourseService.getCourse(teacher_id, getLocale()).then((res) => {
        this.setMyCourses(res.data);
      });
    }
    return this.myCourses;
  }
}

export default useModule(MODULE_NAME, CourseModule);
