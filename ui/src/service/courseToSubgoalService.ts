import axios from 'axios';

class CourseToSubgoalService {
  updateCourseToSubgoal(params: any) {
    return axios.put('./updateCourseToSubgoal', params);
  }

  deleteCourseToSubgoal(params: any) {
    const { subgoal_id, course_id } = params;
    return axios.delete(`./deleteCourseToSubgoal?subgoal_id=${subgoal_id}&course_id=${course_id}`);
  }

  addCourseToSubgoal(params: any) {
    return axios.put('./addCourseToSubgoal', params);
  }
}

export default new CourseToSubgoalService();
