import i18n from '@/plugins/i18n';
import VueI18n from 'vue-i18n';

const requirement: VueI18n.TranslateResult = i18n.t('requirement');

// @ts-ignore
requirement.forEach((value: any, index: number) => {
  value.index = (index + 1).toString();
  value.children.forEach((val: object, indx: number) => {
    // @ts-ignore
    val.index = `${value.index}-${indx + 1}`;
  });
})

export default requirement;
