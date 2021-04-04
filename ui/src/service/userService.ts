import axios from '@/plugins/axios';

class UserService {
  getUser(params: any) { // lang username password
    return axios.post('./userLogin', params);
  }
}

export default new UserService();
