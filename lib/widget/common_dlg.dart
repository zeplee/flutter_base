import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//弹窗组件
class CommonDlg extends Dialog {
  final Widget child;

  CommonDlg({@required this.child});

  show(BuildContext context) {}

  dismiss() {}
}

class CommonDlg1 extends Dialog {
  final double width; // 宽度
  final double height; // 高度
  final String title; // 顶部标题
  final String content; // 内容
  final String cancelTxt; // 取消按钮的文本
  final String enterTxt; // 确认按钮的文本
  final Function callback; // 修改之后的回掉函数

  CommonDlg1(
      {this.width: 270,
      this.height: 141,
      this.title,
      this.content, // 根据content来，判断显示哪种类型
      this.cancelTxt: "取消",
      this.enterTxt: "确认",
      this.callback});

  @override
  Widget build(BuildContext context) {
    String _inputVal = "";

    return GestureDetector(
      // 点击遮罩层隐藏弹框
      child: Padding(
        //永远有一个最小15的外间距
        padding: const EdgeInsets.all(15.0),
        child: Material(
          type: MaterialType.transparency, // 配置透明度
          child: Center(
            child: GestureDetector(
              // 点击遮罩层关闭弹框，并且点击非遮罩区域禁止关闭
              onTap: () {
                print('我是非遮罩区域～');
              },
              child: Container(
                width: this.width,
                height: this.height,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                ),
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: <Widget>[
                    Visibility(
                      visible: this.content == null ? true : false,
                      child: Positioned(
                        top: 0,
                        child: Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.fromLTRB(0, 19, 0, 19),
                          child: Text(
                            "${this.title}",
                            style: TextStyle(
                                fontSize: 17,
                                color: Color(0xff000000),
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                      alignment: Alignment.center,
                      child: this.content != null
                          ? Container(
                              width: double.infinity,
                              margin: EdgeInsets.fromLTRB(0, 0, 0, 42),
                              alignment: Alignment.center,
                              child: Text("${this.content}",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600)))
                          : TextField(
                              textAlignVertical: TextAlignVertical.center,
                              style: TextStyle(fontSize: 13),
                              textInputAction: TextInputAction.send,
                              decoration: InputDecoration(
                                hintText: '${this.title}',
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 3.0, horizontal: 5.0),
                                enabledBorder: OutlineInputBorder(
                                    // 边框默认色
                                    borderSide: const BorderSide(
                                        color: Color(0xffC8C7CC))),
                                focusedBorder: OutlineInputBorder(
                                    // 聚焦之后的边框色
                                    borderSide: const BorderSide(
                                        color: Color(0xfff3187D2))),
                              ),
                              onChanged: (value) {
                                _inputVal = value;
                              },
                            ),
                    ),
                    Container(
                      height: 43,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1, color: Color(0xffEFEFF4)))),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Container(
                                  height: double.infinity,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          right: BorderSide(
                                              width: 1,
                                              color: Color(0xffEFEFF4)))),
                                  child: Text("${this.cancelTxt}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff007AFF),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w400))),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              child: Container(
                                  height: double.infinity,
                                  // 继承父级的高度
                                  alignment: Alignment.center,
                                  child: Text("${this.enterTxt}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Color(0xff007AFF),
                                          fontSize: 17,
                                          fontWeight: FontWeight.w600))),
                              onTap: () {
                                if (this.content != null) {
                                  this.callback(_inputVal); // 通过回掉函数传给父级
                                }
                                Navigator.pop(context); // 关闭dialog
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      onTap: () {
        print('我是遮罩区域～');
        Navigator.pop(context);
      },
    );
  }
}

class CommonDlg2 extends Dialog {
  final String text;
  final bool canBack;

  CommonDlg2({Key key, @required this.text, this.canBack = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBack(canBack),
      child: Material(
        //创建透明层
        type: MaterialType.transparency, //透明类型
        child: Center(
          //保证控件居中效果
          child: SizedBox(
            width: 120.0,
            height: 120.0,
            child: Container(
              decoration: ShapeDecoration(
                color: Color(0xffffffff),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(8.0),
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 20.0,
                    ),
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _onBack(bool canBack) => () async => canBack; //true 不拦截返回，false 拦截返回

}

class CommonDlg3 extends Dialog {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Center(
          //保证控件居中效果
          child: CupertinoActivityIndicator(
            radius: 18,
          ),
        ),
        onWillPop: () async {
          return Future.value(true);
        });
  }
}
