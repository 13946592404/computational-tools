import { RouteConfig } from 'vue-router';
import { $t } from '@/plugins/i18n';
import UserController from '@/store/userController';
import { LocalMessage } from '@/plugins/element-ui';

const loginCheck = (to: any, from: any, next: any) => {
  if (UserController.user.id) {
    next();
  } else {
    LocalMessage(
      $t('user.permission.require'),
      'warning',
    );
    next({ name: 'user' });
  }
};

// home page: redirect
export const home: RouteConfig = {
  path: '/',
  name: 'home',
  component: () => import('@/views/Home.vue'),
  redirect: {
    name: 'master',
  },
};

// main pages (in children)
export const master: RouteConfig = {
  path: '/master',
  name: 'master',
  component: () => import('@/views/master/shell/MasterShell.vue'),
  redirect: {
    name: 'user',
  },
  children: [
    {
      path: 'user',
      name: 'user',
      meta: {
        name: $t('navigation.user'),
        icon: 'el-icon-s-custom',
      },
      component: () => import('@/views/master/UserView.vue'),
    },
    {
      path: 'requirement',
      name: 'requirement',
      meta: {
        name: $t('navigation.requirement'),
        icon: 'el-icon-s-flag',
      },
      component: () => import('@/views/master/GraduateRequire.vue'),
      beforeEnter: loginCheck,
    },
    {
      path: 'course',
      name: 'course',
      meta: {
        name: $t('navigation.course'),
        icon: 'el-icon-school',
      },
      component: () => import('@/views/master/CourseManage.vue'),
      beforeEnter: loginCheck,
    },
    {
      path: 'student',
      name: 'student',
      meta: {
        name: $t('navigation.student'),
        icon: 'el-icon-collection',
      },
      component: () => import('@/views/master/StudentManage.vue'),
      beforeEnter: loginCheck,
    },
    {
      path: 'setting',
      name: 'setting',
      meta: {
        name: $t('navigation.setting'),
        icon: 'el-icon-s-tools',
      },
      component: () => import('@/views/master/UserSetting.vue'),
    },
  ],
};

// http common pages: 40X 50X
export const common: Array<RouteConfig> = [
  {
    path: '/50*',
    name: '50*',
    component: () => import('@/views/common/ServerError.vue'),
  },
  {
    path: '/401',
    name: '401',
    component: () => import('@/views/common/NotAuth.vue'),
  },
  {
    path: '*',
    name: '404',
    component: () => import('@/views/common/NotFound.vue'),
  },
];

// all routes
const routes: Array<RouteConfig> = [
  home,
  master,
  ...common,
];

export default routes;
