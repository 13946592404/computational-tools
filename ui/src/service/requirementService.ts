import axios from '@/plugins/axios';

class Requirements {
  static getRequirements(lang: string) {
    return axios.get('./requirements', {
      params: {
        lang,
      },
    });
  }

  static getSubGoals(lang: string) {
    return axios.get('./subGoals', {
      params: {
        lang,
      },
    });
  }

  static getCourses(lang: string) {
    return axios.get('./courses', {
      params: {
        lang,
      },
    });
  }

  static getCoursesToSubgoalsView(lang: string) {
    return axios.get('./coursesToSubgoalsView', {
      params: {
        lang,
      },
    });
  }

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

export default Requirements;
