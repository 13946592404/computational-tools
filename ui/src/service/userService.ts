import axios from '@/plugins/axios';

class UserService {
  getUser(params: any) {
    return axios.post('./userLogin', params);
  }

  registerUser(params: any) {
    return axios.put('./userRegister', params);
  }

  modifyUserInfo(user: any) {
    return axios.put('./userModifyInfo', user);
  }
}

export default new UserService();
