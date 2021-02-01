<template>
  <div>
    <div class="collapseGroups">
      <certification-collapse
        v-model="statement"
      />
    </div>
    <div class="radioGroups">
      <el-switch
        v-model="statement.collapse.show"
        :active-text="statement.collapse.text.open"
        :inactive-text="statement.collapse.text.fold"
      />
      <el-switch
        v-model="statement.course.show"
        :active-text="statement.course.text.open"
        :inactive-text="statement.course.text.fold"
        :disabled="!statement.collapse.show"
      />
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, reactive, toRefs } from '@vue/composition-api';
import i18n from '@/plugins/i18n';
import CertificationCollapse from './CertificationCollapse.vue';

export default defineComponent({
  components: {
    CertificationCollapse,
  },
  setup() {
    const state = reactive({
      statement: {
        collapse: {
          show: true,
          text: {
            open: `${i18n.t('base.open')}${i18n.t('certification.switchGroups.collapse')}`,
            fold: `${i18n.t('base.fold')}${i18n.t('certification.switchGroups.collapse')}`,
          },
        },
        course: {
          show: false,
          text: {
            open: `${i18n.t('base.open')}${i18n.t('certification.switchGroups.course')}`,
            fold: `${i18n.t('base.fold')}${i18n.t('certification.switchGroups.course')}`,
          },
        },
      },
    });

    return {
      ...toRefs(state),
    };
  },
});
</script>

<style lang="scss">
.radioGroups {
  position: fixed;
  right: 2%;
  bottom: 7%;
  display: flex;
  flex-flow: column wrap;
  text-align: center;
  background: whitesmoke;
  border: 1px dotted #999999;
  z-index: 1;

  .el-switch {
    margin: 20px;
    justify-content: center;
  }
}
</style>
