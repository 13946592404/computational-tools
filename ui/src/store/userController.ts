import { useModule } from '@/store/helper';
import { reactive } from '@vue/composition-api';
import { createModule, mutation, action } from 'vuex-class-component';
import UserService from '@/service/userService';
import { getLocale } from '@/plugins/i18n';

const MODULE_NAME = 'UserModule';

export class UserModule extends createModule({ namespaced: MODULE_NAME }) {
  state = reactive({
    user: {},
  });

  get user() {
    return this.state.user;
  }

  @mutation setUser(user: any) {
    this.state.user = user;
  }

  @action async loadUser(login: any) {
    // @ts-ignore
    if (this.state.user?.id > 0) {
      return this.state.user;
    }
    const { username, password } = login;
    const user = await UserService.getUser({
      lang: getLocale(),
      username,
      password,
    }).then((res) => res.data);
    this.setUser(user);
    return user;
  }

  @mutation logoutUser() {
    this.state.user = {};
  }
}

export default useModule(MODULE_NAME, UserModule);
