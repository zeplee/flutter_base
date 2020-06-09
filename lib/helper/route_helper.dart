import 'package:flutter/material.dart';

class RouteHelper {
  //navigatorKey可以代替Navigator.of(context)，用于没有context对象时的跳转
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  //打开页面
  static void push(
    String path, {
    Object arguments,
  }) {
    navigatorKey.currentState.pushNamed(
      path,
      arguments: arguments,
    );
  }

  //替换页面
  static void pushReplacementNamed(
    String path, {
    Object arguments,
  }) {
    navigatorKey.currentState.pushReplacementNamed(
      path,
      arguments: arguments,
    );
  }

  //返回根路由
  static void pushAndRemoveUntil(
    String path,
    bool isRetain, {
    Object arguments,
  }) {
    navigatorKey.currentState.pushNamedAndRemoveUntil(
      path,
      (route) => isRetain,
      arguments: arguments,
    );
  }

  //关闭页面
  static void pop<T extends Object>([T result]) {
    navigatorKey.currentState.pop<T>(result);
  }

  //关闭并打开新页面
  static void popAndPushNamed(
    String path, {
    bool isRetain,
    Object arguments,
  }) {
    navigatorKey.currentState.popAndPushNamed(
      path,
      arguments: arguments,
    );
  }

  static void popUntil(bool isRetain) {
    navigatorKey.currentState.popUntil((route) => isRetain);
  }

  //是否有上一页
  static bool canPop() => navigatorKey.currentState.canPop();

  //生成 PageRoute
  static Route<dynamic> appPageRoute(
    Widget widget, {
    bool opaque = false,
    int duration = 200,
    Widget transitionsBuilder,
  }) {
    return PageRouteBuilder(
      pageBuilder: (context, animation1, animation2) => widget,
      opaque: opaque,
      transitionDuration: Duration(milliseconds: duration),
      transitionsBuilder: (context, animation1, animation2, Widget child) {
        if (transitionsBuilder != null) {
          return transitionsBuilder;
        } else {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(
                parent: animation1,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          );
          return FadeTransition(
            opacity: animation1,
            child: ScaleTransition(
              scale: Tween<double>(begin: 0.5, end: 1.0).animate(animation1),
              child: child,
            ),
          );
          return ScaleTransition(
            scale: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn),
            ),
            child: child,
          );
          return SlideTransition(
            position:
                Tween<Offset>(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
                    .animate(
              CurvedAnimation(parent: animation1, curve: Curves.fastOutSlowIn),
            ),
            child: child,
          );
        }
      },
    );
  }
}

class AppPageRoute extends PageRouteBuilder {
  final Widget widget;

  AppPageRoute(this.widget)
      : super(
          transitionDuration: Duration(seconds: 1),
          pageBuilder: (context, animaton1, animaton2) => widget,
          transitionsBuilder: (context, animaton1, animaton2, Widget child) {},
        );
}
