import 'package:flutter/material.dart';
import 'package:hm_shop/pages/Login/index.dart';
import 'package:hm_shop/pages/Main/index.dart';

// 返回App的根级组件
Widget getRootWidget() {
  return MaterialApp(
    initialRoute: "/",
    // 命名路由
    routes: getRootRouts(),
  );
}

// 返回该app的路由配置
Map<String, Widget Function(BuildContext)> getRootRouts() {
  return {
    "/":(context) => MainPage(),  // 主页路由
    "/login":(context) => LoginPage(), // 登录路由
  };
}