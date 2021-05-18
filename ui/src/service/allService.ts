import axios from '@/plugins/axios';

class AllService {
  getAll(id: number) {
    return axios.get('./all', {
      params: {
        id,
      },
    });
  }
}

export default new AllService();
