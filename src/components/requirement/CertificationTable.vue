<template>
  <el-table
    :data="data"
    stripe
    border
    :default-expand-all="isExpand"
  >
    <el-table-column prop="index" label="子目标" width="100px" />
    <el-table-column prop="statement" label="内容" />
    <certification-table-expand />
  </el-table>
</template>

<script lang="ts">
import CertificationTableExpand from './CertificationTableExpand.vue';

export default {
  components: {
    CertificationTableExpand,
  },
  props: {
    data: {
      default: [],
    },
  },
  data() {
    return {
      isExpand: true,
    };
  },
  // methods: {
  //   openCourseAll() {
  //     this.isExpand = true;
  //   },
  //   foldCourseAll() {
  //     this.isExpand = false;
  //   },
  // },
  // created() {
  //   setInterval(() => {
  //     this.isExpand = !this.isExpand;
  //   }, 3000)
  // },
};
</script>
