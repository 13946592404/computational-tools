<template>
  <el-table-column type="expand">
    <template slot-scope="props">
      <el-form label-position="left" class="demo-table-expand">
        <el-form-item
          v-for="course in props.row.subClasses"
          :key="course.name"
          :label="course.name"
        >
          <div :style="spanStyle">
            <span contenteditable>{{ course.percent }}</span>
          </div>
        </el-form-item>
      </el-form>
    </template>
  </el-table-column>
</template>

<script lang="ts">
import { defineComponent, reactive, toRefs } from '@vue/composition-api';
import i18n from '@/plugins/i18n';

export default defineComponent({
  setup() {
    const state = reactive({
      editable: false,
      name: 'test',
    });

    const spanStyle = {
      marginLeft: i18n.locale === 'ch' ? '80px' : '380px',
    };

    return {
      ...toRefs(state),
      spanStyle,
    };
  },
});
</script>

<style lang="scss">
.el-form-item__label {
  white-space: nowrap;
}
</style>
