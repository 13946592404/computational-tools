import axios from '@/plugins/axios';

class StudyCourseService {
  getStudyCourse(opencourse_id: number) {
    return axios.get('./studyCourse', {
      params: {
        opencourse_id,
      },
    });
  }

  addStudyCourse(params: any) {
    return axios.put('./studyCourseAdd', params);
  }
}

export default new StudyCourseService();
