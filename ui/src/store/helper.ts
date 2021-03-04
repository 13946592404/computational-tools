import { useStore } from '@/store';
import { createProxy, extractVuexModule } from 'vuex-class-component';

export function useModule(moduleName: string, cls: any) {
  // extract class to object define vuex
  const modules = extractVuexModule(cls);

  const global = useStore();
  global.registerModule(moduleName, modules[moduleName]);

  // create proxy of the vuex
  const store = createProxy(global, cls);

  return store;
}
