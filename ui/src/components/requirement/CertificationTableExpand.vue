<template>
  <el-table-column type="expand">
    <template slot-scope="props">
      <el-form label-position="left" class="demo-table-expand">
        <el-form-item
          v-for="course in props.row.subClasses"
          :key="course.name"
          :label="course.percent"
        >
          <span v-show="!editable">{{ course.name }}</span>
          <input v-if="editable" type="text" v-model="name">
        </el-form-item>
        <input type="text">
      </el-form>
    </template>
  </el-table-column>
</template>

<script lang="ts">
import { defineComponent, reactive, toRefs } from '@vue/composition-api';

export default defineComponent({
  setup() {
    const state = reactive({
      editable: false,
      name: 'test',
    });

    return {
      ...toRefs(state),
    };
  },
});
</script>
