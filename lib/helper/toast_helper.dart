import 'package:flutter/material.dart';
import 'package:flutter_base/widget/widget.dart';

//吐司
class ToastHelper {
  static CommonFloat _float;

  static Widget getDefault(BuildContext context, String msg) {
    return Container(
      color: Colors.transparent,
      margin: EdgeInsets.only(
        top: MediaQuery.of(context).size.height * 0.7,
      ),
      alignment: Alignment.center,
      child: Center(
        child: Container(
          color: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Material(
              child: Text(
                msg,
                style: TextStyle(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  static show(BuildContext context, Widget child, {int duration = 2}) {
    _float = CommonFloat(child: child);
    _float?.show(context, duration: duration);
  }

  static dismiss() {
    _float?.dismiss();
  }
}
