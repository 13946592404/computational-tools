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
      username,
      password,
      lang: getLocale(),
    }).then((res) => res.data);
    this.setUser(user);
    return user;
  }

  @action async registerUser(login: any) {
    const { username, password } = login;
    const user = await UserService.registerUser({
      username,
      password,
    }).then((res) => res.data);
    this.setUser(user);
    return user;
  }

  @action async modifyUserInfo(user: any) {
    const newUser = await UserService.modifyUserInfo(user).then((res) => res.data);
    this.setUser(newUser);
    return user;
  }

  @mutation logoutUser() {
    this.state.user = {};
  }
}

export default useModule(MODULE_NAME, UserModule);
