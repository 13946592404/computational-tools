<template>
  <div class="h-full bg-white">
    <div style="padding-left: 30%; padding-top: 3%">
      <el-table
        :data="student"
        :max-height="450"
        style="width: 65%"
      >
        <el-table-column
          prop="id"
          :label="$t('user.student.no')"
          width="180"
        />
        <el-table-column
          prop="name"
          :label="$t('user.student.name')"
          width="180"
        />
        <el-table-column
          :label="$t('user.student.action')"
          width="180"
        >
          <template slot-scope="scope">
            <a @click="getRequirement(scope.row.id)">
              {{ $t('user.student.requirement') }}
            </a>
          </template>
        </el-table-column>
      </el-table>
    </div>
    <div class="sdkjlf">
      <el-input
        v-model="newName"
        :placeholder="$t('user.student.new')"
        class="mb-4"
      />
      <el-button
        type="success"
        round
        @click="studentAdd"
      >
        {{ $t('user.student.add') }}
      </el-button>
    </div>
  </div>
</template>

<script lang="ts">
import { defineComponent, reactive, toRefs } from '@vue/composition-api';
import { $t } from '../../plugins/i18n';
import { LocalMessage, LocalMessageBox } from '../../plugins/element-ui';
import StudentService from '../../service/studentService';

export default defineComponent({
  setup() {
    const state = reactive({
      student: [],
      newName: '',
    });

    const studentGet = () => {
      StudentService.getStudent().then((res: any) => {
        state.student = res.data;
      });
    };

    studentGet();

    const studentAdd = () => {
      StudentService.addStudent({
        name: state.newName,
      }).then(
        () => {
          LocalMessage($t('openCourse.view.message.ok'), 'success');
          studentGet();
        },
        () => { LocalMessage($t('openCourse.view.message.no'), 'error'); },
      );
    };

    const getRequirement = (id: number) => {
      LocalMessageBox(
        $t('user.student.requirement'),
        id,
      );
    };

    return {
      ...toRefs(state),
      studentAdd,
      getRequirement,
    };
  },
});
</script>

<style lang="scss">
.sdkjlf {
  position: absolute;
  width: 10%;
  top: 35%;
  right: 8%;
}
</style>
