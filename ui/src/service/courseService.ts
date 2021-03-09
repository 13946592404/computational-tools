import axios from '@/plugins/axios';

class CourseService {
  getCourses(lang: string) {
    return axios.get('./course', {
      params: {
        lang,
      },
    });
  }
}

export default new CourseService();
