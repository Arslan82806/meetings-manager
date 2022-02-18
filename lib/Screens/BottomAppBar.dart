import 'package:flutter/material.dart';
import 'package:meetings_manager/Screens/AddMeeting.dart';
import 'package:meetings_manager/Screens/settings.dart';
class bottomAppBar extends StatefulWidget {
  @override
  _bottomAppBarState createState() => _bottomAppBarState();
}

class _bottomAppBarState extends State<bottomAppBar> {
  int _currentIndex=0;
  void onTabTapped(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _currentIndex,
        onTap: onTabTapped, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home, size: 35,),
            title: new Text(''),

          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.people_alt_sharp, size: 35,),
            title: new Text(''),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings, size: 35,),
              title: Text('')
          )
        ],
      ),
      body: _currentIndex==0?Container(

      ):_currentIndex==1?Addmeeting():Settings()
    );
  }
}
