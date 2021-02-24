import axios, { AxiosResponse } from 'axios';

axios.defaults.baseURL = 'http://localhost:3000';
// axios.defaults.headers.common['Authorization'] = AUTH_TOKEN;
axios.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';

axios.get('./sql').then((res: AxiosResponse<any>) => {
  console.log(res);
});
