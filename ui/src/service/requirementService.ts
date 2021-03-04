import axios from '@/plugins/axios';

class RequirementService {
  getRequirements(lang: string) {
    return axios.get('./requirements', {
      params: {
        lang,
      },
    });
  }

  getSubGoals(lang: string) {
    return axios.get('./subGoals', {
      params: {
        lang,
      },
    });
  }

  getCoursesToSubgoalsView(lang: string) {
    return axios.get('./coursesToSubgoalsView', {
      params: {
        lang,
      },
    });
  }
}

export default new RequirementService();
