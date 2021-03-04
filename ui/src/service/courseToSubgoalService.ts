import axios from 'axios';

class CourseToSubgoalService {
  static putUpdateCoursesToSubgoals(query: any) {
    return axios.get('./updateCoursesToSubgoals', {
      params: query,
    });
  }

  static putDeleteCoursesToSubgoals(query: any) {
    return axios.get('./deleteCoursesToSubgoals', {
      params: query,
    });
  }

  static putAddCoursesToSubgoals(query: any) {
    return axios.get('./addCoursesToSubgoals', {
      params: query,
    });
  }
}

export default CourseToSubgoalService;
