import axios from '@/plugins/axios';

class OpenCourse {
  getCourse(teacher_id: number) {
    return axios.get('./openCourse', {
      params: {
        teacher_id,
      },
    });
  }

  deleteCourse(openCourse_id: number) {
    return axios.delete(`./openCourseDelete?openCourse_id=${openCourse_id}`);
  }

  addCourse(params: any) {
    return axios.put('./openCourseAdd', params);
  }
}

export default new OpenCourse();
