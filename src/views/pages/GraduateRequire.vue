<template>
  <div>
    <el-collapse v-model="activeNames" @change="handleChange">
      <el-collapse-item
        v-for="target in graduate"
        :key="target.index"
        :name="target.index"
        :title="target.index + ' ' + target.requirement"
      >
          <el-table
            :data="target.subRequirements"
            stripe
            border
            default-expand-all
          >
            <el-table-column
              prop="index"
              label="子目标"
              width="100px"
            />
            <el-table-column
              prop="requirement"
              label="内容"
            />
            <el-table-column type="expand">
              <template slot-scope="props">
                <el-form
                  label-position="left"
                  class="demo-table-expand"
                >
                  <el-form-item
                    v-for="course in props.row.subClasses"
                    :key="course.name"
                    :label="course.name"
                  >
                    <span>{{ course.percent }}</span>
                  </el-form-item>
                </el-form>
              </template>
            </el-table-column>
          </el-table>
      </el-collapse-item>
    </el-collapse>
    <el-backtop target=".page-component__scroll .el-scrollbar__wrap" />
  </div>
</template>

<script>
import graduate from '@/temp/graduate.json';

export default {
  data() {
    return {
      graduate,
      activeNames: ['1'],
    };
  },
};
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
