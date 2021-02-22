import i18n from '@/plugins/i18n';
import { getCourses } from '@/service/requirementCourse';

/* eslint-disable */
// @ts-ignore
const requirement: Array<any> = Array.from(i18n.t('requirement'));

// add index
for (let i = 0; i < requirement.length; i += 1) {
  requirement[i].index = (i + 1).toString();
  for (let j = 0; j < requirement[i].children.length; j += 1) {
    requirement[i].children[j].index = `${i + 1}-${j + 1}`;
    requirement[i].children[j].subClasses = [];
  }
}

// add courses
getCourses.forEach((val: any) => {
  const finder: Array<number> = val.father.split('-').map((value: string) => Number.parseInt(value, 10));
  requirement[finder[0] - 1].children[finder[1] - 1].subClasses.push({
    name: val.name,
    percent: val.percent,
  });
});

export default requirement;
