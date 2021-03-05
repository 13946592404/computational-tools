import axios from '@/plugins/axios';

class UserService {
  getUser(query: any) { // lang username password
    return axios.get('./userLogin', {
      params: query,
    });
  }
}

export default new UserService();
