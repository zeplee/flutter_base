import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/flutter_base.dart';

///详情页-dialog
class HomeDetail15Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Builder(
        builder: (BuildContext context) => _buildBody(context),
      ),
    );
  }

  _buildAppBar() => PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          centerTitle: true,
          title: Text("dialog"),
        ),
      );

  _buildBody(context) {
    return Column(
      children: <Widget>[
        RaisedButton(
          child: Text('上'),
          onPressed: () {},
        ),
        RaisedButton(
          child: Text('中'),
          onPressed: () {},
        ),
        RaisedButton(
          child: Text('下'),
          onPressed: () {
            _showBottomDlg(context);
          },
        ),
        RaisedButton(
          child: Text('aboutDlg'),
          onPressed: () {
            _showAboutDlg(context);
          },
        ),
        RaisedButton(
          child: Text('alertDlg'),
          onPressed: () {
            _showAlertDlg(context);
          },
        ),
        RaisedButton(
          child: Text('simpleDlg'),
          onPressed: () {
            _showSimpleDlg(context);
          },
        ),
        RaisedButton(
          child: Text('commonDlg'),
          onPressed: () {
            _showCommonDlg(context);
          },
        ),
        RaisedButton(
          child: Text('dlg'),
          onPressed: () {
            _showDlg(context);
          },
        ),
        RaisedButton(
          child: Text('menu'),
          onPressed: () {
            _showMenu(context);
          },
        ),
        RaisedButton(
          child: Text('search'),
          onPressed: () {},
        ),
      ],
    );
  }

  _showAboutDlg(context) {
    showAboutDialog(
      context: context,
      applicationIcon: Image.asset(
        'assets/images/flare_logo.png',
        height: 100,
        width: 100,
      ),
      applicationName: '应用程序',
      applicationVersion: '1.0.0',
//      applicationLegalese: 'copyright 老孟，一枚有态度的程序员',
      children: <Widget>[
        Container(
          height: 30,
          color: Colors.red,
        ),
        Container(
          height: 30,
          color: Colors.blue,
        ),
        Container(
          height: 30,
          color: Colors.green,
        ),
      ],
    );
  }

  _showAlertDlg(context) {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('提示'),
        content: Text('确认删除吗？'),
        actions: <Widget>[
          FlatButton(
            child: Text('取消'),
            onPressed: () {},
          ),
          FlatButton(
            child: Text('确认'),
            onPressed: () {},
          ),
        ],
      ),
    );
//    showCupertinoDialog(
//      context: context,
//      builder: (context) {
//        return CupertinoAlertDialog(
//          title: Text('提示'),
//          content: Text('确认删除吗？'),
//          actions: <Widget>[
//            CupertinoDialogAction(
//              child: Text('取消'),
//              onPressed: () {},
//            ),
//            CupertinoDialogAction(
//              child: Text('确认'),
//              onPressed: () {},
//            ),
//          ],
//        );
//      },
//    );
  }

  _showSimpleDlg(context) {
    showDialog(
      context: context,
      useSafeArea: true,
      builder: (context) => SimpleDialog(
        title: Text('提示'),
        children: <Widget>[
          Container(
            height: 80,
            alignment: Alignment.center,
            child: Text('确认删除吗？'),
          ),
          Divider(
            height: 1,
          ),
          FlatButton(
            child: Text('取消'),
            onPressed: () {
              Navigator.of(context).pop('cancel');
            },
          ),
          Divider(
            height: 1,
          ),
          FlatButton(
            child: Text('确认'),
            onPressed: () {
              Navigator.of(context).pop('ok');
            },
          ),
        ],
      ),
    );
  }

  _showBottomDlg(context) {
    //阻挡型底部弹窗，有半透明蒙层，返回-退出，空白处-退出
//    showModalBottomSheet(
//      context: context,
//      isScrollControlled: true,
//      builder: (context) {
//        return FlatButton(
//          child: Text('确认'),
//          onPressed: () {
//            Navigator.of(context).pop('ok');
//          },
//        );
//      },
//    );
    //非阻挡型底部弹窗，无蒙层，返回-退出，空白处-不退出，需要context位于Scaffold子层
    showBottomSheet(
      context: context,
      builder: (context) {
        return FlatButton(
          child: Text('确认'),
          onPressed: () {
            Navigator.of(context).pop('ok');
          },
        );
      },
    );
  }

  _showCommonDlg(context) {
//    showDialog(
//      context: context,
//      builder: (context) {
//        return CommonDlg1(
//          title: '昵称',
//          enterTxt: "修改",
//          callback: (res) {
////                setState(() {
////                  this.settingData[index]['message'] = res;
////                });
////                this.editorToast();
//          },
//        );
//      },
//    );
//    showCupertinoModalPopup(
//      context: context,
//      builder: (context) {
//        return CommonDlg2(
//          text: '正在获取详情...',
//        );
//      },
//    );
//    showCupertinoModalPopup(
//      context: context,
////      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
//      builder: (context) {
//        return CupertinoActionSheet(
//          title: Text('提示'),
//          message: Text('是否要删除当前项？'),
//          actions: <Widget>[
//            CupertinoActionSheetAction(
//              child: Text('删除'),
//              onPressed: () {},
//              isDefaultAction: true,
//            ),
//            CupertinoActionSheetAction(
//              child: Text('暂时不删'),
//              onPressed: () {},
//              isDestructiveAction: true,
//            ),
//          ],
//        );
//      },
//    );
//    showDialog(
//      context: context,
//      builder: (context) {
//        return Center(
//          child: Container(
//            color: Colors.white,
//            width: 300,
//            height: 300,
//            child: Center(
//              child: Text("这里是文字啊"),
//            ),
//          ),
//        );
//      },
//    );
//    showDialog(
//      context: context,
//      builder: (context) {
//        return CommonDlg2(
//          text: '正在获取详情...',
//        );
//      },
//    );

    //还可以这么显示dialog 阻挡型，可以设置背景是否透明-其实使用showGeneralDialog即可实现相同功能
    Navigator.of(context).push(AppPageRoute(CommonDlg3()));
  }

  //barrierColor 不设置的话是纯透明的，阻挡型dialog
  _showDlg(context) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, anim1, anim2) {},
      barrierColor: Colors.grey.withOpacity(.4),
      barrierDismissible: true,
      barrierLabel: "",
      transitionDuration: Duration(milliseconds: 400),
      transitionBuilder: (context, anim1, anim2, child) {
        final curvedValue = Curves.easeInOutBack.transform(anim1.value) - 1.0;
        return Transform(
            transform: Matrix4.translationValues(0.0, curvedValue * 200, 0.0),
            child: Opacity(
              opacity: anim1.value,
              child: AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                title: Text("Dialog"),
                content: Text("Hello world"),
              ),
            ));
      },
    );
  }

  _showMenu(context) {
    showMenu(
      context: context,
      position: RelativeRect.fill,
      items: <PopupMenuEntry>[
        PopupMenuItem(child: Text('语文')),
        PopupMenuDivider(),
        CheckedPopupMenuItem(
          child: Text('数学'),
          checked: true,
        ),
        PopupMenuDivider(),
        PopupMenuItem(child: Text('英语')),
      ],
    );
  }
}
