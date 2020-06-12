import 'dart:math';

import 'package:flutter/material.dart';

///自带搜索模版
class HomeDetail16Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          title: Text("推荐页"),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.face),
              onPressed: () {
                _showDatePicker(context);
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
            ),
          ],
        ),
      ),
    );
  }
}

_showDatePicker(context) {
  showDatePicker(
    context: context,
    initialDate: DateTime.parse("20181209"),
    //初始选中日期
    firstDate: DateTime.parse("20181109"),
    //可选日期范围第一个日期
    lastDate: DateTime.parse("20190109"),
    //可选日期范围最后一个日期
    selectableDayPredicate: (dateTime) {
      //通过此方法可以过滤掉可选范围内不可选的特定日期
      if (dateTime.day == 10 || dateTime.day == 20 || dateTime.day == 30) {
        //此处表示10号、20号、30号不可选
        return false;
      }
      return true;
    },
    initialDatePickerMode: DatePickerMode.day, //初始化选择模式，有day和year两种
  ).then((dateTime) {
    //选择日期后点击OK拿到的日期结果
    print('当前选择了：${dateTime.year}年${dateTime.month}月${dateTime.day}日');
  });

  showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(), //初始化显示时间
  ).then((timeOfDay) {
    //选择时间后点击OK拿到的时间结果
    if (timeOfDay == null) {
      return;
    }
    print('当前选择了：${timeOfDay.hour}时${timeOfDay.minute}分');
  });
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: Colors.blue,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(
          Icons.clear,
        ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('老孟 $index'),
          onTap: () {
            query = '老孟 $index';
          },
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: Random().nextInt(5),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return Container(
          height: 60,
          alignment: Alignment.center,
          child: Text(
            '$index',
            style: TextStyle(fontSize: 20),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider();
      },
      itemCount: 10,
    );
  }
}
