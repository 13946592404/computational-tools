<template>
  <div>
    <div class="collapseGroups">
      <certification-collapse
        :radioCollapse="radioCollapse"
      />
    </div>
    <div class="radioGroups">
      <!-- edit button: collapse - show, course - show, auth - ok -->
      <el-switch
        v-if="radioCollapse && radioCourse.value && radioPermission.show"
        v-model="radioPermission.value"
        active-color="#E6A23C"
        :active-text="$t('certification.switchGroups.buttonShow')"
        :inactive-text="$t('certification.switchGroups.buttonHide')"
      />
      <!-- course fold: collapse - show -->
      <el-switch
        v-if="radioCollapse"
        v-model="radioCourse.value"
        inactive-color="#909399"
        :active-text="$t('certification.switchGroups.courseOpen')"
        :inactive-text="$t('certification.switchGroups.courseFold')"
      />
      <!-- collapse fold: no limit -->
      <el-switch
        v-model="radioCollapse"
        active-color="#13ce66"
        inactive-color="#ff4949"
        :active-text="$t('certification.switchGroups.collapseOpen')"
        :inactive-text="$t('certification.switchGroups.collapseFold')"
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
