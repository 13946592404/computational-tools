import axios from '@/plugins/axios';

class CourseService {
  static getCourses(lang: string) {
    return axios.get('./courses', {
      params: {
        lang,
      },
    });
  }
}

export default CourseService;
