<template>
  <div class="graduate-require">
    <div class="collapseGroups animate__animated animate__fadeIn">
      <certification-requirement
        :radio-requirement="radioRequirement"
        v-if="globalVuexState"
      />
      <div class="requirment-loading flex flex-1"
        v-if="!globalVuexState"
        v-loading="!globalVuexState"
      />
    </div>
    <div class="radioGroups">
      <!-- edit button: collapse - show, course - show, auth - ok -->
      <el-switch
        v-if="radioRequirement && radioSubgoal.value && radioCoursePermission.show"
        v-model="radioCoursePermission.value"
        active-color="#E6A23C"
        :active-text="$t('certification.switchGroups.buttonShow')"
        :inactive-text="$t('certification.switchGroups.buttonHide')"
      />
      <!-- course fold: collapse - show -->
      <el-switch
        v-if="radioRequirement"
        v-model="radioSubgoal.value"
        inactive-color="#909399"
        :active-text="$t('certification.switchGroups.courseOpen')"
        :inactive-text="$t('certification.switchGroups.courseFold')"
      />
      <!-- collapse fold: no limit -->
      <el-switch
        v-model="radioRequirement"
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
import RequirementController from '../../store/requirementController';
import UserController from '../../store/userController';
// import CourseController from '@/store/courseController';
import CertificationRequirement from '../../components/requirement/CertificationRequirement.vue';

export default defineComponent({
  components: {
    CertificationRequirement,
  },
  setup() {
    const globalVuexState = ref(false);

    const radioRequirement = ref(true);

    const radioSubgoal = reactive({
      value: true,
    });

    const isAdmin = Boolean(UserController.user?.is_admin);

    const radioCoursePermission = reactive({
      show: isAdmin,
      value: isAdmin,
    });

    provide('radioSubgoal', radioSubgoal);
    provide('radioCoursePermission', radioCoursePermission);

    const globalVuex = async () => {
      await RequirementController.init();
      // await CourseController.init();
      globalVuexState.value = true;
    };

    globalVuex();

    return {
      // radio state
      radioRequirement,
      radioSubgoal,
      radioCoursePermission,
      // vuex
      globalVuexState,
    };
  },
});
</script>

<style lang="scss">
.graduate-require {
  height: auto;
  width: 100%;
  background-color: white;

  .collapseGroups {
    padding: 1% 18%;
  }
}
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
