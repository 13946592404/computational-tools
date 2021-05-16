import axios from '@/plugins/axios';

class OpenCourseForm {
  getOpenCourseForm(opencourse_id: number) {
    return axios.get('./openCourseForm', {
      params: {
        opencourse_id,
      },
    });
  }

  editOpenCourseForm(params: any) {
    return axios.put('./openCourseFormEdit', params);
  }

  deleteOpenCourseForm(id: number) {
    return axios.delete(`./openCourseFormDelete?id=${id}`);
  }
}

export default new OpenCourseForm();
