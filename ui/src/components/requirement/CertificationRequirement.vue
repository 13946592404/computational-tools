<template>
  <el-collapse v-model="activeNames">
    <el-collapse-item
      v-for="target in requirements"
      :key="target.id"
      :name="target.id"
      :title="target.id + ' ' + target.title + ' - ' + target.statement"
    >
      <certification-subgoal
        :subGoals="target.children"
      />
    </el-collapse-item>
  </el-collapse>
</template>

<script lang="ts">
import {
  defineComponent,
  reactive,
  toRefs,
  watch,
} from '@vue/composition-api';
import RequirementController from '@/store/requirementController';
import CertificationSubgoal from './CertificationSubgoal.vue';

export default defineComponent({
  components: {
    CertificationSubgoal,
  },

  props: {
    radioCollapse: {
      default: true,
    },
  },

  setup(props) {
    // data
    const state = reactive({
      requirements: [],
      activeNames: [],
    });

    // methods
    const handleCollapse = (opt: boolean) => {
      if (opt) {
        // @ts-ignore
        state.activeNames.push(...state.requirements.map((val) => val.id));
      } else {
        state.activeNames = [];
      }
    };

    const getRequirements = async () => {
      await RequirementController.getAll();
      state.requirements = RequirementController.requirements;
      handleCollapse(props.radioCollapse);
    };

    getRequirements();

    // state change - by radio group
    watch(
      () => props,
      (val) => handleCollapse(val.radioCollapse),
      { deep: true },
    );

    return {
      ...toRefs(state),
    };
  },
});
</script>

<style lang="scss">
.demo-table-expand {
  font-size: 0;
}

.demo-table-expand label {
  width: 160px;
  color: #99a9bf;
}

.demo-table-expand .el-form-item {
  margin-right: 0;
  margin-bottom: 0;
  width: 50%;
}

.el-collapse-item__header {
  line-height: 24px !important;
  height: 72px !important;
  max-height: 72px !important;
}
</style>
