import 'package:flutter/material.dart';

///详情页-本地列表
class HomeDetail13Page extends StatelessWidget {
  //或者使用 AnimatedList.of(context)
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  final items = [
    '1',
    '2',
    '3',
    '3',
    '3',
    '3',
    '3',
    '3',
    '3',
    '3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () => _addItem(),
            child: Icon(Icons.add),
          ),
          SizedBox(
            width: 60,
          ),
          FloatingActionButton(
            onPressed: () => _removeItem(),
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }

  _buildAppBar() => PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          centerTitle: true,
          title: Text("本地列表"),
        ),
      );

//  _buildBody() => ListView.builder(
//        //去除越界效果
//        physics: ClampingScrollPhysics(),
//        itemBuilder: (context, i) {
//          return Text('你好');
//        },
//      );

  _buildBody() => AnimatedList(
        key: _listKey,
        initialItemCount: items.length,
        itemBuilder: (BuildContext context, int index, Animation animation) =>
            _buildItem(items[index].toString(), animation),
      );

//
  _buildItem(String _item, Animation _animation) {
    return SizeTransition(
      sizeFactor: _animation,
      child: Card(
        child: ListTile(
          title: Text(
            _item,
          ),
        ),
      ),
    );
  }

//

//  _buildItem(String _item, Animation _animation) {
//    return SlideTransition(
//      position: _animation
//          .drive(CurveTween(curve: Curves.easeIn))
//          .drive(Tween<Offset>(begin: Offset(1, 1), end: Offset(0, 1))),
//      child: Card(
//        child: ListTile(
//          title: Text(
//            _item,
//          ),
//        ),
//      ),
//    );
//  }

  _addItem() {
    final int _index = items.length;
    var item = items[_index - 1].toString();
    items.insert(_index, item);
    _listKey.currentState.insertItem(_index);
  }

  _removeItem() {
    final int _index = items.length - 1;
    var item = items[_index].toString();
    items.removeAt(_index);
    _listKey.currentState.removeItem(
      _index,
      (context, animation) => _buildItem(item, animation),
    );
  }
}
