<template>
  <div>
    <div class="collapseGroups">
      <certification-collapse
        :radioCollapse="radioGroup.radioCollapse"
        :radioCourse="radioGroup.radioCourse"
      />
    </div>
    <div class="radioGroups">
      <el-switch
        v-model="radioGroup.radioCollapse"
        :active-text="$t('certification.switchGroups.collapseOpen')"
        :inactive-text="$t('certification.switchGroups.collapseFold')"
        active-color="#13ce66"
        inactive-color="#ff4949"
      />
      <el-switch
        v-model="radioGroup.radioCourse"
        :active-text="$t('certification.switchGroups.courseOpen')"
        :inactive-text="$t('certification.switchGroups.courseFold')"
        :disabled="!radioGroup.radioCollapse"
      />
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, reactive, toRefs } from '@vue/composition-api';
import CertificationCollapse from './CertificationCollapse.vue';

export default defineComponent({
  components: {
    CertificationCollapse,
  },
  setup() {
    const state = reactive({
      radioGroup: {
        radioCollapse: true,
        radioCourse: true,
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
