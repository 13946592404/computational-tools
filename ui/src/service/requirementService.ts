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

  static getCoursesToSubgoalsView(lang: string) {
    return axios.get('./coursesToSubgoalsView', {
      params: {
        lang,
      },
    });
  }
}

export default Requirements;
