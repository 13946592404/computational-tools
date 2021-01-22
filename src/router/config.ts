import { RouteConfig } from 'vue-router';

// home page: redirect
const home: RouteConfig = {
  path: '/',
  name: 'home',
  component: () => import('@/views/Home.vue'),
  redirect: {
    name: 'master',
  },
};

// main pages (in children)
const master: Array<RouteConfig> = [
  {
    path: '/master',
    name: 'master',
    component: () => import('@/views/master/MasterPage.vue'),
    redirect: {
      name: 'helloworld',
    },
    children: [
      {
        path: 'helloworld',
        name: 'helloworld',
        component: () => import('@/components/HelloWorld.vue'),
      },
    ],
  },
];

// http common pages: 40X 50X
const common: Array<RouteConfig> = [
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
  ...master,
  ...common,
];

export default routes;
