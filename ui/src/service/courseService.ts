import axios from '@/plugins/axios';

class CourseService {
  getCourses(lang: string) {
    return axios.get('./courses', {
      params: {
        lang,
      },
    });
  }
}

export default new CourseService();
