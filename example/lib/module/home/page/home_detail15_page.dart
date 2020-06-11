import 'package:flutter/material.dart';

///详情页-dialog
class HomeDetail15Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
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
          onPressed: () {},
        ),
        RaisedButton(
          child: Text('aboutDlg'),
          onPressed: () {
            _showAboutDlg(context);
          },
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
      applicationLegalese: 'copyright 老孟，一枚有态度的程序员',
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
}
