import Vue from 'vue';
import VueRouter, { RouteConfig } from 'vue-router';
import Home from '../views/Home.vue';

Vue.use(VueRouter);

const routes: Array<RouteConfig> = [
  {
    path: '/',
    name: 'Home',
    component: Home,
    redirect: {
      name: 'helloworld',
    },
  },
  {
    path: '/helloworld',
    name: 'helloworld',
    component: () => import(/* webpackChunkName: "about" */ '../components/HelloWorld.vue'),
  },
  {
    path: '/*',
    name: 'notfound',
    component: () => import(/* webpackChunkName: "about" */ '../views/common/NotFound.vue'),
  },
];

const router = new VueRouter({
  mode: 'history',
  base: process.env.BASE_URL,
  routes,
});

export default router;
