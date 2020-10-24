import 'package:MusicApp/commons/CollapsingNavigationDrawer.dart';
import 'package:MusicApp/theme.dart';
import 'package:flutter/material.dart';


void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home : HomePage()
  ));


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: drawerBackGroundColor,
          centerTitle: true,
          title:Text('Sidebar design')
        ),

        body: Stack(
          children: <Widget>[
            Container(
              color: Colors.purple,
            ),
            CollapsingNavigationDrawer()
          ],
        ),
      )
      );
  }
}