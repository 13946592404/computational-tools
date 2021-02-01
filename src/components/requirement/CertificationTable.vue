<template>
  <el-table
    :data="data"
    stripe
    border
    :default-expand-all="false"
  >
    <el-table-column
      prop="index"
      label="子目标"
      width="100px"
      align="center"
    />
    <el-table-column
      prop="statement"
      label="内容"
    />
    <certification-table-expand />
  </el-table>
</template>

<script lang="ts">
import { defineComponent } from '@vue/composition-api';
import CertificationTableExpand from './CertificationTableExpand.vue';

export default defineComponent({
  components: {
    CertificationTableExpand,
  },
  props: {
    data: {
      default: [],
    },
  },
});
</script>

<style lang="scss">
.el-table_1_column_2 {
  padding-left: 8px !important;
}
</style>
