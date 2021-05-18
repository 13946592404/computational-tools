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
            <el-link
              type="primary"
              @click="getRequirement(scope.row.id)"
            >
              {{ $t('user.student.requirement') }}
            </el-link>
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
import { MessageBox } from 'element-ui';
import { $t } from '../../plugins/i18n';
import { LocalMessage } from '../../plugins/element-ui';
import StudentService from '../../service/studentService';
import AllService from '../../service/allService';

export default defineComponent({
  setup() {
    const state = reactive({
      student: [],
      newName: '',
      ans: {},
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
      AllService.getAll(id).then((res: any) => {
        state.ans = res.data[0]; // eslint-disable-line
        // console.log(ans);
        let msg = '';
        let times = 0;
        let ans = true;
        for (let i of Object.keys(state.ans)) { // eslint-disable-line
          if (i.indexOf('-') >= 0) {
            // @ts-ignore
            if (state.ans[i] < 0.6) {
              ans = false;
            }
            // @ts-ignore
            msg += `<span style='margin-left: 45px'>${i}: ${state.ans[i]}</span>`;
            times += 1;
            if (times === 3) {
              times = 0;
              msg += '</br>';
            }
          }
        }
        msg += `</br></br><p>${$t(`certification.ans.${ans ? 'yes' : 'no'}`)}</p>`;
        MessageBox({
          title: $t('user.student.requirement').toString(),
          message: msg,
          dangerouslyUseHTMLString: true,
        });
      });
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
