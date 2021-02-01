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
import {
  defineComponent,
  ref,
  watch,
} from '@vue/composition-api';
import requirement from '@/data/requirement';
import CertificationTable from './CertificationTable.vue';

export default defineComponent({
  components: {
    CertificationTable,
  },

  props: {
    value: {
      default: {},
    },
  },

  setup(props) {
    const activeNames = ref([]);

    const foldCertificationAll = () => {
      activeNames.value.splice(0, activeNames.value.length);
    };

    const openCertificationAll = () => {
      activeNames.value.push(...requirement.map((val) => val.index));
    };

    // default open all
    openCertificationAll();

    // watch props
    watch(
      () => props.value.collapse.show,
      () => (props.value.collapse.show ? openCertificationAll() : foldCertificationAll()),
    );

    // Certification-Table-Expand test
    requirement[0].children[0].sub = [
      { name: 'a', percent: '30%' },
    ];

    return {
      requirement,
      activeNames,
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
