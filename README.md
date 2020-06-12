# flutter_base

flutter应用框架快速搭建库

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## web预览
### github-page
https://zeplee.github.io/flutter_base/web
### coding-page
https://n10w8r.coding-pages.com/release/web

## 依赖使用
### pub.dev
dependencies:
  flutter_base: '^0.0.1'
### Hosted
dependencies:
  flutter_base:
    hosted:
      name: flutter_base
      url: http://your-package-server.com
    version: ^0.0.0
### Git
dependencies:
  flutter_base:
     git:
       url: https://github.com/Li-Zepeng/flutter_base.git
       ref: some-branch
       path: packages/package1 如上配置默认认为package项目位于仓库的根目录上，若不是，需用path:配置指出具体的子目录
### Path
dependencies:
  flutter_base:
     path: ../plugins/plugin1 相对路径
## 功能
### 网络
dio
### 路由
fluro
### 权限
permission_handler
### 图片缓存
cached_network_image
### 工具集
flustars
### 存储
#### 共享参数
shared_preferences
#### 数据库
### 状态管理
provider
### 事件总线
event_bus
### 公用组件
#### 吐司
toast,
#### 阻挡ui弹窗
dlg
#### 非阻挡ui弹窗
ppw
#### 拖动组件
drag
#### 全局浮动组件
float
