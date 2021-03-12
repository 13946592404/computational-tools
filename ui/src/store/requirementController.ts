import { useModule } from '@/store/helper';
import { reactive } from '@vue/composition-api';
import { createModule, mutation, action } from 'vuex-class-component';
import RequirementService from '@/service/requirementService';
import { getLocale } from '@/plugins/i18n';

// export interface CoursesToSubgoalsView {
//   course_id: string;
//   name: string;
//   percent: number;
//   subgoal_id: string;
//   is_edit: boolean; // FE
// }

// export interface SubGoal {
//   id: string;
//   statement: string;
//   father_id: number;
//   subClasses: CoursesToSubgoalsView[];
// }

// export interface Requirement {
//   id: number;
//   statement: string;
//   title: string;
//   children: SubGoal[];
// }

const validLen = (val: number) => val > 1;

const locale: string = getLocale();

const MODULE_NAME = 'RequirementModule';

export class RequirementModule extends createModule({ namespaced: MODULE_NAME }) {
  state = reactive({
    requirements: [
      { children: [] },
    ],
    subGoals: [
      { subClasses: [] },
    ],
    coursesToSubgoalsViews: [
      { is_edit: false },
    ],
  });

  // base getter
  get requirements() {
    return this.state.requirements;
  }
  get subGoals() {
    return this.state.subGoals;
  }
  get coursesToSubgoalsViews() {
    return this.state.coursesToSubgoalsViews;
  }

  // base mutation
  @mutation setRequirements(requirements: []) {
    this.state.requirements = requirements;
  }
  @mutation setSubGoals(subGoals: []) {
    this.state.subGoals = subGoals;
  }
  @mutation setCoursesToSubgoalsViews(coursesToSubgoalsViews: []) {
    this.state.coursesToSubgoalsViews = coursesToSubgoalsViews;
  }

  // base action
  @action async loadRequirements() {
    return validLen(this.requirements.length) ? this.requirements : RequirementService.getRequirements(locale).then((res) => {
      this.setRequirements(res.data);
    });
  }
  @action async loadSubGoals() {
    return validLen(this.subGoals.length) ? this.subGoals : RequirementService.getSubGoals(locale).then((res) => {
      this.setSubGoals(res.data);
    });
  }
  @action async loadCoursesToSubgoalsViews() {
    return validLen(this.coursesToSubgoalsViews.length) ? this.coursesToSubgoalsViews : RequirementService.getCoursesToSubgoalsViews(locale).then((res) => {
      this.setCoursesToSubgoalsViews(res.data);
    });
  }

  // load All - sum of base action
  @action async loadAll() {
    await this.loadRequirements();
    await this.loadSubGoals();
    await this.loadCoursesToSubgoalsViews();
  }

  // handle function
  @mutation handleSubGoals() {
    for (let i = 0; i < this.state.subGoals.length; i += 1) {
      this.state.subGoals[i].subClasses = [];
    }

    // add every courses to subGoals[]
    this.state.coursesToSubgoalsViews.forEach((val) => {
      const proxy = val;
      proxy.is_edit = false;
      // @ts-ignore
      this.state.subGoals.find((value) => value.id === val.subgoal_id).subClasses.push(proxy);
    });
  }

  @mutation handleRequirements() {
    for (let i = 0; i < this.state.requirements.length; i += 1) {
      this.state.requirements[i].children = [];
    }

    // add every subGoals to children[]
    // @ts-ignore
    this.state.subGoals.forEach((val) => this.state.requirements[val.father_id - 1].children.push(val));
  }

  // handle all - sum of handle
  @action async handleAll() {
    await this.handleSubGoals();
    await this.handleRequirements();
  }

  // get all - sum of load all & handle all
  @action async getAll() {
    if (!validLen(this.requirements.length)) {
      // set all
      await this.loadAll();
      // handle all
      this.handleAll();
    }
    return this.requirements;
  }
}

export default useModule(MODULE_NAME, RequirementModule);
