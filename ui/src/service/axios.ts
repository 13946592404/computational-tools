import axios, { AxiosResponse } from 'axios';
import axiosConfig from '@/conf/axios.json';

axios.defaults.baseURL = axiosConfig.url;
// axios.defaults.headers.common['Authorization'] = AUTH_TOKEN;
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';

axios.get('./sql').then((res: AxiosResponse<any>) => {
  console.log(res);
});
