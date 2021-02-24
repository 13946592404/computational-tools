import axios from '@/plugins/axios';

class Requirements {
  static getRequirements() {
    return axios.get('./requirements');
  }

  static getSubGoals() {
    return axios.get('./subGoals');
  }

  static getCoursesToSubgoalsView() {
    return axios.get('./coursesToSubgoalsView');
  }
}

export default Requirements;
