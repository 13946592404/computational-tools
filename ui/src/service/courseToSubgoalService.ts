import axios from 'axios';

class CourseToSubgoalService {
  /* TODO - put */
  updateCourseToSubgoal(query: any) {
    return axios.get('./updateCourseToSubgoal', {
      params: query,
    });
  }

  /* TODO - put */
  deleteCourseToSubgoal(query: any) {
    return axios.get('./deleteCourseToSubgoal', {
      params: query,
    });
  }

  /* TODO - put */
  addCourseToSubgoal(query: any) {
    return axios.get('./addCourseToSubgoal', {
      params: query,
    });
  }
}

export default new CourseToSubgoalService();
