<template>
  <el-collapse v-model="activeNames">
    <el-collapse-item
      v-for="target in requirements"
      :key="target.id"
      :name="target.id"
      :title="target.id + ' ' + target.title + ' - ' + target.statement"
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
  reactive,
  ref,
  toRefs,
  watch,
} from '@vue/composition-api';
import getAllRequirements from '@/data/requirementData';
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
    const state = reactive({
      requirements: {},
    });

    const activeNames = ref([]);

    const foldCertificationAll = () => {
      activeNames.value.splice(0, activeNames.value.length);
    };

    const openCertificationAll = () => {
      activeNames.value.push(...state.requirements.map((val) => val.id));
    };

    // watch props
    watch(
      () => props.value.collapse.show,
      () => (props.value.collapse.show ? openCertificationAll() : foldCertificationAll()),
    );

    getAllRequirements().then((val) => {
      state.requirements = val;
      // default open all - after promise
      openCertificationAll();
    });

    return {
      ...toRefs(state),
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

.el-collapse-item__header {
  line-height: 24px !important;
  height: 72px !important;
  max-height: 72px !important;
}
</style>
