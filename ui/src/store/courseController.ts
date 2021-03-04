import { useModule } from '@/store/helper';
import { reactive } from '@vue/composition-api';
import { createModule, mutation, action } from 'vuex-class-component';
import CourseService from '@/service/courseService';
import { getLocale } from '@/plugins/i18n';

const MODULE_NAME = 'CourseModule';

export class CourseModule extends createModule({ namespaced: MODULE_NAME }) {
  state = reactive({
    courses: {
      id: 0,
      name: '',
      teacher: '',
    },
  });

  get courses() {
    return this.state.courses;
  }

  @mutation setCourses(courses: any) {
    this.state.courses = courses;
  }

  @action async loadCourses() {
    return CourseService.getCourses(getLocale()).then((res) => {
      this.setCourses(res.data);
    });
  }
}

export default useModule(MODULE_NAME, CourseModule);
