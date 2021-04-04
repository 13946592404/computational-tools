import axios from '@/plugins/axios';

class UserService {
  getUser(params: any) { // lang username password
    return axios.post('./userLogin', params);
  }

  registerUser(params: any) { // lang username password
    return axios.put('./userRegister', params);
  }
}

export default new UserService();
