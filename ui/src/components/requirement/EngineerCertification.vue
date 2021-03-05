<template>
  <div>
    <div class="collapseGroups">
      <certification-collapse
        :radioCollapse="radioCollapse"
      />
    </div>
    <div class="radioGroups">
      <el-switch
        v-model="radioCollapse"
        :active-text="$t('certification.switchGroups.collapseOpen')"
        :inactive-text="$t('certification.switchGroups.collapseFold')"
        active-color="#13ce66"
        inactive-color="#ff4949"
      />
      <el-switch
        v-model="radioCourse.value"
        :active-text="$t('certification.switchGroups.courseOpen')"
        :inactive-text="$t('certification.switchGroups.courseFold')"
        :disabled="!radioCollapse"
      />
      <el-switch
        v-if="radioPermission.show"
        v-model="radioPermission.value"
        :active-text="$t('certification.switchGroups.buttonShow')"
        :inactive-text="$t('certification.switchGroups.buttonHide')"
        :disabled="!radioCollapse"
      />
    </div>
  </div>
</template>

<script lang="ts">
import {
  defineComponent,
  provide,
  ref,
  reactive,
} from '@vue/composition-api';
import CertificationCollapse from './CertificationCollapse.vue';

export default defineComponent({
  components: {
    CertificationCollapse,
  },
  setup() {
    const radioCollapse = ref(true);

    const radioCourse = reactive({
      value: true,
    });

    const radioPermission = reactive({
      show: true,
      value: true,
    });

    provide('radioCourse', radioCourse);
    provide('radioPermission', radioPermission);

    return {
      radioCollapse,
      radioCourse,
      radioPermission,
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
