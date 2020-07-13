import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/flutter_base.dart';
import 'package:flutter_base_example/common/global.dart';
import 'package:flutter_base_example/module/module.dart';

import 'common/common.dart';

void main() {
  _handleUi();
  _handleSdk();
  _handleError();
}

_handleDebug() {
  debugPaintSizeEnabled = Global.debugPaintSizeEnabled;
  debugCheckElevationsEnabled = Global.debugCheckElevationsEnabled;
  debugInstrumentationEnabled = Global.debugInstrumentationEnabled;
  debugPaintBaselinesEnabled = Global.debugPaintBaselinesEnabled;
  debugPaintLayerBordersEnabled = Global.debugPaintLayerBordersEnabled;
  debugPaintPointersEnabled = Global.debugPaintPointersEnabled;
  debugProfileBuildsEnabled = Global.debugProfileBuildsEnabled;
  debugProfilePaintsEnabled = Global.debugProfilePaintsEnabled;
  debugRepaintRainbowEnabled = Global.debugRepaintRainbowEnabled;
  debugRepaintTextRainbowEnabled = Global.debugRepaintTextRainbowEnabled;
}

_handleUi() {
  if (defaultTargetPlatform == TargetPlatform.android) {
    //透明状态栏，android默认是半透明
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        //启动时状态栏字体颜色，进入后取得是appbar的Brightness
        statusBarIconBrightness: Brightness.light,
//          systemNavigationBarColor: Colors.transparent,
//          systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
  }
}

_handleSdk() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  //  DebugFloat.init(context);
}

//_handleError() {
//  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
//    //收集Flutter异常发送给runZoned的onError
//    Zone.current
//        .handleUncaughtError(errorDetails.exception, errorDetails.stack);
//    //定制错误页面
//    return ErrorPage(errorDetails: errorDetails);
//  };
//  runZoned(
//    () => runApp(App()),
//    zoneSpecification: ZoneSpecification(
//      print: (Zone self, ZoneDelegate parent, Zone zone, String line) {
//        if (!Constants.IS_DEBUG()) {
//          // _reportLog(line); //收集日志
//        }
//      },
//    ),
//    onError: (Object obj, StackTrace stack) {
//      if (!Constants.IS_DEBUG()) {
//        // _reportError(obj, stack); //收集Dart异常
//      }
//    },
//  );
//}

_handleError() {
  ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
    Zone.current
        .handleUncaughtError(errorDetails.exception, errorDetails.stack);
    //定制错误页面
    return ErrorPage(errorDetails: errorDetails);
  };
  FlutterBugly.postCatchedException(() {
    runApp(App());
  });
  FlutterBugly.init(
      androidAppId: Global.buglyAndroidAppId, iOSAppId: Global.buglyIosAppId);
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _handleDebug();
    // 触摸收起键盘-但是如果触摸有点击事件的位置则无效，不完美方案
    return
//      GestureDetector(
//      behavior: HitTestBehavior.translucent,
//      onTap: () {
//        FocusScope.of(context).requestFocus(FocusNode());
//      },
//      child:
        MaterialApp(
      debugShowMaterialGrid: Global.debugShowMaterialGrid,
      showPerformanceOverlay: Global.showPerformanceOverlay,
      debugShowCheckedModeBanner: Global.debugShowCheckedModeBanner,
      showSemanticsDebugger: Global.showSemanticsDebugger,
      checkerboardRasterCacheImages: Global.checkerboardRasterCacheImages,
      checkerboardOffscreenLayers: Global.checkerboardOffscreenLayers,

      title: 'tonal',
      color: Colors.white,

      theme: Global.lightTheme,
      darkTheme: Global.darkTheme,
      themeMode: Global.themeMode,

      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('zh', 'CH'),
        const Locale('en', 'US'),
      ],
//      locale: Locale('zh'),

      navigatorKey: RouteHelper.navigatorKey,
      routes: Global.routes,
      onUnknownRoute: Global.onUnknownRoute,
//      onGenerateRoute: Global.onGenerateRoute,
      initialRoute: Global.greetPage,
      home: HomePage(),
//      ),
    );
  }
}
