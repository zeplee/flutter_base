import 'package:flutter/material.dart';
import 'package:flutter_base/widget/widget.dart';

//吐司
class ToastHelper {
  static CommonFloat _float;

  static Widget getDefault(BuildContext context, String msg) {
    return Align(
      child: Container(
        color: Colors.red,
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
