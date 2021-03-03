import { RouteConfig } from 'vue-router';
import { $t } from '@/plugins/i18n';

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
    name: 'requirement',
  },
  children: [
    {
      path: 'requirement',
      name: 'requirement',
      meta: {
        name: $t('navigation.requirement'),
        icon: 'el-icon-s-flag',
      },
      component: () => import('@/views/master/GraduateRequire.vue'),
    },
    {
      path: 'user',
      name: 'user',
      meta: {
        name: $t('navigation.user'),
        icon: 'el-icon-user-solid',
      },
      component: () => import('@/views/master/UserView.vue'),
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
