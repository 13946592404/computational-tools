import { useModule } from '@/store/helper';
import { reactive } from '@vue/composition-api';
import { createModule, mutation, action } from 'vuex-class-component';
import UserService from '@/service/userService';
import { getLocale } from '@/plugins/i18n';

const MODULE_NAME = 'UserModule';

export class UserModule extends createModule({ namespaced: MODULE_NAME }) {
  state = reactive({
    user: {
      id: 0,
    },
    login: {
      username: '',
      password: '',
    },
  });

  get user() {
    return this.state.user;
  }

  @mutation setLogin(login: any) {
    this.state.login = login;
  }

  @mutation setUser(user: any) {
    this.state.user = user;
  }

  @action async loadUser() {
    if (this.state.user?.id > 0) {
      return this.state.user;
    }
    const { username, password } = this.state.login;
    const user = await UserService.getUser({
      lang: getLocale(),
      username,
      password,
    }).then((res) => res.data);
    this.setUser(user);
    return user;
  }
}

export default useModule(MODULE_NAME, UserModule);
