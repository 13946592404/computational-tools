import requirementService from '@/service/requirementService';

export interface SubClasses {
  name: string;
  percent: number;
  subgoal_id: string;
  is_edit: boolean; // FE
}

export interface SubGoals {
  id: string;
  statement: string;
  father_id: number;
  subClasses: SubClasses[];
}

export interface Requirements {
  id: number;
  statement: string;
  title: string;
  children: SubGoals[];
}

const handleAllRequirements = (requirements: Requirements[], subGoals: SubGoals[], coursesToSubgoalsView: SubClasses[]) => {
  const requirement = requirements;
  const subGoal = subGoals;

  // add subClasses[]
  for (let i = 0; i < subGoal.length; i += 1) {
    subGoal[i].subClasses = [];
  }

  // add every courses to subGoals[]
  coursesToSubgoalsView.forEach((val: SubClasses) => {
    const proxy = val;
    proxy.is_edit = false;
    subGoal.find((value) => value.id === val.subgoal_id)!.subClasses.push(proxy);
  });

  // add children[]
  for (let i = 0; i < requirement.length; i += 1) {
    requirement[i].children = [];
  }

  // add every subGoals to children[]
  subGoals.forEach((val: SubGoals) => requirement[val.father_id - 1].children.push(val));

  return requirement;
};

const getAllRequirements = async (locale: string) => {
  const requirements = await requirementService.getRequirements(locale).then((res) => res.data);
  const subGoals = await requirementService.getSubGoals(locale).then((res) => res.data);
  const coursesToSubgoalsView = await requirementService.getCoursesToSubgoalsView(locale).then((res) => res.data);
  return handleAllRequirements(requirements, subGoals, coursesToSubgoalsView);
};

export default getAllRequirements;
