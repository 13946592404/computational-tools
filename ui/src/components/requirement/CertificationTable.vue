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
            :subGoals="props.row"
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
    radioCourse: {
      default: true,
    },
  },
  setup(props) {
    const state = reactive({
      expandArray: [],
    });

    // @ts-ignore
    const getRowKey = (row) => row.id;

    const handleCourses = (opt: boolean) => {
      if (opt) {
        // @ts-ignore
        state.expandArray.push(...props.subGoals.map((val) => val.id));
      } else {
        state.expandArray = [];
      }
    };

    watch(
      () => props,
      (value) => handleCourses(value.radioCourse),
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
</style>
