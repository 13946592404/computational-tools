<template>
  <el-table
    :data="data"
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
    <certification-table-expand />
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
    data: {
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
    const getRowKey = (row) => row.index;

    watch(
      () => props,
      (value) => {
        if (value.radioCourse) {
          // @ts-ignore
          state.expandArray.push(...value.data.map((val) => val.index));
        } else {
          state.expandArray.splice(0, state.expandArray.length);
        }
      },
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
