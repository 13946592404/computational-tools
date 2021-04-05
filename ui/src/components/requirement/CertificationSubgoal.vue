<template>
  <el-table
    :data="subgoals"
    stripe
    border
    :row-key="getRowKey"
    :expand-row-keys="expandArray"
  >
    <el-table-column
      prop="id"
      :label="$t('certification.table.subTarget')"
      width="100px"
      align="center"
    />
    <el-table-column
      prop="statement"
      :label="$t('certification.table.content')"
    />
    <el-table-column type="expand">
      <template slot-scope="props">
        <el-form label-position="left" class="demo-table-expand">
          <certification-view-course
            :subgoal="props.row.id"
          />
        </el-form>
      </template>
    </el-table-column>
  </el-table>
</template>

<script lang="ts">
import {
  defineComponent,
  toRefs,
  reactive,
  inject,
  watch,
} from '@vue/composition-api';
import RequirementController from '../../store/requirementController';
import CertificationViewCourse from './CertificationViewCourse.vue';

export default defineComponent({
  components: {
    CertificationViewCourse,
  },

  props: {
    requirement: {
      default: 0,
    },
  },

  setup(props) {
    const radioSubgoal = inject('radioSubgoal');

    const state = reactive({
      expandArray: [],
      subgoals: [],
    });

    const getRowKey = (row: any) => row.id;

    const handleCollapseByRadioSubgoal = (opt: unknown) => {
      if (opt) {
        // @ts-ignore
        state.expandArray = state.subgoals.map((val) => val.id);
      } else {
        state.expandArray = [];
      }
    };

    const getSubgoals = () => {
      state.subgoals = RequirementController.subgoals.filter((val: any) => val.father_id === props.requirement);
      handleCollapseByRadioSubgoal(radioSubgoal);
    };

    setTimeout(() => getSubgoals(), 0); // debug: async

    watch(
      () => radioSubgoal,
      (val: any) => handleCollapseByRadioSubgoal(val.value),
      { deep: true },
    );

    return {
      ...toRefs(state),
      getRowKey,
    };
  },
});
</script>

<style lang="scss">
.el-table_1_column_2 {
  padding-left: 8px !important;
}
.el-table__header-wrapper {
  border-bottom: 1px solid #e2e8f0; /* Inspect Error */
}
</style>
