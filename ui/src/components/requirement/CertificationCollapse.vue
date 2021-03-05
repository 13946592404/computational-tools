<template>
  <el-collapse v-model="activeNames">
    <el-collapse-item
      v-for="target in requirements"
      :key="target.id"
      :name="target.id"
      :title="target.id + ' ' + target.title + ' - ' + target.statement"
    >
      <certification-table
        :subGoals="target.children"
        :radioCourse="radioCourse"
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
import RequirementData from '@/store/requirementData';
import CourseController from '@/store/courseController';
import CertificationTable from './CertificationTable.vue';

export default defineComponent({
  components: {
    CertificationTable,
  },

  props: {
    radioCollapse: {
      default: true,
    },
    radioCourse: {
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

    // get data and init
    RequirementData.getAllRequirements().then((val) => {
      // requirements
      // @ts-ignore
      state.requirements = val;
      // state init - collapse
      handleCollapse(props.radioCollapse);
    });

    // state change - by radio group
    watch(
      () => props,
      (val) => handleCollapse(val.radioCollapse),
      { deep: true },
    );

    CourseController.loadCourses();

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
