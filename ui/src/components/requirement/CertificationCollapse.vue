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

<script lang="js">
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
    radioCollapse: {
      default: false,
    },
    radioCourse: {
      default: false,
    },
  },

  setup(props) {
    // data
    const state = reactive({
      requirements: [],
    });

    const activeNames = ref([]);

    // methods
    const handleCertificationAll = (opt) => {
      if (opt) {
        activeNames.value.push(...state.requirements.map((val) => val.id));
      } else {
        activeNames.value.splice(0, activeNames.value.length);
      }
    };

    // get data and init
    getAllRequirements().then((val) => {
      // requirements
      state.requirements = val;
      // state init - collapse
      handleCertificationAll(props.radioCollapse);
    });

    // state change - by radio group
    watch(
      () => props,
      (val) => handleCertificationAll(val.radioCollapse),
      { deep: true },
    );

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
