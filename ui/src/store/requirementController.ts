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
    subgoals: [
      { subClasses: [] },
    ],
    coursesToSubgoalsViews: [
      { is_edit: false },
    ],
  });

  // validation
  get requirementsValid() {
    return validLen(this.requirements.length);
  }
  get subgoalsValid() {
    return validLen(this.subgoals.length);
  }
  get coursesToSubgoalsViewsValid() {
    return validLen(this.coursesToSubgoalsViews.length);
  }

  // base getter
  get requirements() {
    return this.state.requirements;
  }
  get subgoals() {
    return this.state.subgoals;
  }
  get coursesToSubgoalsViews() {
    return this.state.coursesToSubgoalsViews;
  }

  // base mutation
  @mutation setRequirements(requirements: []) {
    this.state.requirements = requirements;
  }
  @mutation setSubgoals(subgoals: []) {
    this.state.subgoals = subgoals;
  }
  @mutation setCoursesToSubgoalsViews(coursesToSubgoalsViews: []) {
    this.state.coursesToSubgoalsViews = coursesToSubgoalsViews;
  }

  // base action
  @action async loadRequirements(force = false) {
    if (!this.requirementsValid || force) {
      await RequirementService.getRequirements(locale).then((res) => {
        this.setRequirements(res.data);
      });
    }
    return this.requirements;
  }
  @action async loadSubgoals(force = false) {
    if (!this.subgoalsValid || force) {
      await RequirementService.getSubgoals(locale).then((res) => {
        this.setSubgoals(res.data);
      });
    }
    return this.subgoals;
  }
  @action async loadCoursesToSubgoalsViews(force = false) {
    if (!this.coursesToSubgoalsViewsValid || force) {
      await RequirementService.getCoursesToSubgoalsViews(locale).then((res) => {
        this.setCoursesToSubgoalsViews(res.data);
      });
    }
    return this.coursesToSubgoalsViews;
  }

  // init
  @action async init(force = false) {
    this.loadRequirements(force);
    this.loadSubgoals(force);
    this.loadCoursesToSubgoalsViews(force);
  }
}

export default useModule(MODULE_NAME, RequirementModule);
