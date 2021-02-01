import i18n from '@/plugins/i18n';

// @ts-ignore
const requirement: array<any> = Array.from(i18n.t('requirement'));

for (let i = 0; i < requirement.length; i += 1) {
  requirement[i].index = (i + 1).toString();
  for (let j = 0; j < requirement[i].children.length; j += 1) {
    requirement[i].children[j].index = `${i + 1}-${j + 1}`;
  }
}

export default requirement;
