<template>
  <el-table
    :data="subGoals"
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
          <certification-table-expand
            :subGoal="props.row"
          />
        </el-form>
      </template>
    </el-table-column>
  </el-table>
</template>

<script lang="ts">
import {
  defineComponent,
  watch,
  toRefs,
  reactive,
  inject,
} from '@vue/composition-api';
import CertificationTableExpand from './CertificationTableExpand.vue';

export default defineComponent({
  components: {
    CertificationTableExpand,
  },

  props: {
    subGoals: {
      default: [],
    },
  },

  setup(props) {
    const radioCourse = inject('radioCourse');

    const state = reactive({
      expandArray: [],
    });

    const getRowKey = (row: any) => row.id;

    const handleCourses = (opt: boolean | undefined) => {
      if (opt) {
        // @ts-ignore
        state.expandArray.push(...props.subGoals.map((val) => val.id));
      } else {
        state.expandArray = [];
      }
    };

    watch(
      () => radioCourse,
      (val: any) => handleCourses(val.value),
      { deep: true, immediate: true },
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
