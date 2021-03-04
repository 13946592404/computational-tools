import CourseService from '@/service/courseService';
import { getLocale } from '@/plugins/i18n';

export interface Course {
  id: number;
  name: string;
  teacher: string;
}

class CourseData {
  courses: Course[];

  constructor() {
    this.courses = [];
  }

  async setCourses() {
    this.courses = await CourseService.getCourses(getLocale()).then((res) => res.data);
  }

  async getCourses() {
    if (!this.courses.length) {
      await this.setCourses();
    }
    return this.courses;
  }
}

export default new CourseData();
