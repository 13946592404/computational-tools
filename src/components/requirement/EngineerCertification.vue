<template>
  <el-collapse v-model="activeNames" @change="handleChange">
    <el-collapse-item
      v-for="target in requirement"
      :key="target.index"
      :name="target.index"
      :title="target.index + ' ' + target.title + '：' + target.statement"
    >
        <el-table
          :data="target.children"
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
            prop="statement"
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
</template>

<script>
import requirement from '@/data/requirement';

export default {
  data() {
    let activeNames = []; // eslint-disable-line

    return {
      activeNames,
      requirement,
    };
  },
  created() {
    setInterval(() => {
      if (this.activeNames.length) {
        this.activeNames = [];
      } else {
        this.activeNames = requirement.map((value) => value.index);
      }
    }, 3000);
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
