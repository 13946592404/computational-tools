<template>
  <el-col :span="12">
    <el-menu
      class="el-menu-vertical-demo ct-sidebar"
    >
      <el-menu-item index="2">
        <i class="el-icon-menu"></i>
        <span slot="title">{{ $i18n.t('navigation.info') }}</span>
      </el-menu-item>
      <el-menu-item index="3" disabled>
        <i class="el-icon-document"></i>
        <span slot="title">导航三</span>
      </el-menu-item>
      <el-menu-item index="4">
        <i class="el-icon-setting"></i>
        <span slot="title">导航四</span>
      </el-menu-item>
    </el-menu>
  </el-col>
</template>
