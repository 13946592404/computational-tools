import axios from '@/plugins/axios';

class StudentService {
  getStudent() {
    return axios.get('./student');
  }

  addStudent(params: any) {
    return axios.put('./studentAdd', params);
  }
}

export default new StudentService();
