import axios from '@/plugins/axios';

class OpenCourse {
  getCourse(teacher_id: number) {
    return axios.get('./openCourse', {
      params: {
        teacher_id,
      },
    });
  }
}

export default new OpenCourse();
