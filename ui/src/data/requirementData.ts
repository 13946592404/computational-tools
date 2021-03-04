import RequirementService from '@/service/requirementService';
import { getLocale } from '@/plugins/i18n';

const locale: string = getLocale();

export interface CoursesToSubgoalsView {
  course_id: string;
  name: string;
  percent: number;
  subgoal_id: string;
  is_edit: boolean; // FE
}

export interface SubGoal {
  id: string;
  statement: string;
  father_id: number;
  subClasses: CoursesToSubgoalsView[];
}

export interface Requirement {
  id: number;
  statement: string;
  title: string;
  children: SubGoal[];
}

class RequirementData {
  requirements: Requirement[];
  subGoals: SubGoal[];
  coursesToSubgoalsViews: CoursesToSubgoalsView[];

  constructor() {
    this.requirements = [];
    this.subGoals = [];
    this.coursesToSubgoalsViews = [];
  }

  async setRequirments() {
    if (!this.requirements.length) {
      this.requirements = await RequirementService.getRequirements(locale).then((res) => res.data);
    }
  }

  async setSubGoals() {
    if (!this.subGoals.length) {
      this.subGoals = await RequirementService.getSubGoals(locale).then((res) => res.data);
    }
  }

  async setCourseToSubgoalsViews() {
    if (!this.coursesToSubgoalsViews.length) {
      this.coursesToSubgoalsViews = await RequirementService.getCoursesToSubgoalsView(locale).then((res) => res.data);
    }
  }

  // set all
  async setAllRequirements() {
    await this.setRequirments();
    await this.setSubGoals();
    await this.setCourseToSubgoalsViews();
  }

  handleSubGoals() {
    // add CoursesToSubgoalsView[]
    for (let i = 0; i < this.subGoals.length; i += 1) {
      this.subGoals[i].subClasses = [];
    }

    // add every courses to subGoals[]
    this.coursesToSubgoalsViews.forEach((val: CoursesToSubgoalsView) => {
      const proxy = val;
      proxy.is_edit = false;
      this.subGoals.find((value) => value.id === val.subgoal_id)!.subClasses.push(proxy);
    });
  }

  handleRequirements() {
    // add children[]
    for (let i = 0; i < this.requirements.length; i += 1) {
      this.requirements[i].children = [];
    }

    // add every subGoals to children[]
    this.subGoals.forEach((val: SubGoal) => this.requirements[val.father_id - 1].children.push(val));
  }

  // handle all
  handleAllRequirements() {
    this.handleSubGoals();
    this.handleRequirements();
  }

  // get all
  async getAllRequirements() {
    if (!this.requirements.length) {
      // set all
      await this.setAllRequirements();
      // handle all
      this.handleAllRequirements();
    }
    return this.requirements;
  }
}

export default new RequirementData();
