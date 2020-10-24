import 'package:MusicApp/commons/CollapsingListTile.dart';
import 'package:MusicApp/model/NavigationModel.dart';
import 'package:MusicApp/theme.dart';
import 'package:flutter/material.dart';

class CollapsingNavigationDrawer extends StatefulWidget {
  @override
  _CollapsingNavigationDrawerState createState() => _CollapsingNavigationDrawerState();
}

class _CollapsingNavigationDrawerState extends State<CollapsingNavigationDrawer> with SingleTickerProviderStateMixin{

  double maxWidth = 250;
  double minWidth = 60;
  bool isCollaps = false;
  AnimationController _animationController;
  Animation<double>widthAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this,duration: Duration(milliseconds: 200));
    widthAnimation       = Tween<double>(begin: maxWidth,end: minWidth).animate(_animationController);
  }
  
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: _animationController, builder: (context,widget) => getWidget(context,widget));
}

Widget getWidget(context,widget){
  return Container(
      width: widthAnimation.value,
      color: drawerBackGroundColor,
      child: Column(
        children: <Widget>[
            CollapsingListTile(
                    title: 'Mridul Hossain',
                    icon: Icons.person,
                    animationController : _animationController
              ),

            SizedBox(height: 40),
            Expanded(
              child: ListView.builder(itemBuilder: (context,counter){
                  return CollapsingListTile(
                    title: navigationItems[counter].title,
                    icon: navigationItems[counter].icon,
                    animationController : _animationController
                  );
              },
              itemCount: navigationItems.length,  
              ),
            ),
            InkWell(
              onTap:(){
                setState(() {
                   isCollaps = !isCollaps;
                   isCollaps ? _animationController.forward() : _animationController.reverse();
                });
              },
              child: AnimatedIcon(
                icon: AnimatedIcons.close_menu,
                progress: _animationController,
                color: Colors.white,
                size: 50,
              )
            )
        ],
      ),
    );
}
}