<template>
  <el-col :span="12">
    <el-menu class="el-menu-vertical-demo ct-sidebar" >
      <aside
        v-for="(value, index) in $i18n.t('navigation')"
        :key="index"
      >
        <router-link :to=" { name: value.routerName }">
          <el-menu-item :index="index">
            <i :class="value.icon" />
            <span slot="title">
              {{ value.name }}
            </span>
          </el-menu-item>
        </router-link>
      </aside>
    </el-menu>
  </el-col>
</template>
