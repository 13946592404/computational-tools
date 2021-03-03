import requirementService from '@/service/requirementService';

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

  async setAllRequirements(locale: string) {
    this.requirements = await requirementService.getRequirements(locale).then((res) => res.data);
    this.subGoals = await requirementService.getSubGoals(locale).then((res) => res.data);
    this.coursesToSubgoalsViews = await requirementService.getCoursesToSubgoalsView(locale).then((res) => res.data);
  }

  handleAllRequirements() {
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

    // add children[]
    for (let i = 0; i < this.requirements.length; i += 1) {
      this.requirements[i].children = [];
    }

    // add every subGoals to children[]
    this.subGoals.forEach((val: SubGoal) => this.requirements[val.father_id - 1].children.push(val));
  }

  async getAllRequirements(locale: string) {
    if (!this.requirements.length) {
      await this.setAllRequirements(locale);
      this.handleAllRequirements();
    }
    return this.requirements;
  }
}

export default new RequirementData();
