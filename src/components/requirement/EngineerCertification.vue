<template>
  <el-collapse v-model="activeNames">
    <el-collapse-item
      v-for="target in requirement"
      :key="target.index"
      :name="target.index"
      :title="target.index + ' ' + target.title + '：' + target.statement"
    >
        <certification-table
          :data="target.children"
        />
    </el-collapse-item>
  </el-collapse>
</template>

<script type="ts">
import { defineComponent, reactive } from '@vue/composition-api';
import requirement from '@/data/requirement';
import CertificationTable from './CertificationTable.vue';

export default defineComponent({
  components: {
    CertificationTable,
  },

  setup() {
    const activeNames = reactive([]);

    const foldCertificationAll = () => {
      activeNames.splice(0, this.activeNames.length);
    };

    const openCertificationAll = () => {
      activeNames.push(...requirement.map((val) => val.index));
    };

    requirement[0].children[0].sub = [
      { name: 'a', percent: '30%' },
    ];

    setTimeout(() => {
      openCertificationAll();
    }, 3000);

    setTimeout(() => {
      foldCertificationAll();
    }, 6000);

    return {
      activeNames,
      requirement,
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
</style>
