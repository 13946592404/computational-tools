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
}

export default new OpenCourseToSubgoalService();
