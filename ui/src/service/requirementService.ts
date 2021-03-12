import axios from '@/plugins/axios';

class RequirementService {
  getRequirements(lang: string) {
    return axios.get('./requirement', {
      params: {
        lang,
      },
    });
  }

  getSubgoals(lang: string) {
    return axios.get('./subgoal', {
      params: {
        lang,
      },
    });
  }

  getCoursesToSubgoalsViews(lang: string) {
    return axios.get('./courseToSubgoalView', {
      params: {
        lang,
      },
    });
  }
}

export default new RequirementService();
