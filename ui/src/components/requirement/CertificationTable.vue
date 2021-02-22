<template>
  <el-table
    :data="data"
    stripe
    border
    :default-expand-all="false"
  >
    <el-table-column
      prop="index"
      :label="labels.subTarget"
      width="100px"
      align="center"
    />
    <el-table-column
      prop="statement"
      :label="labels.content"
    />
    <certification-table-expand />
  </el-table>
</template>

<script lang="ts">
import { defineComponent } from '@vue/composition-api';
import i18n from '@/plugins/i18n';
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
  setup() {
    const labels = {
      subTarget: i18n.t('certification.table.subTarget'),
      content: i18n.t('certification.table.content'),
    };

    return {
      labels,
    };
  },
});
</script>

<style lang="scss">
.el-table_1_column_2 {
  padding-left: 8px !important;
}
</style>
