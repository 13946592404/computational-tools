<template>
  <el-table-column type="expand">
    <template slot-scope="props">
      <el-form label-position="left" class="demo-table-expand">
        <el-form-item
          v-for="course in props.row.subClasses"
          :key="course.name"
          :label="course.percent"
        >
          <span>{{ course.name }}</span>
        </el-form-item>
      </el-form>
    </template>
  </el-table-column>
</template>
