import axios from 'axios';

class CourseToSubgoalService {
  putUpdateCoursesToSubgoals(query: any) {
    return axios.get('./updateCoursesToSubgoals', {
      params: query,
    });
  }

  putDeleteCoursesToSubgoals(query: any) {
    return axios.get('./deleteCoursesToSubgoals', {
      params: query,
    });
  }

  putAddCoursesToSubgoals(query: any) {
    return axios.get('./addCoursesToSubgoals', {
      params: query,
    });
  }
}

export default new CourseToSubgoalService();
