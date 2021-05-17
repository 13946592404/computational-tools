import axios from '@/plugins/axios';

class OpenCourseToSubgoalService {
  getOpenCourseToSubgoal(course_id: number) {
    return axios.get('./openCourseToSubgoal', {
      params: {
        course_id,
      },
    });
  }

  getOpenCourseToSubgoalSelect(opencourse_id: number, subgoal_id: string) {
    return axios.get('./openCourseToSubgoalSelect', {
      params: {
        opencourse_id,
        subgoal_id,
      },
    });
  }

  deleteOpenCourseToSubgoal(id: number) {
    return axios.delete(`./openCourseToSubgoalDelete?id=${id}`);
  }

  addOpenCourseToSubgoal(params: any) {
    // opencourseform_id: number, coursetosubgoal_id: number, ratio: number
    return axios.put('./openCourseToSubgoalAdd', params);
  }
}

export default new OpenCourseToSubgoalService();
