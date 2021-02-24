import requirementService from '@/service/requirementService';

interface SubClasses {
  name: string;
  percent: string;
  //
}

interface SubGoals {
  index: string;
  statement: string;
  father_id: number;
  subClasses: SubClasses[];
}

interface Requirements {
  id: number;
  statement: string;
  title: string;
  children: SubGoals[];
}

const handleAllRequirements = (requirements: Requirements[], subGoals: SubGoals[]) => {
  const ans = requirements;

  // add children[]
  for (let i = 0; i < requirements.length; i += 1) {
    ans[i].children = [];
  }

  // add every subGoals to children[]
  subGoals.forEach((val: SubGoals) => {
    ans[val.father_id - 1].children.push(val);
  });

  return ans;
};

const getAllRequirements = async () => {
  const requirements = await requirementService.getRequirements().then((res) => res.data);
  const subGoals = await requirementService.getSubGoals().then((res) => res.data);
  // const coursesToSubgoalsView = await requirementService.getCoursesToSubgoalsView()
  // .then((res) => res.data);
  return handleAllRequirements(requirements, subGoals);
};

export default getAllRequirements;
